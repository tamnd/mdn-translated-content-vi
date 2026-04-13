---
title: "VideoDecoder: phương thức reset()"
short-title: reset()
slug: Web/API/VideoDecoder/reset
page-type: web-api-instance-method
browser-compat: api.VideoDecoder.reset
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Phương thức **`reset()`** của giao diện {{domxref("VideoDecoder")}} đặt lại tất cả các trạng thái bao gồm cấu hình, thông điệp điều khiển trong hàng đợi và tất cả các callback đang chờ.

## Cú pháp

```js-nolint
reset()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau đây đặt lại `VideoDecoder`.

```js
VideoDecoder.reset();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
