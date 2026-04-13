---
title: Sử dụng luồng có thể ghi
slug: Web/API/Streams_API/Using_writable_streams
page-type: guide
---

{{DefaultAPISidebar("Streams")}}

Là một nhà phát triển JavaScript, việc ghi dữ liệu vào luồng theo chương trình là rất hữu ích! Bài viết này giải thích chức năng ghi luồng của [Streams API](/en-US/docs/Web/API/Streams_API).

> [!LƯU Ý]
> Bài viết này giả định rằng bạn hiểu các trường hợp sử dụng của luồng có thể ghi và nhận thức được các khái niệm cấp cao.
> Nếu không, chúng tôi khuyên bạn trước tiên nên đọc bài viết [Khái niệm về luồng và tổng quan về cách sử dụng](/en-US/docs/Web/API/Streams_API#concepts_and_usage) và [Khái niệm về luồng API](/en-US/docs/Web/API/Streams_API/Concepts), sau đó quay lại.

> [!LƯU Ý]
> Nếu bạn đang tìm kiếm thông tin về các luồng có thể đọc được, hãy thử [Sử dụng các luồng có thể đọc được](/en-US/docs/Web/API/Streams_API/Using_readable_streams) và [Sử dụng các luồng byte có thể đọc được](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams).

## Giới thiệu một ví dụ

Trong kho lưu trữ [dom-examples/streams](https://github.com/mdn/dom-examples/tree/main/streams) của chúng tôi, bạn sẽ tìm thấy [Ví dụ về người viết đơn giản](https://github.com/mdn/dom-examples/blob/main/streams/simple-writer/index.html) ([xem trực tiếp](https://mdn.github.io/dom-examples/streams/simple-writer/)). Thao tác này nhận một thông báo nhất định và ghi nó vào một luồng có thể ghi, hiển thị từng đoạn trên giao diện người dùng khi nó được ghi vào luồng và cũng hiển thị toàn bộ thông báo trên giao diện người dùng khi quá trình viết hoàn tất.

## Cách hoạt động của các luồng có thể ghi

Hãy xem cách hoạt động của chức năng luồng có thể ghi trong bản demo của chúng tôi.

### Xây dựng luồng có thể ghi

Để tạo luồng có thể ghi, chúng tôi sử dụng hàm tạo {{domxref("WritableStream.WritableStream","WritableStream()")}}; Cú pháp thoạt nhìn có vẻ phức tạp nhưng thực ra không quá tệ.

Bộ xương cú pháp trông như thế này:

```js
const stream = new WritableStream(
  {
    start(controller) {},
    write(chunk, controller) {},
    close(controller) {},
    abort(reason) {},
  },
  {
    highWaterMark: 3,
    size: () => 1,
  },
);
```

The constructor takes two objects as parameters. The first object is required, and creates a model in JavaScript of the underlying sink the data is being written to. The second object is optional, and allows you to specify a [custom queueing strategy](/en-US/docs/Web/API/Streams_API/Concepts#internal_queues_and_queuing_strategies) to use for your stream, which takes the form of an instance of {{domxref("ByteLengthQueuingStrategy")}} or {{domxref("CountQueuingStrategy")}}.

The first object can contain up to four members, all of which are optional:

1. `start(bộ điều khiển)` — A method that is called once, immediately after the {{domxref("WritableStream")}} is constructed. Inside this method, you should include code that sets up the stream functionality, e.g., getting access to the underlying sink.
2. `write(chunk,bộ điều khiển)` — A method that is called repeatedly every time a new chunk is ready to be written to the underlying sink (specified in the `chunk` parameter).
3. `đóng(bộ điều khiển)` — A method that is called if the app signals that it has finished writing chunks to the stream. It should do whatever is necessary to finalize writes to the underlying sink, and release access to it.
4. `abort(lý do)` — A method that will be called if the app signals that it wishes to abruptly close the stream and put it in an errored state.

The constructor call in our example looks like this:

```js
const decoder = new TextDecoder("utf-8");
const queuingStrategy = new CountQueuingStrategy({ highWaterMark: 1 });
let result = "";
const writableStream = new WritableStream(
  {
    // Implement the sink
    write(chunk) {
      return new Promise((resolve, reject) => {
        const buffer = new ArrayBuffer(1);
        const view = new Uint8Array(buffer);
        view[0] = chunk;
        const decoded = decoder.decode(view, { stream: true });
        const listItem = document.createElement("li");
        listItem.textContent = `Đã giải mã đoạn: ${decoded`;
        list.appendChild(listItem);
        result += decoded;
        resolve();
      });
    },
    close() {
      const listItem = document.createElement("li");
      listItem.textContent = `[TIN NHẮN NHẬN] ${result`;
      list.appendChild(listItem);
    },
    abort(err) {
      console.error("Sink error:", err);
    },
  },
  queuingStrategy,
);
```

- The `write()` method contains a promise including code that decodes each written chunk into a format that can be written to the UI. This is called when each chunk is actually written (see the next section).
- The `close()` method is called automatically when writing has finished — it prints the entire decoded result to the UI in one string.
- The `abort()` method prints an error to the console if the stream is aborted.

### Writing

To actually write content to the stream we call the `sendMessage()` function, passing it a message to be written and the stream to write to:

```js
sendMessage("Hello, world.", writableStream);
```

The `s endMessage()` definition looks like so:

```js
function sendMessage(message, writableStream) {
  // defaultWriter is of type WritableStreamDefaultWriter
  const defaultWriter = writableStream.getWriter();
  const encoder = new TextEncoder();
  const encoded = encoder.encode(message);
  encoded.forEach((chunk) => {
    defaultWriter.ready
      .then(() => defaultWriter.write(chunk))
      .then(() => console.log("Chunk written to sink."))
      .catch((err) => console.error("Chunk error:", err));
  });
  // Call ready again to ensure that all chunks are written
  //   before closing the writer.
  defaultWriter.ready
    .then(() => defaultWriter.close())
    .then(() => console.log("All chunks written"))
    .catch((err) => console.error("Stream error:", err));
}
```

So here we create a writer to write the chunks to the stream using {{domxref("WritableStream.getWriter()")}}. This creates a {{domxref("WritableStreamDefaultWriter")}} instance.

We also create a new {{domxref("TextEncoder")}} instance using the relevant constructor to encode the message into chunks to be put into the stream.

With the chunks encoded, we then call [`forEach()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray/forEach) on the resulting array. Inside this block we use {{domxref("WritableStreamDefaultWriter.ready")}} to check whether the writer is ready to have another chunk written to it. `ready` returns a promise that fulfills when this is the case, inside of which we call {{domxref("WritableStreamDefaultWriter.write()")}} to actually write the chunk to the stream. This also triggers the `write()` method specified inside the `WritableStream()` constructor, as discussed above.

After the chunks have all been written, we then perform the `ready__ MDNPH38__ready` check fulfills, we invoke {{domxref("WritableStreamDefaultWriter.close()")}} to close the stream. This also triggers the `close()` method specified inside the `WritableStream()` constructor, as discussed above.

### Controllers

As you'll have noticed when studying the `WritableStream()` syntax skeleton, the `start()`, `write()`, and `close()` methods can optionally have a `controller` parameter passed to them. This contains an instance of the {{domxref("WritableStreamDefaultController")}} interface, which can be used by the developer to further control the stream as required.

This currently only has one method available on it — {{domxref("WritableStreamDefaultController.error()")}}, which when invoked causes future interactions with the stream to error. This is useful when another part of an app goes wrong, and you want to propagate the error to the stream so that the whole system fails cleanly, rather than risking garbage being silently written to the stream (or something similarly bad).

### Closing and aborting

As mentioned above, we call the `close()` method when the writing is finished, which triggers the `close()` method specified inside the `WritableStream()` constructor.

We could also abort the stream by calling {{domxref("WritableStreamDefaultWriter.abort()")}}.

The difference is that when close is called, any previously enqueued chunks are written and finished with before the stream is closed.

When abort is called, any previously enqueued chunks are just thrown away immediately and then the stream is moved to an errored state. This also triggers any `abort()` method specified in the `WritableStream()` hàm tạo được gọi.
