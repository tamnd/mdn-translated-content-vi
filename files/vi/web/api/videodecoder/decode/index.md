---
title: "VideoDecoder: phương thức decode()"
short-title: decode()
slug: Web/API/VideoDecoder/decode
page-type: web-api-instance-method
browser-compat: api.VideoDecoder.decode
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`decode()`** của giao diện {{domxref("VideoDecoder")}} thêm một thông điệp điều khiển vào hàng đợi để giải mã một đoạn video nhất định.

## Cú pháp

```js-nolint
decode(chunk)
```

### Tham số

- `chunk`
  - : Một đối tượng {{domxref("EncodedVideoChunk")}} biểu thị một đoạn video đã được mã hóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu {{domxref("VideoDecoder.state","state")}} không phải là `configured`.
- `DataError` {{domxref("DOMException")}}
  - : Ném ra nếu `chunk` không thể được giải mã do phụ thuộc vào các khung khác để giải mã.

## Ví dụ

Ví dụ sau đây minh họa cách sử dụng phương thức `decode()` để giải mã các đối tượng {{domxref("EncodedVideoChunk")}} được tạo từ dữ liệu video đã mã hóa.

```js
const responses = await downloadVideoChunksFromServer(timestamp);
for (const response of responses) {
  const chunk = new EncodedVideoChunk({
    timestamp: response.timestamp,
    type: response.key ? "key" : "delta",
    data: new Uint8Array(response.body),
  });
  decoder.decode(chunk);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
