---
title: Atomics.store()
short-title: store()
slug: Web/JavaScript/Reference/Global_Objects/Atomics/store
page-type: javascript-static-method
browser-compat: javascript.builtins.Atomics.store
sidebar: jsref
---

Phương thức tĩnh **`Atomics.store()`** lưu trữ một giá trị đã cho tại một vị trí đã cho trong mảng và trả về giá trị đó. Thao tác nguyên tử này đảm bảo rằng việc ghi không bị rách, và tất cả các lần ghi nguyên tử đều nhất quán tuần tự.

Lưu ý rằng không giống nhiều phương thức `Atomic` khác, `store()` trả về giá trị mới thay vì giá trị cũ. Để lấy giá trị cũ, hãy sử dụng {{jsxref("Atomics.exchange()")}} thay thế.

## Cú pháp

```js-nolint
Atomics.store(typedArray, index, value)
```

### Tham số

- `typedArray`
  - : Một mảng được gõ kiểu số nguyên. Một trong {{jsxref("Int8Array")}}, {{jsxref("Uint8Array")}}, {{jsxref("Int16Array")}}, {{jsxref("Uint16Array")}}, {{jsxref("Int32Array")}}, {{jsxref("Uint32Array")}}, {{jsxref("BigInt64Array")}}, hoặc {{jsxref("BigUint64Array")}}.
- `index`
  - : Vị trí trong `typedArray` để lưu trữ `value`.
- `value`
  - : Số cần lưu trữ.

### Giá trị trả về

Giá trị đã được lưu trữ.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu `typedArray` không phải là một trong các kiểu số nguyên được cho phép.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu `index` nằm ngoài giới hạn trong `typedArray`.

## Ví dụ

Lưu ý rằng các ví dụ này không thể chạy trực tiếp từ console hoặc một trang web tùy ý, vì `SharedArrayBuffer` không được định nghĩa trừ khi các [yêu cầu bảo mật](/en-US/docs/Web/JavaScript/Reference/Global_Objects/SharedArrayBuffer#security_requirements) của nó được đáp ứng.

### Sử dụng Atomics.store()

```js
// Create a SharedArrayBuffer with a size in bytes
const sab = new SharedArrayBuffer(1024);
const ta = new Uint8Array(sab);

console.log(Atomics.store(ta, 0, 12)); // 12, the new/current value
console.log(Atomics.load(ta, 0)); // 12, the new/current value
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Atomics")}}
- {{jsxref("Atomics.load()")}}
- {{jsxref("Atomics.exchange()")}}
