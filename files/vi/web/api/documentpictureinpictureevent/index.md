---
title: DocumentPictureInPictureEvent
slug: Web/API/DocumentPictureInPictureEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.DocumentPictureInPictureEvent
---

{{APIRef("Document Picture-in-Picture API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Giao diện **`DocumentPictureInPictureEvent`** của {{domxref("Document Picture-in-Picture API", "Document Picture-in-Picture API", "", "nocode")}} là đối tượng sự kiện cho sự kiện {{domxref("DocumentPictureInPicture/enter_event", "enter")}}, được kích hoạt khi cửa sổ Picture-in-Picture được mở.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("DocumentPictureInPictureEvent.DocumentPictureInPictureEvent", "DocumentPictureInPictureEvent()")}} {{Experimental_Inline}}
  - : Tạo một phiên bản đối tượng `DocumentPictureInPictureEvent` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ đối tượng cha, {{DOMxRef("Event")}}._

- {{domxref("DocumentPictureInPictureEvent.window", "window")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một phiên bản {{domxref("Window")}} đại diện cho ngữ cảnh duyệt web bên trong cửa sổ `DocumentPictureInPicture` mà sự kiện được kích hoạt.

## Phương thức phiên bản

_Kế thừa các phương thức từ đối tượng cha, {{DOMxRef("Event")}}._

## Ví dụ

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
