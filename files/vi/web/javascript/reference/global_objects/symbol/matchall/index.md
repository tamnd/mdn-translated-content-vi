---
title: Symbol.matchAll
short-title: matchAll
slug: Web/JavaScript/Reference/Global_Objects/Symbol/matchAll
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.matchAll
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.matchAll`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.matchAll`. Phương thức {{jsxref("String.prototype.matchAll()")}} tra cứu symbol này trên đối số đầu tiên của nó cho phương thức trả về một iterator, cung cấp các kết quả khớp của đối tượng hiện tại với một chuỗi.

Để biết thêm thông tin, xem [`RegExp.prototype[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll) và {{jsxref("String.prototype.matchAll()")}}.

{{InteractiveExample("JavaScript Demo: Symbol.matchAll")}}

```js interactive-example
const re = /\d+/g;
const str = "2016-01-02|2019-03-07";
const result = re[Symbol.matchAll](str);

console.log(Array.from(result, (x) => x[0]));
// Expected output: Array ["2016", "01", "02", "2019", "03", "07"]
```

## Giá trị

Well-known symbol `Symbol.matchAll`.

{{js_property_attributes(0, 0, 0)}}

## Ví dụ

### Sử dụng Symbol.matchAll

```js
const str = "2016-01-02|2019-03-07";

const numbers = {
  *[Symbol.matchAll](str) {
    for (const n of str.matchAll(/\d+/g)) yield n[0];
  },
};

console.log(Array.from(str.matchAll(numbers)));
// ["2016", "01", "02", "2019", "03", "07"]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Symbol.matchAll` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-symbol)
- [es-shims polyfill của `Symbol.matchAll`](https://www.npmjs.com/package/string.prototype.matchall)
- {{jsxref("Symbol.match")}}
- {{jsxref("Symbol.replace")}}
- {{jsxref("Symbol.search")}}
- {{jsxref("Symbol.split")}}
- {{jsxref("String.prototype.matchAll()")}}
- [`RegExp.prototype[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll)
