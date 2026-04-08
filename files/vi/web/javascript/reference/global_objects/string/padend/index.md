---
title: String.prototype.padEnd()
short-title: padEnd()
slug: Web/JavaScript/Reference/Global_Objects/String/padEnd
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.padEnd
sidebar: jsref
---

Phương thức **`padEnd()`** của các giá trị {{jsxref("String")}} đệm string này với một string đã cho (được lặp lại và/hoặc cắt bớt, nếu cần) để string kết quả đạt độ dài nhất định. Phần đệm được áp dụng từ cuối string này.

{{InteractiveExample("JavaScript Demo: String.prototype.padEnd()")}}

```js interactive-example
const str1 = "Breaded Mushrooms";

console.log(str1.padEnd(25, "."));
// Expected output: "Breaded Mushrooms........"

const str2 = "200";

console.log(str2.padEnd(5));
// Expected output: "200  "
```

## Cú pháp

```js-nolint
padEnd(targetLength)
padEnd(targetLength, padString)
```

### Tham số

- `targetLength`
  - : Độ dài của string kết quả sau khi `str` hiện tại đã được đệm. Nếu giá trị nhỏ hơn hoặc bằng `str.length`, thì `str` được trả về như cũ.
- `padString` {{optional_inline}}
  - : String để đệm `str` hiện tại. Nếu `padString` quá dài để nằm trong `targetLength`, nó sẽ bị cắt bớt từ cuối. Giá trị mặc định là ký tự khoảng trắng (U+0020).

### Giá trị trả về

Một {{jsxref("String")}} có `targetLength` được chỉ định với `padString` được áp dụng ở cuối.

## Ví dụ

### Sử dụng String.prototype.padEnd()

```js
"abc".padEnd(10); // "abc       "
"abc".padEnd(10, "foo"); // "abcfoofoof"
"abc".padEnd(6, "123456"); // "abc123"
"abc".padEnd(1); // "abc"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `String.prototype.padEnd` in `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [es-shims polyfill of `String.prototype.padEnd`](https://www.npmjs.com/package/string.prototype.padend)
- {{jsxref("String.prototype.padStart()")}}
