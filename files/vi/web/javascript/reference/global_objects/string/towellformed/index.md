---
title: String.prototype.toWellFormed()
short-title: toWellFormed()
slug: Web/JavaScript/Reference/Global_Objects/String/toWellFormed
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.toWellFormed
sidebar: jsref
---

Phương thức **`toWellFormed()`** của các giá trị {{jsxref("String")}} trả về một chuỗi trong đó tất cả [các surrogate đơn lẻ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters) của chuỗi này được thay thế bằng ký tự thay thế Unicode U+FFFD.

## Cú pháp

```js-nolint
toWellFormed()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi mới là bản sao của chuỗi này, với tất cả các surrogate đơn lẻ được thay thế bằng ký tự thay thế Unicode U+FFFD. Nếu `str` [có định dạng tốt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/isWellFormed), vẫn sẽ trả về một chuỗi mới (về bản chất là bản sao của `str`).

## Mô tả

Chuỗi trong JavaScript được mã hóa UTF-16. Mã hóa UTF-16 có khái niệm _surrogate pair_, được giới thiệu chi tiết trong phần [Ký tự UTF-16, code point Unicode và grapheme cluster](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters).

`toWellFormed()` duyệt qua các đơn vị code của chuỗi này và thay thế mọi surrogate đơn lẻ bằng [ký tự thay thế Unicode](<https://en.wikipedia.org/wiki/Specials_(Unicode_block)#Replacement_character>) U+FFFD `<0xFFFD>`. Điều này đảm bảo chuỗi trả về có định dạng tốt và có thể được sử dụng trong các hàm yêu cầu chuỗi có định dạng tốt, chẳng hạn như {{jsxref("encodeURI")}}. So với cách triển khai tùy chỉnh, `toWellFormed()` hiệu quả hơn vì các engine có thể truy cập trực tiếp vào biểu diễn nội bộ của chuỗi.

Khi các chuỗi không có định dạng tốt được sử dụng trong một số ngữ cảnh nhất định, chẳng hạn như {{domxref("TextEncoder")}}, chúng sẽ tự động được chuyển đổi thành chuỗi có định dạng tốt bằng cùng ký tự thay thế. Khi các surrogate đơn lẻ được hiển thị, chúng cũng được hiển thị dưới dạng ký tự thay thế (một hình thoi có dấu chấm hỏi bên trong).

## Ví dụ

### Sử dụng toWellFormed()

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
  console.log(str.toWellFormed());
}
// Logs:
// "ab<0xFFFD>"
// "ab<0xFFFD>c"
// "<0xFFFD>ab"
// "c<0xFFFD>ab"
// "abc"
// "ab😄c"
```

### Tránh lỗi trong encodeURI()

{{jsxref("encodeURI")}} ném ra lỗi nếu chuỗi được truyền vào không có định dạng tốt. Có thể tránh điều này bằng cách sử dụng `toWellFormed()` để chuyển đổi chuỗi thành chuỗi có định dạng tốt trước.

```js
const illFormed = "https://example.com/search?q=\uD800";

try {
  encodeURI(illFormed);
} catch (e) {
  console.log(e); // URIError: URI malformed
}

console.log(encodeURI(illFormed.toWellFormed())); // "https://example.com/search?q=%EF%BF%BD"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.toWellFormed` trong `core-js`](https://github.com/zloirock/core-js#well-formed-unicode-strings)
- [Polyfill es-shims của `String.prototype.toWellFormed`](https://www.npmjs.com/package/string.prototype.towellformed)
- {{jsxref("String.prototype.isWellFormed()")}}
- {{jsxref("String.prototype.normalize()")}}
