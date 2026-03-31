---
title: Atomics.xor()
short-title: xor()
slug: Web/JavaScript/Reference/Global_Objects/Atomics/xor
page-type: javascript-static-method
browser-compat: javascript.builtins.Atomics.xor
sidebar: jsref
---

Phương thức tĩnh **`Atomics.xor()`** tính toán phép XOR bit với một giá trị đã cho tại một vị trí đã cho trong mảng, và trả về giá trị cũ tại vị trí đó. Thao tác nguyên tử này đảm bảo rằng không có lần ghi nào khác xảy ra cho đến khi giá trị đã sửa đổi được ghi lại.

## Cú pháp

```js-nolint
Atomics.xor(typedArray, index, value)
```

### Tham số

- `typedArray`
  - : Một mảng được gõ kiểu số nguyên. Một trong {{jsxref("Int8Array")}}, {{jsxref("Uint8Array")}}, {{jsxref("Int16Array")}}, {{jsxref("Uint16Array")}}, {{jsxref("Int32Array")}}, {{jsxref("Uint32Array")}}, {{jsxref("BigInt64Array")}}, hoặc {{jsxref("BigUint64Array")}}.
- `index`
  - : Vị trí trong `typedArray` để tính toán phép XOR bit.
- `value`
  - : Số cần tính toán phép XOR bit với.

### Giá trị trả về

Giá trị cũ tại vị trí đã cho (`typedArray[index]`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `typedArray` không phải là một trong các kiểu số nguyên được cho phép.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `index` nằm ngoài giới hạn trong `typedArray`.

## Mô tả

Phép XOR bit cho kết quả 1, nếu `a` và `b` khác nhau. Bảng sự thật của phép XOR:

| `a` | `b` | `a ^ b` |
| --- | --- | ------- |
| 0   | 0   | 0       |
| 0   | 1   | 1       |
| 1   | 0   | 1       |
| 1   | 1   | 0       |

Ví dụ, phép XOR bit của `5 ^ 1` cho kết quả `0100`, tức là 4 ở hệ thập phân.

```plain
5  0101
1  0001
   ----
4  0100
```

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng Atomics.xor()

```js
// Create a SharedArrayBuffer with a size in bytes
const sab = new SharedArrayBuffer(1024);
// Create a view and set the value of the 0 index
const ta = new Uint8Array(sab);
ta[0] = 7;

// 7 (0111) XOR 2 (0010) = 5 (0101)
console.log(Atomics.xor(ta, 0, 2)); // 7, the old value
console.log(Atomics.load(ta, 0)); // 5, the new/current value
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Atomics")}}
- {{jsxref("Atomics.and()")}}
- {{jsxref("Atomics.or()")}}
