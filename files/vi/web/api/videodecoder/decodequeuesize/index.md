---
title: "VideoDecoder: thuộc tính decodeQueueSize"
short-title: decodeQueueSize
slug: Web/API/VideoDecoder/decodeQueueSize
page-type: web-api-instance-property
browser-compat: api.VideoDecoder.decodeQueueSize
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`decodeQueueSize`** của giao diện {{domxref("VideoDecoder")}} trả về số lượng yêu cầu giải mã đang chờ trong hàng đợi.

## Giá trị

Một số nguyên chứa số lượng yêu cầu.

## Ví dụ

Ví dụ sau đây in kích thước hàng đợi ra console.

```js
console.log(VideoDecoder.decodeQueueSize);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
