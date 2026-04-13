---
title: ImageCapture
slug: Web/API/ImageCapture
page-type: web-api-interface
browser-compat: api.ImageCapture
---

{{APIRef("Image Capture API")}}

Giao diện **`ImageCapture`** thuộc [MediaStream Image Capture API](/en-US/docs/Web/API/MediaStream_Image_Capture_API) cung cấp các phương thức để chụp ảnh hoặc ảnh tĩnh từ camera hoặc thiết bị chụp ảnh khác. Giao diện này cho phép chụp ảnh từ một thiết bị chụp ảnh được tham chiếu qua một {{domxref("MediaStreamTrack")}} hợp lệ.

## Hàm khởi tạo

- {{domxref("ImageCapture.ImageCapture()", "ImageCapture()")}}
  - : Tạo một đối tượng `ImageCapture` mới có thể dùng để chụp ảnh tĩnh từ một {{domxref("MediaStreamTrack")}} đại diện cho luồng video.

## Thuộc tính phiên bản

- {{domxref("ImageCapture.track")}} {{ReadOnlyInline}}
  - : Trả về tham chiếu đến {{domxref("MediaStreamTrack")}} đã được truyền vào hàm khởi tạo.

## Phương thức phiên bản

- {{domxref("ImageCapture.takePhoto()")}}
  - : Chụp một ảnh đơn lẻ từ thiết bị quay video cung cấp {{domxref("MediaStreamTrack")}} và trả về một {{jsxref("Promise")}} phân giải thành một {{domxref("Blob")}} chứa dữ liệu ảnh.
- {{domxref("ImageCapture.getPhotoCapabilities()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một đối tượng chứa các phạm vi tùy chọn cấu hình có sẵn.
- {{domxref("ImageCapture.getPhotoSettings()")}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một đối tượng chứa các cài đặt cấu hình ảnh hiện tại.
- {{domxref("ImageCapture.grabFrame()")}}
  - : Chụp một ảnh từ video trực tiếp trong {{domxref("MediaStreamTrack")}}, trả về một {{domxref("ImageBitmap")}} nếu thành công.

## Ví dụ

Đoạn mã dưới đây được lấy từ [Chrome's Grab Frame - Take Photo Sample](https://googlechrome.github.io/samples/image-capture/grab-frame-take-photo.html). Vì `ImageCapture` cần một nguồn để chụp ảnh, ví dụ dưới đây bắt đầu với thiết bị media (tức là camera).

Ví dụ này minh họa, sơ lược, một {{domxref("MediaStreamTrack")}} được trích xuất từ {{domxref("MediaStream")}} của thiết bị. Track đó được dùng để tạo đối tượng `ImageCapture`, qua đó có thể gọi `takePhoto()` và `grabFrame()`. Cuối cùng, ví dụ chỉ cách áp dụng kết quả vào một đối tượng canvas.

```js
let imageCapture;

function onGetUserMediaButtonClick() {
  navigator.mediaDevices
    .getUserMedia({ video: true })
    .then((mediaStream) => {
      document.querySelector("video").srcObject = mediaStream;

      const track = mediaStream.getVideoTracks()[0];
      imageCapture = new ImageCapture(track);
    })
    .catch((error) => console.error(error));
}

function onGrabFrameButtonClick() {
  imageCapture
    .grabFrame()
    .then((imageBitmap) => {
      const canvas = document.querySelector("#grabFrameCanvas");
      drawCanvas(canvas, imageBitmap);
    })
    .catch((error) => console.error(error));
}

function onTakePhotoButtonClick() {
  imageCapture
    .takePhoto()
    .then((blob) => createImageBitmap(blob))
    .then((imageBitmap) => {
      const canvas = document.querySelector("#takePhotoCanvas");
      drawCanvas(canvas, imageBitmap);
    })
    .catch((error) => console.error(error));
}

/* Utils */

function drawCanvas(canvas, img) {
  canvas.width = getComputedStyle(canvas).width.split("px")[0];
  canvas.height = getComputedStyle(canvas).height.split("px")[0];
  let ratio = Math.min(canvas.width / img.width, canvas.height / img.height);
  let x = (canvas.width - img.width * ratio) / 2;
  let y = (canvas.height - img.height * ratio) / 2;
  canvas.getContext("2d").clearRect(0, 0, canvas.width, canvas.height);
  canvas
    .getContext("2d")
    .drawImage(
      img,
      0,
      0,
      img.width,
      img.height,
      x,
      y,
      img.width * ratio,
      img.height * ratio,
    );
}

document.querySelector("video").addEventListener("play", () => {
  document.querySelector("#grabFrameButton").disabled = false;
  document.querySelector("#takePhotoButton").disabled = false;
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
