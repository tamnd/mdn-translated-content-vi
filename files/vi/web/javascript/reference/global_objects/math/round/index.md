---
title: Math.round()
short-title: round()
slug: Web/JavaScript/Reference/Global_Objects/Math/round
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.round
sidebar: jsref
---

Phương thức tĩnh **`Math.round()`** trả về giá trị của một số được làm tròn đến số nguyên gần nhất.

{{InteractiveExample("JavaScript Demo: Math.round()")}}

```js interactive-example
console.log(Math.round(0.9));
// Expected output: 1

console.log(Math.round(5.95), Math.round(5.5), Math.round(5.05));
// Expected output: 6 6 5

console.log(Math.round(-5.05), Math.round(-5.5), Math.round(-5.95));
// Expected output: -5 -5 -6
```

## Cú pháp

```js-nolint
Math.round(x)
```

### Tham số

- `x`
  - : Một số.

### Giá trị trả về

Giá trị của `x` được làm tròn đến số nguyên gần nhất.

## Mô tả

Nếu phần thập phân của đối số lớn hơn 0.5, đối số được làm tròn lên số nguyên có giá trị tuyệt đối cao hơn. Nếu nhỏ hơn 0.5, được làm tròn xuống số nguyên có giá trị tuyệt đối thấp hơn. Nếu phần thập phân đúng bằng 0.5, đối số được làm tròn đến số nguyên tiếp theo theo hướng +∞.

> [!NOTE]
> Điều này khác với hàm `round()` của nhiều ngôn ngữ khác, thường làm tròn nửa đơn vị _ra xa số 0_, cho kết quả khác khi có số âm với phần thập phân đúng bằng 0.5.

`Math.round(x)` không hoàn toàn giống [`Math.floor(x + 0.5)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor). Khi `x` là -0, hoặc -0.5 ≤ x < 0, `Math.round(x)` trả về -0, trong khi `Math.floor(x + 0.5)` trả về 0. Tuy nhiên, bỏ qua sự khác biệt đó và các lỗi độ chính xác tiềm ẩn, `Math.round(x)` và `Math.floor(x + 0.5)` nhìn chung là tương đương.

Vì `round()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.round()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không có constructor).

## Ví dụ

### Sử dụng round

```js
Math.round(-Infinity); // -Infinity
Math.round(-20.51); // -21
Math.round(-20.5); // -20
Math.round(-0.1); // -0
Math.round(0); // 0
Math.round(20.49); // 20
Math.round(20.5); // 21
Math.round(42); // 42
Math.round(Infinity); // Infinity
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Number.prototype.toPrecision()")}}
- {{jsxref("Number.prototype.toFixed()")}}
- {{jsxref("Math.abs()")}}
- {{jsxref("Math.ceil()")}}
- {{jsxref("Math.floor()")}}
- {{jsxref("Math.sign()")}}
- {{jsxref("Math.trunc()")}}
