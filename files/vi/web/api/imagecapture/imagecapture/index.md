---
title: "ImageCapture: ImageCapture() constructor"
short-title: ImageCapture()
slug: Web/API/ImageCapture/ImageCapture
page-type: web-api-constructor
browser-compat: api.ImageCapture.ImageCapture
---

{{APIRef("Image Capture API")}}

Hàm khởi tạo **`ImageCapture()`** tạo một đối tượng {{domxref("ImageCapture")}} mới.

## Cú pháp

```js-nolint
new ImageCapture(videoTrack)
```

### Tham số

- `videoTrack`
  - : Một {{domxref("MediaStreamTrack")}} dùng để chụp ảnh tĩnh. Có thể là bất kỳ nguồn nào, chẳng hạn như luồng đến từ hội nghị video, một bộ phim đang phát, hoặc luồng từ webcam.

### Giá trị trả về

Một đối tượng `ImageCapture` mới có thể dùng để chụp ảnh tĩnh từ track video được chỉ định.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính `kind` của tham số `videoTrack` không phải là `video`.

## Ví dụ

Ví dụ dưới đây minh họa cách dùng lệnh gọi {{domxref("MediaDevices.getUserMedia()")}} để lấy {{domxref("MediaStreamTrack")}} cần thiết cho hàm khởi tạo `ImageCapture()`.

```js
navigator.mediaDevices
  .getUserMedia({ video: true })
  .then((mediaStream) => {
    document.querySelector("video").srcObject = mediaStream;
    const track = mediaStream.getVideoTracks()[0];
    imageCapture = new ImageCapture(track);
  })
  .catch((error) => console.error(error));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
