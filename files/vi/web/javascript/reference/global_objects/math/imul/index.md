---
title: Math.imul()
short-title: imul()
slug: Web/JavaScript/Reference/Global_Objects/Math/imul
page-type: javascript-static-method
browser-compat: javascript.builtins.Math.imul
sidebar: jsref
---

Phương thức tĩnh **`Math.imul()`** trả về kết quả phép nhân 32-bit kiểu C của hai tham số.

{{InteractiveExample("JavaScript Demo: Math.imul()")}}

```js interactive-example
console.log(Math.imul(3, 4));
// Expected output: 12

console.log(Math.imul(-5, 12));
// Expected output: -60

console.log(Math.imul(0xffffffff, 5));
// Expected output: -5

console.log(Math.imul(0xfffffffe, 5));
// Expected output: -10
```

## Cú pháp

```js-nolint
Math.imul(a, b)
```

### Tham số

- `a`
  - : Số thứ nhất.
- `b`
  - : Số thứ hai.

### Giá trị trả về

Kết quả phép nhân 32-bit kiểu C của các đối số đã cho.

## Mô tả

`Math.imul()` cho phép nhân số nguyên 32-bit với ngữ nghĩa giống C. Tính năng này hữu ích cho các dự án như [Emscripten](https://en.wikipedia.org/wiki/Emscripten).

Vì `imul()` là một phương thức tĩnh của `Math`, bạn luôn sử dụng nó dưới dạng `Math.imul()`, thay vì là phương thức của một đối tượng `Math` bạn tạo ra (`Math` không phải là constructor).

Nếu bạn sử dụng các số thực dấu phẩy động JavaScript thông thường trong `imul()`, hiệu năng sẽ bị giảm. Nguyên nhân là do chi phí chuyển đổi số thực dấu phẩy động sang số nguyên để nhân, rồi chuyển ngược lại. Tuy nhiên, với [asm.js](/en-US/docs/Games/Tools/asm.js), cho phép trình tối ưu hóa JIT sử dụng số nguyên trong JavaScript tự tin hơn, việc nhân hai số được lưu nội bộ dưới dạng số nguyên (chỉ có thể với asm.js) bằng `imul()` có thể có hiệu năng tốt hơn.

## Ví dụ

### Sử dụng Math.imul()

```js
Math.imul(2, 4); // 8
Math.imul(-1, 8); // -8
Math.imul(-2, -2); // 4
Math.imul(0xffffffff, 5); // -5
Math.imul(0xfffffffe, 5); // -10
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `Math.imul` in `core-js`](https://github.com/zloirock/core-js#ecmascript-math)
- [es-shims polyfill of `Math.imul`](https://www.npmjs.com/package/math.imul)
- [Emscripten](https://en.wikipedia.org/wiki/Emscripten) trên Wikipedia
