---
title: "ByteLengthQueuingStrategy: phương thức size()"
short-title: size()
slug: Web/API/ByteLengthQueuingStrategy/size
page-type: web-api-instance-method
browser-compat: api.ByteLengthQueuingStrategy.size
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`size()`** của giao diện {{domxref("ByteLengthQueuingStrategy")}} trả về thuộc tính `byteLength` của chunk đã cho.

## Cú pháp

```js-nolint
size(chunk)
```

### Tham số

- `chunk`
  - : Một chunk dữ liệu đang được truyền qua stream.

### Giá trị trả về

Một số nguyên biểu thị độ dài byte của chunk đã cho.

## Ví dụ

```js
const queuingStrategy = new ByteLengthQueuingStrategy({ highWaterMark: 1 });

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

- Bộ khởi tạo {{domxref("ByteLengthQueuingStrategy.ByteLengthQueuingStrategy", "ByteLengthQueuingStrategy()")}}
