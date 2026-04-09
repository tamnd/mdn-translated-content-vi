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
  - : Một chuỗi chứa tên của sự kiện.
    Chuỗi này phân biệt chữ hoa chữ thường và trình duyệt sẽ đặt nó thành `compositionstart`, `compositionupdate`, hoặc `compositionend`.
- `options` {{optional_inline}}
  - : Một đối tượng, ngoài các thuộc tính được định nghĩa trong {{domxref("UIEvent/UIEvent", "UIEvent()")}}, còn có các thuộc tính sau:
    - `data` {{optional_inline}}
      - : Một chuỗi dùng để khởi tạo thuộc tính {{domxref("CompositionEvent.data", "data")}} của {{domxref("CompositionEvent")}} mới. Với các sự kiện do trình duyệt tạo ra, giá trị này được đặt thành các ký tự do composition của IME tạo ra.

### Giá trị trả về

Một đối tượng {{domxref("CompositionEvent")}} mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CompositionEvent")}}, giao diện của các đối tượng mà hàm tạo này tạo ra.
