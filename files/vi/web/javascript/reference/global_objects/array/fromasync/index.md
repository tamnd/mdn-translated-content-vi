---
title: Array.fromAsync()
short-title: fromAsync()
slug: Web/JavaScript/Reference/Global_Objects/Array/fromAsync
page-type: javascript-static-method
browser-compat: javascript.builtins.Array.fromAsync
sidebar: jsref
---

Phương thức tĩnh **`Array.fromAsync()`** tạo ra một instance `Array` mới được sao chép nông từ một đối tượng [async iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols), [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) hoặc [giống mảng (array-like)](/en-US/docs/Web/JavaScript/Guide/Indexed_collections#working_with_array-like_objects).

## Syntax

```js-nolint
Array.fromAsync(items)
Array.fromAsync(items, mapFn)
Array.fromAsync(items, mapFn, thisArg)
```

### Parameters

- `items`
  - : Một đối tượng async iterable, iterable hoặc giống mảng để chuyển đổi thành mảng.
- `mapFn` {{optional_inline}}
  - : Hàm để gọi trên mỗi phần tử của mảng. Nếu được cung cấp, mọi giá trị cần thêm vào mảng sẽ được truyền qua hàm này trước, và giá trị trả về của `mapFn` sẽ được thêm vào mảng thay thế (sau khi được [await](/en-US/docs/Web/JavaScript/Reference/Operators/await)). Hàm được gọi với các đối số sau:
    - `element`
      - : Phần tử hiện tại đang được xử lý trong mảng. Nếu `items` là một đối tượng sync iterable hoặc giống mảng, thì tất cả các phần tử trước tiên được [await](/en-US/docs/Web/JavaScript/Reference/Operators/await), và `element` sẽ không bao giờ là một [thenable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#thenables). Nếu `items` là một async iterable, thì mỗi giá trị được yield được truyền như là.
    - `index`
      - : Chỉ số của phần tử hiện tại đang được xử lý trong mảng.
- `thisArg` {{optional_inline}}
  - : Giá trị để dùng làm `this` khi thực thi `mapFn`.

### Return value

Một {{jsxref("Promise")}} mới có giá trị fulfillment là một instance {{jsxref("Array")}} mới.

## Description

`Array.fromAsync()` cho phép bạn tạo mảng từ:

- [các đối tượng async iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) (các đối tượng như {{domxref("ReadableStream")}} và {{jsxref("AsyncGenerator")}}); hoặc, nếu đối tượng không phải async iterable,
- [các đối tượng iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) (các đối tượng như {{jsxref("Map")}} và {{jsxref("Set")}}); hoặc, nếu đối tượng không thể lặp,
- các đối tượng giống mảng (các đối tượng có thuộc tính `length` và các phần tử được đánh chỉ số).

`Array.fromAsync()` lặp qua async iterable theo cách rất giống với {{jsxref("Statements/for-await...of", "for await...of")}}. `Array.fromAsync(items)` thường tương đương với đoạn code sau, nếu `items` là một async iterable hoặc sync iterable:

```js
const result = [];
for await (const element of items) {
  result.push(element);
}
```

`Array.fromAsync()` gần tương đương với {{jsxref("Array.from()")}} về mặt hành vi, ngoại trừ những điểm sau:

- `Array.fromAsync()` xử lý các đối tượng async iterable.
- `Array.fromAsync()` trả về một {{jsxref("Promise")}} được fulfill thành instance mảng.
- Nếu `Array.fromAsync()` được gọi với một đối tượng không phải async iterable, mỗi phần tử cần thêm vào mảng trước tiên được [await](/en-US/docs/Web/JavaScript/Reference/Operators/await).
- Nếu `mapFn` được cung cấp, đầu ra của nó cũng được await nội bộ.

`Array.fromAsync()` và {{jsxref("Promise.all()")}} đều có thể chuyển đổi một iterable của các promise thành một promise của mảng. Tuy nhiên, có hai sự khác biệt chính:

- `Array.fromAsync()` await từng giá trị được yield từ đối tượng một cách tuần tự. `Promise.all()` await tất cả các giá trị đồng thời.
- `Array.fromAsync()` lặp qua iterable một cách lười biếng, và không lấy giá trị tiếp theo cho đến khi giá trị hiện tại được settle. `Promise.all()` lấy tất cả các giá trị trước và await tất cả chúng.

## Examples

### Array từ async iterable

```js
const asyncIterable = (async function* () {
  for (let i = 0; i < 5; i++) {
    await new Promise((resolve) => setTimeout(resolve, 10 * i));
    yield i;
  }
})();

Array.fromAsync(asyncIterable).then((array) => console.log(array));
// [0, 1, 2, 3, 4]
```

Khi `items` là một async iterable trong đó kết quả của mỗi phần tử `value` cũng là một promise, thì các promise đó được thêm vào mảng kết quả mà không được await. Điều này nhất quán với hành vi của `for await...of`.

```js
function createAsyncIter() {
  let i = 0;
  return {
    [Symbol.asyncIterator]() {
      return {
        async next() {
          if (i > 2) return { done: true };
          i++;
          return { value: Promise.resolve(i), done: false };
        },
      };
    },
  };
}

Array.fromAsync(createAsyncIter()).then((array) => console.log(array));
// (3) [Promise, Promise, Promise]
```

> [!NOTE]
> Trong thực tế, bạn hiếm khi gặp một async iterable yield các promise, vì nếu bạn triển khai nó bằng [hàm async generator](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*), thì biểu thức [`yield`](/en-US/docs/Web/JavaScript/Reference/Operators/yield) tự động unwrap các promise.

### Array từ sync iterable

```js
Array.fromAsync(
  new Map([
    [1, 2],
    [3, 4],
  ]),
).then((array) => console.log(array));
// [[1, 2], [3, 4]]
```

### Array từ sync iterable yield các promise

```js
Array.fromAsync(
  new Set([Promise.resolve(1), Promise.resolve(2), Promise.resolve(3)]),
).then((array) => console.log(array));
// [1, 2, 3]
```

### Array từ đối tượng giống mảng chứa promise

```js
Array.fromAsync({
  length: 3,
  0: Promise.resolve(1),
  1: Promise.resolve(2),
  2: Promise.resolve(3),
}).then((array) => console.log(array));
// [1, 2, 3]
```

### Dùng mapFn với sync iterable

Khi `items` là một sync iterable hoặc đối tượng giống mảng, cả đầu vào và đầu ra của `mapFn` đều được `Array.fromAsync()` await nội bộ.

```js
function delayedValue(v) {
  return new Promise((resolve) => setTimeout(() => resolve(v), 100));
}

Array.fromAsync(
  [delayedValue(1), delayedValue(2), delayedValue(3)],
  (element) => delayedValue(element * 2),
).then((array) => console.log(array));
// [2, 4, 6]
```

### Dùng mapFn với async iterable

Khi `items` là một async iterable, đầu vào của `mapFn` không được await, nhưng đầu ra thì có. Dùng hàm `createAsyncIter` tương tự như ở trên:

```js
Array.fromAsync(createAsyncIter(), async (element) => (await element) * 2).then(
  (array) => console.log(array),
);
// [2, 4, 6]
```

Điều thú vị là điều này có nghĩa là `Array.fromAsync(createAsyncIter())` không tương đương với `Array.fromAsync(createAsyncIter(), (element) => element)`, vì sau này await từng giá trị được yield, trong khi trước thì không.

```js
Array.fromAsync(createAsyncIter(), (element) => element).then((array) =>
  console.log(array),
);
// [1, 2, 3]
```

### So sánh với Promise.all()

`Array.fromAsync()` await từng giá trị được yield từ đối tượng một cách tuần tự. `Promise.all()` await tất cả các giá trị đồng thời.

```js
function* makeIterableOfPromises() {
  for (let i = 0; i < 5; i++) {
    yield new Promise((resolve) => setTimeout(resolve, 100));
  }
}

(async () => {
  console.time("Array.fromAsync() time");
  await Array.fromAsync(makeIterableOfPromises());
  console.timeEnd("Array.fromAsync() time");
  // Array.fromAsync() time: 503.610ms

  console.time("Promise.all() time");
  await Promise.all(makeIterableOfPromises());
  console.timeEnd("Promise.all() time");
  // Promise.all() time: 101.728ms
})();
```

### Không xử lý lỗi cho sync iterable

Tương tự như [`for await...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of#iterating_over_sync_iterables_and_generators), nếu đối tượng đang được lặp là sync iterable và lỗi xảy ra trong quá trình lặp, phương thức `return()` của iterator bên dưới sẽ không được gọi, do đó iterator không được đóng.

```js
function* generatorWithRejectedPromises() {
  try {
    yield 0;
    yield Promise.reject(new Error("error"));
  } finally {
    console.log("called finally");
  }
}

(async () => {
  try {
    await Array.fromAsync(generatorWithRejectedPromises());
  } catch (e) {
    console.log("caught", e);
  }
})();
// caught Error: error
// No "called finally" message
```

Nếu bạn cần đóng iterator, bạn cần dùng vòng lặp {{jsxref("Statements/for...of", "for...of")}} thay thế, và tự `await` từng giá trị.

```js
(async () => {
  const arr = [];
  try {
    for (const val of generatorWithRejectedPromises()) {
      arr.push(await val);
    }
  } catch (e) {
    console.log("caught", e);
  }
})();
// called finally
// caught 3
```

## Specifications

{{Specifications}}

## Browser compatibility

{{Compat}}

## See also

- [Polyfill of `Array.fromAsync` in `core-js`](https://github.com/zloirock/core-js#arrayfromasync)
- [Indexed collections](/en-US/docs/Web/JavaScript/Guide/Indexed_collections) guide
- {{jsxref("Array")}}
- {{jsxref("Array/Array", "Array()")}}
- {{jsxref("Array.of()")}}
- {{jsxref("Array.from()")}}
- {{jsxref("Statements/for-await...of", "for await...of")}}
