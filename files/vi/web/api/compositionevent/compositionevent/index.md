---
title: "CompositionEvent: hàm tạo CompositionEvent()"
short-title: CompositionEvent()
slug: Web/API/CompositionEvent/CompositionEvent
page-type: web-api-constructor
browser-compat: api.CompositionEvent.CompositionEvent
---

{{APIRef("UI Events")}}

Hàm tạo **`CompositionEvent()`** tạo một đối tượng {{domxref("CompositionEvent")}} mới.

## Cú pháp

```js-nolint
new CompositionEvent(type)
new CompositionEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Phân biệt chữ hoa chữ thường và trình duyệt đặt thành `compositionstart`, `compositionupdate`, hoặc `compositionend`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("UIEvent/UIEvent", "UIEvent()")}}_, có các thuộc tính sau:
    - `data` {{optional_inline}}
      - : Một chuỗi dùng để khởi tạo thuộc tính {{domxref("CompositionEvent.data", "data")}} của đối tượng {{domxref("CompositionEvent")}} mới.
        Các sự kiện do trình duyệt tạo đặt thuộc tính này thành các ký tự được tạo bởi quá trình soạn thảo IME.

### Giá trị trả về

Một đối tượng {{domxref("CompositionEvent")}} mới.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CompositionEvent")}}, giao diện của các đối tượng mà nó tạo ra.
