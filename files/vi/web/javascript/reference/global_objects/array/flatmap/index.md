---
title: Array.prototype.flatMap()
short-title: flatMap()
slug: Web/JavaScript/Reference/Global_Objects/Array/flatMap
page-type: javascript-instance-method
browser-compat: javascript.builtins.Array.flatMap
sidebar: jsref
---

Phương thức **`flatMap()`** của các instance {{jsxref("Array")}} trả về một mảng mới được tạo thành bằng cách áp dụng hàm callback đã cho lên mỗi phần tử của mảng, sau đó làm phẳng kết quả một cấp. Nó giống hệt với {{jsxref("Array/map", "map()")}} theo sau là {{jsxref("Array/flat", "flat()")}} với độ sâu 1 (`arr.map(...args).flat()`), nhưng hiệu quả hơn một chút so với việc gọi hai phương thức đó riêng biệt.

{{InteractiveExample("JavaScript Demo: Array.prototype.flatMap()", "shorter")}}

```js interactive-example
const arr = [1, 2, 1];

const result = arr.flatMap((num) => (num === 2 ? [2, 2] : 1));

console.log(result);
// Expected output: Array [1, 2, 2, 1]
```

## Syntax

```js-nolint
flatMap(callbackFn)
flatMap(callbackFn, thisArg)
```

### Parameters

- `callbackFn`
  - : Hàm để thực thi cho mỗi phần tử trong mảng. Nó trả về một mảng chứa các phần tử mới của mảng kết quả, hoặc một giá trị không phải mảng để được thêm vào mảng kết quả. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng.
    - `array`
      - : Mảng mà `flatMap()` được gọi trên đó.
- `thisArg` {{optional_inline}}
  - : Giá trị để dùng làm `this` khi thực thi `callbackFn`. Xem [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods).

### Return value

Một mảng mới với mỗi phần tử là kết quả của hàm callback và được làm phẳng một cấp độ.

## Description

