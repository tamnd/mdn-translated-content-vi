---
title: "AudioWorkletGlobalScope: thuộc tính currentTime"
short-title: currentTime
slug: Web/API/AudioWorkletGlobalScope/currentTime
page-type: web-api-instance-property
browser-compat: api.AudioWorkletGlobalScope.currentTime
---

{{APIRef("Web Audio API")}}

Thuộc tính chỉ đọc **`currentTime`** của giao diện {{domxref("AudioWorkletGlobalScope")}} trả về một số thực double biểu thị thời gian ngữ cảnh của khối âm thanh đang được xử lý và liên tục tăng lên. Giá trị này bằng với thuộc tính {{domxref("BaseAudioContext.currentTime", "currentTime")}} của {{domxref("BaseAudioContext")}} mà worklet thuộc về.

## Giá trị

Một số dấu phẩy động biểu thị thời gian.

## Ví dụ

{{domxref("AudioWorkletProcessor")}} có thể truy cập các thuộc tính riêng của {{domxref("AudioWorkletGlobalScope")}}:

```js
// AudioWorkletProcessor defined in : test-processor.js
class TestProcessor extends AudioWorkletProcessor {
  constructor() {
    super();

    // Logs the current sample-frame and time at the moment of instantiation.
    // They are accessible from the AudioWorkletGlobalScope.
    console.log(currentFrame);
    console.log(currentTime);
  }

  // The process method is required - output silence,
  // which the outputs are already filled with.
  process(inputs, outputs, parameters) {
    return true;
  }
}

// Logs the sample rate, that is not going to change ever,
// because it's a read-only property of a BaseAudioContext
// and is set only during its instantiation.
console.log(sampleRate);

// You can declare any variables and use them in your processors
// for example it may be an ArrayBuffer with a wavetable.
const usefulVariable = 42;
console.log(usefulVariable);

registerProcessor("test-processor", TestProcessor);
```

Kịch bản chính tải processor, tạo một thể hiện của {{domxref("AudioWorkletNode")}}, truyền tên của processor cho nó và kết nối node đó vào một đồ thị âm thanh. Chúng ta sẽ thấy đầu ra của các lệnh gọi {{domxref("console/log_static", "console.log()")}} trong console:

```js
const audioContext = new AudioContext();
await audioContext.audioWorklet.addModule("test-processor.js");
const testNode = new AudioWorkletNode(audioContext, "test-processor");
testNode.connect(audioContext.destination);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
