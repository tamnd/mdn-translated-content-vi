---
title: "KeyboardEvent: constructor KeyboardEvent()"
short-title: KeyboardEvent()
slug: Web/API/KeyboardEvent/KeyboardEvent
page-type: web-api-constructor
browser-compat: api.KeyboardEvent.KeyboardEvent
---

{{APIRef("UI Events")}}

Constructor **`KeyboardEvent()`** tạo một đối tượng
{{domxref("KeyboardEvent")} mới.

## Cú pháp

```js-nolint
new KeyboardEvent(type)
new KeyboardEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên của sự kiện.
    Nó phân biệt chữ hoa chữ thường và trình duyệt đặt nó thành `keydown`, `keyup`, hoặc `keypress`.
- `options` {{optional_inline}}
  - : Một đối tượng mà, _ngoài các thuộc tính được định nghĩa trong {{domxref("UIEvent/UIEvent", "UIEvent()")}}_, có thể có các thuộc tính sau:
    - `key` {{optional_inline}}
      - : Một chuỗi, mặc định là `""`, đặt giá trị của {{domxref("KeyboardEvent.key")}}.
    - `code` {{optional_inline}}
      - : Một chuỗi, mặc định là `""`, đặt giá trị của {{domxref("KeyboardEvent.code")}}.
    - `location` {{optional_inline}}
      - : Một số, mặc định là `0`, đặt giá trị của {{domxref("KeyboardEvent.location")}}.
    - `repeat` {{optional_inline}}
      - : Một giá trị boolean, mặc định là `false`, đặt giá trị của {{domxref("KeyboardEvent.repeat")}}.
    - `isComposing` {{optional_inline}}
      - : Một giá trị boolean, mặc định là `false`, đặt giá trị của {{domxref("KeyboardEvent.isComposing")}}.
    - `charCode` {{optional_inline}} {{deprecated_inline}}
      - : Một số, mặc định là `0`, đặt giá trị của {{domxref("KeyboardEvent.charCode")} đã lỗi thời.
    - `keyCode` {{optional_inline}} {{deprecated_inline}}
      - : Một số, mặc định là `0`, đặt giá trị của {{domxref("KeyboardEvent.keyCode")} đã lỗi thời.
    - `which` {{optional_inline}} {{deprecated_inline}}
      - : Một số, mặc định là `0`, đặt giá trị của {{domxref("UIEvent.which")} đã lỗi thời.
    - `ctrlKey` {{optional_inline}}
      - : Một giá trị boolean, mặc định là `false`, đặt giá trị của {{domxref("KeyboardEvent.ctrlKey")}}.
    - `shiftKey` {{optional_inline}}
      - : Một giá trị boolean, mặc định là `false`, đặt giá trị của {{domxref("KeyboardEvent.shiftKey")}}.
    - `altKey` {{optional_inline}}
      - : Một giá trị boolean, mặc định là `false`, đặt giá trị của {{domxref("KeyboardEvent.altKey")}}.
    - `metaKey` {{optional_inline}}
      - : Một giá trị boolean, mặc định là `false`, đặt giá trị của {{domxref("KeyboardEvent.metaKey")}}.

### Giá trị trả về

Một đối tượng {{domxref("KeyboardEvent")} mới.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("KeyboardEvent")}}, giao diện của các đối tượng mà nó xây dựng.
