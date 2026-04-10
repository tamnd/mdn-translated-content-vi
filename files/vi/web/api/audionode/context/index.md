---
title: "AudioNode: thuộc tính context"
short-title: context
slug: Web/API/AudioNode/context
page-type: web-api-instance-property
browser-compat: api.AudioNode.context
---

{{APIRef("Web Audio API")}}

Thuộc tính chỉ đọc `context` của giao diện {{domxref("AudioNode")}} trả về {{domxref("BaseAudioContext")}} liên kết, tức đối tượng biểu diễn đồ thị xử lý mà nút này đang tham gia.

## Giá trị

Đối tượng {{domxref("AudioContext")}} hoặc {{domxref("OfflineAudioContext")}} đã được dùng để tạo `AudioNode` này.

## Ví dụ

```js
const audioCtx = new AudioContext();

const oscillator = audioCtx.createOscillator();
const gainNode = audioCtx.createGain();
oscillator.connect(gainNode).connect(audioCtx.destination);

console.log(oscillator.context); // AudioContext
console.log(oscillator.context === audioCtx); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
