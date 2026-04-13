---
title: "FocusEvent: Constructor FocusEvent()"
short-title: FocusEvent()
slug: Web/API/FocusEvent/FocusEvent
page-type: web-api-constructor
browser-compat: api.FocusEvent.FocusEvent
---

{{APIRef("UI Events")}}

Constructor **`FocusEvent()`** trả về một đối tượng {{domxref("FocusEvent")}} mới được tạo với {{domxref("EventTarget")}} tùy chọn. Khi sự kiện có cả nguồn và đích, giá trị `relatedTarget` phải được đặt thành mục tiêu còn lại.

## Cú pháp

```js-nolint
new FocusEvent(type)
new FocusEvent(type, options)
```

### Tham số

_Constructor `FocusEvent()` cũng kế thừa các tham số từ {{domxref("UIEvent.UIEvent", "UIEvent()")}} và từ {{domxref("Event.Event", "Event()")}}._

- `type`
  - : Một chuỗi chứa tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt đặt thành `blur`, `focus`, `focusin`, hoặc `focusout`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, ngoài các thuộc tính được định nghĩa trong {{domxref("UIEvent/UIEvent", "UIEvent()")}}, có thể có các thuộc tính sau:
    - `relatedTarget` {{optional_inline}}
      - : Một {{domxref("EventTarget")}} đại diện cho mục tiêu phụ của một {{domxref("FocusEvent")}}. Mặc định là `null`.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("FocusEvent")}} mà nó thuộc về.
