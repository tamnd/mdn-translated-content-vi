---
title: Array.prototype.entries()
short-title: entries()
slug: Web/JavaScript/Reference/Global_Objects/Array/entries
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.entries
sidebar: jsref
---

Phương thức **`entries()`** của các instance {{jsxref("Array")}} trả về một _[đối tượng iterator mảng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator)_ mới chứa các cặp khóa/giá trị cho mỗi chỉ số trong mảng.

{{InteractiveExample("JavaScript Demo: Array.prototype.entries()")}}

```js interactive-example
const array = ["a", "b", "c"];

const iterator = array.entries();

console.log(iterator.next().value);
// Expected output: Array [0, "a"]

console.log(iterator.next().value);
// Expected output: Array [1, "b"]
```

## Syntax

```js-nolint
entries()
```

### Parameters

Không có.

### Return value

Một [đối tượng iterator có thể lặp (iterable iterator object)](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) mới.

## Description

Khi dùng trên [mảng thưa (sparse arrays)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays), phương thức `entries()` lặp qua các slot rỗng như thể chúng có giá trị `undefined`.

Phương thức `entries()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên.

## Examples

### Lặp với chỉ số và phần tử

```js
const a = ["a", "b", "c"];

for (const [index, element] of a.entries()) {
  console.log(index, element);
}

// 0 'a'
// 1 'b'
// 2 'c'
```

### Dùng vòng lặp for...of

```js
const array = ["a", "b", "c"];
const arrayEntries = array.entries();

for (const element of arrayEntries) {
  console.log(element);
}

// [0, 'a']
// [1, 'b']
// [2, 'c']
```

### Lặp qua mảng thưa

`entries()` sẽ duyệt qua các slot rỗng như thể chúng là `undefined`.

```js
for (const element of [, "a"].entries()) {
  console.log(element);
}
// [0, undefined]
// [1, 'a']
```

### Gọi entries() trên các đối tượng không phải mảng

Phương thức `entries()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`.

```js
const arrayLike = {
  length: 3,
  0: "a",
  1: "b",
  2: "c",
  3: "d", // ignored by entries() since length is 3
};
for (const entry of Array.prototype.entries.call(arrayLike)) {
  console.log(entry);
}
// [ 0, 'a' ]
// [ 1, 'b' ]
// [ 2, 'c' ]
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.entries` in `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill of `Array.prototype.entries`](https://www.npmjs.com/package/array.prototype.entries)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.keys()")}}
- {{jsxref("Array.prototype.values()")}}
- [`Array.prototype[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Symbol.iterator)
- {{jsxref("TypedArray.prototype.entries()")}}
- [Iteration protocols](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
