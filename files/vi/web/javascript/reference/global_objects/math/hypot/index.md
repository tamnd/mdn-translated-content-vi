---
title: Math.hypot()
short-title: hypot()
slug: Web/JavaScript/Reference/Global_Objects/Math/hypot
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.hypot
sidebar: jsref
---

Phương thức tĩnh **`Math.hypot()`** trả về căn bậc hai của tổng bình phương các đối số. Cụ thể:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mstyle mathvariant="monospace"><mo lspace="0em" rspace="0.16666666666666666em">𝙼𝚊𝚝𝚑.𝚑𝚢𝚙𝚘𝚝</mo><mo stretchy="false">(</mo><msub><mi>v</mi><mn>1</mn></msub><mo>,</mo><msub><mi>v</mi><mn>2</mn></msub><mo>,</mo><mo>…</mo><mo>,</mo><msub><mi>v</mi><mi>n</mi></msub><mo stretchy="false">)</mo></mstyle><mo>=</mo><msqrt><mrow><munderover><mo>∑</mo><mrow><mi>i</mi><mo>=</mo><mn>1</mn></mrow><mi>n</mi></munderover><msubsup><mi>v</mi><mi>i</mi><mn>2</mn></msubsup></mrow></msqrt><mo>=</mo><msqrt><mrow><msubsup><mi>v</mi><mn>1</mn><mn>2</mn></msubsup><mo>+</mo><msubsup><mi>v</mi><mn>2</mn><mn>2</mn></msubsup><mo>+</mo><mo>…</mo><mo>+</mo><msubsup><mi>v</mi><mi>n</mi><mn>2</mn></msubsup></mrow></msqrt></mrow><annotation encoding="TeX">\mathtt{\operatorname{Math.hypot}(v_1, v_2, \dots, v_n)} = \sqrt{\sum_{i=1}^n v_i^2} = \sqrt{v_1^2 + v_2^2 + \dots + v_n^2}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

{{InteractiveExample("JavaScript Demo: Math.hypot()")}}

```js interactive-example
console.log(Math.hypot(3, 4));
// Expected output: 5

console.log(Math.hypot(5, 12));
// Expected output: 13

console.log(Math.hypot(3, 4, 5));
// Expected output: 7.0710678118654755

console.log(Math.hypot(-5));
// Expected output: 5
```

## Cú pháp

```js-nolint
Math.hypot()
Math.hypot(value1)
Math.hypot(value1, value2)
Math.hypot(value1, value2, /* …, */ valueN)
```

### Tham số

- `value1`, …, `valueN`
  - : Các số.

### Giá trị trả về

Căn bậc hai của tổng bình phương các đối số đã cho. Trả về {{jsxref("Infinity")}} nếu bất kỳ đối số nào là ±Infinity. Ngược lại, nếu ít nhất một đối số là hoặc được chuyển thành {{jsxref("NaN")}}, trả về {{jsxref("NaN")}}. Trả về `0` nếu không có đối số nào hoặc tất cả đối số đều là ±0.

## Mô tả

Tính cạnh huyền của tam giác vuông, hoặc độ lớn của số phức, sử dụng công thức `Math.sqrt(v1*v1 + v2*v2)`, trong đó v1 và v2 là các cạnh của tam giác hoặc các thành phần thực và ảo của số phức. Khoảng cách tương ứng trong 2 hoặc nhiều chiều có thể tính bằng cách thêm các bình phương dưới căn: `Math.sqrt(v1*v1 + v2*v2 + v3*v3 + v4*v4)`.

Hàm này giúp phép tính này dễ dàng và nhanh hơn; bạn gọi `Math.hypot(v1, v2)`, hoặc `Math.hypot(v1, /* …, */, vN)`.

`Math.hypot` cũng tránh được các vấn đề tràn số / mất số khi độ lớn của các số rất lớn. Số lớn nhất trong JS là [`Number.MAX_VALUE`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE), khoảng 10<sup>308</sup>. Nếu các số lớn hơn khoảng 10<sup>154</sup>, bình phương chúng sẽ cho kết quả Infinity. Ví dụ, `Math.sqrt(1e200*1e200 + 1e200*1e200) = Infinity`. Nếu dùng `hypot()` thay thế, kết quả tốt hơn: `Math.hypot(1e200, 1e200) = 1.4142...e+200`. Điều này cũng đúng với các số rất nhỏ. `Math.sqrt(1e-200*1e-200 + 1e-200*1e-200) = 0`, nhưng `Math.hypot(1e-200, 1e-200) = 1.4142...e-200`.

Với một đối số, `Math.hypot()` tương đương với [`Math.abs()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs). [`Math.hypot.length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function/length) là 2, cho thấy hàm được thiết kế để xử lý ít nhất hai tham số.

Vì `hypot()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.hypot()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

## Ví dụ

### Sử dụng Math.hypot()

```js
Math.hypot(3, 4); // 5
Math.hypot(3, 4, 5); // 7.0710678118654755
Math.hypot(); // 0
Math.hypot(NaN); // NaN
Math.hypot(NaN, Infinity); // Infinity
Math.hypot(3, 4, "foo"); // NaN, since +'foo' => NaN
Math.hypot(3, 4, "5"); // 7.0710678118654755, +'5' => 5
Math.hypot(-3); // 3, the same as Math.abs(-3)
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Math.hypot` in `core-js`](https://github.com/zloirock/core-js#ecmascript-math)
- {{jsxref("Math.abs()")}}
- {{jsxref("Math.pow()")}}
- {{jsxref("Math.sqrt()")}}
