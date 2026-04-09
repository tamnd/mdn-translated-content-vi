---
title: "AudioDecoder: phương thức reset()"
short-title: reset()
slug: Web/API/AudioDecoder/reset
page-type: web-api-instance-method
browser-compat: api.AudioDecoder.reset
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`reset()`** của giao diện {{domxref("AudioDecoder")}} đặt lại mọi trạng thái, bao gồm cấu hình, các thông điệp điều khiển trong hàng đợi thông điệp điều khiển và mọi callback đang chờ.

## Cú pháp

```js-nolint
reset()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau đặt lại `AudioDecoder`.

```js
AudioDecoder.reset();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
