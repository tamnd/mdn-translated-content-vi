---
title: "TypeError: can't convert BigInt to number"
slug: Web/JavaScript/Reference/Errors/Cant_convert_BigInt_to_number
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "can't convert BigInt to number" xảy ra khi một phép tính số học liên quan đến hỗn hợp các giá trị {{jsxref("BigInt")}} và {{jsxref("Number")}}.

## Thông báo

```plain
TypeError: Cannot convert a BigInt value to a number (V8-based)
TypeError: Cannot mix BigInt and other types, use explicit conversions (V8-based)
TypeError: BigInts have no unsigned right shift, use >> instead (V8-based)
TypeError: can't convert BigInt to number (Firefox)
TypeError: Conversion from 'BigInt' to 'number' is not allowed. (Safari)
TypeError: Invalid mix of BigInt and other type in addition/multiplication/…. (Safari)
TypeError: BigInt does not support >>> operator (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}.

## Nguyên nhân?

Hai vế của toán tử số học phải đều là BigInts hoặc đều không phải. Nếu một phép tính liên quan đến hỗn hợp BigInts và numbers, không rõ kết quả nên là BigInt hay number, vì có thể mất độ chính xác trong cả hai trường hợp.

Lỗi cũng xảy ra khi một BigInt được chuyển đổi ngầm thành number thông qua quá trình [ép kiểu number](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion). Ví dụ, nếu một BigInt được truyền vào một phương thức tích hợp mong đợi một number.

Lỗi cũng có thể xảy ra nếu [toán tử unsigned right shift (`>>>`)](/en-US/docs/Web/JavaScript/Reference/Operators/Unsigned_right_shift) được sử dụng giữa hai BigInts. Trong Firefox, thông báo là giống nhau: "can't convert BigInt to number".

## Ví dụ

### Hỗn hợp numbers và BigInts trong các phép tính

```js example-bad
const sum = 1n + 1;
// TypeError: can't convert BigInt to number
```

Thay vào đó, hãy chuyển đổi rõ ràng một vế thành BigInt hoặc number.

```js example-good
const sum = 1n + BigInt(1);
const sum2 = Number(1n) + 1;
```

### Sử dụng unsigned right shift trên BigInts

```js example-bad
const a = 4n >>> 2n;
// TypeError: can't convert BigInt to number
```

Hãy dùng right shift thông thường thay thế.

```js example-good
const a = 4n >> 2n;
```

## Xem thêm

- [`BigInt`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt)
