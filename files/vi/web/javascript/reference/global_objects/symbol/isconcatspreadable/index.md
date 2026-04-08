---
title: Symbol.isConcatSpreadable
short-title: isConcatSpreadable
slug: Web/JavaScript/Reference/Global_Objects/Symbol/isConcatSpreadable
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.isConcatSpreadable
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.isConcatSpreadable`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.isConcatSpreadable`. Phương thức {{jsxref("Array.prototype.concat()")}} tra cứu symbol này trên từng đối tượng được nối để xác định xem nó có nên được coi như đối tượng dạng mảng và làm phẳng thành các phần tử mảng của nó không.

{{InteractiveExample("JavaScript Demo: Symbol.isConcatSpreadable")}}

```js interactive-example
const alpha = ["a", "b", "c"];
const numeric = [1, 2, 3];
let alphaNumeric = alpha.concat(numeric);

console.log(alphaNumeric);
// Expected output: Array ["a", "b", "c", 1, 2, 3]

numeric[Symbol.isConcatSpreadable] = false;
alphaNumeric = alpha.concat(numeric);

console.log(alphaNumeric);
// Expected output: Array ["a", "b", "c", Array [1, 2, 3]]
```

## Giá trị

Well-known symbol `Symbol.isConcatSpreadable`.

{{js_property_attributes(0, 0, 0)}}

## Mô tả

Thuộc tính `[Symbol.isConcatSpreadable]` có thể được định nghĩa là thuộc tính riêng hoặc kế thừa và giá trị của nó là boolean. Nó có thể kiểm soát hành vi cho mảng và các đối tượng dạng mảng:

- Đối với các đối tượng mảng, hành vi mặc định là làm phẳng (spread) các phần tử. `Symbol.isConcatSpreadable` có thể tránh làm phẳng trong các trường hợp này.
- Đối với các đối tượng dạng mảng, hành vi mặc định là không làm phẳng. `Symbol.isConcatSpreadable` có thể ép buộc làm phẳng trong các trường hợp này.

## Ví dụ

### Mảng

Theo mặc định, {{jsxref("Array.prototype.concat()")}} làm phẳng mảng vào kết quả của nó:

```js
const alpha = ["a", "b", "c"];
const numeric = [1, 2, 3];

const alphaNumeric = alpha.concat(numeric);

console.log(alphaNumeric); // Result: ['a', 'b', 'c', 1, 2, 3]
```

Khi đặt `Symbol.isConcatSpreadable` thành `false`, bạn có thể tắt hành vi mặc định:

```js
const alpha = ["a", "b", "c"];
const numeric = [1, 2, 3];

numeric[Symbol.isConcatSpreadable] = false;
const alphaNumeric = alpha.concat(numeric);

console.log(alphaNumeric); // Result: ['a', 'b', 'c', [1, 2, 3] ]
```

### Đối tượng dạng mảng

Đối với các đối tượng dạng mảng, mặc định là không làm phẳng. `Symbol.isConcatSpreadable` cần được đặt thành `true` để có được mảng được làm phẳng:

```js
const x = [1, 2, 3];

const fakeArray = {
  [Symbol.isConcatSpreadable]: true,
  length: 2,
  0: "hello",
  1: "world",
};

x.concat(fakeArray); // [1, 2, 3, "hello", "world"]
```

> [!NOTE]
> Thuộc tính `length` được dùng để kiểm soát số thuộc tính đối tượng cần thêm vào. Trong ví dụ trên, `length:2` chỉ ra rằng hai thuộc tính cần được thêm vào.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Symbol.isConcatSpreadable` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-symbol)
- {{jsxref("Array.prototype.concat()")}}
