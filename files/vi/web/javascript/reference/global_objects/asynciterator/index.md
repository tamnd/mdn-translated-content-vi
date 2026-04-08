---
title: AsyncIterator
slug: Web/JavaScript/Reference/Global_Objects/AsyncIterator
page-type: javascript-class
browser-compat: javascript.builtins.AsyncIterator
sidebar: jsref
---

Một đối tượng **`AsyncIterator`** là đối tượng tuân theo [giao thức async iterator](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) bằng cách cung cấp phương thức `next()` trả về một promise được thực hiện thành một đối tượng kết quả iterator. Đối tượng `AsyncIterator.prototype` là một đối tượng toàn cục ẩn mà tất cả các async iterator tích hợp sẵn đều kế thừa từ đó. Nó cung cấp phương thức [`[Symbol.asyncIterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncIterator/Symbol.asyncIterator) trả về chính đối tượng async iterator, giúp async iterator cũng trở thành [async iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols).

Lưu ý rằng `AsyncIterator` _không_ phải là đối tượng toàn cục, mặc dù nó sẽ trở thành như vậy trong tương lai với [đề xuất async iterator helpers](https://github.com/tc39/proposal-async-iterator-helpers). Đối tượng `AsyncIterator.prototype` được chia sẻ bởi tất cả các async iterator tích hợp sẵn có thể được lấy bằng đoạn mã sau:

```js
const AsyncIteratorPrototype = Object.getPrototypeOf(
  Object.getPrototypeOf(Object.getPrototypeOf((async function* () {})())),
);
```

## Mô tả

Hiện tại, async iterator tích hợp duy nhất của JavaScript là đối tượng {{jsxref("AsyncGenerator")}} được trả về bởi [các hàm async generator](/en-US/docs/Web/JavaScript/Reference/Statements/async_function*). Có một số async iterator tích hợp khác trong web API, chẳng hạn như async iterator của {{domxref("ReadableStream")}}.

Mỗi async iterator này có một đối tượng prototype riêng, định nghĩa phương thức `next()` được sử dụng bởi async iterator cụ thể đó. Tất cả các đối tượng prototype này đều kế thừa từ `AsyncIterator.prototype`, cung cấp phương thức [`[Symbol.asyncIterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/asyncIterator) trả về chính đối tượng async iterator, khiến async iterator cũng là [async iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols).

> [!NOTE]
> `AsyncIterator.prototype` không triển khai [`[Symbol.iterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/iterator), do đó các async iterator không phải là [sync iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) theo mặc định.

## Phương thức instance

- [`AsyncIterator.prototype[Symbol.asyncDispose]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncIterator/Symbol.asyncDispose)
  - : Gọi và đợi phương thức `return()` của `this`, nếu nó tồn tại. Điều này triển khai _giao thức async disposable_ và cho phép nó được giải phóng khi sử dụng với {{jsxref("Statements/await_using", "await using")}}.
- [`AsyncIterator.prototype[Symbol.asyncIterator]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/AsyncIterator/Symbol.asyncIterator)
  - : Trả về chính đối tượng async iterator. Điều này cho phép các đối tượng async iterator cũng là async iterable.

## Ví dụ

### Sử dụng async iterator như một async iterable

Tất cả các async iterator tích hợp sẵn cũng là async iterable, vì vậy bạn có thể sử dụng chúng trong vòng lặp `for await...of`:

```js
const asyncIterator = (async function* () {
  yield 1;
  yield 2;
  yield 3;
})();
(async () => {
  for await (const value of asyncIterator) {
    console.log(value);
  }
})();
// Logs: 1, 2, 3
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Statements/async_function*", "async function*")}}
- [Các giao thức iteration](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
