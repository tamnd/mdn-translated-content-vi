---
title: "NDEFReadingEvent: NDEFReadingEvent() constructor"
short-title: NDEFReadingEvent()
slug: Web/API/NDEFReadingEvent/NDEFReadingEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.NDEFReadingEvent.NDEFReadingEvent
---

{{APIRef("Web NFC API")}}{{securecontext_header}}{{SeeCompatTable}}

Hàm khởi tạo **`NDEFReadingEvent()`** tạo một đối tượng {{domxref("NDEFReadingEvent")}} mới đại diện cho các sự kiện được gửi khi có đọc NFC mới do {{DOMxRef("NDEFReader")}} thu được.

## Cú pháp

```js-nolint
new NDEFReadingEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi chứa tên sự kiện. Phân biệt chữ hoa chữ thường và các trình duyệt luôn đặt giá trị là `reading`.
- `options`
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `serialNumber` {{optional_inline}}
      - : Số serial của thiết bị mà tin nhắn được đọc từ đó. Mặc định là `""`, và có thể được đặt thành `null`.
    - `message`
      - : Một đối tượng với các thành viên sau:
        - `data` {{optional_inline}}
          - : Chứa dữ liệu cần truyền. Có thể là chuỗi, {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, {{jsxref("DataView")}}, hoặc mảng các bản ghi lồng nhau.
        - `encoding` {{optional_inline}}
          - : Một chuỗi chỉ định mã hóa của bản ghi.
        - `id` {{optional_inline}}
          - : Định danh do nhà phát triển định nghĩa cho bản ghi.
        - `lang` {{optional_inline}}
          - : Một {{glossary("BCP 47 language tag")}} hợp lệ.
        - `mediaType` {{optional_inline}}
          - : Một [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) hợp lệ.
        - `recordType`
          - : Một chuỗi cho biết loại dữ liệu được lưu trữ trong `data`. Phải là một trong các giá trị sau:
            - `"absolute-url"`: URL tuyệt đối đến dữ liệu.
            - `"empty"`: Một {{domxref("NDEFRecord")}} rỗng.
            - `"mime"`: Một [kiểu MIME](/en-US/docs/Web/HTTP/Guides/MIME_types) hợp lệ.
            - `"smart-poster"`: Smart poster theo định nghĩa trong thông số kỹ thuật [NDEF-SMARTPOSTER](https://w3c.github.io/web-nfc/#bib-ndef-smartposter).
            - `"text"`: Văn bản theo định nghĩa trong thông số kỹ thuật [NDEF-TEXT](https://w3c.github.io/web-nfc/#bib-ndef-text).
            - `"unknown"`: Loại bản ghi không được biết đến.
            - `"URL"`: URL theo định nghĩa trong thông số kỹ thuật [NDEF-URI](https://w3c.github.io/web-nfc/#bib-ndef-uri).

### Giá trị trả về

Một đối tượng {{domxref("NDEFReadingEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
