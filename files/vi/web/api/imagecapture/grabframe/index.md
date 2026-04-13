---
title: "ImageCapture: grabFrame() method"
short-title: grabFrame()
slug: Web/API/ImageCapture/grabFrame
page-type: web-api-instance-method
browser-compat: api.ImageCapture.grabFrame
---

{{APIRef("Image Capture API")}}

Phương thức **`grabFrame()`** của giao diện {{domxref("ImageCapture")}} chụp một ảnh từ video trực tiếp trong {{domxref("MediaStreamTrack")}} và trả về một {{jsxref("Promise")}} phân giải thành một {{domxref("ImageBitmap")}} chứa ảnh đó.

## Cú pháp

```js-nolint
grabFrame()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một đối tượng {{domxref("ImageBitmap")}}.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính `readyState` của `MediaStreamTrack` được truyền vào hàm khởi tạo không phải là `live`.
- `UnknownError` {{domxref("DOMException")}}
  - : Được ném ra nếu thao tác không thể hoàn thành vì bất kỳ lý do nào.

## Ví dụ

Ví dụ này được trích xuất từ [Simple Image Capture demo](https://simpl.info/imagecapture/). Nó minh họa cách dùng {{jsxref("Promise")}} được trả về bởi `grabFrame()` để sao chép frame trả về vào phần tử {{htmlelement("canvas")}}. Để đơn giản, ví dụ không hiển thị cách tạo đối tượng {{domxref("ImageCapture")}}.

```js
let grabFrameButton = document.querySelector("button#grabFrame");
let canvas = document.querySelector("canvas");

grabFrameButton.onclick = grabFrame;

function grabFrame() {
  imageCapture
    .grabFrame()
    .then((imageBitmap) => {
      console.log("Grabbed frame:", imageBitmap);
      canvas.width = imageBitmap.width;
      canvas.height = imageBitmap.height;
      canvas.getContext("2d").drawImage(imageBitmap, 0, 0);
      canvas.classList.remove("hidden");
    })
    .catch((error) => {
      console.error("grabFrame() error: ", error);
    });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
