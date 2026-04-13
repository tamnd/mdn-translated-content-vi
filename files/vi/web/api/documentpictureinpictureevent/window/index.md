---
title: "DocumentPictureInPictureEvent: thuộc tính window"
short-title: window
slug: Web/API/DocumentPictureInPictureEvent/window
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.DocumentPictureInPictureEvent.window
---

{{APIRef("Document Picture-in-Picture API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`window`** của giao diện {{domxref("DocumentPictureInPictureEvent")}} trả về một phiên bản {{domxref("Window")}} đại diện cho ngữ cảnh duyệt web bên trong cửa sổ `DocumentPictureInPicture` mà sự kiện được kích hoạt.

## Giá trị

Một đối tượng {{domxref("Window")}}.

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
