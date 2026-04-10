---
title: "AudioContext: thuộc tính outputLatency"
short-title: outputLatency
slug: Web/API/AudioContext/outputLatency
page-type: web-api-instance-property
browser-compat: api.AudioContext.outputLatency
---

{{APIRef("Web Audio API")}}

Thuộc tính chỉ đọc **`outputLatency`** của giao diện {{domxref("AudioContext")}} cung cấp giá trị ước tính của độ trễ đầu ra của ngữ cảnh âm thanh hiện tại.

Đây là khoảng thời gian, tính bằng giây, giữa lúc trình duyệt chuyển một bộ đệm âm thanh từ đồ thị âm thanh sang hệ thống con âm thanh của hệ thống máy chủ để phát, và thời điểm mẫu đầu tiên trong bộ đệm thực sự được thiết bị đầu ra âm thanh xử lý.

Giá trị này thay đổi tùy theo nền tảng và phần cứng hiện có.

## Giá trị

Một số thực double biểu diễn độ trễ đầu ra theo giây.

## Ví dụ

```js
const audioCtx = new AudioContext();
console.log(audioCtx.outputLatency);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
