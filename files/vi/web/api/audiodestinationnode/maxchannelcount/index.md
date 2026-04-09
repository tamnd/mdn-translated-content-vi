---
title: "AudioDestinationNode: thuộc tính maxChannelCount"
short-title: maxChannelCount
slug: Web/API/AudioDestinationNode/maxChannelCount
page-type: web-api-instance-property
browser-compat: api.AudioDestinationNode.maxChannelCount
---

{{ APIRef("Web Audio API") }}

Thuộc tính `maxChannelCount` của giao diện {{ domxref("AudioDestinationNode") }} là một `unsigned long` xác định số lượng kênh tối đa mà thiết bị vật lý có thể xử lý.

Thuộc tính {{domxref("AudioNode.channelCount")}} có thể được đặt trong khoảng từ 0 đến giá trị này (bao gồm cả hai đầu). Nếu `maxChannelCount` là `0`, như trong {{domxref("OfflineAudioContext")}}, số lượng kênh không thể thay đổi.

## Giá trị

Một `unsigned long`.

## Ví dụ

Đoạn mã sau sẽ thiết lập một đồ thị âm thanh, trong đó có một `AudioDestinationNode` với `maxChannelCount` là 2:

```js
const audioCtx = new AudioContext();
const source = audioCtx.createMediaElementSource(myMediaElement);
source.connect(gainNode);
audioCtx.destination.maxChannelCount = 2;
gainNode.connect(audioCtx.destination);
```

Để xem một cách triển khai đầy đủ hơn, hãy xem một trong các ví dụ Web Audio của MDN, như [Voice-change-o-matic](https://mdn.github.io/webaudio-examples/voice-change-o-matic/) hoặc [Violent Theremin](https://mdn.github.io/webaudio-examples/violent-theremin/).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
