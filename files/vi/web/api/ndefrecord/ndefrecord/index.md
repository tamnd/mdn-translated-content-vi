---
title: "NDEFRecord: hàm khởi tạo NDEFRecord()"
short-title: NDEFRecord()
slug: Web/API/NDEFRecord/NDEFRecord
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.NDEFRecord.NDEFRecord
---

{{SecureContext_Header}}{{SeeCompatTable}}{{APIRef("Web NFC API")}}

Hàm khởi tạo **`NDEFRecord()`** của [Web NFC API](/en-US/docs/Web/API/Web_NFC_API) trả về một đối tượng {{DOMxRef("NDEFRecord")}} được xây dựng mới đại diện cho dữ liệu có thể được đọc từ, hoặc ghi vào, các thiết bị NFC tương thích, ví dụ: các thẻ NFC hỗ trợ NDEF.

## Cú pháp

```js-nolint
new NDEFRecord(options)
```

### Tham số

- `options`
  - : Một đối tượng với các thuộc tính sau:
    - `data` {{optional_inline}}
      - : Chứa dữ liệu cần truyền. Có thể là chuỗi, {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, {{jsxref("DataView")}} hoặc mảng các bản ghi lồng nhau.
    - `encoding` {{optional_inline}}
      - : Một chuỗi chỉ định mã hóa của bản ghi.
    - `id` {{optional_inline}}
      - : Định danh do nhà phát triển định nghĩa cho bản ghi.
    - `lang` {{optional_inline}}
      - : Một {{glossary("BCP 47 language tag")}} hợp lệ.
    - `mediaType` {{optional_inline}}
      - : Một [loại MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) hợp lệ.
    - `recordType`
      - : Một chuỗi chỉ định loại dữ liệu được lưu trữ trong `data`. Phải là một trong các giá trị sau:
        - `"absolute-url"`
          - : URL tuyệt đối đến dữ liệu.
        - `"empty"`
          - : Một {{domxref("NDEFRecord")}} rỗng.
        - `"mime"`
          - : Một [loại MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) hợp lệ.
        - `"smart-poster"`
          - : Smart poster như được định nghĩa trong thông số kỹ thuật [NDEF-SMARTPOSTER](https://w3c.github.io/web-nfc/#bib-ndef-smartposter).
        - `"text"`
          - : Văn bản như được định nghĩa trong thông số kỹ thuật [NDEF-TEXT](https://w3c.github.io/web-nfc/#bib-ndef-text).
        - `"unknown"`
          - : Loại bản ghi không được biết.
        - `"URL"`
          - : URL như được định nghĩa trong thông số kỹ thuật [NDEF-URI](https://w3c.github.io/web-nfc/#bib-ndef-uri).

### Giá trị trả về

Một {{DOMxRef("NDEFRecord")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
