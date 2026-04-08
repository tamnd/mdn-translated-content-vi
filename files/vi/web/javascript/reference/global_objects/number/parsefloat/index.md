---
title: Number.parseFloat()
short-title: parseFloat()
slug: Web/JavaScript/Reference/Global_Objects/Number/parseFloat
page-type: javascript-static-method
browser-compat: javascript.builtins.Number.parseFloat
sidebar: jsref
---

Phương thức tĩnh **`Number.parseFloat()`** phân tích cú pháp một đối số và trả về một số dấu phẩy động. Nếu không thể phân tích cú pháp số từ đối số, nó trả về {{jsxref("NaN")}}.

{{InteractiveExample("JavaScript Demo: Number.parseFloat()")}}

```js interactive-example
function circumference(r) {
  if (Number.isNaN(Number.parseFloat(r))) {
    return 0;
  }
  return parseFloat(r) * 2.0 * Math.PI;
}

console.log(circumference("4.567abcdefgh"));
// Expected output: 28.695307297889173

console.log(circumference("abcdefgh"));
// Expected output: 0
```

## Cú pháp

```js-nolint
Number.parseFloat(string)
```

### Tham số

- `string`
  - : Giá trị cần phân tích, [chuyển đổi thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion). Khoảng trắng đầu chuỗi trong đối số này bị bỏ qua.

### Giá trị trả về

Một số dấu phẩy động được phân tích từ `string` đã cho.

Hoặc {{jsxref("NaN")}} khi ký tự đầu tiên không phải khoảng trắng không thể chuyển đổi thành số.

## Ví dụ

### Number.parseFloat so với parseFloat

Phương thức này có cùng chức năng với hàm {{jsxref("parseFloat()")}} toàn cục:

```js
Number.parseFloat === parseFloat; // true
```

Mục đích của nó là mô-đun hóa các hàm toàn cục.

Xem {{jsxref("parseFloat()")}} để biết thêm chi tiết và ví dụ.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Number.parseFloat` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-number)
- [es-shims polyfill của `Number.parseFloat`](https://www.npmjs.com/package/number.parsefloat)
- {{jsxref("Number")}}
- {{jsxref("parseFloat()")}}
