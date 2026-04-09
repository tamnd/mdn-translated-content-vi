---
title: "AudioEncoder: phương thức close()"
short-title: close()
slug: Web/API/AudioEncoder/close
page-type: web-api-instance-method
browser-compat: api.AudioEncoder.close
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`close()`** của giao diện {{domxref("AudioEncoder")}} kết thúc toàn bộ công việc đang chờ và giải phóng tài nguyên hệ thống.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau đóng `AudioEncoder`.

```js
AudioEncoder.close();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
