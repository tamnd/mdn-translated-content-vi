---
title: Using the Document Picture-in-Picture API
slug: Web/API/Document_Picture-in-Picture_API/Using
page-type: guide
---

{{DefaultAPISidebar("Document Picture-in-Picture API")}}

Hướng dẫn này cung cấp quy trình sử dụng điển hình của {{domxref("Document Picture-in-Picture API", "Document Picture-in-Picture API", "", "nocode")}}.

> [!NOTE]
> Bạn có thể xem bản demo nổi bật tại [Ví dụ Document Picture-in-Picture API](https://mdn.github.io/dom-examples/document-picture-in-picture/) (xem thêm [mã nguồn](https://github.com/mdn/dom-examples/tree/main/document-picture-in-picture) đầy đủ).

## HTML mẫu

HTML sau đây thiết lập trình phát video cơ bản.

```html
<div id="container">
  <p class="in-pip-message">
    Video player is currently in the separate Picture-in-Picture window.
  </p>
  <div id="player">
    <video
      src="assets/bigbuckbunny.mp4"
      id="video"
      controls
      width="320"></video>

    <div id="credits">
      <a href="https://peach.blender.org/download/" target="_blank">
        Video by Blender </a
      >;
      <a href="https://peach.blender.org/about/" target="_blank">
        licensed CC-BY 3.0
      </a>
    </div>

    <div id="control-bar">
      <p class="no-picture-in-picture">
        Document Picture-in-Picture API not available
      </p>

      <p></p>
    </div>
  </div>
</div>
```

## Phát hiện tính năng

Để kiểm tra xem Document Picture-in-Picture API có được hỗ trợ không, bạn có thể kiểm tra xem `documentPictureInPicture` có sẵn trong `window` không:

```js
if ("documentPictureInPicture" in window) {
  document.querySelector(".no-picture-in-picture").remove();

  const togglePipButton = document.createElement("button");
  togglePipButton.textContent = "Toggle Picture-in-Picture";
  togglePipButton.addEventListener("click", togglePictureInPicture);

  document.getElementById("control-bar").appendChild(togglePipButton);
}
```

Nếu có sẵn, chúng tôi xóa thông báo "Document Picture-in-Picture API not available" và thay vào đó thêm phần tử {{htmlelement("button")}} để mở trình phát video trong cửa sổ Document Picture-in-Picture.

## Mở cửa sổ Picture-in-Picture

JavaScript sau gọi {{domxref("DocumentPictureInPicture.requestWindow", "window.documentPictureInPicture.requestWindow()")}} để mở cửa sổ Picture-in-Picture trống. {{jsxref("Promise")}} được trả về giải quyết với đối tượng {{domxref("Window")}} Picture-in-Picture. Trình phát video được di chuyển đến cửa sổ đó bằng {{domxref("Element.append()")}}, và chúng tôi hiển thị thông báo cho biết nó đã được di chuyển.

```js
async function togglePictureInPicture() {
  // Trả về sớm nếu đã có cửa sổ Picture-in-Picture mở
  if (window.documentPictureInPicture.window) {
    return;
  }

  // Mở cửa sổ Picture-in-Picture.
  const pipWindow = await window.documentPictureInPicture.requestWindow({
    width: videoPlayer.clientWidth,
    height: videoPlayer.clientHeight,
  });

  // …

  // Di chuyển trình phát đến cửa sổ Picture-in-Picture.
  pipWindow.document.body.append(videoPlayer);

  // Hiển thị thông báo cho biết nó đã được di chuyển
  inPipMessage.style.display = "block";
}
```

## Sao chép stylesheet sang cửa sổ Picture-in-Picture

Để sao chép tất cả CSS stylesheet từ cửa sổ gốc, hãy lặp qua tất cả stylesheet được liên kết rõ ràng hoặc nhúng trong tài liệu (qua {{domxref("Document.styleSheets")}}) và nối chúng vào cửa sổ Picture-in-Picture. Lưu ý rằng đây là bản sao một lần.

```js
// …

// Sao chép stylesheet từ tài liệu ban đầu
// để trình phát trông giống nhau.
[...document.styleSheets].forEach((styleSheet) => {
  try {
    const cssRules = [...styleSheet.cssRules]
      .map((rule) => rule.cssText)
      .join("");
    const style = document.createElement("style");

    style.textContent = cssRules;
    pipWindow.document.head.appendChild(style);
  } catch (e) {
    const link = document.createElement("link");

    link.rel = "stylesheet";
    link.type = styleSheet.type;
    link.media = styleSheet.media;
    link.href = styleSheet.href;
    pipWindow.document.head.appendChild(link);
  }
});

// …
```

## Nhắm mục tiêu kiểu khi ở chế độ Picture-in-Picture

Giá trị `picture-in-picture` của tính năng phương tiện {{cssxref("@media/display-mode", "display-mode")}} cho phép nhà phát triển áp dụng CSS cho tài liệu dựa trên việc nó có đang được hiển thị trong chế độ Picture-in-Picture hay không. Cách sử dụng cơ bản như sau:

```css
@media (display-mode: picture-in-picture) {
  body {
    background: red;
  }
}
```

Đoạn mã này sẽ đổi nền của tài liệu `<body>` thành đỏ, chỉ khi nó đang được hiển thị trong chế độ Picture-in-Picture.

## Xử lý khi trang web thoát Picture-in-Picture

Mã để chuyển cửa sổ Picture-in-Picture đóng lại khi nút được nhấn lần thứ hai trông như sau:

```js
inPipMessage.style.display = "none";
playerContainer.append(videoPlayer);
window.documentPictureInPicture.window.close();
```

Tuy nhiên, bạn cũng cần xem xét trường hợp người dùng đóng cửa sổ Picture-in-Picture bằng cách nhấn điều khiển đóng UI do trình duyệt cung cấp trên cửa sổ. Bạn có thể xử lý điều này bằng cách phát hiện khi cửa sổ đóng bằng sự kiện [`pagehide`](/en-US/docs/Web/API/Window/pagehide_event):

```js
pipWindow.addEventListener("pagehide", (event) => {
  inPipMessage.style.display = "none";
  playerContainer.append(videoPlayer);
});
```

## Lắng nghe khi trang web vào Picture-in-Picture

Lắng nghe sự kiện {{domxref("DocumentPictureInPicture.enter_event", "enter")}} trên đối tượng `DocumentPictureInPicture` để biết khi cửa sổ Picture-in-Picture được mở.

Trong demo của chúng tôi, chúng tôi sử dụng sự kiện `enter` để thêm nút bật tắt âm thanh vào cửa sổ Picture-in-Picture:

```js
documentPictureInPicture.addEventListener("enter", (event) => {
  const pipWindow = event.window;
  console.log("Video player has entered the pip window");

  const pipMuteButton = pipWindow.document.createElement("button");
  pipMuteButton.textContent = "Mute";
  pipMuteButton.addEventListener("click", () => {
    const pipVideo = pipWindow.document.querySelector("#video");
    if (!pipVideo.muted) {
      pipVideo.muted = true;
      pipMuteButton.textContent = "Unmute";
    } else {
      pipVideo.muted = false;
      pipMuteButton.textContent = "Mute";
    }
  });

  pipWindow.document.body.append(pipMuteButton);
});
```

## Truy cập phần tử và xử lý sự kiện

Bạn có thể truy cập các phần tử trong cửa sổ Picture-in-Picture theo nhiều cách khác nhau:

- Đối tượng {{domxref("Window")}} được trả về bởi phương thức {{domxref("DocumentPictureInPicture.requestWindow()")}}, như đã thấy ở trên.
- Qua thuộc tính `window` của đối tượng sự kiện {{domxref("DocumentPictureInPictureEvent")}} (trên sự kiện {{domxref("DocumentPictureInPicture.enter_event", "enter")}}).
- Qua thuộc tính {{domxref("DocumentPictureInPicture.window")}}:

```js
const pipWindow = window.documentPictureInPicture.window;
if (pipWindow) {
  // Tắt tiếng video đang phát trong cửa sổ Picture-in-Picture.
  const pipVideo = pipWindow.document.querySelector("#video");
  pipVideo.muted = true;
}
```
