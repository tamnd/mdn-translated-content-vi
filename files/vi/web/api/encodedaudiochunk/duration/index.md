---
title: "EncodedAudioChunk: duration property"
short-title: duration
slug: Web/API/EncodedAudioChunk/duration
page-type: web-api-instance-property
browser-compat: api.EncodedAudioChunk.duration
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`duration`** của giao diện {{domxref("EncodedAudioChunk")}} trả về một số nguyên cho biết thời lượng của âm thanh tính bằng micro giây.

## Giá trị

Một số nguyên.

## Ví dụ

Trong ví dụ dưới đây, `duration` được in ra console.

```js
const init = {
  type: "key",
  data: audioBuffer,
  timestamp: 23000000,
  duration: 2000000,
};
const chunk = new EncodedAudioChunk(init);

console.log(chunk.duration); // 2000000
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
