---
title: "AudioWorkletGlobalScope: port"
short-title: port
slug: Web/API/AudioWorkletGlobalScope/port
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.AudioWorkletGlobalScope.port
---

{{APIRef("Web Audio API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`port`** của giao diện {{domxref("AudioWorkletGlobalScope")}} trả về một đối tượng {{domxref("MessagePort")}} có thể được dùng để gửi và nhận thông điệp giữa luồng chính và {{domxref("AudioWorklet")}} liên kết.

Điều này cho phép giao tiếp tùy chỉnh, bất đồng bộ giữa mã trên luồng chính và phạm vi toàn cục của một audio worklet, chẳng hạn như gửi dữ liệu điều khiển hoặc thiết lập toàn cục.

## Giá trị

Đối tượng {{domxref("MessagePort")}} kết nối `AudioWorklet` với `AudioWorkletGlobalScope` liên kết của nó.

## Ví dụ

Xem [`AudioWorkletNode.port`](/en-US/docs/Web/API/AudioWorkletNode/port#examples) để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Using AudioWorklet](/en-US/docs/Web/API/Web_Audio_API/Using_AudioWorklet)
