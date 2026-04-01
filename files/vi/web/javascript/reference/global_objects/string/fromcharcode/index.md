---
title: String.fromCharCode()
short-title: fromCharCode()
slug: Web/JavaScript/Reference/Global_Objects/String/fromCharCode
page-type: javascript-static-method
browser-compat: javascript.builtins.String.fromCharCode
sidebar: jsref
---

Phương thức static **`String.fromCharCode()`** trả về một string được tạo từ chuỗi đơn vị code UTF-16 được chỉ định.

{{InteractiveExample("JavaScript Demo: String.fromCharCode()", "shorter")}}

```js interactive-example
console.log(String.fromCharCode(189, 43, 190, 61));
// Expected output: "½+¾="
```

## Cú pháp

```js-nolint
String.fromCharCode()
String.fromCharCode(num1)
String.fromCharCode(num1, num2)
String.fromCharCode(num1, num2, /* …, */ numN)
```

### Tham số

- `num1`, …, `numN`
  - : Một số từ `0` đến `65535` (`0xFFFF`) biểu diễn một đơn vị code UTF-16. Các số lớn hơn `0xFFFF` bị cắt bớt đến 16 bit cuối. Không có kiểm tra tính hợp lệ.

### Giá trị trả về

Một string có độ dài `N` bao gồm `N` đơn vị code UTF-16 được chỉ định.

## Mô tả

Vì `fromCharCode()` là một phương thức static của `String`, bạn luôn sử dụng nó là `String.fromCharCode()`, thay vì là một phương thức của một giá trị `String` bạn đã tạo.

Các code point Unicode có phạm vi từ `0` đến `1114111` (`0x10FFFF`). `charCodeAt()` luôn trả về một giá trị nhỏ hơn `65536`, bởi vì các code point cao hơn được biểu diễn bởi _một cặp_ pseudo-character surrogate 16-bit. Do đó, để tạo ra một ký tự đầy đủ có giá trị lớn hơn `65535`, cần cung cấp hai đơn vị code (như thể xử lý một string có hai ký tự). Để biết thông tin về Unicode, xem [UTF-16 characters, Unicode code points, and grapheme clusters](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters).

Vì `fromCharCode()` chỉ hoạt động với các giá trị 16-bit (giống như chuỗi thoát `\u`), một cặp surrogate là cần thiết để trả về một ký tự bổ sung. Ví dụ, cả `String.fromCharCode(0xd83c, 0xdf03)` và `"\ud83c\udf03"` đều trả về code point `U+1F303` "Night with Stars". Mặc dù có mối quan hệ toán học giữa giá trị code point bổ sung (ví dụ: `0x1f303`) và cả hai giá trị surrogate biểu diễn nó (ví dụ: `0xd83c` và `0xdf03`), nhưng nó yêu cầu một bước thêm để tính toán hoặc tra cứu các giá trị surrogate pair mỗi khi một code point bổ sung được sử dụng. Vì lý do này, việc sử dụng {{jsxref("String.fromCodePoint()")}} thuận tiện hơn, cho phép trả về các ký tự bổ sung dựa trên giá trị code point thực tế của chúng. Ví dụ, `String.fromCodePoint(0x1f303)` trả về code point `U+1F303` "Night with Stars".

## Ví dụ

### Sử dụng fromCharCode()

Các ký tự BMP, trong UTF-16, sử dụng một đơn vị code duy nhất:

```js
String.fromCharCode(65, 66, 67); // returns "ABC"
String.fromCharCode(0x2014); // returns "—"
String.fromCharCode(0x12014); // also returns "—"; the digit 1 is truncated and ignored
String.fromCharCode(8212); // also returns "—"; 8212 is the decimal form of 0x2014
```

Các ký tự bổ sung, trong UTF-16, yêu cầu hai đơn vị code (tức là một surrogate pair):

```js
String.fromCharCode(0xd83c, 0xdf03); // Code Point U+1F303 "Night with
String.fromCharCode(55356, 57091); // Stars" === "\uD83C\uDF03"

String.fromCharCode(0xd834, 0xdf06, 0x61, 0xd834, 0xdf07); // "\uD834\uDF06a\uD834\uDF07"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.fromCodePoint()")}}
- {{jsxref("String.prototype.charAt()")}}
- {{jsxref("String.prototype.charCodeAt()")}}
- {{jsxref("String.prototype.codePointAt()")}}
