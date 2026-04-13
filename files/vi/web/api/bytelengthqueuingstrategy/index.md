---
title: ByteLengthQueuingStrategy
slug: Web/API/ByteLengthQueuingStrategy
page-type: web-api-interface
browser-compat: api.ByteLengthQueuingStrategy
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Giao diện **`ByteLengthQueuingStrategy`** của [Streams API](/en-US/docs/Web/API/Streams_API) cung cấp một chiến lược xếp hàng theo độ dài byte dựng sẵn, có thể được dùng khi khởi tạo stream.

## Bộ khởi tạo

- {{domxref("ByteLengthQueuingStrategy.ByteLengthQueuingStrategy", "ByteLengthQueuingStrategy()")}}
  - : Tạo một thể hiện đối tượng `ByteLengthQueuingStrategy` mới.

## Thuộc tính thể hiện

- {{domxref("ByteLengthQueuingStrategy.highWaterMark")}} {{ReadOnlyInline}}
  - : Tổng số byte có thể được chứa trong hàng đợi nội bộ trước khi [backpressure](/en-US/docs/Web/API/Streams_API/Concepts#backpressure) được áp dụng.

## Phương thức thể hiện

- {{domxref("ByteLengthQueuingStrategy.size()")}}
  - : Trả về thuộc tính `byteLength` của chunk đã cho.

## Ví dụ

```js
const queueingStrategy = new ByteLengthQueuingStrategy({ highWaterMark: 1024 });

const readableStream = new ReadableStream(
  {
    start(controller) {
      // …
    },
    pull(controller) {
      // …
    },
    cancel(err) {
      console.log("stream error:", err);
    },
  },
  queueingStrategy,
);

const size = queueingStrategy.size(chunk);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Streams API", "Streams API", "", "nocode")}}
- [Hàng đợi nội bộ và chiến lược xếp hàng](/en-US/docs/Web/API/Streams_API/Concepts#internal_queues_and_queuing_strategies)
- Bộ khởi tạo {{domxref("ByteLengthQueuingStrategy.ByteLengthQueuingStrategy", "ByteLengthQueuingStrategy()")}}
