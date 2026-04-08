---
title: Symbol.asyncIterator
short-title: asyncIterator
slug: Web/JavaScript/Reference/Global_Objects/Symbol/asyncIterator
page-type: javascript-static-data-property
browser-compat: javascript.builtins.Symbol.asyncIterator
sidebar: jsref
---

Thuộc tính dữ liệu tĩnh **`Symbol.asyncIterator`** đại diện cho [well-known symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol#well-known_symbols) `Symbol.asyncIterator`. [Giao thức async iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) tra cứu symbol này cho phương thức trả về async iterator cho một đối tượng. Để một đối tượng có thể là async iterable, nó phải có khóa `[Symbol.asyncIterator]`.

{{InteractiveExample("JavaScript Demo: Symbol.asyncIterator", "taller")}}

```js interactive-example
const delayedResponses = {
  delays: [500, 1300, 3500],

  wait(delay) {
    return new Promise((resolve) => {
      setTimeout(resolve, delay);
    });
  },

  async *[Symbol.asyncIterator]() {
    for (const delay of this.delays) {
      await this.wait(delay);
      yield `Delayed response for ${delay} milliseconds`;
    }
  },
};

(async () => {
  for await (const response of delayedResponses) {
    console.log(response);
  }
})();

// Expected output: "Delayed response for 500 milliseconds"
// Expected output: "Delayed response for 1300 milliseconds"
// Expected output: "Delayed response for 3500 milliseconds"
```

## Giá trị

Well-known symbol `Symbol.asyncIterator`.

{{js_property_attributes(0, 0, 0)}}

## Ví dụ

### Async iterable do người dùng định nghĩa

Bạn có thể định nghĩa async iterable của riêng mình bằng cách đặt thuộc tính `[Symbol.asyncIterator]()` trên một đối tượng.

```js
const myAsyncIterable = {
  async *[Symbol.asyncIterator]() {
    yield "hello";
    yield "async";
    yield "iteration!";
  },
};

(async () => {
  for await (const x of myAsyncIterable) {
    console.log(x);
  }
})();
// Logs:
// "hello"
// "async"
// "iteration!"
```

Khi tạo API, hãy nhớ rằng async iterable được thiết kế để đại diện cho thứ gì đó _có thể lặp lại_ — như một luồng dữ liệu hoặc danh sách —, không phải để thay thế hoàn toàn callback và event trong hầu hết các tình huống.

### Async iterable tích hợp sẵn

Không có đối tượng nào trong ngôn ngữ JavaScript cốt lõi là async iterable. Một số Web API, chẳng hạn như {{domxref("ReadableStream")}}, có phương thức `Symbol.asyncIterator` được thiết lập mặc định.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Giao thức lặp lại](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols)
- [for await...of](/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of)
