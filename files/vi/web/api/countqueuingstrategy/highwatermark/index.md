---
title: "CountQueuingStrategy: thuộc tính highWaterMark"
short-title: highWaterMark
slug: Web/API/CountQueuingStrategy/highWaterMark
page-type: web-api-instance-property
browser-compat: api.CountQueuingStrategy.highWaterMark
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`CountQueuingStrategy.highWaterMark`** trả về tổng số chunk có thể được chứa trong hàng đợi nội bộ trước khi backpressure được áp dụng.

## Giá trị

Một số nguyên biểu thị số lượng chunk.

## Ví dụ

```js
const queuingStrategy = new CountQueuingStrategy({ highWaterMark: 1 });

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

- Bộ khởi tạo {{domxref("CountQueuingStrategy.CountQueuingStrategy", "CountQueuingStrategy()")}}
