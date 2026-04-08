---
title: Number.prototype.toPrecision()
short-title: toPrecision()
slug: Web/JavaScript/Reference/Global_Objects/Number/toPrecision
page-type: javascript-instance-method
browser-compat: javascript.builtins.Number.toPrecision
sidebar: jsref
---

Phương thức **`toPrecision()`** của các giá trị {{jsxref("Number")}} trả về một chuỗi biểu diễn số này với số chữ số có nghĩa được chỉ định.

{{InteractiveExample("JavaScript Demo: Number.prototype.toPrecision()")}}

```js interactive-example
function precise(x) {
  return x.toPrecision(4);
}

console.log(precise(123.456));
// Expected output: "123.5"

console.log(precise(0.004));
// Expected output: "0.004000"

console.log(precise(1.23e5));
// Expected output: "1.230e+5"
```

## Cú pháp

```js-nolint
toPrecision()
toPrecision(precision)
```

### Tham số

- `precision` {{optional_inline}}
  - : Một số nguyên chỉ định số chữ số có nghĩa.

### Giá trị trả về

Một chuỗi biểu diễn số đã cho, sử dụng số chữ số có nghĩa được chỉ định. Ký hiệu khoa học được sử dụng nếu số mũ lớn hơn hoặc bằng `precision` hoặc nhỏ hơn -6. Có hành vi giống như {{jsxref("Number.prototype.toString()")}} nếu đối số `precision` bị bỏ qua.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu `precision` không nằm trong khoảng `1` đến `100` (bao gồm cả hai đầu).
- {{jsxref("TypeError")}}
  - : Ném ra nếu phương thức này được gọi trên một đối tượng không phải là {{jsxref("Number")}}.

## Ví dụ

### Sử dụng `toPrecision`

```js
// This number has exponent 0, so it will never use exponential notation
let num = 5.123456;

console.log(num.toPrecision()); // '5.123456'
console.log(num.toPrecision(5)); // '5.1235'
console.log(num.toPrecision(2)); // '5.1'
console.log(num.toPrecision(1)); // '5'

// This number has exponent -4, so it will never use exponential notation
num = 0.000123;

console.log(num.toPrecision()); // '0.000123'
console.log(num.toPrecision(5)); // '0.00012300'
console.log(num.toPrecision(2)); // '0.00012'
console.log(num.toPrecision(1)); // '0.0001'

// This number has exponent 3, so it will use exponential notation if precision is less than 4
num = 1234.5;
console.log(num.toPrecision(1)); // '1e+3'
console.log(num.toPrecision(2)); // '1.2e+3'
console.log(num.toPrecision(6)); // '1234.50'

// This number has exponent -7, so it will always use exponential notation
num = 0.00000012345;
console.log(num.toPrecision(1)); // '1e-7'
console.log(num.toPrecision(10)); // '1.234500000e-7'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Number.prototype.toFixed()")}}
- {{jsxref("Number.prototype.toExponential()")}}
- {{jsxref("Number.prototype.toString()")}}
