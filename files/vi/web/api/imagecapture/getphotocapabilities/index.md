---
title: "ImageCapture: getPhotoCapabilities() method"
short-title: getPhotoCapabilities()
slug: Web/API/ImageCapture/getPhotoCapabilities
page-type: web-api-instance-method
browser-compat: api.ImageCapture.getPhotoCapabilities
---

{{APIRef("Image Capture API")}}

Phương thức **`getPhotoCapabilities()`** của giao diện {{domxref("ImageCapture")}} trả về một {{jsxref("Promise")}} phân giải thành một đối tượng chứa các phạm vi tùy chọn cấu hình có sẵn.

## Cú pháp

```js-nolint
getPhotoCapabilities()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một đối tượng chứa các thuộc tính sau:

- `redEyeReduction`
  - : Trả về một trong các giá trị `"never"`, `"always"`, hoặc `"controllable"`. Giá trị `"controllable"` có nghĩa là tính năng giảm mắt đỏ của thiết bị có thể được người dùng kiểm soát.
- `imageHeight`
  - : Trả về một đối tượng cho biết phạm vi chiều cao hình ảnh được tác nhân người dùng hỗ trợ.
- `imageWidth`
  - : Trả về một đối tượng cho biết phạm vi chiều rộng hình ảnh được tác nhân người dùng hỗ trợ.
- `fillLightMode`
  - : Trả về một mảng các tùy chọn đèn chiếu sáng có sẵn. Các tùy chọn bao gồm `auto`, `off`, hoặc `flash`.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính `readyState` của `MediaStreamTrack` được truyền vào hàm khởi tạo không phải là `live`.
- `OperationError` {{domxref("DOMException")}}
  - : Được ném ra nếu thao tác không thể hoàn thành vì bất kỳ lý do nào.

## Ví dụ

Ví dụ dưới đây, được trích xuất từ [Chrome's Image Capture / Photo Resolution Sample](https://googlechrome.github.io/samples/image-capture/photo-resolution.html), sử dụng kết quả từ `getPhotoCapabilities()` để thay đổi kích thước của một phần tử input range. Ví dụ này cũng minh họa cách tạo đối tượng {{domxref("ImageCapture")}} bằng cách dùng {{domxref("MediaStreamTrack")}} lấy từ {{domxref("MediaStream")}} của thiết bị.

```js
const input = document.querySelector('input[type="range"]');

let imageCapture;

navigator.mediaDevices
  .getUserMedia({ video: true })
  .then((mediaStream) => {
    document.querySelector("video").srcObject = mediaStream;

    const track = mediaStream.getVideoTracks()[0];
    imageCapture = new ImageCapture(track);

    return imageCapture.getPhotoCapabilities();
  })
  .then((photoCapabilities) => {
    const settings = imageCapture.track.getSettings();

    input.min = photoCapabilities.imageWidth.min;
    input.max = photoCapabilities.imageWidth.max;
    input.step = photoCapabilities.imageWidth.step;

    return imageCapture.getPhotoSettings();
  })
  .then((photoSettings) => {
    input.value = photoSettings.imageWidth;
  })
  .catch((error) => console.error("Argh!", error.name || error));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