Phương thức `flatMap()` là một [iterative method](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods). Xem {{jsxref("Array.prototype.map()")}} để biết mô tả chi tiết về hàm callback. Phương thức `flatMap()` giống hệt với [`map(callbackFn, thisArg)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) theo sau là [`flat(1)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flat) — với mỗi phần tử, nó tạo ra một mảng các phần tử mới, và nối các mảng kết quả lại với nhau để tạo thành một mảng mới. Đọc phần [iterative methods](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#iterative_methods) để biết thêm thông tin về cách các phương thức này hoạt động nói chung.

Phương thức `flatMap()` là [generic](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#generic_array_methods). Nó chỉ yêu cầu giá trị `this` có thuộc tính `length` và các thuộc tính có khóa là số nguyên. Tuy nhiên, giá trị được trả về từ `callbackFn` phải là mảng nếu nó cần được làm phẳng.

### Phương án thay thế

#### Cấp phát trước và lặp rõ ràng

```js
const arr = [1, 2, 3, 4];

arr.flatMap((x) => [x, x * 2]);
// is equivalent to
const n = arr.length;
const acc = new Array(n * 2);
for (let i = 0; i < n; i++) {
  const x = arr[i];
  acc[i * 2] = x;
  acc[i * 2 + 1] = x * 2;
}
// [1, 2, 2, 4, 3, 6, 4, 8]
```

Lưu ý rằng trong trường hợp cụ thể này, cách tiếp cận `flatMap` chậm hơn cách tiếp cận vòng lặp for — do việc tạo ra các mảng tạm thời phải được thu gom rác, cũng như mảng kết quả không cần phải thay đổi kích thước thường xuyên. Tuy nhiên, `flatMap` vẫn có thể là giải pháp đúng trong những trường hợp mà tính linh hoạt và khả năng đọc của nó được ưa chuộng.

## Examples

### map() và flatMap()

```js
const arr = [1, 2, 3, 4];

arr.map((x) => [x * 2]);
// [[2], [4], [6], [8]]

arr.flatMap((x) => [x * 2]);
// [2, 4, 6, 8]

// only one level is flattened
arr.flatMap((x) => [[x * 2]]);
// [[2], [4], [6], [8]]
```

Mặc dù ví dụ trên có thể đạt được bằng cách dùng map, đây là một ví dụ thể hiện rõ hơn cách sử dụng `flatMap()`.

Hãy tạo danh sách các từ từ danh sách các câu.

```js
const arr = ["it's Sunny in", "", "California"];

arr.map((x) => x.split(" "));
// [["it's","Sunny","in"],[""],["California"]]

arr.flatMap((x) => x.split(" "));
// ["it's","Sunny","in", "", "California"]
```

Lưu ý, độ dài danh sách đầu ra có thể khác với độ dài danh sách đầu vào.

### Thêm và xóa phần tử trong quá trình map()

`flatMap` có thể được dùng như một cách để thêm và xóa phần tử (thay đổi số lượng phần tử) trong quá trình `map`. Nói cách khác, nó cho phép bạn ánh xạ _nhiều phần tử sang nhiều phần tử_ (bằng cách xử lý từng phần tử đầu vào riêng biệt), thay vì luôn _một-đến-một_. Theo nghĩa này, nó hoạt động như ngược lại của [filter](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter).
Trả về mảng 1 phần tử để giữ phần tử, mảng nhiều phần tử để thêm phần tử, hoặc mảng 0 phần tử để xóa phần tử.

```js
// Let's say we want to remove all the negative numbers
// and split the odd numbers into an even number and a 1
const a = [5, 4, -3, 20, 17, -33, -4, 18];
//         |\  \  x   |  | \   x   x   |
//        [4,1, 4,   20, 16, 1,       18]

const result = a.flatMap((n) => {
  if (n < 0) {
    return [];
  }
  return n % 2 === 0 ? [n] : [n - 1, 1];
});
console.log(result); // [4, 1, 4, 20, 16, 1, 18]
```

### Dùng đối số thứ ba của callbackFn

Đối số `array` hữu ích khi bạn muốn truy cập một phần tử khác trong mảng, đặc biệt khi bạn không có biến hiện có nào tham chiếu đến mảng. Ví dụ sau trước tiên dùng `filter()` để trích xuất các trạm đang hoạt động và sau đó dùng `flatMap()` để tạo một mảng mới trong đó mỗi phần tử chứa một trạm và trạm kế tiếp của nó. Ở trạm cuối cùng, nó trả về một mảng rỗng để loại trừ nó khỏi mảng kết quả.

```js
const stations = ["New Haven", "West Haven", "Milford (closed)", "Stratford"];
const line = stations
  .filter((name) => !name.endsWith("(closed)"))
  .flatMap((name, idx, arr) => {
    // Without the arr argument, there's no way to easily access the
    // intermediate array without saving it to a variable.
    if (idx === arr.length - 1) return []; // last station has no next station
    return [`${name} - ${arr[idx + 1]}`];
  });
console.log(line); // ['New Haven - West Haven', 'West Haven - Stratford']
```

Đối số `array` _không phải_ là mảng đang được xây dựng — không có cách nào để truy cập mảng đang được xây dựng từ hàm callback.

### Dùng flatMap() trên mảng thưa

`callbackFn` sẽ không được gọi cho các slot rỗng trong mảng nguồn vì `map()` không gọi, trong khi `flat()` bỏ qua các slot rỗng trong các mảng được trả về.

```js
console.log([1, 2, , 4, 5].flatMap((x) => [x, x * 2])); // [1, 2, 2, 4, 4, 8, 5, 10]
console.log([1, 2, 3, 4].flatMap((x) => [, x * 2])); // [2, 4, 6, 8]
```

### Gọi flatMap() trên các đối tượng không phải mảng

Phương thức `flatMap()` đọc thuộc tính `length` của `this` và sau đó truy cập từng thuộc tính có khóa là số nguyên không âm nhỏ hơn `length`. Nếu giá trị trả về của hàm callback không phải là mảng, nó luôn được thêm trực tiếp vào mảng kết quả.

```js
const arrayLike = {
  length: 3,
  0: 1,
  1: 2,
  2: 3,
  3: 4, // ignored by flatMap() since length is 3
};
console.log(Array.prototype.flatMap.call(arrayLike, (x) => [x, x * 2]));
// [1, 2, 2, 4, 3, 6]

// Array-like objects returned from the callback won't be flattened
console.log(
  Array.prototype.flatMap.call(arrayLike, (x) => ({
    length: 1,
    0: x,
  })),
);
// [ { '0': 1, length: 1 }, { '0': 2, length: 1 }, { '0': 3, length: 1 } ]
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.prototype.flatMap` in `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill of `Array.prototype.flatMap`](https://www.npmjs.com/package/array.prototype.flatmap)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array.prototype.concat()")}}
- {{jsxref("Array.prototype.flat()")}}
- {{jsxref("Array.prototype.map()")}}
- {{jsxref("Array.prototype.reduce()")}}
