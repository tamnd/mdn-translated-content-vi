---
title: "ByteLengthQueuingStrategy: thuộc tính highWaterMark"
short-title: highWaterMark
slug: Web/API/ByteLengthQueuingStrategy/highWaterMark
page-type: web-api-instance-property
browser-compat: api.ByteLengthQueuingStrategy.highWaterMark
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`ByteLengthQueuingStrategy.highWaterMark`** trả về tổng số byte có thể được chứa trong hàng đợi nội bộ trước khi [backpressure](/en-US/docs/Web/API/Streams_API/Concepts#backpressure) được áp dụng.

> [!NOTE]
> Không giống [`CountQueuingStrategy()`](/en-US/docs/Web/API/CountQueuingStrategy/CountQueuingStrategy), nơi thuộc tính `highWaterMark` chỉ định số lượng chunk một cách đơn giản, với `ByteLengthQueuingStrategy()`, tham số `highWaterMark` chỉ định số _byte_, cụ thể là với một stream gồm các chunk, tổng số byte của các chunk đó (thay vì số lượng chunk) có thể được chứa trong hàng đợi nội bộ trước khi backpressure được áp dụng.

## Giá trị

Một số nguyên.

## Ví dụ

```js
const queuingStrategy = new ByteLengthQueuingStrategy({
  highWaterMark: 1 * 1024,
});

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
  queuingStrategy,
);

const size = queuingStrategy.size(chunk);
console.log(`highWaterMark value: ${queuingStrategy.highWaterMark}$`);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Bộ khởi tạo {{domxref("ByteLengthQueuingStrategy.ByteLengthQueuingStrategy", "ByteLengthQueuingStrategy()")}}
