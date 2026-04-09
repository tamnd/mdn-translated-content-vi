---
title: "AudioDecoder: thuộc tính decodeQueueSize"
short-title: decodeQueueSize
slug: Web/API/AudioDecoder/decodeQueueSize
page-type: web-api-instance-property
browser-compat: api.AudioDecoder.decodeQueueSize
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`decodeQueueSize`** của giao diện {{domxref("AudioDecoder")}} trả về số lượng yêu cầu giải mã đang chờ trong hàng đợi.

## Giá trị

Một số nguyên chứa số lượng yêu cầu.

## Ví dụ

Ví dụ sau in kích thước của hàng đợi ra bảng điều khiển.

```js
console.log(AudioDecoder.decodeQueueSize);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
