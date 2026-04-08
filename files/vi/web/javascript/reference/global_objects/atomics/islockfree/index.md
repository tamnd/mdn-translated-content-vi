---
title: Atomics.isLockFree()
short-title: isLockFree()
slug: Web/JavaScript/Reference/Global_Objects/Atomics/isLockFree
page-type: javascript-static-method
browser-compat: javascript.builtins.Atomics.isLockFree
sidebar: jsref
---

Phương thức tĩnh **`Atomics.isLockFree()`** được sử dụng để xác định xem các phương thức `Atomics` có sử dụng khóa hay các thao tác phần cứng nguyên tử khi áp dụng cho các mảng được gõ với kích thước byte phần tử đã cho hay không. Nó được thiết kế như một nguyên thủy tối ưu hóa, để các thuật toán hiệu suất cao có thể xác định liệu nên sử dụng khóa hay thao tác nguyên tử trong các phần tới hạn. Nếu một nguyên thủy nguyên tử không free-lock, thường thì hiệu quả hơn cho một thuật toán khi cung cấp khóa riêng của mình.

{{InteractiveExample("JavaScript Demo: Atomics.isLockFree()")}}

```js interactive-example
console.log(Atomics.isLockFree(3));
// 3 is not one of the BYTES_PER_ELEMENT values
// Expected output: false

console.log(Atomics.isLockFree(4));
// 4 is one of the BYTES_PER_ELEMENT values
// Expected output: true
```

## Cú pháp

```js-nolint
Atomics.isLockFree(size)
```

### Tham số

- `size`
  - : Kích thước tính bằng byte cần kiểm tra.

### Giá trị trả về

Giá trị `true` hoặc `false` chỉ ra liệu thao tác có free-lock hay không.

- Luôn là `true` nếu `size` là 4, vì tất cả các nền tảng đã biết đều hỗ trợ thao tác nguyên tử 4 byte.
- Luôn là `false` nếu kích thước đã cho không phải là một trong các thuộc tính [`BYTES_PER_ELEMENT`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/BYTES_PER_ELEMENT) của các kiểu TypedArray số nguyên.

## Ví dụ

### Sử dụng Atomics.isLockFree()

```js
Atomics.isLockFree(1); // true (phụ thuộc vào nền tảng)
Atomics.isLockFree(2); // true (phụ thuộc vào nền tảng)
Atomics.isLockFree(3); // false
Atomics.isLockFree(4); // true
Atomics.isLockFree(5); // false
Atomics.isLockFree(6); // false
Atomics.isLockFree(7); // false
Atomics.isLockFree(8); // true (phụ thuộc vào nền tảng)
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Atomics")}}
