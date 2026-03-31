---
title: Array.prototype.concat()
short-title: concat()
slug: Web/JavaScript/Reference/Global_Objects/Array/concat
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.concat
sidebar: jsref
---

Phương thức **`concat()`** của các instance {{jsxref("Array")}} được dùng để hợp nhất hai hay nhiều mảng lại với nhau.
Phương thức này không thay đổi các mảng hiện có mà trả về một mảng mới.

{{InteractiveExample("JavaScript Demo: Array.prototype.concat()", "shorter")}}

```js interactive-example
const array1 = ["a", "b", "c"];
const array2 = ["d", "e", "f"];
const array3 = array1.concat(array2);

console.log(array3);
// Expected output: Array ["a", "b", "c", "d", "e", "f"]
```

## Syntax

```js-nolint
concat()
concat(value1)
concat(value1, value2)
concat(value1, value2, /* …, */ valueN)
```

### Parameters

- `value1`, …, `valueN` {{optional_inline}}
  - : Mảng và/hoặc giá trị để nối vào một mảng mới. Nếu tất cả các tham số `valueN` bị bỏ qua, `concat` trả về một [bản sao nông (shallow copy)](/en-US/docs/Glossary/Shallow_copy) của mảng hiện tại mà nó được gọi trên. Xem phần mô tả bên dưới để biết thêm chi tiết.

### Return value

Một instance {{jsxref("Array")}} mới.

## Description

Phương thức `concat` tạo ra một mảng mới. Mảng đầu tiên sẽ được điền bởi các phần tử trong đối tượng mà nó được gọi trên. Sau đó, với mỗi đối số, giá trị của nó sẽ được nối vào mảng — với các đối tượng thông thường hoặc giá trị nguyên thủy, bản thân đối số sẽ trở thành phần tử của mảng cuối cùng; với các mảng hoặc đối tượng giống mảng có thuộc tính [`Symbol.isConcatSpreadable`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/isConcatSpreadable) được đặt thành giá trị truthy, mỗi phần tử của đối số sẽ được thêm độc lập vào mảng cuối cùng. Phương thức `concat` không đệ quy vào các đối số mảng lồng nhau.

Phương thức `concat()` là một [copying method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copying_methods_and_mutating_methods). Nó không thay đổi `this` hay bất kỳ mảng nào được cung cấp làm đối số mà thay vào đó trả về một [bản sao nông (shallow copy)](/en-US/docs/Glossary/Shallow_copy) chứa các phần tử giống như các mảng gốc.

Phương thức `concat()` bảo toàn các slot rỗng nếu bất kỳ mảng nguồn nào là [mảng thưa (sparse)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays).

Phương thức `concat()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Giá trị `this` được xử lý theo cùng một cách như các đối số khác (ngoại trừ nó sẽ được chuyển đổi thành object trước), nghĩa là các object thuần túy sẽ được thêm trực tiếp vào mảng kết quả, trong khi các đối tượng giống mảng có `[Symbol.isConcatSpreadable]` truthy sẽ được trải rộng vào mảng kết quả.

## Examples

### Nối hai mảng

Đoạn code sau nối hai mảng:

```js
const letters = ["a", "b", "c"];
const numbers = [1, 2, 3];

const alphaNumeric = letters.concat(numbers);
console.log(alphaNumeric);
// results in ['a', 'b', 'c', 1, 2, 3]
```

### Nối ba mảng

Đoạn code sau nối ba mảng:

```js
const num1 = [1, 2, 3];
const num2 = [4, 5, 6];
const num3 = [7, 8, 9];

const numbers = num1.concat(num2, num3);

console.log(numbers);
// results in [1, 2, 3, 4, 5, 6, 7, 8, 9]
```

### Nối giá trị vào mảng

Đoạn code sau nối ba giá trị vào một mảng:

```js
const letters = ["a", "b", "c"];

const alphaNumeric = letters.concat(1, [2, 3]);

console.log(alphaNumeric);
// results in ['a', 'b', 'c', 1, 2, 3]
```

### Nối mảng lồng nhau

Đoạn code sau nối các mảng lồng nhau và minh họa việc giữ nguyên các tham chiếu:

```js
const num1 = [[1]];
const num2 = [2, [3]];

const numbers = num1.concat(num2);

console.log(numbers);
// results in [[1], 2, [3]]

// modify the first element of num1
num1[0].push(4);

console.log(numbers);
// results in [[1, 4], 2, [3]]
```

### Nối các đối tượng giống mảng với Symbol.isConcatSpreadable

`concat` không coi tất cả các đối tượng giống mảng là mảng theo mặc định — chỉ khi `Symbol.isConcatSpreadable` được đặt thành giá trị truthy (ví dụ: `true`).

```js
const obj1 = { 0: 1, 1: 2, 2: 3, length: 3 };
const obj2 = { 0: 1, 1: 2, 2: 3, length: 3, [Symbol.isConcatSpreadable]: true };
console.log([0].concat(obj1, obj2));
// [ 0, { '0': 1, '1': 2, '2': 3, length: 3 }, 1, 2, 3 ]
```

### Dùng concat() trên mảng thưa

Nếu bất kỳ mảng nguồn nào là mảng thưa, mảng kết quả cũng sẽ thưa:

```js
console.log([1, , 3].concat([4, 5])); // [1, empty, 3, 4, 5]
console.log([1, 2].concat([3, , 5])); // [1, 2, 3, empty, 5]
```

### Gọi concat() trên các đối tượng không phải mảng

Nếu giá trị `this` không phải là mảng, nó được chuyển đổi thành object và sau đó được xử lý theo cùng cách như các đối số cho `concat()`. Trong trường hợp này, giá trị trả về luôn là một mảng mới thuần túy.

```js
console.log(Array.prototype.concat.call({}, 1, 2, 3)); // [{}, 1, 2, 3]
console.log(Array.prototype.concat.call(1, 2, 3)); // [ [Number: 1], 2, 3 ]
const arrayLike = {
  [Symbol.isConcatSpreadable]: true,
  length: 2,
  0: 1,
  1: 2,
  2: 99, // ignored by concat() since length is 2
};
console.log(Array.prototype.concat.call(arrayLike, 3, 4)); // [1, 2, 3, 4]
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.concat` in `core-js` with fixes and implementation of modern behavior like `Symbol.isConcatSpreadable` support](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill of `Array.prototype.concat`](https://www.npmjs.com/package/array.prototype.concat)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.push()")}}
- {{jsxref("Array.prototype.unshift()")}}
- {{jsxref("Array.prototype.splice()")}}
- {{jsxref("String.prototype.concat()")}}
- {{jsxref("Symbol.isConcatSpreadable")}}
