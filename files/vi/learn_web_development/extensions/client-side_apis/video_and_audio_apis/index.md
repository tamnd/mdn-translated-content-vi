---
title: API âm thanh và video
short-title: Âm thanh và video
slug: Learn_web_development/Extensions/Client-side_APIs/Video_and_audio_APIs
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Client-side_APIs/Introduction", "Learn_web_development/Extensions/Client-side_APIs/Drawing_graphics", "Learn_web_development/Extensions/Client-side_APIs")}}

HTML đi kèm với các phần tử để nhúng đa phương tiện vào tài liệu — {{htmlelement("video")}} và {{htmlelement("audio")}} — và chúng có các API riêng để điều khiển phát lại, tìm kiếm, v.v. Bài viết này hướng dẫn bạn thực hiện các tác vụ thông thường như tạo các điều khiển phát lại tùy chỉnh.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>, đặc biệt là <a href="/en-US/docs/Learn_web_development/Core/Scripting/Object_basics">kiến thức cơ bản về đối tượng JavaScript</a> và kiến thức cốt lõi về API như <a href="/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting">lập trình DOM</a> và <a href="/en-US/docs/Learn_web_development/Core/Scripting/Network_requests">Yêu cầu mạng</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        <ul>
          <li>Codec là gì, và các định dạng âm thanh và video khác nhau.</li>
          <li>Hiểu các chức năng chính liên quan đến âm thanh và video — phát, tạm dừng, dừng, tua ngược và tua tới, thời lượng và thời gian hiện tại.</li>
          <li>Sử dụng API <code>HTMLMediaElement</code> để xây dựng trình phát đa phương tiện tùy chỉnh cơ bản, giúp trợ năng tốt hơn hoặc đồng nhất hơn giữa các trình duyệt.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Âm thanh và video HTML

Các phần tử {{htmlelement("video")}} và {{htmlelement("audio")}} cho phép chúng ta nhúng video và âm thanh vào các trang web. Như chúng ta đã trình bày trong [HTML video and audio](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio), một triển khai điển hình trông như thế này:

```html
<video controls>
  <source src="rabbit320.mp4" type="video/mp4" />
  <source src="rabbit320.webm" type="video/webm" />
  <p>
    Your browser doesn't support HTML video. Here is a
    <a href="rabbit320.mp4">link to the video</a> instead.
  </p>
</video>
```

Điều này tạo ra một trình phát video trong trình duyệt:

```html hidden live-sample___multiple-formats
<h1>Below is a video that will play in all modern browsers</h1>

<video controls>
  <source
    src="https://mdn.github.io/learning-area/html/multimedia-and-embedding/video-and-audio-content/rabbit320.mp4"
    type="video/mp4" />
  <source
    src="https://mdn.github.io/learning-area/html/multimedia-and-embedding/video-and-audio-content/rabbit320.webm"
    type="video/webm" />
</video>
```

{{EmbedLiveSample("multiple-formats", '100%', 380)}}

