---
title: "AudioProcessingEvent: outputBuffer property"
short-title: outputBuffer
slug: Web/API/AudioProcessingEvent/outputBuffer
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.AudioProcessingEvent.outputBuffer
---

{{APIRef("Web Audio API")}}{{Deprecated_header}}

Thuộc tính chỉ đọc **`outputBuffer`** của giao diện {{domxref("AudioProcessingEvent")}} biểu diễn bộ đệm đầu ra của một sự kiện xử lý âm thanh.

Bộ đệm đầu ra được biểu diễn bằng một đối tượng {{domxref("AudioBuffer")}}, đối tượng này chứa một tập hợp các kênh âm thanh, trong đó mỗi kênh là một mảng các giá trị dấu phẩy động biểu diễn dạng sóng tín hiệu âm thanh được mã hóa như một chuỗi các biên độ. Số lượng kênh và độ dài của từng kênh được xác định bởi số kênh và thuộc tính kích thước bộ đệm của `AudioBuffer`.

## Giá trị

Một đối tượng {{domxref("AudioBuffer")}}.

## Ví dụ

Trong ví dụ này, một {{domxref("ScriptProcessorNode")}} được tạo với kích thước bộ đệm là 256 mẫu, 2 kênh đầu vào và 2 kênh đầu ra. Khi một sự kiện {{domxref("ScriptProcessorNode/audioprocess_event", "audioprocess")}} được kích hoạt, các bộ đệm đầu vào và đầu ra được lấy từ đối tượng sự kiện. Dữ liệu âm thanh trong bộ đệm đầu vào được xử lý, và kết quả được ghi vào bộ đệm đầu ra. Trong trường hợp này, dữ liệu âm thanh được giảm xuống theo hệ số 0.5.

```js
const audioContext = new AudioContext();
const processor = audioContext.createScriptProcessor(256, 2, 2);

processor.addEventListener("audioprocess", (event) => {
  const inputBuffer = event.inputBuffer;
  const outputBuffer = event.outputBuffer;

  for (let channel = 0; channel < outputBuffer.numberOfChannels; channel++) {
    const inputData = inputBuffer.getChannelData(channel);
    const outputData = outputBuffer.getChannelData(channel);

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

- {{domxref("AudioProcessingEvent.inputBuffer")}}
- {{domxref("ScriptProcessorNode")}}
