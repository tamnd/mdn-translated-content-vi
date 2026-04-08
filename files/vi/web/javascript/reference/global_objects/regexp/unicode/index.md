---
title: RegExp.prototype.unicode
short-title: unicode
slug: Web/JavaScript/Reference/Global_Objects/RegExp/unicode
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.RegExp.unicode
sidebar: jsref
---

Thuộc tính accessor **`unicode`** của các instance {{jsxref("RegExp")}} trả về liệu cờ `u` có được sử dụng với biểu thức chính quy này hay không.

{{InteractiveExample("JavaScript Demo: RegExp.prototype.unicode")}}

```js interactive-example
const regex1 = /\u{61}/;
const regex2 = /\u{61}/u;

console.log(regex1.unicode);
// Expected output: false

console.log(regex2.unicode);
// Expected output: true
```

## Mô tả

`RegExp.prototype.unicode` có giá trị `true` nếu cờ `u` được sử dụng; ngược lại là `false`. Cờ `u` bật các tính năng liên quan đến Unicode. Với cờ "u":

- Bất kỳ [escape điểm mã Unicode](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape) nào (`\u{xxxx}`, `\p{UnicodePropertyValue}`) sẽ được diễn giải như vậy thay vì là escape nhận dạng. Ví dụ: `/\u{61}/u` khớp với `"a"`, nhưng `/\u{61}/` (không có cờ `u`) khớp với `"u".repeat(61)`, trong đó `\u` tương đương với một `u` đơn lẻ.
- Các cặp đại diện sẽ được diễn giải là các ký tự nguyên vẹn thay vì hai ký tự riêng biệt. Ví dụ: `/[😄]/u` chỉ khớp với `"😄"` chứ không phải `"\ud83d"`.
- Khi [`lastIndex`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex) được tự động tăng (chẳng hạn khi gọi [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec)), regex unicode tăng theo điểm mã Unicode thay vì đơn vị mã UTF-16.

Có những thay đổi khác đối với hành vi phân tích cú pháp ngăn ngừa các lỗi cú pháp có thể xảy ra (tương tự như [strict mode](/en-US/docs/Web/JavaScript/Reference/Strict_mode) cho cú pháp regex). Các cú pháp này đều [bị phản đối và chỉ được giữ lại để tương thích web](/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features#regexp), và bạn không nên dựa vào chúng.

Accessor set của `unicode` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

### Chế độ nhận biết Unicode

Khi chúng ta đề cập đến _chế độ nhận biết Unicode_, chúng ta có nghĩa là regex có cờ `u` hoặc cờ [`v`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets), trong trường hợp đó regex bật các tính năng liên quan đến Unicode (chẳng hạn như [escape lớp ký tự Unicode](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape)) và có các quy tắc cú pháp nghiêm ngặt hơn. Vì `u` và `v` diễn giải cùng một regex theo những cách không tương thích, sử dụng cả hai cờ dẫn đến {{jsxref("SyntaxError")}}.

Tương tự, một regex là _không nhận biết Unicode_ nếu nó không có cờ `u` hay `v`. Trong trường hợp này, regex được diễn giải như một chuỗi các đơn vị mã UTF-16, và có nhiều cú pháp cũ không trở thành lỗi cú pháp.

## Ví dụ

### Sử dụng thuộc tính unicode

```js
const regex = /\u{61}/u;

console.log(regex.unicode); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("RegExp.prototype.lastIndex")}}
- {{jsxref("RegExp.prototype.dotAll")}}
- {{jsxref("RegExp.prototype.global")}}
- {{jsxref("RegExp.prototype.hasIndices")}}
- {{jsxref("RegExp.prototype.ignoreCase")}}
- {{jsxref("RegExp.prototype.multiline")}}
- {{jsxref("RegExp.prototype.source")}}
- {{jsxref("RegExp.prototype.sticky")}}
