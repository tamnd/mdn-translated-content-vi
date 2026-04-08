---
title: "TypeError: 'x' is not iterable"
slug: Web/JavaScript/Reference/Errors/is_not_iterable
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "is not iterable" xảy ra khi giá trị được [spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) vào một mảng hoặc lời gọi hàm, được dùng làm toán hạng bên phải của [`for...of`](/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration#for...of_statement), làm đối số của hàm như {{jsxref("Promise.all")}} hoặc {{jsxref("Set/Set", "Set()")}}, hoặc làm toán hạng bên phải của [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) mảng, không phải là một [đối tượng iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols). Lỗi này cũng xảy ra khi {{jsxref("Array.fromAsync()")}} hoặc {{jsxref("Statements/for-await...of", "for await...of")}} được sử dụng với [non-async iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols).

## Thông báo

```plain
TypeError: Spread syntax requires ...iterable[Symbol.iterator] to be a function (V8-based & Safari)
TypeError: %Array%.from requires that the property of the first argument, items[Symbol.iterator], when exists, be a function (V8-based & Safari)
TypeError: Array.fromAsync requires that the property of the first argument, items[Symbol.asyncIterator], when exists, be a function (V8-based & Safari)
TypeError: object is not iterable (cannot read property Symbol(Symbol.iterator)) (V8-based)
TypeError: x is not async iterable (V8-based)
TypeError: x is not iterable (V8-based & Firefox)
TypeError: undefined is not a function (near '...y of x...') (Safari)
TypeError: Array.from: no function (Safari)
TypeError: Type error (Safari)
```

## Loại lỗi

{{jsxref("TypeError")}}

## Nguyên nhân?

Giá trị được [spread](/en-US/docs/Web/JavaScript/Reference/Operators/Spread_syntax) vào một mảng hoặc lời gọi hàm, được dùng làm toán hạng bên phải của [`for...of`](/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration#for...of_statement), hoặc làm đối số của hàm như {{jsxref("Promise.all")}} hoặc {{jsxref("Set/Set", "Set()")}}, hoặc làm nguồn của mẫu [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) mảng, không phải là một [đối tượng iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols). Một iterable có thể là kiểu iterable tích hợp sẵn như {{jsxref("Array")}}, {{jsxref("String")}} hoặc {{jsxref("Map")}}, kết quả của generator, hoặc một đối tượng triển khai [giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol).

```js
const nonIterable1 = {};
const nonIterable2 = { [Symbol.iterator]: 1 };

[...nonIterable1];
Math.max(...nonIterable1);
for (const x of nonIterable1);
new Set(nonIterable1);
Array.from(nonIterable2);
new Int8Array(nonIterable2);
const [] = nonIterable1;
```

## Ví dụ

### Destructuring mảng từ một non-iterable

```js example-bad
const myObj = { arrayOrObjProp1: {}, arrayOrObjProp2: [42] };

const {
  arrayOrObjProp1: [value1],
  arrayOrObjProp2: [value2],
} = myObj; // TypeError: object is not iterable

console.log(value1, value2);
```

Non-iterable có thể trở thành `undefined` trong một số môi trường chạy.

### Duyệt qua các thuộc tính của Object

Trong JavaScript, {{jsxref("Object")}} không thể duyệt lặp trừ khi chúng triển khai [giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol). Do đó, bạn không thể sử dụng [`for...of`](/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration#for...of_statement) để duyệt qua các thuộc tính của một đối tượng.

```js example-bad
const obj = { France: "Paris", England: "London" };
for (const p of obj) {
  // …
} // TypeError: obj is not iterable
```

Thay vào đó, bạn phải sử dụng {{jsxref("Object.keys")}} hoặc {{jsxref("Object.entries")}} để duyệt qua các thuộc tính hoặc các mục của đối tượng.

```js example-good
const obj = { France: "Paris", England: "London" };
// Duyệt qua tên thuộc tính:
for (const country of Object.keys(obj)) {
  const capital = obj[country];
  console.log(country, capital);
}

for (const [country, capital] of Object.entries(obj)) {
  console.log(country, capital);
}
```

Một lựa chọn khác cho trường hợp này là sử dụng {{jsxref("Map")}}:

```js example-good
const map = new Map();
map.set("France", "Paris");
map.set("England", "London");
// Duyệt qua tên thuộc tính:
for (const country of map.keys()) {
  const capital = map.get(country);
  console.log(country, capital);
}

for (const capital of map.values()) {
  console.log(capital);
}

for (const [country, capital] of map.entries()) {
  console.log(country, capital);
}
```

### Duyệt qua một generator

[Hàm generator](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators#generator_functions) là các hàm bạn gọi để tạo ra một đối tượng iterable.

```js example-bad
function* generate(a, b) {
  yield a;
  yield b;
}

for (const x of generate) {
  console.log(x);
} // TypeError: generate is not iterable
```

Khi chúng không được gọi, đối tượng {{jsxref("Function")}} tương ứng với generator có thể gọi được, nhưng không thể duyệt lặp. Gọi một generator sẽ tạo ra một đối tượng iterable có thể duyệt qua các giá trị được yield trong quá trình thực thi generator.

```js example-good
function* generate(a, b) {
  yield a;
  yield b;
}

for (const x of generate(1, 2)) {
  console.log(x);
}
```

### Duyệt qua một custom iterable

Custom iterable có thể được tạo ra bằng cách triển khai phương thức {{jsxref("Symbol.iterator")}}. Bạn phải đảm bảo rằng phương thức iterator của bạn trả về một đối tượng là iterator, tức là nó phải có phương thức `next`.

```js example-bad
const myEmptyIterable = {
  [Symbol.iterator]() {
    return []; // [] là iterable, nhưng không phải là iterator — nó không có phương thức next.
  },
};

Array.from(myEmptyIterable); // TypeError: myEmptyIterable is not iterable
```

Đây là cách triển khai đúng:

```js example-good
const myEmptyIterable = {
  [Symbol.iterator]() {
    return [][Symbol.iterator]();
  },
};

Array.from(myEmptyIterable); // []
```

## Xem thêm

- [Giao thức iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol)
- {{jsxref("Object.keys")}}
- {{jsxref("Object.entries")}}
- {{jsxref("Map")}}
- [Hàm generator](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators#generator_functions)
- [for...of](/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration#for...of_statement)
