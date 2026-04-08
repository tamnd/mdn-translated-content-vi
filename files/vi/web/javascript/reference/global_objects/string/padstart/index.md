---
title: String.prototype.padStart()
short-title: padStart()
slug: Web/JavaScript/Reference/Global_Objects/String/padStart
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.padStart
sidebar: jsref
---

Phương thức **`padStart()`** của các giá trị {{jsxref("String")}} đệm string này với một string đã cho (được lặp lại và/hoặc cắt bớt, nếu cần) để string kết quả đạt độ dài nhất định. Phần đệm được áp dụng từ đầu string này.

{{InteractiveExample("JavaScript Demo: String.prototype.padStart()")}}

```js interactive-example
const str = "5";

console.log(str.padStart(2, "0"));
// Expected output: "05"

const fullNumber = "2034399002125581";
const last4Digits = fullNumber.slice(-4);
const maskedNumber = last4Digits.padStart(fullNumber.length, "*");

console.log(maskedNumber);
// Expected output: "************5581"
```

## Cú pháp

```js-nolint
padStart(targetLength)
padStart(targetLength, padString)
```

### Tham số

- `targetLength`
  - : Độ dài của string kết quả sau khi `str` hiện tại đã được đệm. Nếu giá trị nhỏ hơn hoặc bằng `str.length`, thì `str` được trả về như cũ.
- `padString` {{optional_inline}}
  - : String để đệm `str` hiện tại. Nếu `padString` quá dài để nằm trong `targetLength`, nó sẽ bị cắt bớt từ cuối. Giá trị mặc định là ký tự khoảng trắng (U+0020).

### Giá trị trả về

Một {{jsxref("String")}} có `targetLength` được chỉ định với `padString` được áp dụng ở đầu.

## Ví dụ

### Sử dụng String.prototype.padStart()

```js
"abc".padStart(10); // "       abc"
"abc".padStart(10, "foo"); // "foofoofabc"
"abc".padStart(6, "123465"); // "123abc"
"abc".padStart(8, "0"); // "00000abc"
"abc".padStart(1); // "abc"
```

### Chuyển đổi số thành string có độ rộng cố định

```js
// JavaScript version of: (unsigned)
// printf "%0*d" width num
function leftFillNum(num, targetLength) {
  return num.toString().padStart(targetLength, "0");
}

const num = 123;
console.log(leftFillNum(num, 5)); // "00123"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `String.prototype.padStart` in `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [es-shims polyfill of `String.prototype.padStart`](https://www.npmjs.com/package/string.prototype.padstart)
- {{jsxref("String.prototype.padEnd()")}}