Bạn có thể xem lại tất cả các tính năng HTML trong bài viết đã liên kết ở trên; với mục đích của chúng ta ở đây, thuộc tính thú vị nhất là [`controls`](/en-US/docs/Web/HTML/Reference/Elements/video#controls), cho phép bộ điều khiển phát lại mặc định. Nếu bạn không chỉ định thuộc tính này, bạn sẽ không có điều khiển phát lại nào:

```html hidden live-sample___multiple-formats-no-controls
<h1>Below is a video that will play in all modern browsers</h1>

<video>
  <source
    src="https://mdn.github.io/learning-area/html/multimedia-and-embedding/video-and-audio-content/rabbit320.mp4"
    type="video/mp4" />
  <source
    src="https://mdn.github.io/learning-area/html/multimedia-and-embedding/video-and-audio-content/rabbit320.webm"
    type="video/webm" />
</video>
```

{{EmbedLiveSample("multiple-formats-no-controls", '100%', 380)}}

Điều này không hữu ích ngay lập tức để phát lại video, nhưng nó có những ưu điểm. Một vấn đề lớn với các điều khiển trình duyệt gốc là chúng khác nhau trong mỗi trình duyệt — không tốt cho hỗ trợ đa trình duyệt! Một vấn đề lớn khác là các điều khiển gốc trong hầu hết các trình duyệt không thực sự hỗ trợ bàn phím tốt.

Bạn có thể giải quyết cả hai vấn đề này bằng cách ẩn các điều khiển gốc (bằng cách xóa thuộc tính `controls`), và lập trình các điều khiển của riêng bạn bằng HTML, CSS và JavaScript. Trong phần tiếp theo, chúng ta sẽ xem xét các công cụ cơ bản mà chúng ta có sẵn để làm điều này.

## HTMLMediaElement API

Là một phần của đặc tả HTML, API {{domxref("HTMLMediaElement")}} cung cấp các tính năng để cho phép bạn điều khiển trình phát video và âm thanh theo lập trình — ví dụ {{domxref("HTMLMediaElement.play()")}}, {{domxref("HTMLMediaElement.pause()")}}, v.v. Giao diện này có sẵn cho cả phần tử {{htmlelement("audio")}} và {{htmlelement("video")}}, vì các tính năng bạn muốn triển khai gần như giống hệt nhau. Hãy cùng làm một ví dụ, thêm các tính năng khi chúng ta tiến hành.

Ví dụ hoàn chỉnh của chúng ta sẽ trông (và hoạt động) như sau:

```html hidden live-sample___custom-video-player
<div class="player">
  <video controls>
    <source src="/shared-assets/videos/sintel-short.mp4" type="video/mp4" />
    <source src="/shared-assets/videos/sintel-short.webm" type="video/webm" />
  </video>
  <div class="controls">
    <button class="play" data-icon="P" aria-label="play pause toggle"></button>
  </div>
</div>
```

{{EmbedLiveSample("custom-video-player", '100%', 480)}}

### Bắt đầu

Để bắt đầu với ví dụ này, hãy tải xuống [media-player-start.zip](https://github.com/mdn/learning-area/blob/main/javascript/apis/video-audio/start/media-player-start.zip) và giải nén nó vào một thư mục mới trên ổ cứng của bạn. Nếu bạn đã [tải xuống kho ví dụ](https://github.com/mdn/learning-area), bạn sẽ tìm thấy nó trong `javascript/apis/video-audio/start/`.

Tại thời điểm này, nếu bạn tải HTML, bạn sẽ thấy một trình phát video HTML hoàn toàn bình thường với các điều khiển gốc được hiển thị.

#### Khám phá HTML

Mở tệp HTML index. Bạn sẽ thấy một số tính năng; HTML chủ yếu là trình phát video và các điều khiển của nó:

- Toàn bộ trình phát được bọc trong một phần tử {{htmlelement("div")}}, để tất cả có thể được tạo kiểu như một đơn vị nếu cần.
- Phần tử {{htmlelement("video")}} chứa hai phần tử {{htmlelement("source")}} để các định dạng khác nhau có thể được tải tùy thuộc vào trình duyệt xem trang web.
- HTML điều khiển có lẽ thú vị nhất:
  - Chúng ta có bốn {{htmlelement("button")}} — phát/tạm dừng, dừng, tua ngược và tua tới.
  - Mỗi `<button>` có tên `class`, thuộc tính `data-icon` để định nghĩa biểu tượng nào nên được hiển thị trên mỗi nút (chúng ta sẽ trình bày cách này hoạt động trong phần dưới), và thuộc tính `aria-label` để cung cấp mô tả dễ hiểu cho từng nút, vì chúng ta không cung cấp nhãn có thể đọc được bên trong các thẻ. Nội dung của các thuộc tính `aria-label` được đọc to bởi trình đọc màn hình khi người dùng của họ tập trung vào các phần tử chứa chúng.
  - Ngoài ra còn có một bộ đếm thời gian {{htmlelement("div")}}, sẽ báo cáo thời gian đã trôi qua khi video đang phát. Chỉ để vui, chúng ta cung cấp hai cơ chế báo cáo — một {{htmlelement("span")}} chứa thời gian đã trôi qua tính bằng phút và giây, và một `<div>` bổ sung mà chúng ta sẽ sử dụng để tạo một thanh chỉ báo ngang ngày càng dài hơn khi thời gian trôi qua.

#### Khám phá CSS

Bây giờ hãy mở tệp CSS và nhìn bên trong. CSS cho ví dụ không quá phức tạp, nhưng chúng ta sẽ làm nổi bật các phần thú vị nhất ở đây. Đầu tiên, hãy chú ý kiểu `.controls`:

```css
.controls {
  visibility: hidden;
  opacity: 0.5;
  width: 400px;
  border-radius: 10px;
  position: absolute;
  bottom: 20px;
  left: 50%;
  margin-left: -200px;
  background-color: black;
  box-shadow: 3px 3px 5px black;
  transition: 1s all;
  display: flex;
}

.player:hover .controls,
.player:focus-within .controls {
  opacity: 1;
}
```

- Chúng ta bắt đầu với {{cssxref("visibility")}} của các điều khiển tùy chỉnh được đặt thành `hidden`. Trong JavaScript của chúng ta sau này, chúng ta sẽ đặt các điều khiển thành `visible` và xóa thuộc tính `controls` khỏi phần tử `<video>`. Điều này để khi JavaScript không tải vì một lý do nào đó, người dùng vẫn có thể sử dụng video với các điều khiển gốc.
- Chúng ta cho các điều khiển một {{cssxref("opacity")}} là `0.5` theo mặc định, để chúng ít gây xao nhãng hơn khi bạn đang cố gắng xem video. Chỉ khi bạn di chuột qua/tập trung vào trình phát, các điều khiển mới xuất hiện với độ mờ đầy đủ.
- Chúng ta sắp xếp các nút bên trong thanh điều khiển bằng flexbox ({{cssxref("display")}}: flex), để dễ dàng hơn.

#### Triển khai JavaScript

Chúng ta đã có giao diện HTML và CSS khá hoàn chỉnh; bây giờ chúng ta chỉ cần kết nối tất cả các nút để các điều khiển hoạt động.

1. Ở đầu tệp `custom-player.js`, hãy chèn đoạn mã sau:

   ```js
   const media = document.querySelector("video");
   const controls = document.querySelector(".controls");

   const play = document.querySelector(".play");
   const stop = document.querySelector(".stop");
   const rwd = document.querySelector(".rwd");
   const fwd = document.querySelector(".fwd");

   const timerWrapper = document.querySelector(".timer");
   const timer = document.querySelector(".timer span");
   const timerBar = document.querySelector(".timer div");
   ```

   Ở đây chúng ta đang tạo các hằng số để lưu trữ tham chiếu đến tất cả các đối tượng chúng ta muốn thao tác.

2. Tiếp theo, hãy chèn phần sau ở cuối mã của bạn:

   ```js
   media.removeAttribute("controls");
   controls.style.visibility = "visible";
   ```

   Hai dòng này xóa các điều khiển trình duyệt mặc định khỏi video và làm cho các điều khiển tùy chỉnh hiển thị.

#### Phát và tạm dừng video

Hãy triển khai điều khiển quan trọng nhất — nút phát/tạm dừng.

1. Trước tiên, hãy thêm đoạn sau vào cuối mã của bạn, để hàm `playPauseMedia()` được gọi khi nút phát được nhấp:

   ```js
   play.addEventListener("click", playPauseMedia);
   ```

2. Bây giờ để định nghĩa `playPauseMedia()` — hãy thêm đoạn sau, một lần nữa ở cuối mã của bạn:

   ```js
   function playPauseMedia() {
     if (media.paused) {
       play.setAttribute("data-icon", "u");
       media.play();
     } else {
       play.setAttribute("data-icon", "P");
       media.pause();
     }
   }
   ```

   Ở đây chúng ta sử dụng câu lệnh [`if`](/en-US/docs/Web/JavaScript/Reference/Statements/if...else) để kiểm tra xem video có đang tạm dừng không. Thuộc tính {{domxref("HTMLMediaElement.paused")}} trả về true nếu media đang tạm dừng. Nếu video đang tạm dừng, chúng ta đặt giá trị thuộc tính `data-icon` trên nút phát thành "u" (biểu tượng "paused") và gọi phương thức {{domxref("HTMLMediaElement.play()")}} để phát media.

   Ở lần nhấp thứ hai, nút sẽ được chuyển đổi lại — biểu tượng "play" sẽ được hiển thị lại và video sẽ bị tạm dừng với {{domxref("HTMLMediaElement.pause()")}}.

#### Dừng video

1. Tiếp theo, hãy thêm chức năng để xử lý việc dừng video. Thêm các dòng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) sau bên dưới dòng trước bạn đã thêm:

   ```js
   stop.addEventListener("click", stopMedia);
   media.addEventListener("ended", stopMedia);
   ```

2. Tiếp theo, hãy định nghĩa `stopMedia()` — thêm hàm sau bên dưới `playPauseMedia()`:

   ```js
   function stopMedia() {
     media.pause();
     media.currentTime = 0;
     play.setAttribute("data-icon", "P");
   }
   ```

   Không có phương thức `stop()` trên HTMLMediaElement API — tương đương là `pause()` video và đặt thuộc tính {{domxref("HTMLMediaElement.currentTime","currentTime")}} của nó về 0.

#### Tua ngược và tua tới

1. Trước tiên, hãy thêm hai dòng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) sau bên dưới các dòng trước:

   ```js
   rwd.addEventListener("click", mediaBackward);
   fwd.addEventListener("click", mediaForward);
   ```

