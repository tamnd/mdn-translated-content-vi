---
title: Symbol.prototype.description
short-title: description
slug: Web/JavaScript/Reference/Global_Objects/Symbol/description
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.Symbol.description
sidebar: jsref
---

Thuộc tính accessor **`description`** của các giá trị {{jsxref("Symbol")}} trả về một chuỗi chứa mô tả của symbol này, hoặc `undefined` nếu symbol không có mô tả.

{{InteractiveExample("JavaScript Demo: Symbol.prototype.description")}}

```js interactive-example
console.log(Symbol("desc").description);
// Expected output: "desc"

console.log(Symbol.iterator.description);
// Expected output: "Symbol.iterator"

console.log(Symbol.for("foo").description);
// Expected output: "foo"

console.log(`${Symbol("foo").description}bar`);
// Expected output: "foobar"
```

## Mô tả

Các đối tượng {{jsxref("Symbol")}} có thể được tạo với một mô tả tùy chọn, có thể dùng để debug nhưng không thể truy cập bản thân symbol. Thuộc tính `Symbol.prototype.description` có thể được dùng để đọc mô tả đó. Nó khác với `Symbol.prototype.toString()` vì nó không chứa chuỗi bao quanh `"Symbol()"`. Xem ví dụ.

## Ví dụ

### Sử dụng description

```js
Symbol("desc").toString(); // "Symbol(desc)"
Symbol("desc").description; // "desc"
Symbol("").description; // ""
Symbol().description; // undefined

// well-known symbols
Symbol.iterator.toString(); // "Symbol(Symbol.iterator)"
Symbol.iterator.description; // "Symbol.iterator"

// global symbols
Symbol.for("foo").toString(); // "Symbol(foo)"
Symbol.for("foo").description; // "foo"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Symbol.prototype.description` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-symbol)
- [es-shims polyfill của `Symbol.prototype.description`](https://www.npmjs.com/package/symbol.prototype.description)
- {{jsxref("Symbol.prototype.toString()")}}
