---
title: "EncodedVideoChunk: type property"
short-title: type
slug: Web/API/EncodedVideoChunk/type
page-type: web-api-instance-property
browser-compat: api.EncodedVideoChunk.type
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("EncodedVideoChunk")}} trả về một giá trị cho biết liệu video chunk có phải là key chunk, không phụ thuộc vào các frame khác để giải mã.

## Giá trị

Một chuỗi, một trong:

- `"key"`
  - : Dữ liệu là key chunk.
- `"delta"`
  - : Dữ liệu không phải là key chunk.

## Ví dụ

Trong ví dụ dưới đây, `type` được in ra console.

```js
const init = {
  type: "key",
  data: videoBuffer,
  timestamp: 23000000,
  duration: 2000000,
};
const chunk = new EncodedVideoChunk(init);

console.log(chunk.type); // "key"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
