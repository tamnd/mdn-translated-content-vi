---
title: "RangeError: x can't be converted to BigInt because it isn't an integer"
slug: Web/JavaScript/Reference/Errors/Cant_be_converted_to_BigInt_because_it_isnt_an_integer
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "x can't be converted to BigInt because it isn't an integer" xảy ra khi hàm [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt) được sử dụng với một số không phải là số nguyên.

## Thông báo

```plain
RangeError: The number 1.5 cannot be converted to a BigInt because it is not an integer (V8-based & Firefox)
RangeError: Not an integer (Safari)
```

## Loại lỗi

{{jsxref("RangeError")}}.

## Nguyên nhân?

Khi sử dụng hàm [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt) để chuyển đổi một số thành BigInt, số đó phải là số nguyên (sao cho [`Number.isInteger`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/isInteger) trả về true).

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
const a = BigInt(1.5);
// RangeError: The number 1.5 cannot be converted to a BigInt because it is not an integer
const b = BigInt(NaN);
// RangeError: NaN cannot be converted to a BigInt because it is not an integer
```

### Trường hợp hợp lệ

```js example-good
const a = BigInt(1);
```

## Xem thêm

- [`BigInt()` constructor](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt)
- [`Number.isInteger()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/isInteger)
