---
title: "AudioContext: thuộc tính baseLatency"
short-title: baseLatency
slug: Web/API/AudioContext/baseLatency
page-type: web-api-instance-property
browser-compat: api.AudioContext.baseLatency
---

{{APIRef("Web Audio API")}}

Thuộc tính chỉ đọc **`baseLatency`** của giao diện {{domxref("AudioContext")}} trả về một số thực double biểu diễn số giây độ trễ xử lý phát sinh khi `AudioContext` truyền một bộ đệm âm thanh từ {{domxref("AudioDestinationNode")}} , tức là cuối đồ thị âm thanh, vào hệ thống con âm thanh của hệ thống máy chủ để sẵn sàng phát.

> [!NOTE]
> Bạn có thể yêu cầu một mức độ trễ nhất định trong lúc {{domxref("AudioContext.AudioContext()", "khởi tạo", "", "true")}} bằng tùy chọn `latencyHint`, nhưng trình duyệt có thể bỏ qua tùy chọn này.

## Giá trị

Một số thực double biểu diễn độ trễ cơ sở theo giây.

## Ví dụ

```js
// độ trễ mặc định ("interactive")
const audioCtx1 = new AudioContext();
console.log(audioCtx1.baseLatency); // 0.00

// độ trễ cao hơn ("playback")
const audioCtx2 = new AudioContext({ latencyHint: "playback" });
console.log(audioCtx2.baseLatency); // 0.15
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
