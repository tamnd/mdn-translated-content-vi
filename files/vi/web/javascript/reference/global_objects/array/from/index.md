---
title: Array.from()
short-title: from()
slug: Web/JavaScript/Reference/Global_Objects/Array/from
page-type: javascript-static-method
browser-compat: javascript.builtins.Array.from
sidebar: jsref
---

Phương thức tĩnh **`Array.from()`** tạo ra một instance `Array` mới được sao chép nông từ một đối tượng [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) hoặc [giống mảng (array-like)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#working_with_array-like_objects).

{{InteractiveExample("JavaScript Demo: Array.from()", "shorter")}}

```js interactive-example
console.log(Array.from("foo"));
// Expected output: Array ["f", "o", "o"]

console.log(Array.from([1, 2, 3], (x) => x + x));
// Expected output: Array [2, 4, 6]
```

## Syntax

```js-nolint
Array.from(items)
Array.from(items, mapFn)
Array.from(items, mapFn, thisArg)
```

### Parameters

- `items`
  - : Một đối tượng iterable hoặc giống mảng để chuyển đổi thành mảng.
- `mapFn` {{optional_inline}}
  - : Hàm để gọi trên mỗi phần tử của mảng. Nếu được cung cấp, mọi giá trị cần thêm vào mảng sẽ được truyền qua hàm này trước, và giá trị trả về của `mapFn` sẽ được thêm vào mảng thay thế. Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng.
- `thisArg` {{optional_inline}}
  - : Giá trị để dùng làm `this` khi thực thi `mapFn`.

### Return value

Một instance {{jsxref("Array")}} mới.

## Description

`Array.from()` cho phép bạn tạo `Array` từ:

- [các đối tượng iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) (các đối tượng như {{jsxref("Map")}} và {{jsxref("Set")}}); hoặc, nếu đối tượng không thể lặp,
- các đối tượng giống mảng (các đối tượng có thuộc tính `length` và các phần tử được đánh chỉ số).

Để chuyển đổi một object thông thường không thể lặp hoặc không giống mảng thành mảng (bằng cách liệt kê các khóa thuộc tính, giá trị hoặc cả hai), hãy dùng {{jsxref("Object.keys()")}}, {{jsxref("Object.values()")}} hoặc {{jsxref("Object.entries()")}}. Để chuyển đổi [async iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) thành mảng, hãy dùng {{jsxref("Array.fromAsync()")}}.

`Array.from()` không bao giờ tạo mảng thưa. Nếu đối tượng `items` thiếu một số thuộc tính chỉ số, chúng sẽ trở thành `undefined` trong mảng mới.

`Array.from()` có tham số tùy chọn `mapFn`, cho phép bạn thực thi một hàm trên mỗi phần tử của mảng đang được tạo, tương tự như {{jsxref("Array/map", "map()")}}. Rõ ràng hơn, `Array.from(obj, mapFn, thisArg)` có cùng kết quả với `Array.from(obj).map(mapFn, thisArg)`, ngoại trừ nó không tạo ra mảng trung gian, và `mapFn` chỉ nhận hai đối số (`element`, `index`) mà không có toàn bộ mảng, vì mảng vẫn đang được xây dựng.

> [!NOTE]
> Hành vi này quan trọng hơn đối với [typed arrays](/en-US/docs/Web/JavaScript/Guide/Typed_arrays), vì mảng trung gian sẽ nhất thiết phải có các giá trị bị cắt bớt để phù hợp với kiểu thích hợp. `Array.from()` được triển khai để có cùng chữ ký với {{jsxref("TypedArray.from()")}}.

Phương thức `Array.from()` là một phương thức factory generic. Ví dụ, nếu một lớp con của `Array` kế thừa phương thức `from()`, phương thức `from()` được kế thừa sẽ trả về các instance mới của lớp con thay vì các instance `Array`. Trên thực tế, giá trị `this` có thể là bất kỳ hàm tạo nào chấp nhận một đối số duy nhất đại diện cho độ dài của mảng mới. Khi một iterable được truyền vào `items`, hàm tạo được gọi không có đối số; khi một đối tượng giống mảng được truyền vào, hàm tạo được gọi với [độ dài chuẩn hóa](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#normalization_of_the_length_property) của đối tượng giống mảng. `length` cuối cùng sẽ được đặt lại khi lặp hoàn tất. Nếu giá trị `this` không phải là hàm tạo, hàm tạo `Array` thuần túy sẽ được dùng thay thế.

## Examples

### Array từ String

```js
Array.from("foo");
// [ "f", "o", "o" ]
```

### Array từ Set

```js
const set = new Set(["foo", "bar", "baz", "foo"]);
Array.from(set);
// [ "foo", "bar", "baz" ]
```

### Array từ Map

```js
const map = new Map([
  [1, 2],
  [2, 4],
  [4, 8],
]);
Array.from(map);
// [[1, 2], [2, 4], [4, 8]]

const mapper = new Map([
  ["1", "a"],
  ["2", "b"],
]);
Array.from(mapper.values());
// ['a', 'b'];

Array.from(mapper.keys());
// ['1', '2'];
```

### Array từ NodeList

```js
// Create an array based on a property of DOM Elements
const images = document.querySelectorAll("img");
const sources = Array.from(images, (image) => image.src);
const insecureSources = sources.filter((link) => link.startsWith("http://"));
```

### Array từ đối tượng giống mảng (arguments)

```js
function f() {
  return Array.from(arguments);
}

f(1, 2, 3);

// [ 1, 2, 3 ]
```

### Dùng arrow function và Array.from()

```js
// Using an arrow function as the map function to
// manipulate the elements
Array.from([1, 2, 3], (x) => x + x);
// [2, 4, 6]

// Generate a sequence of numbers
// Since the array is initialized with `undefined` on each position,
// the value of `v` below will be `undefined`
Array.from({ length: 5 }, (v, i) => i);
// [0, 1, 2, 3, 4]
```

### Bộ sinh dãy số (range)

```js
// Sequence generator function (commonly referred to as "range", cf. Python, Clojure, etc.)
const range = (start, stop, step) =>
  Array.from(
    { length: Math.ceil((stop - start) / step) },
    (_, i) => start + i * step,
  );

// Generate a sequence of numbers from 0 (inclusive) to 5 (exclusive), incrementing by 1
range(0, 5, 1);
// [0, 1, 2, 3, 4]

// Generate a sequence of numbers from 1 (inclusive) to 10 (exclusive), incrementing by 2
range(1, 10, 2);
// [1, 3, 5, 7, 9]

// Generate the Latin alphabet making use of it being ordered as a sequence
range("A".charCodeAt(0), "Z".charCodeAt(0) + 1, 1).map((x) =>
  String.fromCharCode(x),
);
// ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
```

### Gọi from() trên các hàm tạo không phải mảng

Phương thức `from()` có thể được gọi trên bất kỳ hàm tạo nào chấp nhận một đối số duy nhất đại diện cho độ dài của mảng mới.

```js
function NotArray(len) {
  console.log("NotArray called with length", len);
}

// Iterable
console.log(Array.from.call(NotArray, new Set(["foo", "bar", "baz"])));
// NotArray called with length undefined
// NotArray { '0': 'foo', '1': 'bar', '2': 'baz', length: 3 }

// Array-like
console.log(Array.from.call(NotArray, { length: 1, 0: "foo" }));
// NotArray called with length 1
// NotArray { '0': 'foo', length: 1 }
```

Khi giá trị `this` không phải là hàm tạo, một object `Array` thuần túy được trả về.

```js
console.log(Array.from.call({}, { length: 1, 0: "foo" })); // [ 'foo' ]
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.from` in `core-js`](https://github.com/zloirock/core-js#ecmascript-array)
- [es-shims polyfill of `Array.from`](https://www.npmjs.com/package/array.from)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array/Array", "Array()")}}
- {{jsxref("Array.of()")}}
- {{jsxref("Array.fromAsync()")}}
- {{jsxref("Array.prototype.map()")}}
- {{jsxref("TypedArray.from()")}}
