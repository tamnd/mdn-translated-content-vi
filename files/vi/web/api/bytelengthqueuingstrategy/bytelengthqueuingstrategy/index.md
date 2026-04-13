---
title: "ByteLengthQueuingStrategy: bộ khởi tạo ByteLengthQueuingStrategy()"
short-title: ByteLengthQueuingStrategy()
slug: Web/API/ByteLengthQueuingStrategy/ByteLengthQueuingStrategy
page-type: web-api-constructor
browser-compat: api.ByteLengthQueuingStrategy.ByteLengthQueuingStrategy
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Bộ khởi tạo **`ByteLengthQueuingStrategy()`** tạo và trả về một thể hiện đối tượng `ByteLengthQueuingStrategy`.

## Cú pháp

```js-nolint
new ByteLengthQueuingStrategy(options)
```

### Tham số

- `options`
  - : Một đối tượng có thuộc tính sau:
    - `highWaterMark`
      - : Tổng số byte có thể được chứa trong hàng đợi nội bộ trước khi backpressure được áp dụng.

        Không giống [`CountQueuingStrategy()`](/en-US/docs/Web/API/CountQueuingStrategy/CountQueuingStrategy), nơi `highWaterMark` chỉ định số lượng chunk một cách đơn giản, với `ByteLengthQueuingStrategy()`, `highWaterMark` chỉ định số _byte_, cụ thể là với một stream gồm các chunk, tổng số byte của các chunk đó (thay vì số lượng chunk) có thể được chứa trong hàng đợi nội bộ trước khi backpressure được áp dụng.

### Giá trị trả về

Một thể hiện của đối tượng {{domxref("ByteLengthQueuingStrategy")}}.

### Ngoại lệ

Không có.

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
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("ByteLengthQueuingStrategy")}}
