---
title: "DocumentPictureInPictureEvent: hàm khởi tạo DocumentPictureInPictureEvent()"
short-title: DocumentPictureInPictureEvent()
slug: Web/API/DocumentPictureInPictureEvent/DocumentPictureInPictureEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.DocumentPictureInPictureEvent.DocumentPictureInPictureEvent
---

{{APIRef("Document Picture-in-Picture API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Hàm khởi tạo **`DocumentPictureInPictureEvent()`** tạo một phiên bản đối tượng {{domxref("DocumentPictureInPictureEvent")}} mới.

## Cú pháp

```js-nolint
new DocumentPictureInPictureEvent(type, init)
```

### Tham số

- `type`
  - : Một chuỗi đại diện cho loại sự kiện. Trong trường hợp `DocumentPictureInPictureEvent`, giá trị này luôn là `enter`.
- `init`
  - : Một đối tượng chứa các thuộc tính sau:
    - `window`
      - : Một phiên bản {{domxref("Window")}} đại diện cho ngữ cảnh duyệt web bên trong cửa sổ `DocumentPictureInPicture` mà sự kiện được kích hoạt.

## Ví dụ

Nhà phát triển thường không sử dụng hàm khởi tạo này theo cách thủ công. Một đối tượng `DocumentPictureInPictureEvent` mới được tạo khi trình xử lý được gọi do sự kiện {{domxref("DocumentPictureInPicture.enter_event", "enter")}} kích hoạt.

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document Picture-in-Picture API", "Document Picture-in-Picture API", "", "nocode")}}
- [Using the Document Picture-in-Picture API](/en-US/docs/Web/API/Document_Picture-in-Picture_API/Using)
