---
title: "AudioDecoder: phương thức close()"
short-title: close()
slug: Web/API/AudioDecoder/close
page-type: web-api-instance-method
browser-compat: api.AudioDecoder.close
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`close()`** của giao diện {{domxref("AudioDecoder")}} kết thúc mọi công việc đang chờ và giải phóng tài nguyên hệ thống.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau đóng `AudioDecoder`.

```js
AudioDecoder.close();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
