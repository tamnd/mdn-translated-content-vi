---
title: "AudioEncoder: thuộc tính state"
short-title: state
slug: Web/API/AudioEncoder/state
page-type: web-api-instance-property
browser-compat: api.AudioEncoder.state
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`state`** của giao diện {{domxref("AudioEncoder")}} trả về trạng thái hiện tại của codec nền tảng.

## Giá trị

Một chuỗi chứa một trong các giá trị sau:

- `"unconfigured"`
  - : Codec chưa được cấu hình để mã hóa.
- `"configured"`
  - : Codec có cấu hình hợp lệ và đã sẵn sàng.
- `"closed"`
  - : Codec không còn có thể sử dụng và tài nguyên hệ thống đã được giải phóng.

## Ví dụ

Ví dụ sau in trạng thái của `AudioEncoder` ra console.

```js
console.log(AudioEncoder.state);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
