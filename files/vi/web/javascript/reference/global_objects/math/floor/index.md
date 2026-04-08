---
title: Math.floor()
short-title: floor()
slug: Web/JavaScript/Reference/Global_Objects/Math/floor
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.floor
sidebar: jsref
---

Phương thức tĩnh **`Math.floor()`** luôn làm tròn xuống và trả về số nguyên lớn nhất nhỏ hơn hoặc bằng số đã cho.

{{InteractiveExample("JavaScript Demo: Math.floor()")}}

```js interactive-example
console.log(Math.floor(5.95));
// Expected output: 5

console.log(Math.floor(5.05));
// Expected output: 5

console.log(Math.floor(5));
// Expected output: 5

console.log(Math.floor(-5.05));
// Expected output: -6
```

## Cú pháp

```js-nolint
Math.floor(x)
```

### Tham số

- `x`
  - : Một số.

### Giá trị trả về

Số nguyên lớn nhất nhỏ hơn hoặc bằng `x`. Kết quả này tương đương với [`-Math.ceil(-x)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/ceil).

## Mô tả

Vì `floor()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.floor()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.floor()

```js
Math.floor(-Infinity); // -Infinity
Math.floor(-45.95); // -46
Math.floor(-45.05); // -46
Math.floor(-0); // -0
Math.floor(0); // 0
Math.floor(4); // 4
Math.floor(45.05); // 45
Math.floor(45.95); // 45
Math.floor(Infinity); // Infinity
```

### Điều chỉnh thập phân

Trong ví dụ này, chúng ta triển khai một phương thức `decimalAdjust()` — phiên bản mở rộng của `Math.floor()`, {{jsxref("Math.ceil()")}}, và {{jsxref("Math.round()")}}. Ba hàm `Math` gốc luôn điều chỉnh số về chữ số đơn vị, còn `decimalAdjust` nhận tham số `exp` chỉ định số chữ số bên trái của dấu thập phân cần điều chỉnh. Ví dụ, `-1` có nghĩa là giữ lại một chữ số sau dấu phẩy (như "× 10<sup>-1</sup>"). Ngoài ra, bạn có thể chọn kiểu điều chỉnh — `round`, `floor`, hoặc `ceil` — thông qua tham số `type`.

Hàm này thực hiện bằng cách nhân số với lũy thừa của 10, làm tròn kết quả về số nguyên gần nhất, rồi chia cho lũy thừa của 10. Để giữ độ chính xác tốt hơn, hàm sử dụng phương thức [`toString()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString) của Number, vì phương thức này biểu diễn các số lớn hoặc nhỏ theo ký hiệu khoa học (như `6.02e23`).

```js
/**
 * Adjusts a number to the specified digit.
 *
 * @param {"round" | "floor" | "ceil"} type The type of adjustment.
 * @param {number} value The number.
 * @param {number} exp The exponent (the 10 logarithm of the adjustment base).
 * @returns {number} The adjusted value.
 */
function decimalAdjust(type, value, exp) {
  type = String(type);
  if (!["round", "floor", "ceil"].includes(type)) {
    throw new TypeError(
      "The type of decimal adjustment must be one of 'round', 'floor', or 'ceil'.",
    );
  }
  exp = Number(exp);
  value = Number(value);
  if (exp % 1 !== 0 || Number.isNaN(value)) {
    return NaN;
  } else if (exp === 0) {
    return Math[type](value);
  }
  const [magnitude, exponent = 0] = value.toString().split("e");
  const adjustedValue = Math[type](`${magnitude}e${exponent - exp}`);
  // Shift back
  const [newMagnitude, newExponent = 0] = adjustedValue.toString().split("e");
  return Number(`${newMagnitude}e${Number(newExponent) + exp}`);
}

// Decimal round
const round10 = (value, exp) => decimalAdjust("round", value, exp);
// Decimal floor
const floor10 = (value, exp) => decimalAdjust("floor", value, exp);
// Decimal ceil
const ceil10 = (value, exp) => decimalAdjust("ceil", value, exp);

// Round
round10(55.55, -1); // 55.6
round10(55.549, -1); // 55.5
round10(55, 1); // 60
round10(54.9, 1); // 50
round10(-55.55, -1); // -55.5
round10(-55.551, -1); // -55.6
round10(-55, 1); // -50
round10(-55.1, 1); // -60
// Floor
floor10(55.59, -1); // 55.5
floor10(59, 1); // 50
floor10(-55.51, -1); // -55.6
floor10(-51, 1); // -60
// Ceil
ceil10(55.51, -1); // 55.6
ceil10(51, 1); // 60
ceil10(-55.59, -1); // -55.5
ceil10(-59, 1); // -50
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Math.abs()")}}
- {{jsxref("Math.ceil()")}}
- {{jsxref("Math.round()")}}
- {{jsxref("Math.sign()")}}
- {{jsxref("Math.trunc()")}}
