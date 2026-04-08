---
title: RegExp.prototype.global
short-title: global
slug: Web/JavaScript/Reference/Global_Objects/RegExp/global
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.RegExp.global
sidebar: jsref
---

Thuộc tính accessor **`global`** của các instance {{jsxref("RegExp")}} trả về liệu cờ `g` có được sử dụng với biểu thức chính quy này hay không.

{{InteractiveExample("JavaScript Demo: RegExp.prototype.global")}}

```js interactive-example
const regex1 = /foo/g;

console.log(regex1.global);
// Expected output: true

const regex2 = /bar/i;

console.log(regex2.global);
// Expected output: false
```

## Mô tả

`RegExp.prototype.global` có giá trị `true` nếu cờ `g` được sử dụng; ngược lại là `false`. Cờ `g` chỉ ra rằng biểu thức chính quy nên được kiểm tra đối với tất cả các kết quả khớp có thể trong một chuỗi. Mỗi lần gọi [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) sẽ cập nhật thuộc tính [`lastIndex`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex) của nó, để lần gọi `exec()` tiếp theo sẽ bắt đầu tại ký tự tiếp theo.

Một số phương thức, chẳng hạn như [`String.prototype.matchAll()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/matchAll) và [`String.prototype.replaceAll()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll), sẽ xác nhận rằng, nếu tham số là một regex, nó là global. Các phương thức [`[Symbol.match]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.match) và [`[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace) của regex (được gọi bởi [`String.prototype.match()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match) và [`String.prototype.replace()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace)) cũng sẽ có hành vi khác nhau khi regex là global.

Accessor set của `global` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

### Sử dụng global

```js
const globalRegex = /foo/g;

const str = "fooexamplefoo";
console.log(str.replace(globalRegex, "")); // example

const nonGlobalRegex = /foo/;
console.log(str.replace(nonGlobalRegex, "")); // examplefoo
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("RegExp.prototype.lastIndex")}}
- {{jsxref("RegExp.prototype.dotAll")}}
- {{jsxref("RegExp.prototype.hasIndices")}}
- {{jsxref("RegExp.prototype.ignoreCase")}}
- {{jsxref("RegExp.prototype.multiline")}}
- {{jsxref("RegExp.prototype.source")}}
- {{jsxref("RegExp.prototype.sticky")}}
- {{jsxref("RegExp.prototype.unicode")}}
