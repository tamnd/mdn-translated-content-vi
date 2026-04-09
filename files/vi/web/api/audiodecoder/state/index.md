---
title: "AudioDecoder: thuộc tính state"
short-title: state
slug: Web/API/AudioDecoder/state
page-type: web-api-instance-property
browser-compat: api.AudioDecoder.state
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`state`** của giao diện {{domxref("AudioDecoder")}} trả về trạng thái hiện tại của codec nền tảng.

## Giá trị

Một chuỗi chứa một trong các giá trị sau:

- `"unconfigured"`
  - : Codec chưa được cấu hình để giải mã.
- `"configured"`
  - : Codec có cấu hình hợp lệ và đã sẵn sàng.
- `"closed"`
  - : Codec không còn dùng được nữa và tài nguyên hệ thống đã được giải phóng.

## Ví dụ

Ví dụ sau in trạng thái của `AudioDecoder` ra bảng điều khiển.

```js
console.log(AudioDecoder.state);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
