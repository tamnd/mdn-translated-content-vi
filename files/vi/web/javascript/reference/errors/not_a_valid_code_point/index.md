---
title: "RangeError: argument is not a valid code point"
slug: Web/JavaScript/Reference/Errors/Not_a_valid_code_point
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "Invalid code point" xảy ra khi các giá trị {{jsxref("NaN")}}, số nguyên âm (-1), số không nguyên (5.4), hoặc giá trị lớn hơn 0x10FFFF (1114111) được truyền cho {{jsxref("String.fromCodePoint()")}}.

## Thông báo

```plain
RangeError: Invalid code point -1 (V8-based)
RangeError: -1 is not a valid code point (Firefox)
RangeError: Arguments contain a value that is out of range of code points (Safari)
```

## Loại lỗi

{{jsxref("RangeError")}}

## Nguyên nhân?

{{jsxref("String.fromCodePoint()")}} ném ra lỗi này khi được truyền các giá trị {{jsxref("NaN")}}, số nguyên âm (-1), số không nguyên (5.4), hoặc giá trị lớn hơn 0x10FFFF (1114111).

Một [code point](https://en.wikipedia.org/wiki/Code_point) là một giá trị trong không gian mã Unicode; tức là phạm vi các số nguyên từ `0` đến `0x10FFFF`.

## Ví dụ

### Trường hợp không hợp lệ

```js example-bad
String.fromCodePoint("_"); // RangeError
String.fromCodePoint(Infinity); // RangeError
String.fromCodePoint(-1); // RangeError
String.fromCodePoint(3.14); // RangeError
String.fromCodePoint(3e-2); // RangeError
String.fromCodePoint(NaN); // RangeError
```

### Trường hợp hợp lệ

```js example-good
String.fromCodePoint(42); // "*"
String.fromCodePoint(65, 90); // "AZ"
String.fromCodePoint(0x404); // 'Є' (U+0404)
String.fromCodePoint(0x2f804); // '你' (U+2F804)
String.fromCodePoint(194564); // '你'
String.fromCodePoint(0x1d306, 0x61, 0x1d307); // '𝌆a𝌇'
```

## Xem thêm

- {{jsxref("String.fromCodePoint()")}}
