---
title: Tạo một trình phát video đa trình duyệt
slug: Web/Media/Guides/Audio_and_video_delivery/cross_browser_video_player
page-type: guide
sidebar: mediasidebar
---

Bài viết này mô tả một trình phát video HTML cơ bản sử dụng Media API và Fullscreen API. Ngoài việc chạy ở chế độ toàn màn hình, trình phát còn có các điều khiển tùy chỉnh thay vì chỉ dùng điều khiển mặc định của trình duyệt. Bản thân các điều khiển sẽ không được tạo kiểu ngoài mức cơ bản cần thiết để chúng hoạt động; việc tạo kiểu đầy đủ cho trình phát sẽ được thực hiện trong một bài viết sau.

Trình phát video mẫu của chúng ta hiển thị một đoạn phim từ tác phẩm mã nguồn mở [Tears of Steel](https://mango.blender.org/about/) và bao gồm các điều khiển video điển hình.

## HTML markup

Để bắt đầu, hãy cùng xem phần HTML tạo nên trình phát.

### Phần video

Toàn bộ trình phát của chúng ta được chứa trong một phần tử {{ htmlelement("figure") }}.

```html-nolint live-sample___video-player
<figure id="videoContainer">
```

Bên trong, trước tiên chúng ta định nghĩa phần tử {{ htmlelement("video") }}.

```html live-sample___video-player
<video
  id="video"
  controls
  preload="metadata"
  poster="/shared-assets/images/examples/tears-of-steel-battle-clip-medium-poster.jpg">
  <source
    src="/shared-assets/videos/tears-of-steel-battle-clip-medium.mp4"
    type="video/mp4" />
  <source
    src="/shared-assets/videos/tears-of-steel-battle-clip-medium.webm"
    type="video/webm" />
  <source
    src="/shared-assets/videos/tears-of-steel-battle-clip-medium.ogg"
    type="video/ogg" />
  <!-- Cung cấp liên kết tải xuống -->
  <a href="/shared-assets/videos/tears-of-steel-battle-clip-medium.mp4"
    >Tải xuống MP4</a
  >
</video>
```

Mặc dù trình phát này sẽ định nghĩa bộ điều khiển tùy chỉnh của riêng nó, thuộc tính `controls` vẫn được thêm vào phần tử {{ htmlelement("video") }}, và bộ điều khiển mặc định của trình phát sẽ được tắt bằng JavaScript ở phần sau. Làm theo cách này vẫn cho phép người dùng đã tắt JavaScript vì bất kỳ lý do gì vẫn có thể truy cập các điều khiển nguyên bản của trình duyệt.

Một ảnh poster được định nghĩa cho video, và thuộc tính `preload` được đặt thành `metadata`, điều này báo cho trình duyệt rằng ban đầu nó chỉ nên cố gắng tải metadata từ tệp video thay vì toàn bộ tệp video. Điều này cung cấp cho trình phát các dữ liệu như thời lượng video và định dạng.

Ba nguồn video khác nhau được cung cấp cho trình phát: MP4, WebM và Ogg. Việc dùng các định dạng nguồn khác nhau này giúp tăng khả năng được hỗ trợ trên mọi trình duyệt hỗ trợ HTML video. Để biết thêm thông tin về định dạng video và khả năng tương thích trình duyệt, xem [chọn một video codec](/en-US/docs/Web/Media/Guides/Formats/Video_codecs#choosing_a_video_codec).

Đoạn mã trên sẽ cho phép phát video trên hầu hết trình duyệt bằng bộ điều khiển mặc định của trình duyệt. Bước tiếp theo là định nghĩa một bộ điều khiển tùy chỉnh, cũng bằng HTML, để điều khiển video.

### Bộ điều khiển

Các điều khiển video mặc định của đa số trình duyệt có các chức năng sau:

- Phát/tạm dừng
- Tắt tiếng
- Điều khiển âm lượng
- Thanh tiến trình
- Tua nhanh
- Chuyển sang chế độ toàn màn hình

Bộ điều khiển tùy chỉnh cũng sẽ hỗ trợ các chức năng này, đồng thời bổ sung một nút dừng.

Một lần nữa, HTML khá đơn giản, dùng một danh sách không thứ tự với `list-style-type:none` để bao các điều khiển, mỗi điều khiển là một mục danh sách với `float:left`. Đối với thanh tiến trình, ta tận dụng phần tử `progress`. Danh sách này được chèn sau phần tử {{ htmlelement("video") }}, nhưng vẫn nằm bên trong phần tử {{ htmlelement("figure") }} (điều này quan trọng cho chức năng toàn màn hình, sẽ được giải thích sau).

```html live-sample___video-player
<ul id="video-controls" class="controls" data-state="hidden">
  <li><button id="play-pause" type="button">Phát/Tạm dừng</button></li>
  <li><button id="stop" type="button">Dừng</button></li>
  <li class="progress">
    <progress id="progress" value="0"></progress>
  </li>
  <li><button id="mute" type="button">Tắt/Mở tiếng</button></li>
  <li><button id="vol-inc" type="button">Âm lượng+</button></li>
  <li><button id="vol-dec" type="button">Âm lượng-</button></li>
  <li><button id="fs" type="button">Toàn màn hình</button></li>
</ul>
```

Mỗi nút được gán một `id` để có thể truy cập dễ dàng bằng JavaScript.

Ban đầu các điều khiển được ẩn bằng `display:none` trong CSS và sẽ được bật bằng JavaScript. Một lần nữa, nếu người dùng đã tắt JavaScript thì bộ điều khiển tùy chỉnh sẽ không xuất hiện và họ có thể dùng bộ điều khiển mặc định của trình duyệt mà không bị cản trở.

Dĩ nhiên, bộ điều khiển tùy chỉnh này hiện tại vẫn vô dụng và chưa làm được gì: Hãy cải thiện nó bằng JavaScript.

Cuối cùng, ta đóng phần tử `<figure>` bằng một {{htmlelement("figcaption")}} chứa thông tin bản quyền.

```html live-sample___video-player
  <figcaption>
    &copy; Blender Foundation |
    <a href="http://mango.blender.org">mango.blender.org</a>
  </figcaption>
</figure>
```

## Sử dụng Media API

HTML đi kèm với một [Media API](/en-US/docs/Web/API/HTMLMediaElement) JavaScript cho phép nhà phát triển truy cập và điều khiển media HTML. API này sẽ được dùng để khiến bộ điều khiển tùy chỉnh ở trên thực sự hoạt động. Ngoài ra, nút toàn màn hình sẽ sử dụng [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API), một API W3C khác kiểm soát khả năng trình duyệt hiển thị ứng dụng ở toàn màn hình máy tính.

### Thiết lập

Trước khi xử lý từng nút riêng lẻ, cần thực hiện một số lệnh khởi tạo. Cần có các biến trỏ tới các phần tử HTML:

```js live-sample___video-player
const videoContainer = document.getElementById("videoContainer");
const video = document.getElementById("video");
const videoControls = document.getElementById("video-controls");
const playPause = document.getElementById("play-pause");
const stop = document.getElementById("stop");
const mute = document.getElementById("mute");
const volInc = document.getElementById("vol-inc");
const volDec = document.getElementById("vol-dec");
const progress = document.getElementById("progress");
const fullscreen = document.getElementById("fs");
```

Từ các tham chiếu này, giờ có thể gắn sự kiện cho từng nút điều khiển tùy chỉnh để làm chúng tương tác được. Phần lớn các nút này cần thêm bộ lắng nghe sự kiện `click`, và cần gọi hoặc kiểm tra một phương thức và/hoặc thuộc tính được Media API định nghĩa trên video.

Như đã nói trước đó, các điều khiển mặc định của trình duyệt giờ cần bị vô hiệu hóa, và các điều khiển tùy chỉnh cần được hiển thị:

```js live-sample___video-player
// Ẩn các điều khiển mặc định
video.controls = false;
// Hiển thị các điều khiển video do người dùng định nghĩa
videoControls.setAttribute("data-state", "visible");
```

### Phát/Tạm dừng

```js live-sample___video-player
playPause.addEventListener("click", (e) => {
  if (video.paused || video.ended) {
    video.play();
  } else {
    video.pause();
  }
});
```

Khi sự kiện `click` được phát hiện trên nút phát/tạm dừng, trình xử lý đầu tiên kiểm tra xem video hiện đang tạm dừng hay đã kết thúc chưa (thông qua các thuộc tính `paused` và `ended` của Media API); nếu có, nó dùng phương thức `play()` để phát video. Ngược lại, video phải đang phát, nên nó sẽ bị tạm dừng bằng phương thức `pause()`.

### Dừng

```js live-sample___video-player
stop.addEventListener("click", (e) => {
  video.pause();
  video.currentTime = 0;
  progress.value = 0;
});
```

Media API không có phương thức `stop`, vì vậy để mô phỏng điều này, video được tạm dừng, và `currentTime` của nó, tức vị trí phát hiện tại của video, cùng vị trí của phần tử {{ htmlelement("progress") }} được đặt về 0 (phần tử {{ htmlelement("progress") }} sẽ được nói kỹ hơn ở phần sau).

### Tắt tiếng

```js live-sample___video-player
mute.addEventListener("click", (e) => {
  video.muted = !video.muted;
});
```

Nút tắt tiếng là một nút chuyển đổi dùng thuộc tính `muted` của Media API để tắt tiếng video: đây là một giá trị Boolean cho biết video có đang bị tắt tiếng hay không. Để làm nó chuyển đổi qua lại, ta gán nó bằng giá trị đảo của chính nó.

### Âm lượng

```js live-sample___video-player
volInc.addEventListener("click", (e) => {
  alterVolume("+");
});
volDec.addEventListener("click", (e) => {
  alterVolume("-");
});
```

Hai nút điều chỉnh âm lượng đã được định nghĩa, một nút tăng âm lượng và một nút giảm âm lượng. Một hàm do người dùng định nghĩa, `alterVolume(direction)`, được tạo ra để xử lý việc này:

```js live-sample___video-player
function alterVolume(dir) {
  const currentVolume = Math.floor(video.volume * 10) / 10;
  if (dir === "+" && currentVolume < 1) {
    video.volume += 0.1;
  } else if (dir === "-" && currentVolume > 0) {
    video.volume -= 0.1;
  }
}
```

Hàm này dùng thuộc tính `volume` của Media API, vốn giữ giá trị âm lượng hiện tại của video. Các giá trị hợp lệ cho thuộc tính này nằm trong khoảng từ 0 đến 1. Hàm kiểm tra tham số `dir`, cho biết âm lượng cần tăng (+) hay giảm (-), rồi hành xử tương ứng. Hàm được định nghĩa để tăng hoặc giảm thuộc tính `volume` của video theo bước 0,1, đảm bảo nó không thấp hơn 0 hay cao hơn 1.

### Tiến trình

Khi phần tử {{ htmlelement("progress") }} được định nghĩa ở trên trong HTML, chỉ có thuộc tính `value` được đặt thành 0. Thuộc tính này biểu thị giá trị hiện tại của phần tử tiến trình. Nó cũng cần có giá trị tối đa để có thể hiển thị đúng phạm vi của mình, và điều này có thể làm thông qua thuộc tính `max`, vốn cần được đặt bằng thời lượng phát tối đa của video. Giá trị này được lấy từ thuộc tính `duration` của video, cũng là một phần của Media API.

Lý tưởng nhất, giá trị đúng của thuộc tính `duration` của video có sẵn khi sự kiện `loadedmetadata` được phát ra, tức khi metadata của video đã được tải:

```js live-sample___video-player
video.addEventListener("loadedmetadata", () => {
  progress.setAttribute("max", video.duration);
});
```

Đáng tiếc là ở một số trình duyệt di động, khi `loadedmetadata` được phát ra - nếu nó _thậm chí có_ được phát ra - `video.duration` có thể không có giá trị đúng, hoặc thậm chí không có giá trị nào cả. Vì vậy cần phải làm thêm một việc khác. Điều đó sẽ được nói rõ hơn bên dưới.

Một sự kiện khác, `timeupdate`, được phát định kỳ trong khi video đang được phát. Sự kiện này rất phù hợp để cập nhật giá trị của thanh tiến trình, đặt nó bằng giá trị của thuộc tính `currentTime` của video, vốn cho biết video đã phát đến đâu.

```js
video.addEventListener("timeupdate", () => {
  progress.value = video.currentTime;
});
```

Khi sự kiện `timeupdate` được phát ra, thuộc tính `value` của phần tử `progress` sẽ được đặt bằng `currentTime` của video. Phần hiển thị này có màu nền CSS đặc, giúp nó cung cấp phản hồi trực quan giống như một phần tử {{ htmlelement("progress") }}.

Quay lại vấn đề `video.duration` đã nêu ở trên, khi sự kiện `timeupdate` được phát ra, trong hầu hết trình duyệt di động, thuộc tính `duration` của video lúc này sẽ có giá trị đúng. Ta có thể tận dụng điều đó để đặt thuộc tính `max` của phần tử `progress` nếu nó hiện chưa được đặt:

```js live-sample___video-player
video.addEventListener("timeupdate", () => {
  if (!progress.getAttribute("max"))
    progress.setAttribute("max", video.duration);
  progress.value = video.currentTime;
});
```

> [!NOTE]
> Để biết thêm thông tin và ý tưởng về thanh tiến trình và phản hồi bộ đệm, hãy đọc [Media buffering, seeking, and time ranges](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/buffering_seeking_time_ranges).

### Tua nhanh

Một tính năng khác của hầu hết bộ điều khiển video mặc định của trình duyệt là khả năng nhấp vào thanh tiến trình của video để "tua nhanh" đến một điểm khác trong video. Điều này cũng có thể làm được bằng cách thêm một bộ lắng nghe sự kiện `click` vào phần tử `progress`:

```js live-sample___video-player
progress.addEventListener("click", (e) => {
  if (!Number.isFinite(video.duration)) return;
  const rect = progress.getBoundingClientRect();
  const pos = (e.pageX - rect.left) / progress.offsetWidth;
  video.currentTime = pos * video.duration;
});
```

Đoạn mã này dùng vị trí được nhấp để xác định (một cách gần đúng) nơi người dùng đã nhấp trong phần tử `progress`, rồi di chuyển video đến vị trí đó bằng cách đặt thuộc tính `currentTime`. Nó tránh đặt `currentTime` nếu thời lượng của video là {{jsxref("Global_Objects/NaN", "NaN")}} hoặc {{jsxref("Global_Objects/Infinity", "Infinity")}}, điều này xảy ra nếu video chưa được tải.

### Toàn màn hình

Fullscreen API lẽ ra khá đơn giản để dùng: người dùng nhấn một nút, nếu video đang ở chế độ toàn màn hình thì thoát, còn không thì vào chế độ toàn màn hình.

Nút toàn màn hình sẽ bị ẩn nếu Fullscreen API không được bật:

```js live-sample___video-player
if (!document?.fullscreenEnabled) {
  fullscreen.style.display = "none";
}
```

Nút toàn màn hình cần thực sự làm một việc gì đó. Giống như các nút khác, một trình xử lý sự kiện `click` được gắn vào để chuyển đổi chế độ toàn màn hình:

```js live-sample___video-player
fullscreen.addEventListener("click", (e) => {
  if (document.fullscreenElement !== null) {
    // Tài liệu đang ở chế độ toàn màn hình
    document.exitFullscreen();
  } else {
    // Tài liệu không ở chế độ toàn màn hình
    videoContainer.requestFullscreen();
  }
});
```

Nếu trình duyệt hiện đang ở chế độ toàn màn hình, nó phải thoát ra và ngược lại. Điều thú vị là phải dùng `document` để thoát/hủy chế độ toàn màn hình, trong khi bất kỳ phần tử HTML nào cũng có thể yêu cầu chế độ toàn màn hình, ở đây dùng `videoContainer` vì nó cũng chứa các điều khiển tùy chỉnh, và chúng cũng nên xuất hiện cùng video khi ở chế độ toàn màn hình.

## Kết quả

Phần CSS bị ẩn trong hướng dẫn này, nhưng bạn có thể nhấn "Play" để xem toàn bộ mã nguồn. Ở phần tiếp theo, [Video player styling basics](/en-US/docs/Web/Media/Guides/Audio_and_video_delivery/Video_player_styling_basics), chúng ta sẽ khám phá một số kỹ thuật CSS thú vị được dùng ở đây, đồng thời thêm CSS mới để làm cho trình phát trông đẹp hơn.

```css hidden live-sample___video-player
:root {
  color: #333333;
  font-family:
    "Lucida Grande", "Lucida Sans Unicode", "DejaVu Sans", "Lucida",
    "Helvetica", "Arial", sans-serif;
}
a {
  color: #0095dd;
  text-decoration: none;
}
a:hover,
a:focus {
  color: #2255aa;
  text-decoration: underline;
}
figure {
  max-width: 64rem;
  width: 100%;
  margin: 0;
  padding: 0;
}
figcaption {
  display: block;
  font-size: 1rem;
}
video {
  width: 100%;
}

/* controls */
.controls {
  display: flex;
  gap: 6px;
  list-style-type: none;
  overflow: hidden;
  margin: 0;
  padding: 0;
  width: 100%;
}
.controls[data-state="hidden"] {
  display: none;
}
.controls li {
  width: max(10%, 3rem);
  margin: 0;
  padding: 0;
}
.controls .progress {
  flex-grow: 1;
  cursor: pointer;
}
.controls button {
  width: 100%;
  text-align: center;
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
}
.controls progress {
  display: block;
  width: 100%;
  height: 100%;
  border: 1px solid #aaaaaa;
  overflow: hidden;
  border-radius: 2px;
}

/* fullscreen */
figure:fullscreen {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  max-width: 100%;
  height: 100%;
}
figure:fullscreen video {
  margin-top: auto;
  margin-bottom: auto;
}
figure:fullscreen figcaption {
  display: none;
}
```

> [!WARNING]
> Video mẫu có thể phát âm lượng lớn!

{{EmbedLiveSample("video-player", "", 400, "", "", "", "fullscreen")}}

## Xem thêm

- {{ htmlelement("video") }} để xem tài liệu tham khảo
- [HTML video và audio](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio) để biết thêm các kỹ thuật
- [Định dạng media được hỗ trợ bởi các phần tử HTML audio và video](/en-US/docs/Web/Media/Guides/Formats)
