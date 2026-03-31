---
title: RegExp.prototype.dotAll
short-title: dotAll
slug: Web/JavaScript/Reference/Global_Objects/RegExp/dotAll
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.RegExp.dotAll
sidebar: jsref
---

Thuộc tính accessor **`dotAll`** của các instance {{jsxref("RegExp")}} trả về liệu cờ `s` có được sử dụng với biểu thức chính quy này hay không.

{{InteractiveExample("JavaScript Demo: RegExp.prototype.dotAll")}}

```js interactive-example
const regex1 = /f.o/s;

console.log(regex1.dotAll);
// Expected output: true

const regex2 = /bar/;

console.log(regex2.dotAll);
// Expected output: false
```

## Mô tả

`RegExp.prototype.dotAll` có giá trị `true` nếu cờ `s` được sử dụng; ngược lại là `false`. Cờ `s` cho biết rằng ký tự đặc biệt dấu chấm (`.`) cũng nên khớp với các ký tự kết thúc dòng ("newline") sau đây trong một chuỗi, mà nó thường không khớp:

- U+000A LINE FEED (LF) (`\n`)
- U+000D CARRIAGE RETURN (CR) (`\r`)
- U+2028 LINE SEPARATOR
- U+2029 PARAGRAPH SEPARATOR

Điều này thực sự có nghĩa là dấu chấm sẽ khớp với bất kỳ đơn vị mã UTF-16 nào. Tuy nhiên, nó sẽ _không_ khớp với các ký tự nằm ngoài Mặt phẳng Đa ngôn ngữ Cơ bản Unicode (BMP), còn được gọi là ký tự astral, được biểu diễn dưới dạng [cặp đại diện](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters) và cần khớp với hai mẫu `.` thay vì một.

```js
"😄".match(/(.)(.)/s);
// Array(3) [ "😄", "\ud83d", "\ude04" ]
```

Cờ [`u`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode) (unicode) có thể được dùng để cho phép dấu chấm khớp với các ký tự astral như một ký tự đơn.

```js
"😄".match(/./su);
// Array [ "😄" ]
```

Lưu ý rằng một mẫu như `.*` vẫn có khả năng _tiêu thụ_ các ký tự astral như một phần của ngữ cảnh lớn hơn, ngay cả khi không có cờ `u`.

```js
"😄".match(/.*/s);
// Array [ "😄" ]
```

Sử dụng cả cờ `s` và `u` cùng nhau cho phép dấu chấm khớp với bất kỳ ký tự Unicode nào theo cách trực quan hơn.

Accessor set của `dotAll` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

### Sử dụng dotAll

```js
const str1 = "bar\nexample foo example";

const regex1 = /bar.example/s;

console.log(regex1.dotAll); // true

console.log(str1.replace(regex1, "")); // foo example

const str2 = "bar\nexample foo example";

const regex2 = /bar.example/;

console.log(regex2.dotAll); // false

console.log(str2.replace(regex2, ""));
// bar
// example foo example
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của cờ `dotAll` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- {{jsxref("RegExp.prototype.lastIndex")}}
- {{jsxref("RegExp.prototype.global")}}
- {{jsxref("RegExp.prototype.hasIndices")}}
- {{jsxref("RegExp.prototype.ignoreCase")}}
- {{jsxref("RegExp.prototype.multiline")}}
- {{jsxref("RegExp.prototype.source")}}
- {{jsxref("RegExp.prototype.sticky")}}
- {{jsxref("RegExp.prototype.unicode")}}
