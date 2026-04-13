---
title: "TransitionEvent: TransitionEvent() constructor"
short-title: TransitionEvent()
slug: Web/API/TransitionEvent/TransitionEvent
page-type: web-api-constructor
browser-compat: api.TransitionEvent.TransitionEvent
---

{{APIRef("CSSOM")}}

Hàm khởi tạo **`TransitionEvent()`** trả về một đối tượng {{domxref("TransitionEvent")}} mới, biểu diễn một sự kiện liên quan đến transition.

## Cú pháp

```js-nolint
new TransitionEvent(type)
new TransitionEvent(type, options)
```

### Tham số

- `type`
  - : Chuỗi chứa tên của sự kiện. Phân biệt chữ hoa chữ thường và trình duyệt đặt là `transitionrun`, `transitionstart`, `transitionend`, hoặc `transitioncancel`.
- `options` {{optional_inline}}
  - : Một đối tượng có thể có các thuộc tính sau (ngoài các thuộc tính đã định nghĩa trong {{domxref("Event/Event", "Event()")}}):
    - `propertyName` {{optional_inline}}
      - : Chuỗi chứa tên thuộc tính CSS liên quan đến transition. Mặc định là `""`.
    - `elapsedTime` {{optional_inline}}
      - : Số cho biết thời gian hoạt ảnh đã chạy, tính bằng giây, khi sự kiện này được kích hoạt, không tính thời gian hoạt ảnh bị tạm dừng. Mặc định là `0.0`.
    - `pseudoElement` {{optional_inline}}
      - : Chuỗi, mặc định bắt đầu bằng `"::"`, chứa tên của [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) mà hoạt ảnh chạy trên đó. Nếu hoạt ảnh không chạy trên phần tử giả, chuỗi rỗng: `""`. Mặc định là `""`.

### Giá trị trả về

Một đối tượng {{domxref("TransitionEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS transitions](/en-US/docs/Web/CSS/Guides/Transitions/Using)
- Thuộc tính CSS: {{cssxref("transition")}}, {{cssxref("transition-delay")}}, {{cssxref("transition-duration")}}, {{cssxref("transition-property")}}, {{cssxref("transition-timing-function")}}.