2. Bây giờ đến các hàm xử lý sự kiện — thêm đoạn mã sau bên dưới các hàm trước để định nghĩa `mediaBackward()` và `mediaForward()`:

   ```js
   let intervalFwd;
   let intervalRwd;

   function mediaBackward() {
     clearInterval(intervalFwd);
     fwd.classList.remove("active");

     if (rwd.classList.contains("active")) {
       rwd.classList.remove("active");
       clearInterval(intervalRwd);
       media.play();
     } else {
       rwd.classList.add("active");
       media.pause();
       intervalRwd = setInterval(windBackward, 200);
     }
   }

   function mediaForward() {
     clearInterval(intervalRwd);
     rwd.classList.remove("active");

     if (fwd.classList.contains("active")) {
       fwd.classList.remove("active");
       clearInterval(intervalFwd);
       media.play();
     } else {
       fwd.classList.add("active");
       media.pause();
       intervalFwd = setInterval(windForward, 200);
     }
   }
   ```

3. Cuối cùng, chúng ta cần định nghĩa các hàm `windBackward()` và `windForward()`:

   ```js
   function windBackward() {
     if (media.currentTime <= 3) {
       rwd.classList.remove("active");
       clearInterval(intervalRwd);
       stopMedia();
     } else {
       media.currentTime -= 3;
     }
   }

   function windForward() {
     if (media.currentTime >= media.duration - 3) {
       fwd.classList.remove("active");
       clearInterval(intervalFwd);
       stopMedia();
     } else {
       media.currentTime += 3;
     }
   }
   ```

