---
title: String.prototype.isWellFormed()
short-title: isWellFormed()
slug: Web/JavaScript/Reference/Global_Objects/String/isWellFormed
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.isWellFormed
sidebar: jsref
---

Phương thức **`isWellFormed()`** của các giá trị {{jsxref("String")}} trả về một boolean cho biết string này có chứa bất kỳ [surrogate đơn lẻ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters) nào hay không.

## Cú pháp

```js-nolint
isWellFormed()
```

### Tham số

Không có.

### Giá trị trả về

Trả về `true` nếu string này không chứa bất kỳ surrogate đơn lẻ nào, `false` nếu ngược lại.

## Mô tả

Các string trong JavaScript được mã hóa UTF-16. Mã hóa UTF-16 có khái niệm _surrogate pairs_, được giới thiệu chi tiết trong phần [UTF-16 characters, Unicode code points, and grapheme clusters](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters).

`isWellFormed()` cho phép bạn kiểm tra xem một string có được định dạng tốt (tức là không chứa bất kỳ surrogate đơn lẻ nào) hay không. So với một triển khai tùy chỉnh, `isWellFormed()` hiệu quả hơn vì các engine có thể trực tiếp truy cập biểu diễn nội bộ của string. Nếu bạn cần chuyển đổi một string thành string được định dạng tốt, hãy sử dụng phương thức {{jsxref("String/toWellFormed", "toWellFormed()")}}. `isWellFormed()` cho phép bạn xử lý các string không được định dạng tốt khác với các string được định dạng tốt, chẳng hạn như ném lỗi hoặc đánh dấu nó là không hợp lệ.

## Ví dụ

### Sử dụng isWellFormed()

```js
const strings = [
  // Lone leading surrogate
  "ab\uD800",
  "ab\uD800c",
  // Lone trailing surrogate
  "\uDFFFab",
  "c\uDFFFab",
  // Well-formed
  "abc",
  "ab\uD83D\uDE04c",
];

for (const str of strings) {
  console.log(str.isWellFormed());
}
// Logs:
// false
// false
// false
// false
// true
// true
```

### Tránh lỗi trong encodeURI()

{{jsxref("encodeURI")}} ném lỗi nếu string được truyền vào không được định dạng tốt. Điều này có thể tránh được bằng cách sử dụng `isWellFormed()` để kiểm tra string trước khi truyền vào `encodeURI()`.

```js
const illFormed = "https://example.com/search?q=\uD800";

try {
  encodeURI(illFormed);
} catch (e) {
  console.log(e); // URIError: URI malformed
}

if (illFormed.isWellFormed()) {
  console.log(encodeURI(illFormed));
} else {
  console.warn("Ill-formed strings encountered."); // Ill-formed strings encountered.
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `String.prototype.isWellFormed` in `core-js`](https://github.com/zloirock/core-js#well-formed-unicode-strings)
- [es-shims polyfill of `String.prototype.isWellFormed`](https://www.npmjs.com/package/string.prototype.iswellformed)
- {{jsxref("String.prototype.toWellFormed()")}}
- {{jsxref("String.prototype.normalize()")}}
