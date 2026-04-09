---
title: "AudioEncoder: phương thức flush()"
short-title: flush()
slug: Web/API/AudioEncoder/flush
page-type: web-api-instance-method
browser-compat: api.AudioEncoder.flush
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`flush()`** của giao diện {{domxref("AudioEncoder")}} trả về một Promise được giải quyết khi toàn bộ thông điệp đang chờ trong hàng đợi đã hoàn tất.

## Cú pháp

```js-nolint
flush()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với giá trị undefined.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu Promise bị từ chối vì {{domxref("AudioEncoder.state", "state")}} không phải là `"configured"`.

## Ví dụ

Ví dụ sau flush `AudioEncoder`.

```js
AudioEncoder.flush();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
