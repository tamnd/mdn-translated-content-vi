---
title: "CharacterBoundsUpdateEvent: bộ khởi tạo CharacterBoundsUpdateEvent()"
short-title: CharacterBoundsUpdateEvent()
slug: Web/API/CharacterBoundsUpdateEvent/CharacterBoundsUpdateEvent
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.CharacterBoundsUpdateEvent.CharacterBoundsUpdateEvent
---

{{APIRef("CharacterBoundsUpdateEvent API")}}{{SeeCompatTable}}

Bộ khởi tạo **`CharacterBoundsUpdateEvent()`** trả về một đối tượng {{DOMxRef("CharacterBoundsUpdateEvent")}} mới.

## Cú pháp

```js-nolint
new CharacterBoundsUpdateEvent(type)
new CharacterBoundsUpdateEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi biểu diễn kiểu của sự kiện. Giá trị có thể là: `"characterboundsupdate"`.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn với các thuộc tính sau:
    - `rangeStart`
      - : Một số dùng để đặt độ lệch của ký tự đầu tiên trong vùng văn bản có thể chỉnh sửa mà sự kiện này áp dụng.
    - `rangeEnd`
      - : Một số dùng để đặt độ lệch của ký tự cuối cùng trong vùng văn bản có thể chỉnh sửa mà sự kiện này áp dụng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("CharacterBoundsUpdateEvent")}} mà nó thuộc về.
