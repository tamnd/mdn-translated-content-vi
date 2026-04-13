---
title: "VideoEncoder: phương thức flush()"
short-title: flush()
slug: Web/API/VideoEncoder/flush
page-type: web-api-instance-method
browser-compat: api.VideoEncoder.flush
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`flush()`** của giao diện {{domxref("VideoEncoder")}} buộc tất cả các lần mã hóa đang chờ phải hoàn thành.

## Cú pháp

```js-nolint
flush()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết khi quá trình khởi tạo bộ mã hóa hoàn thành và tất cả các {{domxref("EncodedVideoChunk")}} đang chờ được trả về.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu Promise bị từ chối vì {{domxref("VideoEncoder.state","state")}} không phải là `configured`.

## Ví dụ

Ví dụ sau đây xả hàng đợi của `VideoEncoder`.

```js
VideoEncoder.flush();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
