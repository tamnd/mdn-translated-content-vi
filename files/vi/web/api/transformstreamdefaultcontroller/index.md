---
title: TransformStreamDefaultController
slug: Web/API/TransformStreamDefaultController
page-type: web-api-interface
browser-compat: api.TransformStreamDefaultController
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Giao diện **`TransformStreamDefaultController`** của [Streams API](/en-US/docs/Web/API/Streams_API) cung cấp các phương thức để thao tác với {{domxref("ReadableStream")}} và {{domxref("WritableStream")}} liên quan.

Khi xây dựng một {{domxref("TransformStream")}}, `TransformStreamDefaultController` được tạo ra. Do đó nó không có hàm khởi tạo. Cách để lấy một phiên bản của `TransformStreamDefaultController` là qua các phương thức callback của {{domxref("TransformStream.TransformStream", "TransformStream()")}}.

## Thuộc tính phiên bản

- {{domxref("TransformStreamDefaultController.desiredSize")}} {{ReadOnlyInline}}
  - : Trả về kích thước mong muốn để lấp đầy hàng đợi nội bộ của phía có thể đọc của luồng.

## Phương thức phiên bản

- {{domxref("TransformStreamDefaultController.enqueue()")}}
  - : Xếp hàng một chunk (một mảnh dữ liệu đơn) vào phía có thể đọc của luồng.
- {{domxref("TransformStreamDefaultController.error()")}}
  - : Báo lỗi cả phía có thể đọc và phía có thể ghi của luồng transform.
- {{domxref("TransformStreamDefaultController.terminate()")}}
  - : Đóng phía có thể đọc và báo lỗi phía có thể ghi của luồng.

## Ví dụ

Trong ví dụ sau, một luồng transform chuyển qua tất cả các chunk mà nó nhận được dưới dạng giá trị {{jsxref("Uint8Array")}}, sử dụng các phương thức {{domxref("TransformStreamDefaultController.error()","error()")}} và {{domxref("TransformStreamDefaultController.enqueue()","enqueue()")}}.

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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
