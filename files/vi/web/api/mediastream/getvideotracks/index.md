---
title: "MediaStream: phương thức getVideoTracks()"
short-title: getVideoTracks()
slug: Web/API/MediaStream/getVideoTracks
page-type: web-api-instance-method
browser-compat: api.MediaStream.getVideoTracks
---

{{APIRef("Media Capture and Streams")}}

Phương thức **`getVideoTracks()`** của giao diện {{domxref("MediaStream")}} trả về một dãy các đối tượng {{domxref("MediaStreamTrack")}} đại diện cho các track video trong luồng này.

## Cú pháp

```js-nolint
getVideoTracks()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng các đối tượng {{domxref("MediaStreamTrack")}}, mỗi đối tượng cho một track video được chứa trong luồng phương tiện. Các track video là những track có thuộc tính {{domxref("MediaStreamTrack.kind", "kind")}} là `video`. Mảng rỗng nếu luồng không chứa track video nào.

> [!NOTE]
> Thứ tự của các track không được xác định bởi đặc tả, và có thể không giống nhau từ lần gọi `getVideoTracks()` này sang lần gọi khác.

## Ví dụ

Ví dụ sau, được trích xuất từ [Mẫu Độ phân giải Ảnh / Chụp ảnh của Chrome](https://googlechrome.github.io/samples/image-capture/photo-resolution.html), sử dụng `getVideoTracks()` để lấy một track truyền vào constructor {{domxref("ImageCapture.ImageCapture", "ImageCapture()")}}.

```js
let imageCapture;

navigator.mediaDevices.getUserMedia({ video: true }).then((mediaStream) => {
  document.querySelector("video").srcObject = mediaStream;

  const track = mediaStream.getVideoTracks()[0];
  imageCapture = new ImageCapture(track);

  return imageCapture.getPhotoCapabilities();
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
