---
title: "HTMLMediaElement: phương thức play()"
short-title: play()
slug: Web/API/HTMLMediaElement/play
page-type: web-api-instance-method
browser-compat: api.HTMLMediaElement.play
---

{{APIRef("HTML DOM")}}

{{domxref("HTMLMediaElement")}}
Phương thức **`play()`** cố gắng bắt đầu phát lại phương tiện.
Nó trả về {{jsxref("Promise")}} được giải quyết khi quá trình phát lại được thực hiện
bắt đầu thành công.

Không thể bắt đầu phát lại vì bất kỳ lý do gì, chẳng hạn như
vấn đề về quyền, dẫn đến lời hứa bị từ chối.

## Cú pháp

```js-nolint
play()
```

### Tham số

Không có.

### Giá trị trả về

{{jsxref("Promise")}} được giải quyết khi bắt đầu phát lại hoặc
bị từ chối nếu vì bất kỳ lý do gì việc phát lại không thể bắt đầu.

> [!NOTE]
> Các trình duyệt được phát hành trước năm 2019 có thể không trả về giá trị từ
> `play()`.

### Ngoại lệ

**Trình xử lý từ chối** của lời hứa được gọi với đối tượng {{domxref("DOMException")}}
được truyền vào dưới dạng tham số đầu vào duy nhất (ngược lại với ngoại lệ truyền thống là
ném). Các lỗi có thể xảy ra bao gồm:

- `NotAllowedError` {{domxref("DOMException")}}
- : Được cung cấp nếu tác nhân người dùng (trình duyệt) hoặc hệ điều hành không cho phép phát lại phương tiện trong
  bối cảnh hoặc tình huống hiện tại. Trình duyệt có thể yêu cầu người dùng bắt đầu một cách rõ ràng
  phát lại phương tiện bằng cách nhấp vào nút "phát", chẳng hạn như vì [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy).
- `NotSupportedError` {{domxref("DOMException")}}
- : Được cung cấp nếu nguồn phương tiện (có thể được chỉ định là {{domxref("MediaStream")}},
  {{domxref("MediaSource")}}, {{domxref("Blob")}}, hoặc {{domxref("File")}} chẳng hạn)
  không đại diện cho định dạng phương tiện được hỗ trợ.

Các trường hợp ngoại lệ khác có thể được báo cáo, tùy thuộc vào chi tiết triển khai trình duyệt, phương tiện
việc triển khai trình phát, v.v.

## Ghi chú sử dụng

Mặc dù thuật ngữ "tự động phát" thường được coi là đề cập đến các trang
ngay lập tức bắt đầu phát phương tiện khi được tải, chính sách tự động phát của trình duyệt web cũng
áp dụng cho mọi hoạt động phát lại phương tiện được bắt đầu bằng tập lệnh, bao gồm các lệnh gọi tới `play()`.

Nếu {{Glossary("user agent")}} được định cấu hình để không cho phép tự động hoặc
phát lại phương tiện được bắt đầu bằng tập lệnh, việc gọi `play()` sẽ khiến kết quả được trả về
lời hứa sẽ bị từ chối ngay lập tức với `NotAllowedError`. Các trang web nên
chuẩn bị sẵn sàng để xử lý tình huống này. Ví dụ: một trang web không được hiển thị thông tin người dùng
giao diện giả định quá trình phát lại đã bắt đầu tự động nhưng thay vào đó nên cập nhật
Giao diện người dùng dựa trên việc lời hứa được trả lại có được thực hiện hay bị từ chối hay không. Xem
[example](#examples) bên dưới để biết thêm thông tin.

> [!NOTE]
> Phương thức `play()` có thể khiến người dùng bị hỏi
> cấp quyền phát phương tiện, dẫn đến có thể bị chậm trễ trước khi
> lời hứa trả lại được giải quyết. Hãy chắc chắn rằng mã của bạn không mong đợi phản hồi ngay lập tức.

Để biết thêm thông tin chi tiết về tính năng tự động phát và chặn tự động phát, hãy xem
bài viết [Autoplay guide for media and Web Audio APIs](/en-US/docs/Web/Media/Guides/Autoplay).

## Ví dụ

### Xác nhận trạng thái phát lại và xử lý

Ví dụ này trình bày cách xác nhận rằng quá trình phát lại đã bắt đầu và cách thực hiện một cách khéo léo.
xử lý phát lại tự động bị chặn.

Khi ví dụ này được thực thi, nó bắt đầu bằng cách thu thập các tham chiếu đến phần tử {{HTMLElement("video")}} cũng như {{HTMLElement("button")}} được sử dụng để bật và tắt phát lại.
Sau đó, nó thiết lập một trình xử lý sự kiện cho sự kiện {{domxref("Element/click_event", "click")}} trên nút chuyển đổi và cố gắng tự động bắt đầu phát lại bằng cách gọi hàm [`async`](/en-US/docs/Web/JavaScript/Reference/Statements/async_function) `playVideo()`.

Hàm trợ giúp `toggleButton()` cho phép chúng ta xác định điều gì sẽ xảy ra trong mã khi chúng ta chuyển cho nó một giá trị boolean đại diện cho trạng thái phát (ví dụ: `toggleButton(true)`)
Nếu phát lại thành công, văn bản của nút và [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) của nó sẽ thay đổi thành "Tạm dừng".
Nếu phát lại không thành công, nút và `aria-label` hiển thị "Play".
Điều này đảm bảo rằng `playButton` khớp với trạng thái phát lại bằng cách xem độ phân giải hoặc sự từ chối của {{jsxref("Promise")}} được trả về bởi `play()`:

```html live-sample___handling-states
<div class="video-box">
  <video
    id="video"
    width="480"
    loop
    src="/shared-assets/videos/flower.mp4"></video>
  <button type="button" id="play-button" aria-label="Play"></button>
</div>
```

```js live-sample___handling-states
let videoElem = document.getElementById("video");
let playButton = document.getElementById("play-button");

playButton.addEventListener("click", handlePlayButton);
playVideo();

function toggleButton(playing) {
  if (playing) {
    playButton.textContent = "Pause";
    playButton.setAttribute("aria-label", "Pause");
  } else {
    playButton.textContent = "Play";
    playButton.setAttribute("aria-label", "Play");
  }
}

async function playVideo() {
  try {
    await videoElem.play();
    toggleButton(true);
  } catch (err) {
    toggleButton(false);
  }
}

function handlePlayButton() {
  if (videoElem.paused) {
    playVideo();
  } else {
    videoElem.pause();
    toggleButton(false);
  }
}
```

```css hidden live-sample___handling-states
.video-box {
  position: relative;
}

#video {
  border: 2px solid black;
}

#play-button {
  position: absolute;
  top: 10px;
  left: 10px;
  padding: 8px 12px;
  background-color: black;
  color: white;
  border: none;
  cursor: pointer;
}
```

{{embedlivesample("handling-states", , "300")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web media technologies](/en-US/docs/Web/Media)
- Học tập: [HTML video and audio](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio)
- [Autoplay guide for media and Web Audio APIs](/en-US/docs/Web/Media/Guides/Autoplay)
- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
