---
title: "EncodedVideoChunk: duration property"
short-title: duration
slug: Web/API/EncodedVideoChunk/duration
page-type: web-api-instance-property
browser-compat: api.EncodedVideoChunk.duration
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`duration`** của giao diện {{domxref("EncodedVideoChunk")}} trả về một số nguyên cho biết thời lượng của video tính bằng micro giây.

## Giá trị

Một số nguyên.

## Ví dụ

Trong ví dụ dưới đây, `duration` được in ra console.

```js
const init = {
  type: "key",
  data: videoBuffer,
  timestamp: 23000000,
  duration: 2000000,
};
const chunk = new EncodedVideoChunk(init);

console.log(chunk.duration); // 2000000
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
