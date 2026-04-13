---
title: "BarcodeDetector: phương thức detect()"
short-title: detect()
slug: Web/API/BarcodeDetector/detect
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.BarcodeDetector.detect
---

{{securecontext_header}}{{APIRef("Barcode Detector API")}}{{AvailableInWorkers}}{{SeeCompatTable}}

Phương thức **`detect()`** của giao diện {{domxref("BarcodeDetector")}} trả về một {{jsxref("Promise")}} được hoàn thành với một {{jsxref("Array")}} các mã vạch được phát hiện trong một ảnh.

## Cú pháp

```js-nolint
detect(imageBitmapSource)
```

### Tham số

- `imageBitmapSource`
  - : Nhận một nguồn ảnh làm tham số. Đây có thể là một {{domxref("HTMLImageElement")}}, một {{domxref("SVGImageElement")}}, một {{domxref("HTMLVideoElement")}}, một {{domxref("HTMLCanvasElement")}}, một {{domxref("ImageBitmap")}}, một {{domxref("OffscreenCanvas")}}, một {{domxref("VideoFrame")}}, một {{domxref("Blob")}} kiểu ảnh hoặc một đối tượng {{domxref("ImageData")}}.

### Giá trị trả về

Trả về một {{jsxref("Promise")}} được hoàn thành với một mảng các đối tượng `DetectedBarcode` có các thuộc tính sau:

- `boundingBox`
  - : Một {{domxref("DOMRectReadOnly")}}, trả về kích thước của một hình chữ nhật biểu diễn phạm vi của mã vạch được phát hiện, được căn theo ảnh.
- `cornerPoints`
  - : Tọa độ x và y của bốn điểm góc của mã vạch được phát hiện tương đối với ảnh, bắt đầu từ góc trên bên trái và đi theo chiều kim đồng hồ. Hình này có thể không vuông do biến dạng phối cảnh trong ảnh.
- `format`
  - : Định dạng mã vạch được phát hiện. (Để xem danh sách đầy đủ các định dạng, hãy xem [định dạng mã vạch được hỗ trợ](/en-US/docs/Web/API/Barcode_Detection_API#supported_barcode_formats).)
- `rawValue`
  - : Một chuỗi được giải mã từ dữ liệu mã vạch.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu không có tham số nào được chỉ định hoặc `type` không phải là một `ImageBitmapSource`.
- `SecurityError` {{domxref("DOMException")}}
  - : Được ném ra nếu `imageBitmapSource` có một origin và không trùng với origin của tài liệu, hoặc nếu `imageBitmapSource` là một {{domxref("HTMLCanvasElement")}} và cờ [origin-clean](https://html.spec.whatwg.org/multipage/canvas.html#concept-canvas-origin-clean) của nó được đặt thành `false`.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `imageBitmapSource` là một {{domxref("HTMLImageElement")}} và chưa được giải mã hoàn toàn hoặc việc giải mã thất bại, hoặc là một {{domxref("HTMLVideoElement")}} và {{domxref("HTMLMediaElement.readyState", "readyState")}} của nó là `HAVE_NOTHING` hoặc `HAVE_METADATA`.

## Ví dụ

Ví dụ này dùng phương thức `detect()` để phát hiện các mã vạch trong ảnh đã cho. Các mã vạch này sau đó được lặp qua và dữ liệu mã vạch được ghi ra bảng điều khiển.

```js
barcodeDetector
  .detect(imageEl)
  .then((barcodes) => {
    barcodes.forEach((barcode) => console.log(barcode.rawValue));
  })
  .catch((err) => {
    console.error(err);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
