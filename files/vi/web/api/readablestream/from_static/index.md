---
title: "ReadableStream: phương thức tĩnh from()"
short-title: from()
slug: Web/API/ReadableStream/from_static
page-type: web-api-static-method
status:
  - experimental
browser-compat: api.ReadableStream.from_static
---

{{APIRef("Streams")}}{{AvailableInWorkers}}{{SeeCompatTable}}

Phương thức tĩnh **`ReadableStream.from()`** trả về {{domxref("ReadableStream")}} từ một đối tượng lặp có thể lặp hoặc không đồng bộ được cung cấp.

Phương thức này có thể được sử dụng để bao bọc các đối tượng có thể lặp lại và không đồng bộ dưới dạng các luồng có thể đọc được, bao gồm mảng, bộ, mảng lời hứa, trình tạo không đồng bộ, luồng `ReadableStreams`, Node.js `readable`, v.v.

## Cú pháp

```js-nolint
ReadableStream.from(anyIterable)
```

### Parameters

- `anyIterable`
  - : An [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) or [async iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols) object.

### Return value

A {{domxref("ReadableStream")}}.

### Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the passed parameter is not an iterable or async iterable (does not define the `[Symbol.iterator]()` or `[Symbol.asyncIterator]()` method).
    Also thrown if, during iteration, the result of the next step is not an object or is a promise that does not resolve to an object.

## Examples

### Convert an async iterator to a ReadableStream

This live example demonstrates how you can convert an async iterable to a `ReadableStream`, and then how this stream might be consumed.

#### HTML

The HTML is consists of single `<pre>` element, which is used for logging.

````html
<pre id="log"></pre>
``__MDNP H20__log()` function to write to the log HTML element. ```js const
logElement = document.getElementById("log"); function log(text) {
logElement.innerText += `${text}\n`; }
````

It then checks if the static method is supported, and if not, logs the result.

```js
if (!ReadableStream.from) {
  log("ReadableStream.from() is not supported");
}
```

The async iterable is an anonymous generator function that yields the values of 1, 2 and 3 when it is called three times.
This is passed to `ReadableStream.from()` to create the `ReadableStream`.

```js
// Define an asynchronous iterator
const asyncIterator = (async function* () {
  yield 1;
  yield 2;
  yield 3;
})();

// Create ReadableStream from iterator
const myReadableStream = ReadableStream.from(asyncIterator);
```

[Using readable streams](/en-US/docs/Web/API/Streams_API/Using_readable_streams) demonstrates several ways to consume a stream.
The code below uses a `for ...await` loop, as this method is the simplest.
Each iteration of the loop logs the current chunk from the stream.

```js
consumeStream(myReadableStream);

// Iterate a ReadableStream asynchronously
async function consumeStream(readableStream) {
  for await (const chunk of readableStream) {
    // Do something with each chunk
    // Here we just log the values
    log(`chunk: ${chunk`);
  }
}
```

#### Result

The output of consuming the stream is shown below (if `ReadableStream.from()` is supported).

{{EmbedLiveSample("Convert an async iterator to a ReadableStream","100%", "80")}}

### Convert an Array to a ReadableStream

This example demonstrates how you can convert an `Array` to a `ReadableStream`.

```html hidden
<pre id="log"></pre>
```

```js hidden
const logElement = document.getElementById("log");
function log(text) {
  logElement.innerText += `${text}\n`;
}

if (!ReadableStream.from) {
  log("ReadableStream.from() is not supported");
}
```

#### JavaScript

The iterable is just an array of strings that is passed to `ReadableStream.from()` to create the `ReadableStream`.

```js
// An Array of vegetable names
const vegetables = ["Carrot", "Broccoli", "Tomato", "Spinach"];

// Create ReadableStream from the Array
const myReadableStream = ReadableStream.from(vegetables);
```

```js hidden
consumeStream(myReadableStream);

// Iterate a ReadableStream asynchronously
async function consumeStream(readableStream) {
  for await (const chunk of readableStream) {
    // Do something with each chunk
    // Here we just log the values
    log(`chunk: ${chunk}`);
  }
}
```

Chúng tôi sử dụng cách tiếp cận tương tự như trong nhật ký ví dụ trước và để sử dụng luồng, vì vậy điều đó không được hiển thị ở đây.

#### Kết quả

Đầu ra được hiển thị dưới đây.

{{EmbedLiveSample("Convert an Array to a ReadableStream","100%", "100")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ReadableStream")}}
- [Sử dụng các luồng có thể đọc được](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
