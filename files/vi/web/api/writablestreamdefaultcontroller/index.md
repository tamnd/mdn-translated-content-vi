---
title: WritableStreamDefaultController
slug: Web/API/WritableStreamDefaultController
page-type: web-api-interface
browser-compat: api.WritableStreamDefaultController
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Giao diện **`WritableStreamDefaultController`** của [Streams API](/en-US/docs/Web/API/Streams_API) đại diện cho một bộ điều khiển cho phép kiểm soát trạng thái của {{domxref("WritableStream")}}. Khi xây dựng một `WritableStream`, sink cơ bản được cung cấp một phiên bản `WritableStreamDefaultController` tương ứng để thao tác.

## Hàm khởi tạo

Không có. Các phiên bản `WritableStreamDefaultController` được tạo tự động trong quá trình xây dựng `WritableStream`.

## Thuộc tính phiên bản

- {{domxref("WritableStreamDefaultController.signal")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("AbortSignal")}} liên kết với bộ điều khiển.

## Phương thức phiên bản

- {{domxref("WritableStreamDefaultController.error()")}}
  - : Gây ra bất kỳ tương tác nào trong tương lai với luồng liên kết sẽ bị lỗi.

## Ví dụ

```js
const writableStream = new WritableStream({
  start(controller) {
    // do stuff with controller

    // error stream if necessary
    controller.error("My stream is broken");
  },
  write(chunk, controller) {
    // …
  },
  close(controller) {
    // …
  },
  abort(err) {
    // …
  },
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
