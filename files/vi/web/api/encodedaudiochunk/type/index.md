---
title: "EncodedAudioChunk: type property"
short-title: type
slug: Web/API/EncodedAudioChunk/type
page-type: web-api-instance-property
browser-compat: api.EncodedAudioChunk.type
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`type`** của giao diện {{domxref("EncodedAudioChunk")}} trả về một giá trị cho biết liệu audio chunk có phải là key chunk, không phụ thuộc vào các frame khác để giải mã.

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
  data: audioBuffer,
  timestamp: 23000000,
  duration: 2000000,
};
const chunk = new EncodedAudioChunk(init);

console.log(chunk.type); // "key"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
