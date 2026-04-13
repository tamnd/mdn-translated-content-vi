---
title: "EncodedAudioChunk: copyTo() method"
short-title: copyTo()
slug: Web/API/EncodedAudioChunk/copyTo
page-type: web-api-instance-method
browser-compat: api.EncodedAudioChunk.copyTo
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`copyTo()`** của giao diện {{domxref("EncodedAudioChunk")}} sao chép chunk dữ liệu âm thanh đã mã hóa.

## Cú pháp

```js-nolint
copyTo(destination)
```

### Tham số

- `destination`
  - : Một {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} mà dữ liệu có thể được sao chép vào.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Trong ví dụ dưới đây, một {{domxref("EncodedAudioChunk")}} được tạo rồi sao chép.

```js
const init = {
  type: "key",
  data: audioBuffer,
  timestamp: 23000000,
  duration: 2000000,
};
const chunk = new EncodedAudioChunk(init);

chunk.copyTo(newBuffer);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
