---
title: "DocumentPictureInPicture: window property"
short-title: window
slug: Web/API/DocumentPictureInPicture/window
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.DocumentPictureInPicture.window
---

{{APIRef("Document Picture-in-Picture API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`window`** của giao diện
{{domxref("DocumentPictureInPicture")}} trả về phiên bản {{domxref("Window")}} đại diện cho ngữ cảnh duyệt web bên trong cửa sổ Picture-in-Picture.

## Giá trị

Phiên bản đối tượng {{domxref("Window")}} nếu cửa sổ Picture-in-Picture đã được mở bằng {{domxref("DocumentPictureInPicture.requestWindow()")}}, hoặc `null` nếu chưa.

## Ví dụ

```js
const videoPlayer = document.getElementById("player");

// …

await window.documentPictureInPicture.requestWindow({
  width: videoPlayer.clientWidth,
  height: videoPlayer.clientHeight,
});

// …

const pipWindow = window.documentPictureInPicture.window;
if (pipWindow) {
  // Mute video playing in the Picture-in-Picture window.
  const pipVideo = pipWindow.document.querySelector("#video");
  pipVideo.muted = true;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document Picture-in-Picture API", "Document Picture-in-Picture API", "", "nocode")}}
- [Sử dụng Document Picture-in-Picture API](/en-US/docs/Web/API/Document_Picture-in-Picture_API/Using)
