---
title: TransformStream
slug: Web/API/TransformStream
page-type: web-api-interface
browser-compat: api.TransformStream
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Giao diện **`TransformStream`** của [Streams API](/en-US/docs/Web/API/Streams_API) thể hiện cách triển khai cụ thể của khái niệm [pipe chain](/en-US/docs/Web/API/Streams_API/Concepts#pipe_chains) _transformstream_.

Nó có thể được chuyển đến phương thức {{domxref("ReadableStream.pipeThrough()")}} để chuyển đổi luồng dữ liệu từ định dạng này sang định dạng khác.
Ví dụ: nó có thể được sử dụng để giải mã (hoặc mã hóa) khung hình video, giải nén dữ liệu hoặc chuyển đổi luồng từ XML sang JSON.

Thuật toán chuyển đổi có thể được cung cấp dưới dạng đối số tùy chọn cho hàm tạo đối tượng.
Nếu không được cung cấp, dữ liệu sẽ không được sửa đổi khi truyền qua luồng.

`TransformStream` là một [đối tượng có thể chuyển nhượng](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

## Trình xây dựng

- {{domxref("TransformStream.TransformStream", "TransformStream()")}}
  - : Tạo và trả về một đối tượng luồng biến đổi, tùy ý chỉ định một đối tượng biến đổi và các chiến lược xếp hàng cho các luồng.

## Thuộc tính phiên bản

- {{domxref("TransformStream.readable")}} {{ReadOnlyInline}}
  - : Phần cuối `readable` của `TransformStream`.
- {{domxref("TransformStream.writable")}} {{ReadOnlyInline}}
  - : Phần cuối `writable` của `TransformStream`.

## Các phương thức thực thể

không có

## Ví dụ

### Luồng mọi thứ tới uint8array

Trong ví dụ sau, luồng biến đổi đi qua tất cả các đoạn mà nó nhận được dưới dạng giá trị {{jsxref("Uint8Array")}}.

```js
const transformContent = {
  start() {}, // required.
  async transform(chunk, controller) {
    chunk = await chunk;
    switch (typeof chunk) {
      case "object":
        // just say the stream is done I guess
        if (chunk === null) {
          controller.terminate();
        } else if (ArrayBuffer.isView(chunk)) {
          controller.enqueue(
            new Uint8Array(chunk.buffer, chunk.byteOffset, chunk.byteLength),
          );
        } else if (
          Array.isArray(chunk) &&
          chunk.every((value) => typeof value === "number")
        ) {
          controller.enqueue(new Uint8Array(chunk));
        } else if (
          typeof chunk.valueOf === "function" &&
          chunk.valueOf() !== chunk
        ) {
          this.transform(chunk.valueOf(), controller); // hack
        } else if ("toJSON" in chunk) {
          this.transform(JSON.stringify(chunk), controller);
        }
        break;
      case "symbol":
        controller.error("Cannot send a symbol as a chunk part");
        break;
      case "undefined":
        controller.error("Cannot send undefined as a chunk part");
        break;
      default:
        controller.enqueue(this.textencoder.encode(String(chunk)));
        break;
    }
  },
  flush() {
    /* do any destructor work here */
  },
};

class AnyToU8Stream extends TransformStream {
  constructor() {
    super({ ...transformContent, textencoder: new TextEncoder() });
  }
}
```

### Chaining multiple ReadableStreams together

This is a useful one, where multiple streams can be conjoined. Examples include building a PWA with progressive loading and progressive streaming.

```js
let responses = [
  /* conjoined response tree */
];
let { readable, writable } = new TransformStream();

responses.reduce(
  (a, res, i, arr) =>
    a.then(() => res.pipeTo(writable, { preventClose: i + 1 !== arr.length })),
  Promise.resolve(),
);
```

Lưu ý rằng điều này không có khả năng phục hồi trước những ảnh hưởng khác.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Streams—Hướng dẫn chính xác](https://web.dev/articles/streams)
