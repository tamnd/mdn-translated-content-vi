---
title: "RangeError: radix must be an integer"
slug: Web/JavaScript/Reference/Errors/Bad_radix
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "radix must be an integer at least 2 and no greater than 36"
xảy ra khi tham số `radix` tùy chọn của phương thức
{{jsxref("Number.prototype.toString()")}} hoặc
{{jsxref("BigInt.prototype.toString()")}} được chỉ định và không nằm trong khoảng từ 2
đến 36.

## Thông báo

```plain
RangeError: toString() radix argument must be between 2 and 36 (V8-based & Safari)
RangeError: radix must be an integer at least 2 and no greater than 36 (Firefox)
```

## Loại lỗi

{{jsxref("RangeError")}}

## Nguyên nhân?

Tham số `radix` tùy chọn của phương thức
{{jsxref("Number.prototype.toString()")}} hoặc
{{jsxref("BigInt.prototype.toString()")}} được chỉ định. Giá trị của nó phải là một
số nguyên (một số) từ 2 đến 36, chỉ định cơ số của hệ thống số sẽ được dùng
để biểu diễn các giá trị số. Ví dụ, số thập phân (cơ số 10) 169 được
biểu diễn trong hệ thập lục phân (cơ số 16) là A9.

Tại sao giá trị của tham số này bị giới hạn ở 36? Một radix lớn hơn 10 sử dụng
các ký tự chữ cái làm chữ số; do đó, radix không thể lớn hơn 36, vì
bảng chữ cái Latin (được sử dụng bởi tiếng Anh và nhiều ngôn ngữ khác) chỉ có 26 ký tự.

Các radix phổ biến nhất:

- 2 cho [số nhị phân](https://en.wikipedia.org/wiki/Binary_number),
- 8 cho [số bát phân](https://en.wikipedia.org/wiki/Octal),
- 10 cho [số thập phân](https://en.wikipedia.org/wiki/Decimal),
- 16 cho [số thập lục phân](https://en.wikipedia.org/wiki/Hexadecimal).

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
(42).toString(0);
(42).toString(1);
(42).toString(37);
(42).toString(150);
// You cannot use a string like this for formatting:
(12071989).toString("MM-dd-yyyy");
```

### Trường hợp hợp lệ

```js example-good
(42).toString(2); // "101010" (binary)
(13).toString(8); // "15" (octal)
(0x42).toString(10); // "66" (decimal)
(100000).toString(16); // "186a0" (hexadecimal)
```

## Xem thêm

- {{jsxref("Number.prototype.toString()")}}
- {{jsxref("BigInt.prototype.toString()")}}
