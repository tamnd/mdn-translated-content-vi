---
title: "TextUpdateEvent: TextUpdateEvent() constructor"
short-title: TextUpdateEvent()
slug: Web/API/TextUpdateEvent/TextUpdateEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.TextUpdateEvent.TextUpdateEvent
---

{{APIRef("TextUpdateEvent API")}}{{SeeCompatTable}}

Hàm khởi tạo **`TextUpdateEvent()`** trả về đối tượng {{DOMxRef("TextUpdateEvent")}} mới.

## Cú pháp

```js-nolint
new TextUpdateEvent(type)
new TextUpdateEvent(type, options)
```

### Tham số

- `type`
  - : Chuỗi đại diện cho loại sự kiện. Các giá trị có thể: `"textupdate"`.
- `options` {{optional_inline}}
  - : Đối tượng tùy chọn với các thuộc tính sau:
    - `updateRangeStart`
      - : Số đại diện cho độ lệch của ký tự đầu tiên trong văn bản vùng có thể chỉnh sửa cần được cập nhật.
    - `updateRangeEnd`
      - : Số đại diện cho độ lệch của ký tự cuối cùng trong văn bản vùng có thể chỉnh sửa cần được cập nhật.
    - `text`
      - : Chuỗi đại diện cho văn bản cần được chèn vào.
    - `selectionStart`
      - : Số đại diện cho độ lệch bắt đầu vùng chọn trong văn bản vùng có thể chỉnh sửa.
    - `selectionEnd`
      - : Số đại diện cho độ lệch kết thúc vùng chọn trong văn bản vùng có thể chỉnh sửa.
    - `compositionStart`
      - : Số đại diện cho độ lệch bắt đầu của composition trong văn bản vùng có thể chỉnh sửa.
    - `compositionEnd`
      - : Số đại diện cho độ lệch kết thúc của composition trong văn bản vùng có thể chỉnh sửa.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("TextUpdateEvent")}} mà nó thuộc về.
