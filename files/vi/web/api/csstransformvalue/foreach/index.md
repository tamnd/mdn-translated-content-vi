---
title: "CSSTransformValue: forEach() method"
short-title: forEach()
slug: Web/API/CSSTransformValue/forEach
page-type: web-api-instance-method
browser-compat: api.CSSTransformValue.forEach
---

{{APIRef("CSS Typed OM")}}

Phương thức **`CSSTransformValue.forEach()`** thực thi một hàm được cung cấp một lần cho mỗi phần tử của `CSSTransformValue`.

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm được thực thi cho mỗi phần tử, nhận ba đối số:
    - `currentValue`
      - : Giá trị của phần tử hiện tại đang được xử lý.
    - `index` {{optional_inline}}
      - : Chỉ mục của phần tử hiện tại đang được xử lý.
    - `array` {{optional_inline}}
      - : Đối tượng `CSSTransformValue` mà `forEach()` đang được gọi.

- `thisArg` {{Optional_inline}}
  - : Giá trị để sử dụng làm **`this`** (tức là tham chiếu `Object`) khi thực thi `callback`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Sẽ bổ sung

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
