---
title: Number.prototype.toExponential()
short-title: toExponential()
slug: Web/JavaScript/Reference/Global_Objects/Number/toExponential
page-type: javascript-instance-method
browser-compat: javascript.builtins.Number.toExponential
sidebar: jsref
---

Phương thức **`toExponential()`** của các giá trị {{jsxref("Number")}} trả về một chuỗi biểu diễn số này theo ký hiệu mũ.

{{InteractiveExample("JavaScript Demo: Number.prototype.toExponential()")}}

```js interactive-example
function expo(x, f) {
  return Number.parseFloat(x).toExponential(f);
}

console.log(expo(123456, 2));
// Expected output: "1.23e+5"

console.log(expo("123456"));
// Expected output: "1.23456e+5"

console.log(expo("oink"));
// Expected output: "NaN"
```

## Cú pháp

```js-nolint
toExponential()
toExponential(fractionDigits)
```

### Tham số

- `fractionDigits` {{optional_inline}}
  - : Tùy chọn. Một số nguyên chỉ định số chữ số sau dấu thập phân. Mặc định là số chữ số cần thiết để chỉ định số.

### Giá trị trả về

Một chuỗi biểu diễn đối tượng {{jsxref("Number")}} đã cho theo ký hiệu mũ với một chữ số trước dấu thập phân, làm tròn đến `fractionDigits` chữ số sau dấu thập phân.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu `fractionDigits` không nằm trong khoảng `0` đến `100` (bao gồm cả hai đầu).
- {{jsxref("TypeError")}}
  - : Ném ra nếu phương thức này được gọi trên một đối tượng không phải là {{jsxref("Number")}}.

## Mô tả

Nếu đối số `fractionDigits` bị bỏ qua, số chữ số sau dấu thập phân mặc định là số chữ số cần thiết để biểu diễn giá trị một cách duy nhất.

Nếu bạn sử dụng phương thức `toExponential()` cho một số literal và số literal không có số mũ cũng không có dấu thập phân, hãy để khoảng trắng trước dấu chấm phương thức để tránh dấu chấm bị hiểu là dấu thập phân.

Nếu một số có nhiều chữ số hơn được yêu cầu bởi tham số `fractionDigits`, số được làm tròn đến số gần nhất được biểu diễn bởi `fractionDigits` chữ số. Xem thảo luận về làm tròn trong mô tả của phương thức {{jsxref("Number/toFixed", "toFixed()")}}, cũng áp dụng cho `toExponential()`.

## Ví dụ

### Sử dụng toExponential

```js
const numObj = 77.1234;

console.log(numObj.toExponential()); // 7.71234e+1
console.log(numObj.toExponential(4)); // 7.7123e+1
console.log(numObj.toExponential(2)); // 7.71e+1
console.log((77.1234).toExponential()); // 7.71234e+1
console.log((77).toExponential()); // 7.7e+1
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Number.prototype.toExponential` với nhiều sửa lỗi trong `core-js`](https://github.com/zloirock/core-js#ecmascript-number)
- [es-shims polyfill của `Number.prototype.toExponential`](https://www.npmjs.com/package/number.prototype.toexponential)
- {{jsxref("Number.prototype.toFixed()")}}
- {{jsxref("Number.prototype.toPrecision()")}}
- {{jsxref("Number.prototype.toString()")}}
