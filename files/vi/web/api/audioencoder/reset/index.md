---
title: "AudioEncoder: phương thức reset()"
short-title: reset()
slug: Web/API/AudioEncoder/reset
page-type: web-api-instance-method
browser-compat: api.AudioEncoder.reset
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`reset()`** của giao diện {{domxref("AudioEncoder")}} đặt lại toàn bộ trạng thái, bao gồm cấu hình, các thông điệp điều khiển trong hàng đợi thông điệp điều khiển, và toàn bộ callback đang chờ.

## Cú pháp

```js-nolint
reset()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau đặt lại `AudioEncoder`.

```js
AudioEncoder.reset();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
