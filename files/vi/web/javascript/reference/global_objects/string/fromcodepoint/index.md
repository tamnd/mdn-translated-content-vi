---
title: String.fromCodePoint()
short-title: fromCodePoint()
slug: Web/JavaScript/Reference/Global_Objects/String/fromCodePoint
page-type: javascript-static-method
browser-compat: javascript.builtins.String.fromCodePoint
sidebar: jsref
---

Phương thức static **`String.fromCodePoint()`** trả về một string được tạo từ chuỗi code point được chỉ định.

{{InteractiveExample("JavaScript Demo: String.fromCodePoint()", "shorter")}}

```js interactive-example
console.log(String.fromCodePoint(9731, 9733, 9842, 0x2f804));
// Expected output: "☃★♲你"
```

## Cú pháp

```js-nolint
String.fromCodePoint()
String.fromCodePoint(num1)
String.fromCodePoint(num1, num2)
String.fromCodePoint(num1, num2, /* …, */ numN)
```

### Tham số

- `num1`, …, `numN`
  - : Một số nguyên từ `0` đến `0x10FFFF` (bao gồm) biểu diễn một code point Unicode.

### Giá trị trả về

Một string được tạo bằng cách sử dụng chuỗi code point được chỉ định.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu `numN` không phải là số nguyên, nhỏ hơn `0`, hoặc lớn hơn `0x10FFFF` sau khi được chuyển đổi thành số.

## Mô tả

Vì `fromCodePoint()` là một phương thức static của `String`, bạn luôn sử dụng nó là `String.fromCodePoint()`, thay vì là một phương thức của một giá trị `String` bạn đã tạo.

Các code point Unicode có phạm vi từ `0` đến `1114111` (`0x10FFFF`). Trong UTF-16, mỗi chỉ mục string là một đơn vị code có giá trị `0` – `65535`. Các code point cao hơn được biểu diễn bởi _một cặp_ pseudo-character surrogate 16-bit. Do đó, `fromCodePoint()` có thể trả về một string có [`length`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/length) (tính bằng đơn vị code UTF-16) lớn hơn số đối số được truyền vào. Để biết thông tin về Unicode, xem [UTF-16 characters, Unicode code points, and grapheme clusters](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters).

## Ví dụ

### Sử dụng fromCodePoint()

Đầu vào hợp lệ:

```js
String.fromCodePoint(42); // "*"
String.fromCodePoint(65, 90); // "AZ"
String.fromCodePoint(0x404); // "\u0404" === "Є"
String.fromCodePoint(0x2f804); // "\uD87E\uDC04"
String.fromCodePoint(194564); // "\uD87E\uDC04"
String.fromCodePoint(0x1d306, 0x61, 0x1d307); // "\uD834\uDF06a\uD834\uDF07"
```

Đầu vào không hợp lệ:

```js
String.fromCodePoint("_"); // RangeError
String.fromCodePoint(Infinity); // RangeError
String.fromCodePoint(-1); // RangeError
String.fromCodePoint(3.14); // RangeError
String.fromCodePoint(3e-2); // RangeError
String.fromCodePoint(NaN); // RangeError
```

### So sánh với fromCharCode()

{{jsxref("String.fromCharCode()")}} không thể trả về các ký tự bổ sung (tức là các code point `0x010000` – `0x10FFFF`) bằng cách chỉ định code point của chúng. Thay vào đó, nó yêu cầu cặp surrogate UTF-16 để trả về một ký tự bổ sung:

```js
String.fromCharCode(0xd83c, 0xdf03); // Code Point U+1F303 "Night with
String.fromCharCode(55356, 57091); // Stars" === "\uD83C\uDF03"
```

`String.fromCodePoint()`, mặt khác, có thể trả về các ký tự bổ sung 4-byte, cũng như các ký tự BMP 2-byte phổ biến hơn, bằng cách chỉ định code point của chúng (tương đương với đơn vị code UTF-32):

```js
String.fromCodePoint(0x1f303); // or 127747 in decimal
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `String.fromCodePoint` in `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [es-shims polyfill of `String.fromCodePoint`](https://www.npmjs.com/package/string.fromcodepoint)
- {{jsxref("String.fromCharCode()")}}
- {{jsxref("String.prototype.charAt()")}}
- {{jsxref("String.prototype.codePointAt()")}}
- {{jsxref("String.prototype.charCodeAt()")}}
