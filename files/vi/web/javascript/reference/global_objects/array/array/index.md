---
title: Array() constructor
short-title: Array()
slug: Web/JavaScript/Reference/Global_Objects/Array/Array
page-type: javascript-constructor
browser-compat: javascript.builtins.Array.Array
sidebar: jsref
---

Hàm tạo **`Array()`** tạo ra các đối tượng {{jsxref("Array")}}.

## Syntax

```js-nolint
new Array()
new Array(element1)
new Array(element1, element2)
new Array(element1, element2, /* …, */ elementN)
new Array(arrayLength)

Array()
Array(element1)
Array(element1, element2)
Array(element1, element2, /* …, */ elementN)
Array(arrayLength)
```

> [!NOTE]
> `Array()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new). Cả hai cách đều tạo ra một instance `Array` mới.

### Parameters

- `element1`, …, `elementN`
  - : Mảng JavaScript được khởi tạo với các phần tử đã cho, ngoại trừ trường hợp một đối số duy nhất được truyền vào hàm tạo `Array` và đối số đó là một số (xem tham số `arrayLength` bên dưới). Lưu ý rằng trường hợp đặc biệt này chỉ áp dụng cho mảng JavaScript được tạo bằng hàm tạo `Array`, không áp dụng cho mảng literal được tạo bằng cú pháp ngoặc vuông.
- `arrayLength`
  - : Nếu đối số duy nhất được truyền vào hàm tạo `Array` là một số nguyên nằm trong khoảng từ 0 đến 2<sup>32</sup> - 1 (bao gồm cả hai đầu), thì kết quả trả về là một mảng JavaScript mới với thuộc tính `length` được đặt thành số đó.

    > [!NOTE]
    > Điều này tạo ra một mảng có `arrayLength` slot rỗng, không phải các slot chứa giá trị `undefined` thực sự — xem [mảng thưa (sparse arrays)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#sparse_arrays)).

### Exceptions

- {{jsxref("RangeError")}}
  - : Được ném ra nếu chỉ có một đối số (`arrayLength`) là một số, nhưng giá trị của nó không phải là số nguyên hoặc không nằm trong khoảng từ 0 đến 2<sup>32</sup> - 1 (bao gồm cả hai đầu).

## Examples

### Ký hiệu literal mảng

Mảng có thể được tạo bằng ký hiệu [literal](/en-US/docs/Web/JavaScript/Guide/Grammar_and_types#array_literals):

```js
const fruits = ["Apple", "Banana"];

console.log(fruits.length); // 2
console.log(fruits[0]); // "Apple"
```

### Hàm tạo mảng với một tham số duy nhất

Mảng có thể được tạo bằng hàm tạo với một tham số số duy nhất. Mảng được tạo ra với thuộc tính `length` được đặt thành số đó, và các phần tử mảng là các slot rỗng.

```js
const arrayEmpty = new Array(2);

console.log(arrayEmpty.length); // 2
console.log(arrayEmpty[0]); // undefined; actually, it is an empty slot
console.log(0 in arrayEmpty); // false
console.log(1 in arrayEmpty); // false
```

```js
const arrayOfOne = new Array("2"); // Not the number 2 but the string "2"

console.log(arrayOfOne.length); // 1
console.log(arrayOfOne[0]); // "2"
```

### Hàm tạo mảng với nhiều tham số

Nếu nhiều hơn một đối số được truyền vào hàm tạo, một {{jsxref("Array")}} mới chứa các phần tử đã cho sẽ được tạo ra.

```js
const fruits = new Array("Apple", "Banana");

console.log(fruits.length); // 2
console.log(fruits[0]); // "Apple"
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
