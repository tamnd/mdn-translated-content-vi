---
title: "EncodedVideoChunk: byteLength property"
short-title: byteLength
slug: Web/API/EncodedVideoChunk/byteLength
page-type: web-api-instance-property
browser-compat: api.EncodedVideoChunk.byteLength
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`byteLength`** của giao diện {{domxref("EncodedVideoChunk")}} trả về độ dài tính bằng byte của dữ liệu video đã mã hóa.

## Giá trị

Một số nguyên.

## Ví dụ

Trong ví dụ dưới đây, `byteLength` được in ra console.

```js
const init = {
  type: "key",
  data: videoBuffer,
  timestamp: 23000000,
  duration: 2000000,
};
const chunk = new EncodedVideoChunk(init);

console.log(chunk.byteLength); // 352800
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