#### Cập nhật thời gian đã trôi qua

Phần cuối cùng của trình phát đa phương tiện của chúng ta cần triển khai là các màn hình thời gian đã trôi qua. Để làm điều này, chúng ta sẽ chạy một hàm để cập nhật các màn hình thời gian mỗi khi sự kiện {{domxref("HTMLMediaElement/timeupdate_event", "timeupdate")}} được kích hoạt trên phần tử `<video>`.

1. Thêm dòng `addEventListener()` sau ngay bên dưới các dòng khác:

   ```js
   media.addEventListener("timeupdate", setTime);
   ```

2. Bây giờ để định nghĩa hàm `setTime()`. Thêm đoạn sau ở cuối tệp của bạn:

   ```js
   function setTime() {
     const minutes = Math.floor(media.currentTime / 60);
     const seconds = Math.floor(media.currentTime - minutes * 60);

     const minuteValue = minutes.toString().padStart(2, "0");
     const secondValue = seconds.toString().padStart(2, "0");

     const mediaTime = `${minuteValue}:${secondValue}`;
     timer.textContent = mediaTime;

     const barLength =
       timerWrapper.clientWidth * (media.currentTime / media.duration);
     timerBar.style.width = `${barLength}px`;
   }
   ```

## Tóm tắt

API {{domxref("HTMLMediaElement")}} cung cấp rất nhiều chức năng để tạo các trình phát video và âm thanh đơn giản, và đó chỉ là phần nổi của tảng băng chìm. Hãy xem phần "Xem thêm" bên dưới để biết các liên kết đến chức năng phức tạp và thú vị hơn.

## Xem thêm

- {{domxref("HTMLMediaElement")}}
- [HTML video và audio](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio) — hướng dẫn đơn giản cho HTML `<video>` và `<audio>`.
- [Phân phối âm thanh và video](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery) — hướng dẫn chi tiết về phân phối phương tiện trong trình duyệt.
- [Thao tác âm thanh và video](/en-US/docs/Web/Media/Guides/Audio_and_video_manipulation) — hướng dẫn chi tiết về thao tác âm thanh và video.
- {{htmlelement("video")}} và {{htmlelement("audio")}} trang tham khảo.
- [Hướng dẫn về các loại phương tiện và định dạng trên web](/en-US/docs/Web/Media/Guides/Formats)

{{PreviousMenuNext("Learn_web_development/Extensions/Client-side_APIs/Introduction", "Learn_web_development/Extensions/Client-side_APIs/Drawing_graphics", "Learn_web_development/Extensions/Client-side_APIs")}}
