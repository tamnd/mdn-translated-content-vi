---
title: "CountQueuingStrategy: phương thức size()"
short-title: size()
slug: Web/API/CountQueuingStrategy/size
page-type: web-api-instance-method
browser-compat: api.CountQueuingStrategy.size
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`size()`** của giao diện {{domxref("CountQueuingStrategy")}} luôn trả về `1`, để tổng kích thước hàng đợi là số lượng chunk trong hàng đợi.

## Cú pháp

```js-nolint
size()
```

### Tham số

Không có.

### Giá trị trả về

`1`.

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

- Bộ khởi tạo {{domxref("CountQueuingStrategy.CountQueuingStrategy", "CountQueuingStrategy()")}}
