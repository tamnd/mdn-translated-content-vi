---
title: Bộ đệm phương tiện, tìm vị trí và các khoảng thời gian
slug: Web/Media/Guides/Audio_and_video_delivery/buffering_seeking_time_ranges
page-type: guide
sidebar: mediasidebar
---

Đôi khi sẽ hữu ích khi biết {{htmlelement("audio") }} hoặc {{htmlelement("video") }} đã tải xuống bao nhiêu, hoặc phần nào có thể phát ngay mà không bị trễ - một ví dụ điển hình là thanh tiến trình đã đệm của trình phát âm thanh hoặc video. Bài viết này thảo luận cách xây dựng thanh đệm/tìm vị trí bằng [TimeRanges](/en-US/docs/Web/API/TimeRanges), cùng các tính năng khác của API media.

## Đã đệm

Thuộc tính `buffered` cho chúng ta biết những phần nào của media đã được tải xuống. Nó trả về một đối tượng {{ domxref("TimeRanges") }}, cho biết các đoạn media nào đã được tải xuống. Thông thường các đoạn này liên tục, nhưng nếu người dùng nhảy qua lại trong khi media đang đệm, nó có thể xuất hiện các khoảng trống.

Thuộc tính này hoạt động với {{htmlelement("audio") }} hoặc {{htmlelement("video") }}; trước hết hãy xem một ví dụ về âm thanh:

```html
<audio id="my-audio" controls src="music.mp3"></audio>
```

Chúng ta có thể truy cập các thuộc tính này như sau:

```js
const audio = document.getElementById("my-audio");
const bufferedTimeRanges = audio.buffered;
```

## Đối tượng TimeRanges

TimeRanges là một chuỗi các khoảng thời gian không chồng lấn, có thời điểm bắt đầu và kết thúc. ([tìm hiểu thêm về TimeRanges](/en-US/docs/Web/API/TimeRanges)).

Một đối tượng {{ domxref("TimeRanges") }} bao gồm các thuộc tính sau:

- `length`: Số lượng khoảng thời gian trong đối tượng.
- `start(index)`: Thời điểm bắt đầu, tính bằng giây, của một khoảng thời gian.
- `end(index)`: Thời điểm kết thúc, tính bằng giây, của một khoảng thời gian.

Không có tương tác của người dùng thì thường chỉ có một khoảng thời gian, nhưng nếu bạn nhảy qua lại trong media thì có thể xuất hiện nhiều hơn một khoảng thời gian, như minh họa dưới đây. Điều này thể hiện hai khoảng thời gian đã đệm - một kéo dài từ 0 đến 5 giây và khoảng còn lại từ 15 đến 19 giây.

```plain
------------------------------------------------------
|=============|                    |===========|     |
------------------------------------------------------
0             5                    15          19    21
```

Với thể hiện âm thanh này, đối tượng {{ domxref("TimeRanges") }} tương ứng sẽ có các thuộc tính khả dụng như sau:

```js
audio.buffered.length; // trả về 2
audio.buffered.start(0); // trả về 0
audio.buffered.end(0); // trả về 5
audio.buffered.start(1); // trả về 15
audio.buffered.end(1); // trả về 19
```

Để thử và trực quan hóa các khoảng thời gian đã đệm, chúng ta có thể viết một ít HTML:

```html live-sample___timeranges
<p>
  <audio id="my-audio" controls>
    <source
      src="https://cdn.freesound.org/previews/155/155386_326032-lq.mp3"
      type="audio/mpeg" />
  </audio>
</p>
<p>
  <canvas id="my-canvas" width="300" height="20"> </canvas>
</p>
```

```css hidden live-sample___timeranges
#my-audio,
#my-canvas {
  width: 100%;
}
```

và một ít JavaScript:

```js live-sample___timeranges
const audio = document.getElementById("my-audio");
const canvas = document.getElementById("my-canvas");
const context = canvas.getContext("2d");

context.fillStyle = "lightgray";
context.fillRect(0, 0, canvas.width, canvas.height);
context.fillStyle = "red";
context.strokeStyle = "white";

// Hiển thị TimeRanges
audio.addEventListener("seeked", () => {
  const inc = canvas.width / audio.duration;
  for (let i = 0; i < audio.buffered.length; i++) {
    const startX = audio.buffered.start(i) * inc;
    const endX = audio.buffered.end(i) * inc;
    const width = endX - startX;

    context.fillRect(startX, 0, width, canvas.height);
    context.rect(startX, 0, width, canvas.height);
    context.stroke();
  }
});
```

Điều này hoạt động tốt hơn với các đoạn âm thanh hoặc video dài hơn, nhưng hãy nhấn phát và nhấp vào thanh tiến trình của trình phát; bạn sẽ thấy các đoạn màu đỏ. Mỗi hình chữ nhật tô đỏ, viền trắng đại diện cho một khoảng thời gian.

{{EmbedLiveSample("timeranges", "", 200)}}

## Có thể tua tới

