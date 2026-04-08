---
title: Symbol.split
short-title: split
slug: Web/JavaScript/Reference/Global_Objects/Symbol/split
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.split
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.split`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.split`. Phương thức {{jsxref("String.prototype.split()")}} tra cứu symbol này trên đối số đầu tiên của nó cho phương thức chia chuỗi tại các chỉ mục khớp với đối tượng hiện tại.

Để biết thêm thông tin, xem [`RegExp.prototype[Symbol.split]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.split) và {{jsxref("String.prototype.split()")}}.

{{InteractiveExample("JavaScript Demo: Symbol.split", "taller")}}

```js interactive-example
class Split1 {
  constructor(value) {
    this.value = value;
  }
  [Symbol.split](string) {
    const index = string.indexOf(this.value);
    return `${this.value}${string.substring(0, index)}/${string.substring(
      index + this.value.length,
    )}`;
  }
}

console.log("foobar".split(new Split1("foo")));
// Expected output: "foo/bar"
```

## Giá trị

Well-known symbol `Symbol.split`.

{{js_property_attributes(0, 0, 0)}}

## Ví dụ

### Chia chuỗi đảo ngược tùy chỉnh

```js
class ReverseSplit {
  [Symbol.split](string) {
    const array = string.split(" ");
    return array.reverse();
  }
}

console.log("Another one bites the dust".split(new ReverseSplit()));
// [ "dust", "the", "bites", "one", "Another" ]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Symbol.split` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-symbol)
- {{jsxref("Symbol.match")}}
- {{jsxref("Symbol.matchAll")}}
- {{jsxref("Symbol.replace")}}
- {{jsxref("Symbol.search")}}
- {{jsxref("String.prototype.split()")}}
- [`RegExp.prototype[Symbol.split]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.split)
