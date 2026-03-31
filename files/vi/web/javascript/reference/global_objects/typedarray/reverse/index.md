---
title: TypedArray.prototype.reverse()
short-title: reverse()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/reverse
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.reverse
sidebar: jsref
---

Phương thức **`reverse()`** của các thực thể {{jsxref("TypedArray")}} đảo ngược một mảng được gõ kiểu _[tại chỗ](https://en.wikipedia.org/wiki/In-place_algorithm)_ và trả về tham chiếu đến cùng mảng được gõ kiểu đó, phần tử đầu tiên của mảng được gõ kiểu bây giờ trở thành phần tử cuối cùng, và phần tử cuối cùng trở thành phần tử đầu tiên. Nói cách khác, thứ tự các phần tử trong mảng được gõ kiểu sẽ được đảo ngược so với thứ tự đã trình bày trước đó. Phương thức này có cùng thuật toán với {{jsxref("Array.prototype.reverse()")}}.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.reverse()", "shorter")}}

```js interactive-example
const uint8 = new Uint8Array([1, 2, 3]);
uint8.reverse();

console.log(uint8);
// Expected output: Uint8Array [3, 2, 1]
```

## Cú pháp

```js-nolint
reverse()
```

### Tham số

Không có.

### Giá trị trả về

Tham chiếu đến mảng được gõ kiểu ban đầu, hiện đã được đảo ngược. Lưu ý rằng mảng được gõ kiểu được đảo ngược _[tại chỗ](https://en.wikipedia.org/wiki/In-place_algorithm)_, và không có bản sao nào được tạo.

## Mô tả

Xem {{jsxref("Array.prototype.reverse()")}} để biết thêm chi tiết. Phương thức này không phải là phương thức tổng quát và chỉ có thể được gọi trên các thực thể mảng được gõ kiểu.

## Ví dụ

### Sử dụng reverse()

```js
const uint8 = new Uint8Array([1, 2, 3]);
uint8.reverse();

console.log(uint8); // Uint8Array [3, 2, 1]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.reverse` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("TypedArray.prototype.join()")}}
- {{jsxref("TypedArray.prototype.sort()")}}
- {{jsxref("TypedArray.prototype.toReversed()")}}
- {{jsxref("Array.prototype.reverse()")}}
