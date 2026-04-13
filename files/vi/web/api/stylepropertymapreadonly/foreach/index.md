---
title: "StylePropertyMapReadOnly: phương thức forEach()"
short-title: forEach()
slug: Web/API/StylePropertyMapReadOnly/forEach
page-type: web-api-instance-method
browser-compat: api.StylePropertyMapReadOnly.forEach
---

{{APIRef("CSS Typed Object Model API")}}

Phương thức **`StylePropertyMapReadOnly.forEach()`** thực thi một hàm được cung cấp một lần cho mỗi phần tử của {{domxref('StylePropertyMapReadOnly')}}.

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
      - : StylePropertyMapReadOnly mà `forEach()` đang được gọi trên đó.

- `thisArg` {{Optional_inline}}
  - : Giá trị dùng làm **`this`** (tức là đối tượng tham chiếu `Object`) khi thực thi `callback`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Đây là ví dụ sử dụng `forEach()` trên {{domxref('Element.computedStyleMap()')}} đã được lấy về.

```js
// get a button element
const buttonEl = document.querySelector(".example");

// we can retrieve all computed styles with `computedStyleMap`
const allComputedStyles = buttonEl.computedStyleMap();

// forEach will allow us to run code over each prop/val pair
allComputedStyles.forEach((elem, index, arr) => {
  // code to run for each pair
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
