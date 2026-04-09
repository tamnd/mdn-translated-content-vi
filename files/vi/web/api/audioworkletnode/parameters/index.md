---
title: "AudioWorkletNode: thuộc tính parameters"
short-title: parameters
slug: Web/API/AudioWorkletNode/parameters
page-type: web-api-instance-property
browser-compat: api.AudioWorkletNode.parameters
---

{{APIRef("Web Audio API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`parameters`** của giao diện {{domxref("AudioWorkletNode")}} trả về {{domxref("AudioParamMap")}} liên kết, tức là một tập hợp kiểu `Map` gồm các đối tượng {{domxref("AudioParam")}}. Chúng được khởi tạo trong quá trình tạo {{domxref("AudioWorkletProcessor")}} cơ sở theo getter tĩnh {{domxref("AudioWorkletProcessor.parameterDescriptors", "parameterDescriptors")}} của nó.

## Giá trị

Đối tượng {{domxref("AudioParamMap")}} chứa các thể hiện {{domxref("AudioParam")}}. Chúng có thể được tự động hóa theo cách tương tự như với các `AudioNode` mặc định, và các giá trị đã được tính toán của chúng có thể được dùng trong phương thức {{domxref("AudioWorkletProcessor.process", "process")}} của {{domxref("AudioWorkletProcessor")}} của bạn.

## Ví dụ

Để minh họa việc tạo và sử dụng các `AudioParam` tùy chỉnh, chúng ta sẽ mở rộng ví dụ trong trang {{domxref("AudioWorkletNode")}}. Ở đó, chúng ta đã tạo một nút đơn giản tạo ra nhiễu trắng. Ở đây, chúng ta sẽ tạo thêm một tham số gain tùy chỉnh để có thể thay đổi trực tiếp âm lượng đầu ra (mặc dù bạn cũng có thể dùng {{domxref("GainNode")}} để làm điều này).

Trước tiên, chúng ta cần định nghĩa một `AudioWorkletProcessor` tùy chỉnh và đăng ký nó. Lưu ý rằng việc này nên được thực hiện trong một tệp riêng.

Chúng ta mở rộng processor bằng cách thêm getter tĩnh {{domxref("AudioWorkletProcessor.parameterDescriptors", "parameterDescriptors")}}. Nó sẽ được hàm tạo `AudioWorkletNode` dùng nội bộ để điền vào `parameters` của nó bằng các đối tượng `AudioParam` đã được khởi tạo.

```js
// white-noise-processor.js
class WhiteNoiseProcessor extends AudioWorkletProcessor {
  static get parameterDescriptors() {
    return [
      {
        name: "customGain",
        defaultValue: 1,
        minValue: 0,
        maxValue: 1,
        automationRate: "a-rate",
      },
    ];
  }

  process(inputs, outputs, parameters) {
    const output = outputs[0];
    output.forEach((channel) => {
      for (let i = 0; i < channel.length; i++) {
        channel[i] =
          (Math.random() * 2 - 1) *
          (parameters["customGain"].length > 1
            ? parameters["customGain"][i]
            : parameters["customGain"][0]);
        // note: a parameter contains an array of 128 values (one value for each of 128 samples),
        // however it may contain a single value which is to be used for all 128 samples
        // if no automation is scheduled for the moment.
      }
    });
    return true;
  }
}

registerProcessor("white-noise-processor", WhiteNoiseProcessor);
```

Tiếp theo, trong tệp kịch bản chính, chúng ta sẽ tải processor, tạo một thể hiện `AudioWorkletNode` bằng cách truyền vào tên của processor, rồi kết nối nút này vào một đồ thị âm thanh.

```js
const audioContext = new AudioContext();
await audioContext.audioWorklet.addModule("white-noise-processor.js");
const whiteNoiseNode = new AudioWorkletNode(
  audioContext,
  "white-noise-processor",
);
whiteNoiseNode.connect(audioContext.destination);
```

Bây giờ chúng ta có thể thay đổi gain trên nút như sau:

```js
const gainParam = whiteNoiseNode.parameters.get("customGain");
gainParam.setValueAtTime(0, audioContext.currentTime);
gainParam.linearRampToValueAtTime(0.5, audioContext.currentTime + 0.5);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
