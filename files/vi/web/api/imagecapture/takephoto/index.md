---
title: "ImageCapture: takePhoto() method"
short-title: takePhoto()
slug: Web/API/ImageCapture/takePhoto
page-type: web-api-instance-method
browser-compat: api.ImageCapture.takePhoto
---

{{APIRef("Image Capture API")}}

Phương thức **`takePhoto()`** của giao diện {{domxref("ImageCapture")}} chụp một ảnh đơn lẻ từ thiết bị quay video cung cấp {{domxref("MediaStreamTrack")}} và trả về một {{jsxref("Promise")}} phân giải thành một {{domxref("Blob")}} chứa dữ liệu ảnh.

## Cú pháp

```js-nolint
takePhoto()
takePhoto(photoSettings)
```

### Tham số

- `photoSettings` {{optional_inline}}
  - : Một đối tượng thiết lập các tùy chọn cho ảnh được chụp. Các tùy chọn có sẵn bao gồm:
    - `fillLightMode`
      - : Chế độ đèn flash của thiết bị chụp, một trong các giá trị `"auto"`, `"off"`, hoặc `"flash"`.
    - `imageHeight`
      - : Chiều cao hình ảnh mong muốn dưới dạng số nguyên. Tác nhân người dùng chọn giá trị chiều cao gần nhất với cài đặt này nếu chỉ hỗ trợ các chiều cao rời rạc.
    - `imageWidth`
      - : Chiều rộng hình ảnh mong muốn dưới dạng số nguyên. Tác nhân người dùng chọn giá trị chiều rộng gần nhất với cài đặt này nếu chỉ hỗ trợ các chiều rộng rời rạc.
    - `redEyeReduction`
      - : Giá trị boolean cho biết liệu có nên sử dụng tính năng giảm mắt đỏ nếu có hay không.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một {{domxref("Blob")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính `readyState` của `MediaStreamTrack` được truyền vào hàm khởi tạo không phải là `live`.
- `UnknownError` {{domxref("DOMException")}}
  - : Được ném ra nếu thao tác không thể hoàn thành vì bất kỳ lý do nào.

## Ví dụ

Ví dụ này được trích xuất từ [Simple Image Capture demo](https://simpl.info/imagecapture/). Nó minh họa cách dùng {{jsxref("Promise")}} được trả về bởi `takePhoto()` để sao chép {{domxref("Blob")}} trả về vào phần tử {{htmlelement("img")}}. Để đơn giản, ví dụ không hiển thị cách tạo đối tượng {{domxref("ImageCapture")}}.

```js
let takePhotoButton = document.querySelector("button#takePhoto");
let canvas = document.querySelector("canvas");

takePhotoButton.onclick = takePhoto;

function takePhoto() {
  imageCapture
    .takePhoto()
    .then((blob) => {
      console.log("Took photo:", blob);
      img.classList.remove("hidden");
      img.src = URL.createObjectURL(blob);
    })
    .catch((error) => {
      console.error("takePhoto() error: ", error);
    });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
