---
title: "EncodedVideoChunk: copyTo() method"
short-title: copyTo()
slug: Web/API/EncodedVideoChunk/copyTo
page-type: web-api-instance-method
browser-compat: api.EncodedVideoChunk.copyTo
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`copyTo()`** của giao diện {{domxref("EncodedVideoChunk")}} sao chép chunk dữ liệu video đã mã hóa.

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

Trong ví dụ dưới đây, một {{domxref("EncodedVideoChunk")}} được tạo rồi sao chép.

```js
const init = {
  type: "key",
  data: videoBuffer,
  timestamp: 23000000,
  duration: 2000000,
};
const chunk = new EncodedVideoChunk(init);

chunk.copyTo(newBuffer);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
