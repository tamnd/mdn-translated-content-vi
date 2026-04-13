---
title: "BarcodeDetector: phương thức tĩnh getSupportedFormats()"
short-title: getSupportedFormats()
slug: Web/API/BarcodeDetector/getSupportedFormats_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.BarcodeDetector.getSupportedFormats_static
---

{{securecontext_header}}{{APIRef("Barcode Detector API")}}{{AvailableInWorkers}}{{SeeCompatTable}}

Phương thức tĩnh **`getSupportedFormats()`** của giao diện {{domxref("BarcodeDetector")}} trả về một {{jsxref("Promise")}} được hoàn thành với một {{jsxref("Array")}} các loại định dạng mã vạch được hỗ trợ.

## Cú pháp

```js-nolint
BarcodeDetector.getSupportedFormats()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được hoàn thành với một {{jsxref("Array")}} các [loại định dạng mã vạch được hỗ trợ](/en-US/docs/Web/API/Barcode_Detection_API#supported_barcode_formats).

### Ngoại lệ

Không có ngoại lệ nào được ném ra.

## Ví dụ

Ví dụ sau gọi phương thức tĩnh `getSupportFormat()` và ghi kết quả ra bảng điều khiển.

```js
// check supported types
BarcodeDetector.getSupportedFormats().then((supportedFormats) => {
  supportedFormats.forEach((format) => console.log(format));
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
