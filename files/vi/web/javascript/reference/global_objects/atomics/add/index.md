---
title: Atomics.add()
short-title: add()
slug: Web/JavaScript/Reference/Global_Objects/Atomics/add
page-type: javascript-static-method
browser-compat: javascript.builtins.Atomics.add
sidebar: jsref
---

Phương thức tĩnh **`Atomics.add()`** cộng một giá trị đã cho vào một vị trí đã cho trong mảng, và trả về giá trị cũ tại vị trí đó. Thao tác nguyên tử này đảm bảo rằng không có lần ghi nào khác xảy ra cho đến khi giá trị đã sửa đổi được ghi lại.

## Cú pháp

```js-nolint
Atomics.add(typedArray, index, value)
```

### Tham số

- `typedArray`
  - : Một mảng được gõ kiểu số nguyên. Một trong {{jsxref("Int8Array")}}, {{jsxref("Uint8Array")}}, {{jsxref("Int16Array")}}, {{jsxref("Uint16Array")}}, {{jsxref("Int32Array")}}, {{jsxref("Uint32Array")}}, {{jsxref("BigInt64Array")}}, hoặc {{jsxref("BigUint64Array")}}.
- `index`
  - : Vị trí trong `typedArray` để cộng `value` vào.
- `value`
  - : Số cần cộng.

### Giá trị trả về

Giá trị cũ tại vị trí đã cho (`typedArray[index]`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `typedArray` không phải là một trong các kiểu số nguyên được cho phép.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `index` nằm ngoài giới hạn trong `typedArray`.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng Atomics.add()

```js
// Create a SharedArrayBuffer with a size in bytes
const sab = new SharedArrayBuffer(1024);
// Create a view and set the value of the 0 index
const ta = new Uint8Array(sab);
ta[0] = 7;

// 7 + 12 = 19
console.log(Atomics.add(ta, 0, 12)); // 7, the old value
console.log(Atomics.load(ta, 0)); // 19, the new/current value
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Atomics")}}
- {{jsxref("Atomics.sub()")}}
