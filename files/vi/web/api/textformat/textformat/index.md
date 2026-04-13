---
title: "TextFormat: TextFormat() constructor"
short-title: TextFormat()
slug: Web/API/TextFormat/TextFormat
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.TextFormat.TextFormat
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Hàm khởi tạo **`TextFormat()`** trả về một đối tượng {{DOMxRef("TextFormat")}} mới.

## Cú pháp

```js-nolint
new TextFormat()
new TextFormat(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn với các thuộc tính sau:
    - `rangeStart`
      - : Một số đại diện vị trí bắt đầu của phạm vi văn bản cần được định dạng.
    - `rangeEnd`
      - : Một số đại diện vị trí kết thúc của phạm vi văn bản cần được định dạng.
    - `underlineStyle`
      - : Một chuỗi đại diện kiểu đường gạch chân của phạm vi văn bản cần được định dạng.
    - `underlineThickness`
      - : Một chuỗi đại diện độ dày đường gạch chân của phạm vi văn bản cần được định dạng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("TextFormat")}} mà nó thuộc về.
