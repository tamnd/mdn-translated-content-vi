---
title: "VideoDecoder: thuộc tính state"
short-title: state
slug: Web/API/VideoDecoder/state
page-type: web-api-instance-property
browser-compat: api.VideoDecoder.state
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính **`state`** của giao diện {{domxref("VideoDecoder")}} trả về trạng thái hiện tại của codec bên dưới.

## Giá trị

Một chuỗi chứa một trong các giá trị sau:

- `"unconfigured"`
  - : Codec chưa được cấu hình để giải mã.
- `"configured"`
  - : Codec có cấu hình hợp lệ và đã sẵn sàng.
- `"closed"`
  - : Codec không còn có thể sử dụng được và tài nguyên hệ thống đã được giải phóng.

## Ví dụ

Ví dụ sau đây in trạng thái của `VideoDecoder` ra console.

```js
console.log(VideoDecoder.state);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
