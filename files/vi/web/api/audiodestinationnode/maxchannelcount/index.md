---
title: "AudioDestinationNode: thuộc tính maxChannelCount"
short-title: maxChannelCount
slug: Web/API/AudioDestinationNode/maxChannelCount
page-type: web-api-instance-property
browser-compat: api.AudioDestinationNode.maxChannelCount
---

{{ APIRef("Web Audio API") }}

Thuộc tính `maxChannelCount` của giao diện {{ domxref("AudioDestinationNode") }} là một `unsigned long` xác định số kênh tối đa mà thiết bị vật lý có thể xử lý.

Thuộc tính {{domxref("AudioNode.channelCount")}} có thể được đặt trong khoảng từ 0 đến giá trị này (bao gồm cả hai đầu). Nếu `maxChannelCount` là `0`, như trong {{domxref("OfflineAudioContext")}}, thì không thể thay đổi số kênh.

## Giá trị

Một `unsigned long`.

## Ví dụ

Ví dụ sau sẽ thiết lập một đồ thị âm thanh, trong đó `AudioDestinationNode` có `maxChannelCount` bằng 2:

```js
const audioCtx = new AudioContext();
const source = audioCtx.createMediaElementSource(myMediaElement);
source.connect(gainNode);
audioCtx.destination.maxChannelCount = 2;
gainNode.connect(audioCtx.destination);
```

Để xem một triển khai đầy đủ hơn, hãy xem một trong các ví dụ Web Audio của MDN, chẳng hạn như [Voice-change-o-matic](https://mdn.github.io/webaudio-examples/voice-change-o-matic/) hoặc [Violent Theremin](https://mdn.github.io/webaudio-examples/violent-theremin/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
