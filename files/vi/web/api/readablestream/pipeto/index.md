---
title: "ReadableStream: phương thức pipeTo()"
short-title: pipeTo()
slug: Web/API/ReadableStream/pipeTo
page-type: web-api-instance-method
browser-compat: api.ReadableStream.pipeTo
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`pipeTo()`** của giao diện {{domxref("ReadableStream")}} chuyển `ReadableStream` hiện tại tới {{domxref("WritableStream")}} nhất định và trả về {{jsxref("Promise")}} đáp ứng khi quá trình đường ống hoàn tất thành công hoặc từ chối nếu gặp bất kỳ lỗi nào.

Việc truyền một luồng thường sẽ [khóa](/en-US/docs/Web/API/ReadableStream/locked) trong suốt thời gian của luồng, ngăn không cho các trình đọc khác khóa luồng đó.

## Cú pháp

```js-nolint
pipeTo(destination)
pipeTo(destination, options)
```

### Parameters

- `destination`
  - : A {{domxref("WritableStream")}} that acts as the final destination for the {{domxref("ReadableStream")}}.

- `options` {{optional_inline}}
  - : The options that should be used when piping to the `writable` stream.
    Available options are:
    - `preventClose`
      - : If this is set to `true`, the source `Rea dableStream` closing will no longer cause the destination `WritableStream` to be closed.
        The method will return a fulfilled promise once this process completes, unless an error is encountered while closing the destination in which case it will be rejected with that error.
    - `preventAbort`
      - : If this is set to `true`, errors in the source `ReadableStream` will no longer abort the destination `WritableStream__ MDNPH27__preventCancel`
      - : If this is set to `true`, errors in the destination `WritableStream` will no longer cancel the source `ReadableStream`.
        In this case the method will return a promise rejected with the source's error, or with any error that occurs during canceling the source.
        In addition, if the destination writable stream starts out closed or closing, the source readable stream will no longer be canceled.
        In this case the method will return a promise rejected with an error indicating piping to a closed stream failed, or with any error that occurs during canceling the source.
    - `signal`
      - : If set to an [`AbortSigna l`](/en-US/docs/Web/API/AbortSignal) object, ongoing pipe operations can then be aborted via the corresponding [`AbortController`](/en-US/docs/Web/API/AbortController).

### Return value

A {{jsxref("Promise")}} that resolves when the piping process has completed.

### Exceptions

- {{jsxref("TypeError")}}
  - : The `writableStream` and/or `readableStream` objects are not a writable stream/readable stream, or one or both of the streams are locked.

## Examples

```js
// Fetch the original image
fetch("png-logo.png")
  // Retrieve its body as ReadableStream
  .then((response) => response.body)
  .then((body) => body.pipeThrough(new PNGTransformStream()))
  .then((rs) => rs.pipeTo(new FinalDestinationStream()));
```

The same example, but using {{jsxref("Operators/await", "await")}}:

```js
(async () => {
  // Fetch the original image
  const response = await fetch("png-logo.png");
  // Retrieve its body as ReadableStream
  await response.body
    .pipeThrough(new PNGTransformStream())
    .pipeTo(new FinalDestinationStream());
})();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- hàm tạo {{domxref("ReadableStream.ReadableStream", "ReadableStream()")}}

- [Chuỗi ống](/en-US/docs/Web/API/Streams_API/Using_readable_streams#pipe_chains)
