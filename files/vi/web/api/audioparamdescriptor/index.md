---
title: AudioParamDescriptor
slug: Web/API/AudioParamDescriptor
page-type: web-api-interface
spec-urls: https://webaudio.github.io/web-audio-api/#AudioParamDescriptor
---

{{APIRef("Web Audio API")}}

Từ điển **`AudioParamDescriptor`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) chỉ định các thuộc tính cho các đối tượng {{domxref("AudioParam")}}.

Nó được dùng để tạo các `AudioParam` tùy chỉnh trên một {{domxref("AudioWorkletNode")}}. Nếu {{domxref("AudioWorkletProcessor")}} nền tảng có một getter tĩnh {{domxref("AudioWorkletProcessor.parameterDescriptors", "parameterDescriptors")}}, thì mảng đối tượng được trả về dựa trên từ điển này sẽ được hàm dựng `AudioWorkletNode` sử dụng nội bộ để điền thuộc tính {{domxref("AudioWorkletNode.parameters", "parameters")}} của nó cho phù hợp.

## Instance properties

- `name`
  - : Chuỗi biểu diễn tên của `AudioParam`. `AudioParam` sẽ khả dụng dưới tên này trong thuộc tính {{domxref("AudioWorkletNode.parameters", "parameters")}} của node, và dưới tên này, phương thức {{domxref("AudioWorkletProcessor.process")}} sẽ nhận các giá trị đã được tính toán của `AudioParam` này.
- `automationRate` {{optional_inline}}
  - : Chuỗi [`"a-rate"`](/en-US/docs/Web/API/AudioParam#a-rate) hoặc [`"k-rate"`](/en-US/docs/Web/API/AudioParam#k-rate), biểu diễn tốc độ tự động hóa của `AudioParam` này. Mặc định là `"a-rate"`.
- `minValue` {{optional_inline}}
  - : Một `float` biểu diễn giá trị nhỏ nhất của `AudioParam`. Mặc định là `-3.4028235e38`.
- `maxValue` {{optional_inline}}
  - : Một `float` biểu diễn giá trị lớn nhất của `AudioParam`. Mặc định là `3.4028235e38`.
- `defaultValue` {{optional_inline}}
  - : Một `float` biểu diễn giá trị khởi tạo của `AudioParam`. Mặc định là `0`.

## Examples

Đoạn mã dưới đây cho thấy một descriptor kiểu này được trả về bởi phương thức tĩnh {{domxref("AudioWorkletProcessor.parameterDescriptors", "parameterDescriptors")}} được định nghĩa trong một `AudioWorkletProcessor` tùy chỉnh (đây là một phần của ví dụ đầy đủ hơn trong [AudioWorkletNode.parameters](/en-US/docs/Web/API/AudioWorkletNode/parameters#examples)).

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

  // …
}
```

## Specifications

{{Specifications}}

## See also

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
