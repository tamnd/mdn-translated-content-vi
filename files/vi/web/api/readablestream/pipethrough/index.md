---
title: "ReadableStream: phương thức pipeThrough()"
short-title: pipeThrough()
slug: Web/API/ReadableStream/pipeThrough
page-type: web-api-instance-method
browser-compat: api.ReadableStream.pipeThrough
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`pipeThrough()`** của giao diện {{domxref("ReadableStream")}} cung cấp một cách có thể nối chuỗi để dẫn luồng hiện tại thông qua luồng biến đổi hoặc bất kỳ cặp có thể ghi/đọc được nào khác.

Việc truyền một luồng nói chung sẽ khóa luồng đó trong suốt thời gian của luồng, ngăn không cho các trình đọc khác khóa luồng đó.

## Cú pháp

```js-nolint
pipeThrough(transformStream)
pipeThrough(transformStream, options)
```

### Parameters

- `transformStream`
  - : A {{domxref("TransformStream")}} (or an object with the structure `{có thể ghi, có thể đọc được_`) consisting of a readable stream and a writable stream working together to transform some data from one form to another.
    Data written to the `writable` stream can be read in some transformed state by the `readable` stream.
    For example, a {{domxref("TextDecoder")}}, has bytes written to it and strings read from it, while a video decoder has encoded bytes written to it and uncompressed video frames read from it.

- `options` {{optional_inline}}
  - : The options that should be used when piping to the `writable` stream.
    Available options are:
    - `preventClose`
      - : If this is set to `true`, closing the source `ReadableSt ream` will no longer cause the destination `WritableStream` to be closed.

    - `preventAbort`
      - : If this is set to `true`, errors in the source `ReadableStream` will no longer abort the destination `WritableStream`.

    - `ngăn chặnHủy__ MDNPH27__true`, errors in the destination `WritableStream` will no longer cancel the source `ReadableStream`.

    - `signal`
      - : If set to an [`AbortSignal`](/en-US/docs/Web/API/AbortSignal) object, ongoing pipe operations can then be aborted via the corresponding [`AbortController`](/en-US/docs/Web/API/AbortController).

### Return value

The readable side of the `transformStream`.

### Exceptions

- {{jsxref("TypeError")}}
  - : Thrown if the `writable` and/or `readable` property of `transformStream` are undefined.

## Examples

In the following example (see [Unpack chunks of a PNG](https://mdn.github.io/dom-examples/streams/png-transform-stream/) for the full code running live, and [png-transform-stream](https://github.com/mdn/dom-examples/tree/main/streams/png-transform-stream) for the source code), an image is fetched and its body retrieved as a {{domxref("ReadableStream")}}.

Next, we log the contents of the readable stream, use `pipeThrough()` to send it to a new function that creates a gray-scaled version of the stream, then log the new stream's contents too.

```js
// Fetch the original image
fetch("png-logo.png")
  // Retrieve its body as ReadableStream
  .then((response) => response.body)
  .then((rs) => logReadableStream("Fetch Response Stream", rs))
  // Create a gray-scaled PNG stream out of the original
  .then((body) => body.pipeThrough(new PNGTransformStream()))
  .then((rs) => logReadableStream("PNG Chunk Stream", rs));
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- hàm tạo {{domxref("ReadableStream.ReadableStream", "ReadableStream()")}}

- [Chuỗi ống](/en-US/docs/Web/API/Streams_API/Using_readable_streams#pipe_chains)
