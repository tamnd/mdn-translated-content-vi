---
title: Array.prototype.flat()
short-title: flat()
slug: Web/JavaScript/Reference/Global_Objects/Array/flat
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.flat
sidebar: jsref
---

Phương thức **`flat()`** của các instance {{jsxref("Array")}} tạo ra một mảng mới với tất cả các phần tử mảng con được nối vào đó một cách đệ quy đến độ sâu được chỉ định.

{{InteractiveExample("JavaScript Demo: Array.prototype.flat()")}}

```js interactive-example
const arr1 = [0, 1, 2, [3, 4]];

console.log(arr1.flat());
// expected output: Array [0, 1, 2, 3, 4]

const arr2 = [0, 1, [2, [3, [4, 5]]]];

console.log(arr2.flat());
// expected output: Array [0, 1, 2, Array [3, Array [4, 5]]]

console.log(arr2.flat(2));
// expected output: Array [0, 1, 2, 3, Array [4, 5]]

console.log(arr2.flat(Infinity));
// expected output: Array [0, 1, 2, 3, 4, 5]
```

## Syntax

```js-nolint
flat()
flat(depth)
```

### Parameters

- `depth` {{optional_inline}}
  - : Cấp độ sâu chỉ định cấu trúc mảng lồng nhau cần được làm phẳng đến bao nhiêu mức.
    Mặc định là 1.

### Return value

Một mảng mới với các phần tử mảng con được nối vào.

## Description

Phương thức `flat()` là một [copying method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods). Nó không thay đổi `this` mà trả về một [bản sao nông (shallow copy)](/en-US/docs/Glossary/Shallow_copy) chứa các phần tử giống như mảng gốc.

Phương thức `flat()` loại bỏ các slot rỗng nếu mảng được làm phẳng là [mảng thưa (sparse)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays). Ví dụ, nếu `depth` là 1, cả slot rỗng trong mảng gốc và trong mức đầu tiên của mảng lồng nhau đều bị bỏ qua, nhưng slot rỗng trong các mảng lồng nhau sâu hơn được giữ nguyên cùng với chính các mảng đó.

Phương thức `flat()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên. Tuy nhiên, các phần tử của nó phải là mảng nếu chúng cần được làm phẳng.

## Examples

### Làm phẳng mảng lồng nhau

```js
const arr1 = [1, 2, [3, 4]];
arr1.flat();
// [1, 2, 3, 4]

const arr2 = [1, 2, [3, 4, [5, 6]]];
arr2.flat();
// [1, 2, 3, 4, [5, 6]]

const arr3 = [1, 2, [3, 4, [5, 6]]];
arr3.flat(2);
// [1, 2, 3, 4, 5, 6]

const arr4 = [1, 2, [3, 4, [5, 6, [7, 8, [9, 10]]]]];
arr4.flat(Infinity);
// [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
```

### Dùng flat() trên mảng thưa

Phương thức `flat()` loại bỏ các [slot rỗng](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays) trong mảng:

```js
const arr5 = [1, 2, , 4, 5];
console.log(arr5.flat()); // [1, 2, 4, 5]

const array = [1, , 3, ["a", , "c"]];
console.log(array.flat()); // [ 1, 3, "a", "c" ]

const array2 = [1, , 3, undefined, ["a", , ["d", , "e"]], null];
console.log(array2.flat()); // [ 1, 3, undefined, "a", ["d", empty, "e"], null ]
console.log(array2.flat(2)); // [ 1, 3, undefined, "a", "d", "e", null ]
```

### Gọi flat() trên các đối tượng không phải mảng

Phương thức `flat()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`. Nếu phần tử không phải là mảng, nó được thêm trực tiếp vào kết quả. Nếu phần tử là mảng, nó được làm phẳng theo tham số `depth`.

```js
const arrayLike = {
  length: 3,
  0: [1, 2],
  // Array-like objects aren't flattened
  1: { length: 2, 0: 3, 1: 4 },
  2: 5,
  3: 3, // ignored by flat() since length is 3
};
console.log(Array.prototype.flat.call(arrayLike));
// [ 1, 2, { '0': 3, '1': 4, length: 2 }, 5 ]
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.flat` in `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill of `Array.prototype.flat`](https://www.npmjs.com/package/array.prototype.flat)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.concat()")}}
- {{jsxref("Array.prototype.flatMap()")}}
- {{jsxref("Array.prototype.map()")}}
- {{jsxref("Array.prototype.reduce()")}}
