---
title: "AudioWorkletProcessor: thuộc tính port"
short-title: port
slug: Web/API/AudioWorkletProcessor/port
page-type: web-api-instance-property
browser-compat: api.AudioWorkletProcessor.port
---

{{APIRef("Web Audio API")}}

Thuộc tính chỉ đọc **`port`** của giao diện {{domxref("AudioWorkletProcessor")}} trả về {{domxref("MessagePort")}} liên kết. Nó có thể được dùng để giao tiếp giữa processor và {{domxref("AudioWorkletNode")}} mà nó thuộc về.

> [!NOTE]
> Cổng ở đầu còn lại của kênh có sẵn qua thuộc tính {{domxref("AudioWorkletNode.port", "port")}} của nút.

## Giá trị

Đối tượng {{domxref("MessagePort")}} kết nối `AudioWorkletProcessor` với `AudioWorkletNode` liên kết.

## Ví dụ

Xem [`AudioWorkletNode.port`](/en-US/docs/Web/API/AudioWorkletNode/port#examples) để xem mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
