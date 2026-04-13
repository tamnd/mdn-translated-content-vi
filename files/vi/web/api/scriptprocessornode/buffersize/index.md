---
title: "ScriptProcessorNode: thuộc tính bufferSize"
short-title: bufferSize
slug: Web/API/ScriptProcessorNode/bufferSize
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.ScriptProcessorNode.bufferSize
---

{{APIRef("Web Audio API")}}{{Deprecated_Header}}

Thuộc tính `bufferSize` của giao diện {{domxref("ScriptProcessorNode")}} trả về một số nguyên đại diện cho cả kích thước bộ đệm đầu vào và đầu ra, tính bằng sample-frame. Giá trị của nó có thể là lũy thừa của 2 trong khoảng `256` – `16384`.

> [!NOTE]
> Tính năng này đã được thay thế bởi [AudioWorklets](/en-US/docs/Web/API/AudioWorklet) và giao diện {{domxref("AudioWorkletNode")}}.

## Giá trị

Một số nguyên.

## Ví dụ

Xem [`BaseAudioContext.createScriptProcessor()`](/en-US/docs/Web/API/BaseAudioContext/createScriptProcessor#examples) để biết ví dụ code.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
