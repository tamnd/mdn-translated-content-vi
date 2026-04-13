---
title: "EncodedVideoChunk: timestamp property"
short-title: timestamp
slug: Web/API/EncodedVideoChunk/timestamp
page-type: web-api-instance-property
browser-compat: api.EncodedVideoChunk.timestamp
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`timestamp`** của giao diện {{domxref("EncodedVideoChunk")}} trả về một số nguyên cho biết timestamp của video tính bằng micro giây.

## Giá trị

Một số nguyên.

## Ví dụ

Trong ví dụ dưới đây, `timestamp` được in ra console.

```js
const init = {
  type: "key",
  data: videoBuffer,
  timestamp: 23000000,
  duration: 2000000,
};
const chunk = new EncodedVideoChunk(init);
console.log(chunk.timestamp); // 23000000
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
