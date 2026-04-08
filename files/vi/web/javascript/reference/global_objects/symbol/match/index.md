---
title: Symbol.match
short-title: match
slug: Web/JavaScript/Reference/Global_Objects/Symbol/match
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.match
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.match`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.match`. Phương thức {{jsxref("String.prototype.match()")}} tra cứu symbol này trên đối số đầu tiên của nó cho phương thức dùng để khớp chuỗi đầu vào với đối tượng hiện tại. Symbol này cũng được dùng để xác định xem một đối tượng có nên được [coi như biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes) không.

Để biết thêm thông tin, xem [`RegExp.prototype[Symbol.match]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.match) và {{jsxref("String.prototype.match()")}}.

{{InteractiveExample("JavaScript Demo: Symbol.match", "taller")}}

```js interactive-example
const regexp = /foo/;
// console.log('/foo/'.startsWith(regexp));
// Expected output (Chrome): Error: First argument to String.prototype.startsWith must not be a regular expression
// Expected output (Firefox): Error: Invalid type: first can't be a Regular Expression
// Expected output (Safari): Error: Argument to String.prototype.startsWith cannot be a RegExp

regexp[Symbol.match] = false;

console.log("/foo/".startsWith(regexp));
// Expected output: true

console.log("/baz/".endsWith(regexp));
// Expected output: false
```

## Giá trị

Well-known symbol `Symbol.match`.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Hàm này cũng được dùng để xác định [xem các đối tượng có hành vi của biểu thức chính quy không](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes). Ví dụ, các phương thức {{jsxref("String.prototype.startsWith()")}}, {{jsxref("String.prototype.endsWith()")}} và {{jsxref("String.prototype.includes()")}} kiểm tra xem đối số đầu tiên của chúng có phải là biểu thức chính quy và sẽ ném {{jsxref("TypeError")}} nếu đúng. Bây giờ, nếu symbol `match` được đặt thành `false` (hoặc giá trị [Falsy](/en-US/docs/Glossary/Falsy) ngoại trừ `undefined`), nó cho biết đối tượng không được dùng như đối tượng biểu thức chính quy.

## Ví dụ

### Đánh dấu RegExp là không phải regex

Đoạn mã sau sẽ ném {{jsxref("TypeError")}}:

```js
"/bar/".startsWith(/bar/);

// Ném TypeError, vì /bar/ là biểu thức chính quy
// và Symbol.match không bị sửa đổi.
```

Tuy nhiên, nếu bạn đặt `Symbol.match` thành `false`, đối tượng sẽ được coi như [không phải là đối tượng biểu thức chính quy](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes). Các phương thức `startsWith` và `endsWith` sẽ không ném `TypeError` nữa.

```js
const re = /foo/;
re[Symbol.match] = false;
"/foo/".startsWith(re); // true
"/baz/".endsWith(re); // false
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Symbol.match` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-symbol)
- {{jsxref("Symbol.matchAll")}}
- {{jsxref("Symbol.replace")}}
- {{jsxref("Symbol.search")}}
- {{jsxref("Symbol.split")}}
- {{jsxref("String.prototype.match()")}}
- [`RegExp.prototype[Symbol.match]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.match)