Thuộc tính `seekable` trả về một đối tượng {{ domxref("TimeRanges") }} và cho chúng ta biết những phần nào của media có thể phát mà không bị trễ; điều này không phụ thuộc vào việc phần đó đã được tải xuống hay chưa. Một số phần của media có thể tua tới nhưng chưa được đệm nếu máy chủ bật các yêu cầu theo dải byte. Các yêu cầu theo dải byte cho phép các phần của tệp media được phân phối từ máy chủ và vì thế có thể sẵn sàng phát gần như ngay lập tức - do đó chúng có thể tua tới.
Để biết thêm về các yêu cầu theo dải byte, xem [HTTP range requests](/en-US/docs/Web/HTTP/Guides/Range_requests).

```js
const seekableTimeRanges = audio.seekable;
```

## Tạo phản hồi đệm của riêng chúng ta

Nếu muốn tạo trình phát tùy chỉnh của riêng mình, chúng ta có thể muốn cung cấp phản hồi về mức độ media đã sẵn sàng để phát. Trên thực tế, một cách tốt để làm điều này là dùng thuộc tính `seekable`, mặc dù như đã thấy ở trên, các phần có thể tua tới của media không nhất thiết liên tục - tuy nhiên thường thì chúng vẫn liên tục, và chúng ta có thể xấp xỉ thông tin này để cho người dùng biết phần nào của media có thể phát trực tiếp. Chúng ta có thể tìm điểm này trong media bằng dòng mã sau:

```js
const seekableEnd = audio.seekable.end(audio.seekable.length - 1);
```

> [!NOTE]
> `audio.seekable.end(audio.seekable.length - 1)` thực ra cho chúng ta biết điểm kết thúc của khoảng thời gian có thể tua tới cuối cùng (không phải toàn bộ media có thể tua tới). Trong thực tế, điều này là đủ vì trình duyệt hoặc bật yêu cầu theo dải byte hoặc không. Nếu không, `audio.seekable` sẽ tương đương với `audio.buffered`, và điều đó sẽ cho ta một chỉ báo hợp lệ về phần cuối của media có thể tua tới. Nếu yêu cầu theo dải byte được bật, giá trị này thường trở thành thời lượng của media gần như ngay lập tức.

Có lẽ tốt hơn là cho biết chính xác bao nhiêu media đã thực sự tải xuống - đây là điều mà các trình phát gốc của trình duyệt dường như hiển thị.

Vì vậy hãy xây dựng điều đó. HTML cho trình phát của chúng ta như sau:

```html live-sample___buffered-progress
<audio id="my-audio" preload controls>
  <source
    src="https://cdn.freesound.org/previews/155/155386_326032-lq.mp3"
    type="audio/mpeg" />
</audio>
<div class="buffered">
  <span id="buffered-amount"></span>
</div>
<div class="progress">
  <span id="progress-amount"></span>
</div>
```

Chúng ta sẽ dùng CSS sau để tạo kiểu cho phần hiển thị đệm:

```css live-sample___buffered-progress
.buffered {
  height: 20px;
  position: relative;
  background: #555555;
  width: 300px;
}

#buffered-amount {
  display: block;
  height: 100%;
  background-color: #777777;
  width: 0;
}

.progress {
  margin-top: -20px;
  height: 20px;
  position: relative;
  width: 300px;
}

#progress-amount {
  display: block;
  height: 100%;
  background-color: #559955;
  width: 0;
}
```

Và JavaScript sau cung cấp chức năng cho chúng ta:

```js live-sample___buffered-progress
const audio = document.getElementById("my-audio");

audio.addEventListener("progress", () => {
  const duration = audio.duration;
  if (duration > 0) {
    for (let i = 0; i < audio.buffered.length; i++) {
      if (
        audio.buffered.start(audio.buffered.length - 1 - i) < audio.currentTime
      ) {
        document.getElementById("buffered-amount").style.width = `${
          (audio.buffered.end(audio.buffered.length - 1 - i) * 100) / duration
        }%`;
        break;
      }
    }
  }
});

audio.addEventListener("timeupdate", () => {
  const duration = audio.duration;
  if (duration > 0) {
    document.getElementById("progress-amount").style.width = `${
      (audio.currentTime / duration) * 100
    }%`;
  }
});
```

Sự kiện `progress` được kích hoạt khi dữ liệu được tải xuống, đây là sự kiện thích hợp để phản hồi nếu chúng ta muốn hiển thị tiến trình tải xuống hoặc đệm.

Sự kiện `timeupdate` được kích hoạt 4 lần một giây khi media đang phát, và đó là nơi chúng ta cập nhật thanh tiến trình phát.

Lần này, bạn sẽ thấy hai loại đoạn. Thanh màu xám nhạt biểu thị tiến trình đã đệm, còn thanh màu xanh lá biểu thị tiến trình đã phát.

{{EmbedLiveSample("buffered-progress", "", 200)}}

## Một lưu ý nhanh về Played

Cũng đáng đề cập tới thuộc tính `played` - nó cho chúng ta biết những khoảng thời gian nào trong media đã được phát. Ví dụ:

```js
const played = audio.played; // trả về một đối tượng TimeRanges
```

Điều này có thể hữu ích khi xác định những phần của media được nghe hoặc xem nhiều nhất.
