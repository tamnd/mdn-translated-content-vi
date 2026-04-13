---
title: "AudioDecoder: phương thức decode()"
short-title: decode()
slug: Web/API/AudioDecoder/decode
page-type: web-api-instance-method
browser-compat: api.AudioDecoder.decode
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`decode()`** của giao diện {{domxref("AudioDecoder")}} đưa một thông điệp điều khiển vào hàng đợi để giải mã một đoạn âm thanh được cung cấp.

## Cú pháp

```js-nolint
decode(chunk)
```

### Tham số

- `chunk`
  - : Một đối tượng {{domxref("EncodedAudioChunk")}} biểu diễn một đoạn âm thanh đã được mã hóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("AudioDecoder.state","state")}} không phải là `"configured"`.
- `DataError` {{domxref("DOMException")}}
  - : Được ném ra nếu không thể giải mã `chunk` do nó phụ thuộc vào các khung khác để giải mã.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
