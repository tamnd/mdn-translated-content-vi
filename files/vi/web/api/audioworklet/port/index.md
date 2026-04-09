---
title: "AudioWorklet: thuộc tính port"
short-title: port
slug: Web/API/AudioWorklet/port
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.AudioWorklet.port
---

{{APIRef("Web Audio API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`port`** của giao diện {{domxref("AudioWorklet")}} trả về một đối tượng {{domxref("MessagePort")}} có thể được dùng để gửi và nhận thông điệp giữa luồng chính và {{domxref("AudioWorkletGlobalScope")}} liên kết.

Điều này cho phép giao tiếp bất đồng bộ tùy chỉnh giữa mã trong luồng chính và phạm vi toàn cục của một audio worklet, chẳng hạn như nhận dữ liệu điều khiển hoặc các thiết lập toàn cục.

## Giá trị

Đối tượng {{domxref("MessagePort")}} kết nối `AudioWorklet` với `AudioWorkletGlobalScope` liên kết của nó.

## Ví dụ

Xem [`AudioWorkletNode.port`](/en-US/docs/Web/API/AudioWorkletNode/port#examples) để biết thêm ví dụ.

### Dùng một cổng cho các thông điệp toàn cục

Trong ví dụ sau, ta có thể dùng `port.onmessage` để nhận dữ liệu và `port.postMessage` để gửi dữ liệu:

```js
const context = new AudioContext();
// Tải mô-đun chứa mã worklet
await context.audioWorklet.addModule("processor.js");

// Bộ lắng nghe thông điệp từ AudioWorkletGlobalScope
context.audioWorklet.port.onmessage = (event) => {
  console.log("Message from global worklet:", event.data);
};

// Thiết lập một cấu hình toàn cục, ví dụ:
context.audioWorklet.port.postMessage({
  volume: 0.8,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("AudioWorkletGlobalScope")}} — ngữ cảnh thực thi toàn cục của một `AudioWorklet`
- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Sử dụng AudioWorklet](/en-US/docs/Web/API/Web_Audio_API/Using_AudioWorklet)
