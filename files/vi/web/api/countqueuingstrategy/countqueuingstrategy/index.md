---
title: "CountQueuingStrategy: bộ khởi tạo CountQueuingStrategy()"
short-title: CountQueuingStrategy()
slug: Web/API/CountQueuingStrategy/CountQueuingStrategy
page-type: web-api-constructor
browser-compat: api.CountQueuingStrategy.CountQueuingStrategy
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Bộ khởi tạo **`CountQueuingStrategy()`** tạo và trả về một thể hiện đối tượng `CountQueuingStrategy`.

## Cú pháp

```js-nolint
new CountQueuingStrategy(options)
```

### Tham số

- `options`
  - : Một đối tượng có thuộc tính sau:
    - `highWaterMark`
      - : Tổng số chunk có thể được chứa trong hàng đợi nội bộ trước khi backpressure được áp dụng.

### Giá trị trả về

Một thể hiện của đối tượng {{domxref("CountQueuingStrategy")}}.

### Ngoại lệ

Không có.

## Ví dụ

```js
const queuingStrategy = new CountQueuingStrategy({ highWaterMark: 1 });

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
  queuingStrategy,
);

const size = queuingStrategy.size();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("CountQueuingStrategy")}}
