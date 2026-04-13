---
title: "VideoEncoder: close() method"
short-title: close()
slug: Web/API/VideoEncoder/close
page-type: web-api-instance-method
browser-compat: api.VideoEncoder.close
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`close()`** của giao diện {{domxref("VideoEncoder")}} kết thúc tất cả công việc đang chờ và giải phóng tài nguyên hệ thống.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau đóng `VideoEncoder`.

```js
VideoEncoder.close();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
