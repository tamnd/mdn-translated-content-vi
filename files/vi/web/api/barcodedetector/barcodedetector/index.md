---
title: "BarcodeDetector: bộ khởi tạo BarcodeDetector()"
short-title: BarcodeDetector()
slug: Web/API/BarcodeDetector/BarcodeDetector
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.BarcodeDetector.BarcodeDetector
---

{{securecontext_header}}{{APIRef("Barcode Detector API")}}{{AvailableInWorkers}}{{SeeCompatTable}}

Bộ khởi tạo **`BarcodeDetector()`** tạo một đối tượng {{domxref("BarcodeDetector")}} mới để phát hiện mã vạch một chiều và hai chiều trong ảnh.

## Cú pháp

```js-nolint
new BarcodeDetector()
new BarcodeDetector(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn chứa một loạt `BarcodeFormats` để tìm kiếm trong các lần gọi {{domxref("BarcodeDetector.detect()", "detect()")}} sau đó. Các tùy chọn gồm:
    - `formats` {{optional_inline}}
      - : Một {{jsxref("Array")}} các định dạng mã vạch ở dạng chuỗi.
        Nếu không được cung cấp, các lần gọi `detect()` sẽ tìm kiếm mọi định dạng được hỗ trợ.
        Vì vậy, bạn nên giới hạn vào các định dạng cụ thể vì lý do hiệu năng.
        Để xem danh sách đầy đủ các định dạng được hỗ trợ, hãy xem [định dạng mã vạch được hỗ trợ](/en-US/docs/Web/API/Barcode_Detection_API#supported_barcode_formats).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `formats` được chỉ định nhưng tham số rỗng hoặc chứa `unknown`.

## Ví dụ

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
