---
title: "KeyboardLayoutMap: phương thức forEach()"
short-title: forEach()
slug: Web/API/KeyboardLayoutMap/forEach
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.KeyboardLayoutMap.forEach
spec-urls: https://tc39.es/ecma262/multipage/keyed-collections.html#sec-map.prototype.foreach
---

{{APIRef("Keyboard API")}}{{SeeCompatTable}}

Phương thức **`forEach()`** của giao diện {{domxref('KeyboardLayoutMap')}} thực thi hàm được cung cấp một lần cho mỗi phần tử của bản đồ.

Phương thức này giống với {{jsxref("Map.prototype.forEach()")}}.

## Cú pháp

```js-nolint
forEach(callbackFn)
forEach(callbackFn, thisArg)
```

### Tham số

- `callbackFn`
  - : Hàm thực thi cho mỗi phần tử, nhận ba đối số:
    - `currentValue`
      - : Giá trị của phần tử hiện tại đang được xử lý.
    - `index` {{optional_inline}}
      - : Chỉ mục của phần tử hiện tại đang được xử lý.
    - `array` {{optional_inline}}
      - : KeyboardLayoutMap mà `forEach()` đang được gọi trên.

- `thisArg` {{Optional_inline}}
  - : Giá trị sử dụng làm **`this`** (tức là tham chiếu đối tượng) khi thực thi `callback`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau lặp qua mỗi chuỗi theo vị trí hoặc bố cục cụ thể và mã bàn phím liên kết của nó trên bàn phím QWERTY tiếng Anh.

```js
navigator.keyboard.getLayoutMap().then((keyboardLayoutMap) => {
  keyboardLayoutMap.forEach((key, code) => {
    console.log(`${code} keyboard code represents ${key} key`);
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Map.prototype.forEach()")}}
