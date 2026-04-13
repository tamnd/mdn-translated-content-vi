---
title: "AudioProcessingEvent: playbackTime property"
short-title: playbackTime
slug: Web/API/AudioProcessingEvent/playbackTime
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.AudioProcessingEvent.playbackTime
---

{{APIRef("Web Audio API")}}{{Deprecated_header}}

Thuộc tính chỉ đọc **`playbackTime`** của giao diện {{domxref("AudioProcessingEvent")}} biểu diễn thời điểm âm thanh sẽ được phát. Thuộc tính này dùng cùng hệ tọa độ thời gian với thời gian được {{domxref("AudioContext")}} sử dụng.

## Giá trị

Một số không nhất thiết phải là số nguyên.

## Ví dụ

```js
const audioContext = new AudioContext();
const processor = audioContext.createScriptProcessor(256, 2, 2);

processor.addEventListener("audioprocess", (event) => {
  const inputBuffer = event.inputBuffer;
  const outputBuffer = event.outputBuffer;

  for (let channel = 0; channel < outputBuffer.numberOfChannels; channel++) {
    const inputData = inputBuffer.getChannelData(channel);
    const outputData = outputBuffer.getChannelData(channel);

    // Ghi lại thời điểm tương ứng của bộ đệm âm thanh này
    console.log(`Received audio data to be played at ${event.playbackTime}`);

    // Xử lý dữ liệu âm thanh tại đây
    for (let i = 0; i < outputBuffer.length; i++) {
      outputData[i] = inputData[i] * 0.5;
    }
  }
});

processor.connect(audioContext.destination);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("AudioProcessingEvent")}}
- {{domxref("ScriptProcessorNode")}}
