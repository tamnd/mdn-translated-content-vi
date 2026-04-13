---
title: "TextFormatUpdateEvent: TextFormatUpdateEvent() constructor"
short-title: TextFormatUpdateEvent()
slug: Web/API/TextFormatUpdateEvent/TextFormatUpdateEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.TextFormatUpdateEvent.TextFormatUpdateEvent
---

{{APIRef("TextFormatUpdateEvent API")}}{{SeeCompatTable}}

Hàm khởi tạo **`TextFormatUpdateEvent()`** trả về một đối tượng {{DOMxRef("TextFormatUpdateEvent")}} mới.

## Cú pháp

```js-nolint
new TextFormatUpdateEvent(type)
new TextFormatUpdateEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi đại diện cho loại sự kiện. Các giá trị có thể: `"textformatupdate"`.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn với các thuộc tính sau:
    - `textFormats`
      - : Một {{jsxref("Array")}} các đối tượng {{domxref("TextFormat")}} đại diện cho các định dạng văn bản cần được áp dụng với sự kiện này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("TextFormatUpdateEvent")}} mà nó thuộc về.
