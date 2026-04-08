---
title: RegExp.prototype.unicodeSets
short-title: unicodeSets
slug: Web/JavaScript/Reference/Global_Objects/RegExp/unicodeSets
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.RegExp.unicodeSets
sidebar: jsref
---

Thuộc tính accessor **`unicodeSets`** của các instance {{jsxref("RegExp")}} trả về liệu cờ `v` có được sử dụng với biểu thức chính quy này hay không.

{{InteractiveExample("JavaScript Demo: RegExp.prototype.unicodeSets")}}

```js interactive-example
const regex1 = /[\p{Lowercase}&&\p{Script=Greek}]/;
const regex2 = /[\p{Lowercase}&&\p{Script=Greek}]/v;

console.log(regex1.unicodeSets);
// Expected output: false

console.log(regex2.unicodeSets);
// Expected output: true
```

## Mô tả

`RegExp.prototype.unicodeSets` có giá trị `true` nếu cờ `v` được sử dụng; ngược lại là `false`. Cờ `v` là "nâng cấp" của cờ [`u`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode) bật thêm nhiều tính năng liên quan đến Unicode. ("v" là chữ cái tiếp theo sau "u" trong bảng chữ cái.) Vì `u` và `v` diễn giải cùng một regex theo những cách không tương thích, sử dụng cả hai cờ dẫn đến {{jsxref("SyntaxError")}}. Với cờ `v`, bạn nhận được tất cả các tính năng được đề cập trong mô tả cờ `u`, cộng thêm:

- Chuỗi escape [`\p`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Unicode_character_class_escape) có thể được sử dụng thêm để khớp với các thuộc tính của chuỗi, thay vì chỉ ký tự.
- Cú pháp [lớp ký tự](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class) được nâng cấp để cho phép cú pháp giao, hợp, và trừ, cũng như khớp với nhiều ký tự Unicode.
- Cú pháp bổ sung lớp ký tự `[^...]` tạo ra một lớp bổ sung thay vì phủ định kết quả khớp, tránh một số hành vi khó hiểu với khớp không phân biệt hoa/thường. Để biết thêm thông tin, xem [Lớp bổ sung và khớp không phân biệt hoa/thường](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#complement_classes_and_case-insensitive_matching).

Một số regex hợp lệ trong chế độ `u` trở nên không hợp lệ trong chế độ `v`. Cụ thể, cú pháp lớp ký tự khác nhau và một số ký tự không còn có thể xuất hiện theo nghĩa đen. Để biết thêm thông tin, xem [lớp ký tự chế độ `v`](/en-US/docs/Web/JavaScript/Reference/Regular_expressions/Character_class#v-mode_character_class).

> [!NOTE]
> Chế độ `v` không diễn giải các cụm grapheme là các ký tự đơn; chúng vẫn là nhiều điểm mã. Ví dụ: `/[🇺🇳]/v` vẫn có thể khớp với `"🇺"`.

Accessor set của `unicodeSets` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

### Sử dụng thuộc tính unicodeSets

```js
const regex = /[\p{Script_Extensions=Greek}&&\p{Letter}]/v;

console.log(regex.unicodeSets); // true
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
- {{jsxref("RegExp.prototype.unicode")}}
- [RegExp v flag with set notation and properties of strings](https://v8.dev/features/regexp-v-flag) trên v8.dev (2022)
