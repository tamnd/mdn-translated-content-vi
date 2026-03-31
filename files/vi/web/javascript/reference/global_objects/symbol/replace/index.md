---
title: Symbol.replace
short-title: replace
slug: Web/JavaScript/Reference/Global_Objects/Symbol/replace
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.replace
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.replace`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.replace`. Các phương thức {{jsxref("String.prototype.replace()")}} và {{jsxref("String.prototype.replaceAll()")}} tra cứu symbol này trên đối số đầu tiên của chúng cho phương thức thay thế các chuỗi con khớp bởi đối tượng hiện tại.

Để biết thêm thông tin, xem [`RegExp.prototype[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace), {{jsxref("String.prototype.replace()")}}, và {{jsxref("String.prototype.replaceAll()")}}.

{{InteractiveExample("JavaScript Demo: Symbol.replace")}}

```js interactive-example
class Replace1 {
  constructor(value) {
    this.value = value;
  }
  [Symbol.replace](string) {
    return `s/${string}/${this.value}/g`;
  }
}

console.log("foo".replace(new Replace1("bar")));
// Expected output: "s/foo/bar/g"
```

## Giá trị

Well-known symbol `Symbol.replace`.

{{js_property_attributes(0, 0, 0)}}

## Ví dụ

### Sử dụng Symbol.replace

<!-- cSpell:ignore tball -->

```js
class CustomReplacer {
  constructor(value) {
    this.value = value;
  }
  [Symbol.replace](string) {
    return string.replace(this.value, "#!@?");
  }
}

console.log("football".replace(new CustomReplacer("foo"))); // "#!@?tball"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Symbol.replace` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-symbol)
- {{jsxref("Symbol.match")}}
- {{jsxref("Symbol.matchAll")}}
- {{jsxref("Symbol.search")}}
- {{jsxref("Symbol.split")}}
- {{jsxref("String.prototype.replace()")}}
- {{jsxref("String.prototype.replaceAll()")}}
- [`RegExp.prototype[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace)
