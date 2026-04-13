---
title: BarcodeDetector
slug: Web/API/BarcodeDetector
page-type: web-api-interface
status:
  - experimental
browser-compat: api.BarcodeDetector
---

{{securecontext_header}}{{APIRef("Barcode Detector API")}}{{AvailableInWorkers}}{{SeeCompatTable}}

Giao diện **`BarcodeDetector`** của {{domxref("Barcode Detection API", "", "", "nocode")}} cho phép phát hiện mã vạch một chiều và hai chiều trong ảnh.

## Bộ khởi tạo

- {{domxref("BarcodeDetector.BarcodeDetector", "BarcodeDetector.BarcodeDetector()")}} {{Experimental_Inline}}
  - : Tạo và trả về một đối tượng `BarcodeDetector`, với `BarcodeDetectorOptions` là tùy chọn.

## Phương thức tĩnh

- {{domxref("BarcodeDetector/getSupportedFormats_static", "getSupportedFormats()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được hoàn thành với một {{jsxref("Array")}} gồm các [loại định dạng mã vạch](/en-US/docs/Web/API/Barcode_Detection_API#supported_barcode_formats) được hỗ trợ.

## Phương thức thể hiện

- {{domxref("BarcodeDetector.detect", "detect()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} được hoàn thành với một mảng các đối tượng `DetectedBarcode` có các thuộc tính sau:
    - `boundingBox`: Một {{domxref("DOMRectReadOnly")}}, trả về kích thước của một hình chữ nhật biểu diễn phạm vi của mã vạch được phát hiện, được căn theo ảnh.
    - `cornerPoints`: Tọa độ x và y của bốn điểm góc của mã vạch được phát hiện tương đối với ảnh, bắt đầu từ góc trên bên trái và đi theo chiều kim đồng hồ. Hình này có thể không vuông do biến dạng phối cảnh trong ảnh.
    - `format`: Định dạng mã vạch được phát hiện. (Để xem danh sách đầy đủ các định dạng, hãy tham khảo danh sách [định dạng mã vạch được hỗ trợ](/en-US/docs/Web/API/Barcode_Detection_API#supported_barcode_formats).)
    - `rawValue`: Một chuỗi được giải mã từ dữ liệu mã vạch.

## Ví dụ

### Tạo một detector

Ví dụ này tạo một đối tượng phát hiện mã vạch mới, với các định dạng được hỗ trợ chỉ định sẵn và kiểm tra tính tương thích của trình duyệt.

```js
// check compatibility
if (!("BarcodeDetector" in globalThis)) {
  console.log("Barcode Detector is not supported by this browser.");
} else {
  console.log("Barcode Detector supported!");

  // create new detector
  const barcodeDetector = new BarcodeDetector({
    formats: ["code_39", "codabar", "ean_13"],
  });
}
```

### Lấy các định dạng được hỗ trợ

Ví dụ sau gọi phương thức tĩnh `getSupportFormat()` và ghi kết quả ra bảng điều khiển.

```js
// check supported types
BarcodeDetector.getSupportedFormats().then((supportedFormats) => {
  supportedFormats.forEach((format) => console.log(format));
});
```

### Phát hiện mã vạch

Ví dụ này dùng phương thức `detect()` để phát hiện các mã vạch trong ảnh đã cho. Các mã vạch này sau đó được lặp qua và dữ liệu mã vạch được ghi ra bảng điều khiển.

```js
barcodeDetector
  .detect(imageEl)
  .then((barcodes) => {
    barcodes.forEach((barcode) => console.log(barcode.rawValue));
  })
  .catch((err) => {
    console.log(err);
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [barcodefaq.com: Một trang web có thông tin về các loại mã vạch khác nhau và ví dụ về từng loại.](https://www.barcodefaq.com/)
- [Phát hiện hình dạng tăng tốc trong ảnh](https://developer.chrome.com/docs/capabilities/shape-detection#barcodedetector)
