---
title: TypedArray.prototype.subarray()
short-title: subarray()
slug: Web/JavaScript/Reference/Global_Objects/TypedArray/subarray
page-type: javascript-instance-method
browser-compat: javascript.builtins.TypedArray.subarray
sidebar: jsref
---

Phương thức **`subarray()`** của các thực thể {{jsxref("TypedArray")}} trả về một mảng được gõ kiểu mới trên cùng {{jsxref("ArrayBuffer")}} và với cùng kiểu phần tử như mảng được gõ kiểu này. Độ lệch bắt đầu là **bao gồm** và độ lệch kết thúc là **không bao gồm**.

{{InteractiveExample("JavaScript Demo: TypedArray.prototype.subarray()")}}

```js interactive-example
const uint8 = new Uint8Array([10, 20, 30, 40, 50]);

console.log(uint8.subarray(1, 3));
// Expected output: Uint8Array [20, 30]

console.log(uint8.subarray(1));
// Expected output: Uint8Array [20, 30, 40, 50]
```

## Cú pháp

```js-nolint
subarray()
subarray(begin)
subarray(begin, end)
```

### Tham số

- `begin` {{optional_inline}}
  - : Phần tử để bắt đầu. Độ lệch là bao gồm. Toàn bộ mảng sẽ được bao gồm trong khung nhìn mới nếu giá trị này không được chỉ định.
- `end` {{optional_inline}}
  - : Phần tử để kết thúc. Độ lệch là không bao gồm. Nếu không được chỉ định, tất cả các phần tử từ phần tử được chỉ định bởi `begin` đến cuối mảng được bao gồm trong khung nhìn mới.

### Giá trị trả về

Một đối tượng {{jsxref("TypedArray")}} mới.

## Mô tả

Phạm vi được chỉ định bởi `begin` và `end` được kẹp vào phạm vi chỉ số hợp lệ cho mảng hiện tại; nếu độ dài tính toán của mảng mới sẽ là âm, nó được kẹp về không. Nếu `begin` hoặc `end` là âm, nó đề cập đến một chỉ số từ cuối mảng thay vì từ đầu.

Cũng lưu ý rằng đây đang tạo một khung nhìn mới trên bộ đệm hiện có; các thay đổi đối với nội dung của đối tượng mới sẽ ảnh hưởng đến đối tượng ban đầu và ngược lại.

## Ví dụ

### Sử dụng phương thức subarray()

```js
const buffer = new ArrayBuffer(8);
const uint8 = new Uint8Array(buffer);
uint8.set([1, 2, 3]);

console.log(uint8); // Uint8Array [ 1, 2, 3, 0, 0, 0, 0, 0 ]

const sub = uint8.subarray(0, 4);

console.log(sub); // Uint8Array [ 1, 2, 3, 0 ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `TypedArray.prototype.subarray` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-typed-arrays)
- Hướng dẫn [Mảng được gõ kiểu JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
- {{jsxref("TypedArray")}}
- {{jsxref("ArrayBuffer")}}
