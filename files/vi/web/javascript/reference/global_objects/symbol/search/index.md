---
title: Symbol.search
short-title: search
slug: Web/JavaScript/Reference/Global_Objects/Symbol/search
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.search
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.search`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.search`. Phương thức {{jsxref("String.prototype.search()")}} tra cứu symbol này trên đối số đầu tiên của nó cho phương thức trả về chỉ mục trong chuỗi khớp với đối tượng hiện tại.

Để biết thêm thông tin, xem [`RegExp.prototype[Symbol.search]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.search) và {{jsxref("String.prototype.search()")}}.

{{InteractiveExample("JavaScript Demo: Symbol.search")}}

```js interactive-example
class Search1 {
  constructor(value) {
    this.value = value;
  }
  [Symbol.search](string) {
    return string.indexOf(this.value);
  }
}

console.log("foobar".search(new Search1("bar")));
// Expected output: 3
```

## Giá trị

Well-known symbol `Symbol.search`.

{{js_property_attributes(0, 0, 0)}}

## Ví dụ

### Tìm kiếm chuỗi tùy chỉnh

```js
class CaseInsensitiveSearch {
  constructor(value) {
    this.value = value.toLowerCase();
  }
  [Symbol.search](string) {
    return string.toLowerCase().indexOf(this.value);
  }
}

console.log("foobar".search(new CaseInsensitiveSearch("BaR"))); // 3
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Symbol.search` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-symbol)
- {{jsxref("Symbol.match")}}
- {{jsxref("Symbol.matchAll")}}
- {{jsxref("Symbol.replace")}}
- {{jsxref("Symbol.split")}}
- {{jsxref("String.prototype.search()")}}
- [`RegExp.prototype[Symbol.search]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.search)
