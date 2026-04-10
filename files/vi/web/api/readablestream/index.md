---
title: ReadableStream
slug: Web/API/ReadableStream
page-type: web-api-interface
browser-compat: api.ReadableStream
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Giao diện `ReadableStream` của [API luồng](/en-US/docs/Web/API/Streams_API) thể hiện luồng dữ liệu byte có thể đọc được. [API tìm nạp](/en-US/docs/Web/API/Fetch_API) cung cấp một phiên bản cụ thể của `ReadableStream` thông qua thuộc tính {{domxref("Response.body", "body")}} của đối tượng {{domxref("Response")}}.

`ReadableStream` là một [đối tượng có thể chuyển nhượng](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

## Trình xây dựng

- {{domxref("ReadableStream.ReadableStream", "ReadableStream()")}}
  - : Tạo và trả về một đối tượng luồng có thể đọc được từ các trình xử lý đã cho.

## Thuộc tính phiên bản

- {{domxref("ReadableStream.locked")}} {{ReadOnlyInline}}
  - : Trả về một boolean cho biết luồng có thể đọc được có bị khóa đối với trình đọc hay không.

## Phương thức tĩnh

- {{domxref("ReadableStream/from_static", "ReadableStream.from()")}} {{Experimental_Inline}}
  - : Trả về `ReadableStream` từ một đối tượng có thể lặp hoặc không đồng bộ được cung cấp, chẳng hạn như một mảng, một tập hợp, một trình tạo không đồng bộ, v.v.

## Các phương thức thực thể

- {{domxref("ReadableStream.cancel()")}}
  - : Trả về {{jsxref("Promise")}} giải quyết khi luồng bị hủy. Việc gọi phương thức này báo hiệu người tiêu dùng mất hứng thú với luồng. Đối số `reason` được cung cấp sẽ được cấp cho nguồn cơ bản, nguồn này có thể sử dụng hoặc không sử dụng nó.
- {{domxref("ReadableStream.getReader()")}}
  - : Tạo một trình đọc và khóa luồng vào nó. Trong khi luồng bị khóa, không thể lấy được trình đọc nào khác cho đến khi luồng này được phát hành.
- {{domxref("ReadableStream.pipeThrough()")}}
  - : Cung cấp một cách có thể nối chuỗi để truyền luồng hiện tại thông qua luồng biến đổi hoặc bất kỳ cặp có thể ghi/đọc được nào khác.
- {{domxref("ReadableStream.pipeTo()")}}
  - : Chuyển ReadableStream hiện tại sang {{domxref("WritableStream")}} nhất định và trả về {{jsxref("Promise")}} đáp ứng khi quá trình tạo đường dẫn hoàn tất thành công hoặc từ chối nếu gặp bất kỳ lỗi nào.
- {{domxref("ReadableStream.tee()")}}
  - : Phương thức `tee` [tees](https://streams.spec.whatwg.org/#tee-a-readable-stream) luồng có thể đọc được này, trả về một mảng hai phần tử chứa hai nhánh kết quả dưới dạng phiên bản `ReadableStream` mới. Mỗi luồng đó nhận được cùng một dữ liệu đến.

## Lặp lại không đồng bộ

`ReadableStream` triển khai [giao thức lặp không đồng bộ](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_async_iterator_and_async_iterable_protocols).
Điều này cho phép lặp lại không đồng bộ trên các đoạn trong luồng bằng cú pháp [`for await...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of) :

```js
const stream = new ReadableStream(getSomeSource());

for await (const chunk of stream) {
  // Do something with each 'chunk'
}
```

The async iterator consumes the stream until it runs out of data or otherwise terminates.
The loop can also exit early due to a `break`, `throw`, or `return` statement.

While iterating, the stream is locked to prevent other consumers from acquiring a reader (attempting to iterate over a stream that is already locked will throw a `TypeError`).
This lock is released when the loop exits.

By default, exiting the loop will also cancel the stream, so that it can no longer be used.
To continue to use a stream after exiting the loop, pass `{ preventCancel: true } to the stream's`values()` method:

```js
for await (const chunk of stream.values({ preventCancel: true })) {
  // Do something with 'chunk'
  break;
}
// Acquire a reader for the stream and continue reading ...
```

## Examples

### Fetch stream

In the following example, an artificial {{domxref("Response")}} is created to stream HTML fragments fetched from another resource to the browser.

It demonstrates the usage of a `ReadableStream` in combination with a {{jsxref("Uint8Array")}}.

```js
fetch("https://www.example.org")
  .then((response) => response.body)
  .then((rb) => {
    const reader = rb.getReader();

    return new ReadableStream({
      start(controller) {
        // The following function handles each data chunk
        function push() {
          // "done" is a Boolean and value a "Uint8Array"
          reader.read().then(({ done, value }) => {
            // If there is no more data to read
            if (done) {
              console.log("done", done);
              controller.close();
              return;
            }
            // Get the data and send it to the browser via the controller
            controller.enqueue(value);
            // Check chunks by logging to the console
            console.log(done, value);
            push();
          });
        }

        push();
      },
    });
  })
  .then((stream) =>
    // Respond with our stream
    new Response(stream, { headers: { "Content-Type": "text/html" } }).text(),
  )
  .then((result) => {
    // Do things with result
    console.log(result);
  });
```

### Convert an iterator or async iterator to a stream

The {{domxref("ReadableStream/from_static", "from()")}} static method can convert an iterator, such as an {{jsxref("Array")}} or {{jsxref("Map")}}, or an [(async) iterator](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators) to a readable stream:

````js
const myReadableStream = ReadableStream.from(iteratorOrAsyncIterator);
``_ _MDNPH46__from()` method you can instead create your own [custom readable stream](/en-US/docs/Web/API/Streams_API/Using_readable_streams#creating_your_own_custom_readable_stream) to achieve the same result:

```js
function iteratorToStream(iterator) {
  return new ReadableStream({
    async pull(controller) {
      const { value, done } = await iterator.next();

      if (value) {
        controller.enqueue(value);
      }
      if (done) {
        controller.close();
      }
    },
  });
}
````

> [!WARNING]
> This example assumes that the return value (`value` when `done` is `true`), if present, is also a chunk to be enqueued. Some iterator APIs may use the return value for different purposes. You may need to adjust the code based on the API you are interacting with.

### Async iteration of a stream using for await...of

This example shows how you can process the `fetch()` response using a [`for await...of`](/en-US/docs/Web/JavaScript/Reference/Statements/for-await...of) loop to iterate through the arriving chunks.

```js
const response = await fetch("https://www.example.org");
let total = 0;

// Iterate response.body (a ReadableStream) asynchronously
for await (const chunk of response.body) {
  // Do something with each chunk
  // Here we just accumulate the size of the response.
  total += chunk.length;
}

// Do something with the total
console.log(total);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Khái niệm API luồng](/en-US/docs/Web/API/Streams_API)
- [Sử dụng các luồng có thể đọc được](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
- [Sử dụng luồng byte có thể đọc được](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
- [Web-streams-polyfill](https://github.com/MattiasBuelens/web-streams-polyfill)
