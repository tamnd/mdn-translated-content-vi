---
title: Number.prototype.toFixed()
short-title: toFixed()
slug: Web/JavaScript/Reference/Global_Objects/Number/toFixed
page-type: javascript-instance-method
browser-compat: javascript.builtins.Number.toFixed
sidebar: jsref
---

Phương thức **`toFixed()`** của các giá trị {{jsxref("Number")}} trả về một chuỗi biểu diễn số này sử dụng [ký hiệu điểm cố định](https://en.wikipedia.org/wiki/Fixed-point_arithmetic) với số chữ số thập phân được chỉ định.

{{InteractiveExample("JavaScript Demo: Number.toFixed()")}}

```js interactive-example
function financial(x) {
  return Number.parseFloat(x).toFixed(2);
}

console.log(financial(123.456));
// Expected output: "123.46"

console.log(financial(0.004));
// Expected output: "0.00"

console.log(financial("1.23e+5"));
// Expected output: "123000.00"
```

## Cú pháp

```js-nolint
toFixed()
toFixed(digits)
```

### Tham số

- `digits` {{optional_inline}}
  - : Số chữ số xuất hiện sau dấu thập phân; phải là giá trị trong khoảng `0` và `100`, bao gồm cả hai đầu. Nếu đối số này bị bỏ qua, nó được coi là `0`.

### Giá trị trả về

Một chuỗi biểu diễn số đã cho sử dụng ký hiệu điểm cố định. Ký hiệu khoa học được sử dụng nếu độ lớn của số (bỏ qua dấu) lớn hơn hoặc bằng 10<sup>21</sup> (cùng giá trị trả về như {{jsxref("Number.prototype.toString()")}}).

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu `digits` không nằm trong khoảng `0` đến `100` (bao gồm cả hai đầu).
- {{jsxref("TypeError")}}
  - : Ném ra nếu phương thức này được gọi trên một đối tượng không phải là {{jsxref("Number")}}.

## Mô tả

Phương thức `toFixed()` trả về biểu diễn chuỗi của một số mà không sử dụng [ký hiệu mũ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential) và với đúng `digits` chữ số sau dấu thập phân. Số được làm tròn nếu cần thiết, và phần thập phân được đệm bằng số 0 nếu cần để có độ dài được chỉ định.

Nếu giá trị tuyệt đối của số lớn hơn hoặc bằng 10<sup>21</sup>, phương thức này sử dụng cùng thuật toán như {{jsxref("Number.prototype.toString()")}} và trả về chuỗi theo ký hiệu mũ. `toFixed()` trả về `"Infinity"`, `"NaN"`, hoặc `"-Infinity"` nếu giá trị của số là không hữu hạn.

Đầu ra của `toFixed()` có thể chính xác hơn [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString) cho một số giá trị, vì `toString()` chỉ in đủ chữ số có nghĩa để phân biệt số với các giá trị số liền kề. Ví dụ:

```js
(1000000000000000128).toString(); // '1000000000000000100'
(1000000000000000128).toFixed(0); // '1000000000000000128'
```

Tuy nhiên, chọn độ chính xác `digits` quá cao có thể trả về kết quả không mong đợi, vì các số thập phân phân số không thể được biểu diễn chính xác trong dấu phẩy động. Ví dụ:

```js
(0.3).toFixed(50); // '0.29999999999999998889776975374843459576368331909180'
```

## Ví dụ

### Sử dụng toFixed()

```js
const numObj = 12345.6789;

numObj.toFixed(); // '12346'; rounding, no fractional part
numObj.toFixed(1); // '12345.7'; it rounds up
numObj.toFixed(6); // '12345.678900'; additional zeros
(1.23e20).toFixed(2); // '123000000000000000000.00'
(1.23e-10).toFixed(2); // '0.00'
(2.34).toFixed(1); // '2.3'
(2.35).toFixed(1); // '2.4'; it rounds up
(2.55).toFixed(1); // '2.5'
// it rounds down as it can't be represented exactly by a float and the
// closest representable float is lower
(2.449999999999999999).toFixed(1); // '2.5'
// it rounds up as it's less than Number.EPSILON away from 2.45.
// This literal actually encodes the same number value as 2.45

(6.02 * 10 ** 23).toFixed(50); // '6.019999999999999e+23'; large numbers still use exponential notation
```

### Sử dụng toFixed() với số âm

Vì truy cập thành viên có độ ưu tiên [precedence](/en-US/docs/Web/JavaScript/Reference/Operators/Operator_precedence) cao hơn phủ định đơn nguyên, bạn cần nhóm biểu thức số âm để lấy chuỗi.

```js-nolint
-2.34.toFixed(1); // -2.3; a number
(-2.34).toFixed(1); // '-2.3'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Number.prototype.toExponential()")}}
- {{jsxref("Number.prototype.toPrecision()")}}
- {{jsxref("Number.prototype.toString()")}}
- {{jsxref("Number.EPSILON")}}
