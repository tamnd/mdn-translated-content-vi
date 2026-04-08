---
title: RegExp.prototype.multiline
short-title: multiline
slug: Web/JavaScript/Reference/Global_Objects/RegExp/multiline
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.RegExp.multiline
sidebar: jsref
---

Thuộc tính accessor **`multiline`** của các instance {{jsxref("RegExp")}} trả về liệu cờ `m` có được sử dụng với biểu thức chính quy này hay không.

{{InteractiveExample("JavaScript Demo: RegExp.prototype.multiline", "taller")}}

```js interactive-example
const regex1 = /^football/;
const regex2 = /^football/m;

console.log(regex1.multiline);
// Expected output: false

console.log(regex2.multiline);
// Expected output: true

console.log(regex1.test("rugby\nfootball"));
// Expected output: false

console.log(regex2.test("rugby\nfootball"));
// Expected output: true
```

## Mô tả

`RegExp.prototype.multiline` có giá trị `true` nếu cờ `m` được sử dụng; ngược lại là `false`. Cờ `m` chỉ ra rằng một chuỗi đầu vào đa dòng nên được coi là nhiều dòng. Ví dụ, nếu `m` được sử dụng, `^` và `$` thay đổi từ việc chỉ khớp ở đầu hoặc cuối của toàn bộ chuỗi sang đầu hoặc cuối của bất kỳ dòng nào trong chuỗi.

Accessor set của `multiline` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

## Ví dụ

### Sử dụng multiline

```js
const regex = /^foo/m;

console.log(regex.multiline); // true
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
- {{jsxref("RegExp.prototype.source")}}
- {{jsxref("RegExp.prototype.sticky")}}
- {{jsxref("RegExp.prototype.unicode")}}
