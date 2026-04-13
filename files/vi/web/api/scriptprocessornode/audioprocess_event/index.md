---
title: "ScriptProcessorNode: sự kiện audioprocess"
short-title: audioprocess
slug: Web/API/ScriptProcessorNode/audioprocess_event
page-type: web-api-event
status:
  - deprecated
browser-compat: api.ScriptProcessorNode.audioprocess_event
---

{{APIRef("Web Audio API")}}{{Deprecated_Header}}

Sự kiện **`audioprocess`** của giao diện {{domxref("ScriptProcessorNode")}} được kích hoạt khi bộ đệm đầu vào của một bộ xử lý script sẵn sàng để được xử lý.

> [!NOTE]
> Tính năng này đã được thay thế bởi [AudioWorklets](/en-US/docs/Web/API/AudioWorklet) và giao diện {{domxref("AudioWorkletNode")}}.

Sự kiện này không thể hủy và không nổi bong bóng.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("audioprocess", (event) => { })

onaudioprocess = (event) => { }
```

## Loại sự kiện

Một {{domxref("AudioProcessingEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("AudioProcessingEvent")}}

## Thuộc tính sự kiện

_Cũng triển khai các thuộc tính được kế thừa từ cha của nó, {{domxref("Event")}}._

- `playbackTime` {{ReadOnlyInline}}
  - : Một số thực đôi đại diện cho thời điểm âm thanh sẽ được phát, được xác định bởi thời gian của {{domxref("BaseAudioContext/currentTime", "AudioContext.currentTime")}}.
- `inputBuffer` {{ReadOnlyInline}}
  - : Một {{domxref("AudioBuffer")}} là bộ đệm chứa dữ liệu âm thanh đầu vào cần được xử lý.
    Số lượng kênh được xác định là tham số `numberOfInputChannels`,
    của phương thức nhà máy {{domxref("BaseAudioContext/createScriptProcessor", "AudioContext.createScriptProcessor()")}}.
    Lưu ý rằng `AudioBuffer` được trả về chỉ hợp lệ trong phạm vi của trình xử lý sự kiện.
- `outputBuffer` {{ReadOnlyInline}}
  - : Một {{domxref("AudioBuffer")}} là bộ đệm nơi dữ liệu âm thanh đầu ra nên được ghi.
    Số lượng kênh được xác định là tham số, `numberOfOutputChannels`,
    của phương thức nhà máy {{domxref("BaseAudioContext/createScriptProcessor", "AudioContext.createScriptProcessor()")}}.
    Lưu ý rằng `AudioBuffer` được trả về chỉ hợp lệ trong phạm vi của trình xử lý sự kiện.

## Ví dụ

```js
scriptNode.addEventListener("audioprocess", (audioProcessingEvent) => {
  // Bộ đệm đầu vào là một bài hát chúng tôi đã tải trước đó
  const inputBuffer = audioProcessingEvent.inputBuffer;

  // Bộ đệm đầu ra chứa các mẫu sẽ được sửa đổi và phát
  const outputBuffer = audioProcessingEvent.outputBuffer;

  // Lặp qua các kênh đầu ra (trong trường hợp này chỉ có một)
  for (let channel = 0; channel < outputBuffer.numberOfChannels; channel++) {
    const inputData = inputBuffer.getChannelData(channel);
    const outputData = outputBuffer.getChannelData(channel);

    // Lặp qua 4096 mẫu
    for (let sample = 0; sample < inputBuffer.length; sample++) {
      // làm cho đầu ra bằng với đầu vào
      outputData[sample] = inputData[sample];

      // thêm nhiễu vào mỗi mẫu đầu ra
      outputData[sample] += (Math.random() * 2 - 1) * 0.2;
    }
  }
});
```

Bạn cũng có thể thiết lập trình xử lý sự kiện bằng thuộc tính `onaudioprocess`:

```js
scriptNode.onaudioprocess = (audioProcessingEvent) => {
  // …
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
