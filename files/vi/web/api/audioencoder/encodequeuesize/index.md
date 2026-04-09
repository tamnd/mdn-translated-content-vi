---
title: "AudioEncoder: thuộc tính encodeQueueSize"
short-title: encodeQueueSize
slug: Web/API/AudioEncoder/encodeQueueSize
page-type: web-api-instance-property
browser-compat: api.AudioEncoder.encodeQueueSize
---

{{securecontext_header}}{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Thuộc tính chỉ đọc **`encodeQueueSize`** của giao diện {{domxref("AudioEncoder")}} trả về số lượng yêu cầu mã hóa đang chờ trong hàng đợi.

## Giá trị

Một số nguyên chứa số lượng yêu cầu.

## Ví dụ

Ví dụ sau in kích thước của hàng đợi ra console.

```js
console.log(AudioEncoder.encodeQueueSize);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
