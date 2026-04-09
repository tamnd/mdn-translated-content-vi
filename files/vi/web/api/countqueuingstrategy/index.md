---
title: CountQueuingStrategy
slug: Web/API/CountQueuingStrategy
page-type: web-api-interface
browser-compat: api.CountQueuingStrategy
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Giao diện **`CountQueuingStrategy`** của [Streams API](/en-US/docs/Web/API/Streams_API) cung cấp một chiến lược xếp hàng đếm chunk dựng sẵn, có thể được dùng khi khởi tạo stream.

## Bộ khởi tạo

- {{domxref("CountQueuingStrategy.CountQueuingStrategy", "CountQueuingStrategy()")}}
  - : Tạo một thể hiện đối tượng `CountQueuingStrategy` mới.

## Thuộc tính thể hiện

- {{domxref("CountQueuingStrategy.highWaterMark")}} {{ReadOnlyInline}}
  - : Tổng số chunk có thể được chứa trong hàng đợi nội bộ trước khi [backpressure](/en-US/docs/Web/API/Streams_API/Concepts#backpressure) được áp dụng.

## Phương thức thể hiện

- {{domxref("CountQueuingStrategy.size()")}}
  - : Luôn trả về `1`.

## Ví dụ

```js
const queueingStrategy = new CountQueuingStrategy({ highWaterMark: 1 });

const writableStream = new WritableStream(
  {
    // Implement the sink
    write(chunk) {
      // …
    },
    close() {
      // …
    },
    abort(err) {
      console.log("Sink error:", err);
    },
  },
  queueingStrategy,
);

const size = queueingStrategy.size();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Streams API", "Streams API", "", "nocode")}}
- Bộ khởi tạo {{domxref("CountQueuingStrategy.CountQueuingStrategy", "CountQueuingStrategy()")}}
- [Hàng đợi nội bộ và chiến lược xếp hàng](/en-US/docs/Web/API/Streams_API/Concepts#internal_queues_and_queuing_strategies)
