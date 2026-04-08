---
title: "TypeError: can't convert x to BigInt"
slug: Web/JavaScript/Reference/Errors/Cant_convert_x_to_BigInt
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "x can't be converted to BigInt" xảy ra khi cố gắng chuyển đổi một giá trị {{jsxref("Symbol")}}, [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), hoặc {{jsxref("undefined")}} thành {{jsxref("BigInt")}}, hoặc nếu một thao tác mong đợi tham số BigInt nhận được một number.

## Thông báo

```plain
TypeError: Cannot convert null to a BigInt (V8-based)
TypeError: can't convert null to BigInt (Firefox)
TypeError: Invalid argument type in ToBigInt operation (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}.

## Nguyên nhân?

Khi sử dụng hàm [`BigInt()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt) để chuyển đổi một giá trị thành BigInt, giá trị đó trước tiên sẽ được chuyển đổi thành nguyên thủy. Sau đó, nếu nó không phải là một trong BigInt, string, number, và boolean, lỗi sẽ được ném ra.

Một số thao tác, như [`BigInt.asIntN`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/asIntN), yêu cầu tham số là BigInt. Truyền vào một number trong trường hợp này cũng sẽ ném lỗi này.

## Ví dụ

### Sử dụng BigInt() với các giá trị không hợp lệ

```js example-bad
const a = BigInt(null);
// TypeError: can't convert null to BigInt
const b = BigInt(undefined);
// TypeError: can't convert undefined to BigInt
const c = BigInt(Symbol("1"));
// TypeError: can't convert Symbol("1") to BigInt
```

```js example-good
const a = BigInt(1);
const b = BigInt(true);
const c = BigInt("1");
const d = BigInt(Symbol("1").description);
```

> [!NOTE]
> Chỉ đơn giản ép kiểu giá trị thành string hoặc number bằng [`String()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/String) hoặc [`Number()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/Number) trước khi truyền vào `BigInt()` thường không đủ để tránh tất cả lỗi. Nếu string không phải là chuỗi số nguyên hợp lệ, một [SyntaxError](/en-US/docs/Web/JavaScript/Reference/Errors/Invalid_BigInt_syntax) sẽ được ném ra; nếu number không phải là số nguyên (đặc biệt là {{jsxref("NaN")}}), một [RangeError](/en-US/docs/Web/JavaScript/Reference/Errors/Cant_be_converted_to_BigInt_because_it_isnt_an_integer) sẽ được ném ra. Nếu phạm vi đầu vào không xác định, hãy xác thực đúng cách trước khi sử dụng `BigInt()`.

### Truyền number vào hàm mong đợi BigInt

```js example-bad
const a = BigInt.asIntN(4, 8);
// TypeError: can't convert 8 to BigInt
const b = new BigInt64Array(3).fill(3);
// TypeError: can't convert 3 to BigInt
```

```js example-good
const a = BigInt.asIntN(4, 8n);
const b = new BigInt64Array(3).fill(3n);
```

## Xem thêm

- [`BigInt()` constructor](/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt/BigInt)
