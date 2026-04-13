---
title: "AudioEncoder: phương thức encode()"
short-title: encode()
slug: Web/API/AudioEncoder/encode
page-type: web-api-instance-method
browser-compat: api.AudioEncoder.encode
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`encode()`** của giao diện {{domxref("AudioEncoder")}} đưa một thông điệp điều khiển vào hàng đợi để mã hóa một đối tượng {{domxref("AudioData")}} được cung cấp.

## Cú pháp

```js-nolint
encode(data)
```

### Tham số

- `data`
  - : Một đối tượng {{domxref("AudioData")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("AudioEncoder.state", "state")}} không phải là `"configured"`.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu đối tượng `AudioData` đã được [chuyển giao](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

## Ví dụ

Trong ví dụ sau, `encode` được truyền vào một đối tượng `AudioData`.

```js
encoder.encode(data);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
