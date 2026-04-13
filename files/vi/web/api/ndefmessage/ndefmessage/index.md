---
title: "NDEFMessage: hàm khởi tạo NDEFMessage()"
short-title: NDEFMessage()
slug: Web/API/NDEFMessage/NDEFMessage
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.NDEFMessage.NDEFMessage
---

{{SecureContext_Header}}{{APIRef("Web NFC API")}}{{SeeCompatTable}}

Hàm khởi tạo **`NDEFMessage()`** tạo một đối tượng {{domxref("NDEFMessage")}} mới, được khởi tạo với các bản ghi NDEF đã cho.

## Cú pháp

```js-nolint
new NDEFMessage(records)
```

### Tham số

- `records`
  - : Một mảng các đối tượng với các thành viên sau:
    - `data` {{optional_inline}}
      - : Chứa dữ liệu cần truyền; có thể là một chuỗi, một {{jsxref("ArrayBuffer")}}, một {{jsxref("TypedArray")}}, một {{jsxref("DataView")}}, hoặc một mảng các bản ghi lồng nhau.
    - `encoding` {{optional_inline}}
      - : Một chuỗi chỉ định mã hóa của bản ghi.
    - `id` {{optional_inline}}
      - : Một định danh do nhà phát triển xác định cho bản ghi.
    - `lang` {{optional_inline}}
      - : Một {{glossary("BCP 47 language tag")}} hợp lệ.
    - `mediaType` {{optional_inline}}
      - : Một [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) hợp lệ.
    - `recordType`
      - : Một chuỗi chỉ ra loại dữ liệu được lưu trữ trong `data`. Nó phải là một trong các giá trị sau:
        - `"absolute-url"`
          - : Một URL tuyệt đối đến dữ liệu.
        - `"empty"`
          - : Một {{domxref("NDEFRecord")}} rỗng.
        - `"mime"`
          - : Một [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) hợp lệ.
        - `"smart-poster"`
          - : Một smart poster được định nghĩa bởi thông số kỹ thuật [NDEF-SMARTPOSTER](https://w3c.github.io/web-nfc/#bib-ndef-smartposter).
        - `"text"`
          - : Văn bản được định nghĩa bởi thông số kỹ thuật [NDEF-TEXT](https://w3c.github.io/web-nfc/#bib-ndef-text).
        - `"unknown"`
          - : Loại bản ghi không được biết.
        - `"URL"`
          - : Một URL được định nghĩa bởi thông số kỹ thuật [NDEF-URI](https://w3c.github.io/web-nfc/#bib-ndef-uri).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
