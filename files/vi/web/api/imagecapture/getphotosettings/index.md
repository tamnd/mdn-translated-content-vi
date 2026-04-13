---
title: "ImageCapture: getPhotoSettings() method"
short-title: getPhotoSettings()
slug: Web/API/ImageCapture/getPhotoSettings
page-type: web-api-instance-method
browser-compat: api.ImageCapture.getPhotoSettings
---

{{APIRef("Image Capture API")}}

Phương thức **`getPhotoSettings()`** của giao diện {{domxref("ImageCapture")}} trả về một {{jsxref("Promise")}} phân giải thành một đối tượng chứa các cài đặt cấu hình ảnh hiện tại.

## Cú pháp

```js-nolint
getPhotoSettings()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một đối tượng chứa các thuộc tính sau:

- `fillLightMode`
  - : Chế độ đèn flash của thiết bị chụp, một trong các giá trị `"auto"`, `"off"`, hoặc `"flash"`.
- `imageHeight`
  - : Chiều cao hình ảnh mong muốn dưới dạng số nguyên. Trình duyệt chọn giá trị chiều cao gần nhất với cài đặt này nếu chỉ hỗ trợ các chiều cao rời rạc.
- `imageWidth`
  - : Chiều rộng hình ảnh mong muốn dưới dạng số nguyên. Trình duyệt chọn giá trị chiều rộng gần nhất với cài đặt này nếu chỉ hỗ trợ các chiều rộng rời rạc.
- `redEyeReduction`
  - : Giá trị boolean cho biết liệu có nên sử dụng tính năng giảm mắt đỏ nếu có hay không.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính `readyState` của `MediaStreamTrack` được truyền vào hàm khởi tạo không phải là `live`.
- `OperationError` {{domxref("DOMException")}}
  - : Được ném ra nếu thao tác không thể hoàn thành vì bất kỳ lý do nào.

## Ví dụ

Ví dụ dưới đây, được trích xuất từ [Chrome's Image Capture / Photo Resolution Sample](https://googlechrome.github.io/samples/image-capture/photo-resolution.html), sử dụng kết quả từ `getPhotoSettings()` để thay đổi kích thước của một phần tử input range. Ví dụ này cũng minh họa cách tạo đối tượng {{domxref("ImageCapture")}} bằng cách dùng {{domxref("MediaStreamTrack")}} lấy từ {{domxref("MediaStream")}} của thiết bị.

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
