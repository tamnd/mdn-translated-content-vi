---
title: "VideoDecoder: phương thức flush()"
short-title: flush()
slug: Web/API/VideoDecoder/flush
page-type: web-api-instance-method
browser-compat: api.VideoDecoder.flush
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`flush()`** của giao diện {{domxref("VideoDecoder")}} trả về một Promise được giải quyết khi tất cả các thông điệp đang chờ trong hàng đợi đã hoàn thành.

## Cú pháp

```js-nolint
flush()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với undefined.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu Promise bị từ chối vì {{domxref("VideoDecoder.state","state")}} không phải là `configured`.

## Ví dụ

Ví dụ sau đây xả hàng đợi của `VideoDecoder`.

```js
VideoDecoder.flush();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
