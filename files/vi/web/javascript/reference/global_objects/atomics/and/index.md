---
title: Atomics.and()
short-title: and()
slug: Web/JavaScript/Reference/Global_Objects/Atomics/and
page-type: javascript-static-method
browser-compat: javascript.builtins.Atomics.and
sidebar: jsref
---

Phương thức tĩnh **`Atomics.and()`** tính toán phép AND bit với một giá trị đã cho tại một vị trí đã cho trong mảng, và trả về giá trị cũ tại vị trí đó. Thao tác nguyên tử này đảm bảo rằng không có lần ghi nào khác xảy ra cho đến khi giá trị đã sửa đổi được ghi lại.

## Cú pháp

```js-nolint
Atomics.and(typedArray, index, value)
```

### Tham số

- `typedArray`
  - : Một mảng được gõ kiểu số nguyên. Một trong {{jsxref("Int8Array")}}, {{jsxref("Uint8Array")}}, {{jsxref("Int16Array")}}, {{jsxref("Uint16Array")}}, {{jsxref("Int32Array")}}, {{jsxref("Uint32Array")}}, {{jsxref("BigInt64Array")}}, hoặc {{jsxref("BigUint64Array")}}.
- `index`
  - : Vị trí trong `typedArray` để tính toán phép AND bit.
- `value`
  - : Số cần tính toán phép AND bit với.

### Giá trị trả về

Giá trị cũ tại vị trí đã cho (`typedArray[index]`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `typedArray` không phải là một trong các kiểu số nguyên được cho phép.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `index` nằm ngoài giới hạn trong `typedArray`.

## Mô tả

Phép AND bit chỉ cho kết quả 1, nếu cả `a` và `b` đều là 1. Bảng sự thật của phép AND:

| `a` | `b` | `a & b` |
| --- | --- | ------- |
| 0   | 0   | 0       |
| 0   | 1   | 0       |
| 1   | 0   | 0       |
| 1   | 1   | 1       |

Ví dụ, phép AND bit của `5 & 1` cho kết quả `0001`, tức là 1 ở hệ thập phân.

```plain
5  0101
1  0001
   ----
1  0001
```

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng Atomics.and()

```js
// Create a SharedArrayBuffer with a size in bytes
const sab = new SharedArrayBuffer(1024);
// Create a view and set the value of the 0 index
const ta = new Uint8Array(sab);
ta[0] = 7;

// 7 (0111) AND 10 (1010) = 2 (0010)
console.log(Atomics.and(ta, 0, 10)); // 7, the old value
console.log(Atomics.load(ta, 0)); // 2, the new/current value
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Atomics")}}
- {{jsxref("Atomics.or()")}}
- {{jsxref("Atomics.xor()")}}
