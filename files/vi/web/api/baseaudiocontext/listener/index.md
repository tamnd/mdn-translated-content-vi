---
title: "BaseAudioContext: thuộc tính listener"
short-title: listener
slug: Web/API/BaseAudioContext/listener
page-type: web-api-instance-property
browser-compat: api.BaseAudioContext.listener
---

{{ APIRef("Web Audio API") }}

Thuộc tính `listener` của giao diện {{ domxref("BaseAudioContext") }}
trả về một đối tượng {{ domxref("AudioListener") }} sau đó có thể được dùng để
triển khai định vị không gian âm thanh 3D.

## Giá trị

Một đối tượng {{ domxref("AudioListener") }}.

## Ví dụ

> [!NOTE]
> Để xem ví dụ đầy đủ về định vị không gian trong Web Audio, hãy xem bản demo [panner-node](https://github.com/mdn/webaudio-examples/tree/main/panner-node) của chúng tôi.

```js
const audioCtx = new AudioContext();
// Các trình duyệt webkit/blink cũ yêu cầu tiền tố

// …

const myListener = audioCtx.listener;
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
