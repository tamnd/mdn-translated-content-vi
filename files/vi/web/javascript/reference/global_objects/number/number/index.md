---
title: Number() constructor
short-title: Number()
slug: Web/JavaScript/Reference/Global_Objects/Number/Number
page-type: javascript-constructor
browser-compat: javascript.builtins.Number.Number
sidebar: jsref
---

Hàm tạo **`Number()`** tạo ra các đối tượng {{jsxref("Number")}}. Khi được gọi như một hàm thông thường, nó trả về các giá trị nguyên thủy kiểu Number.

## Cú pháp

```js-nolint
new Number(value)
Number(value)
```

> [!NOTE]
> `Number()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new), nhưng với các hiệu ứng khác nhau. Xem [Giá trị trả về](#return_value).

### Tham số

- `value`
  - : Giá trị số của đối tượng được tạo.

### Giá trị trả về

Khi `Number()` được gọi như một hàm (không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new)), nó trả về `value` [chuyển đổi thành số nguyên thủy](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion). Đặc biệt, các giá trị [BigInt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt) được chuyển đổi sang số thay vì ném lỗi. Nếu `value` bị bỏ qua, giá trị trả về là `0`.

Khi `Number()` được gọi như một hàm tạo (với `new`), nó sử dụng quá trình chuyển đổi ở trên và trả về một đối tượng {{jsxref("Number")}} bao bọc, **không** phải là nguyên thủy.

> [!WARNING]
> Bạn hiếm khi cần sử dụng `Number` như một hàm tạo.

## Ví dụ

### Tạo đối tượng Number

```js
const a = new Number("123"); // a === 123 is false
const b = Number("123"); // b === 123 is true
a instanceof Number; // is true
b instanceof Number; // is false
typeof a; // "object"
typeof b; // "number"
```

### Sử dụng Number() để chuyển đổi BigInt sang number

`Number()` là trường hợp duy nhất mà BigInt có thể được chuyển đổi sang số mà không ném lỗi, vì nó rất rõ ràng.

```js example-bad
+1n; // TypeError: Cannot convert a BigInt value to a number
0 + 1n; // TypeError: Cannot mix BigInt and other types, use explicit conversions
```

```js example-good
Number(1n); // 1
```

Lưu ý rằng điều này có thể dẫn đến mất độ chính xác nếu BigInt quá lớn để được [biểu diễn an toàn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/isSafeInteger).

```js
BigInt(Number(2n ** 54n + 1n)) === 2n ** 54n + 1n; // false
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Number` hiện đại (hỗ trợ số nhị phân và bát phân) trong `core-js`](https://github.com/zloirock/core-js#ecmascript-number)
- {{jsxref("NaN")}}
- {{jsxref("Math")}}
- {{jsxref("BigInt")}}
