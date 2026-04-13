---
title: "VideoEncoder: thuộc tính encodeQueueSize"
short-title: encodeQueueSize
slug: Web/API/VideoEncoder/encodeQueueSize
page-type: web-api-instance-property
browser-compat: api.VideoEncoder.encodeQueueSize
---

{{APIRef("WebCodecs API")}}{{SecureContext_Header}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`encodeQueueSize`** của giao diện {{domxref("VideoEncoder")}} trả về số lượng yêu cầu mã hóa đang chờ trong hàng đợi.

## Giá trị

Một số nguyên chứa số lượng yêu cầu.

## Ví dụ

Ví dụ sau đây in kích thước hàng đợi ra console.

```js
console.log(VideoEncoder.encodeQueueSize);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
