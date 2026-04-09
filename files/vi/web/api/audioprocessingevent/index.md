---
title: AudioProcessingEvent
slug: Web/API/AudioProcessingEvent
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.AudioProcessingEvent
---

{{APIRef("Web Audio API")}}{{deprecated_header}}

Giao diện `AudioProcessingEvent` của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) biểu diễn các sự kiện xảy ra khi bộ đệm đầu vào của một {{domxref("ScriptProcessorNode")}} sẵn sàng để được xử lý.

Một sự kiện `audioprocess` với giao diện này sẽ được kích hoạt trên một {{domxref("ScriptProcessorNode")}} khi cần xử lý âm thanh. Trong quá trình xử lý âm thanh, bộ đệm đầu vào được đọc và xử lý để tạo ra dữ liệu âm thanh đầu ra, sau đó dữ liệu này được ghi vào bộ đệm đầu ra.

> [!WARNING]
> Tính năng này đã bị loại bỏ và nên được thay thế bằng [`AudioWorklet`](/en-US/docs/Web/API/AudioWorklet).

{{InheritanceDiagram}}

## Bộ khởi tạo

- {{domxref("AudioProcessingEvent.AudioProcessingEvent", "AudioProcessingEvent()")}} {{Deprecated_Inline}}
  - : Tạo một đối tượng `AudioProcessingEvent` mới.

## Thuộc tính thể hiện

_Cũng triển khai các thuộc tính được kế thừa từ giao diện cha của nó, {{domxref("Event")}}_.

- {{domxref("AudioProcessingEvent.playbackTime", "playbackTime")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Một số thực kép biểu diễn thời điểm âm thanh sẽ được phát,
    như được xác định bởi thời gian của {{domxref("BaseAudioContext/currentTime", "AudioContext.currentTime")}}.
- {{domxref("AudioProcessingEvent.inputBuffer", "inputBuffer")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Một {{domxref("AudioBuffer")}} là bộ đệm chứa dữ liệu âm thanh đầu vào cần được xử lý.
    Số lượng kênh được xác định bởi tham số `numberOfInputChannels`
    của phương thức factory {{domxref("BaseAudioContext/createScriptProcessor", "AudioContext.createScriptProcessor()")}}.
    Lưu ý rằng <code>AudioBuffer</code> được trả về chỉ hợp lệ trong phạm vi của trình xử lý sự kiện.
- {{domxref("AudioProcessingEvent.outputBuffer", "outputBuffer")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Một {{domxref("AudioBuffer")}} là bộ đệm nơi dữ liệu âm thanh đầu ra cần được ghi vào.
    Số lượng kênh được xác định bởi tham số <code>numberOfOutputChannels</code>
    của phương thức factory {{domxref("BaseAudioContext/createScriptProcessor", "AudioContext.createScriptProcessor()")}}.
    Lưu ý rằng <code>AudioBuffer</code> được trả về chỉ hợp lệ trong phạm vi của trình xử lý sự kiện.

## Ví dụ

### Thêm nhiễu trắng bằng script processor

Ví dụ sau cho thấy cách dùng `ScriptProcessorNode` để lấy một track
được tải bằng {{domxref("BaseAudioContext/decodeAudioData", "AudioContext.decodeAudioData()")}}, xử lý nó bằng cách thêm
một ít nhiễu trắng vào từng mẫu âm thanh của track đầu vào (bộ đệm) và phát nó qua
{{domxref("AudioDestinationNode")}}. Với mỗi kênh và mỗi khung mẫu,
hàm `scriptNode.onaudioprocess` nhận
`audioProcessingEvent` tương ứng và dùng nó để lặp qua từng kênh của bộ đệm đầu vào,
và từng mẫu trong mỗi kênh, rồi thêm một lượng nhỏ nhiễu trắng, trước khi
đặt kết quả đó làm mẫu đầu ra trong từng trường hợp.

> [!NOTE]
> Để xem ví dụ đầy đủ có thể chạy được, hãy xem kho GitHub [script-processor-node](https://mdn.github.io/webaudio-examples/script-processor-node/)
> của chúng tôi. (Bạn cũng có thể truy cập [mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/script-processor-node).)

```js
const myScript = document.querySelector("script");
const myPre = document.querySelector("pre");
const playButton = document.querySelector("button");

// Tạo AudioContext và nguồn bộ đệm
let audioCtx;

async function init() {
  audioCtx = new AudioContext();
  const source = audioCtx.createBufferSource();

  // Tạo một ScriptProcessorNode với bufferSize là 4096 và
  // một kênh đầu vào và một kênh đầu ra
  const scriptNode = audioCtx.createScriptProcessor(4096, 1, 1);

  // Tải một track âm thanh bằng fetch() và decodeAudioData()
  try {
    const response = await fetch("viper.ogg");
    const arrayBuffer = await response.arrayBuffer();
    source.buffer = await audioCtx.decodeAudioData(arrayBuffer);
  } catch (err) {
    console.error(
      `Unable to fetch the audio file: ${name} Error: ${err.message}`,
    );
  }

  // Gán cho node một hàm để xử lý các sự kiện âm thanh
  scriptNode.addEventListener("audioprocess", (audioProcessingEvent) => {
    // Bộ đệm đầu vào là bài hát chúng ta đã tải trước đó
    let inputBuffer = audioProcessingEvent.inputBuffer;

    // Bộ đệm đầu ra chứa các mẫu sẽ được chỉnh sửa
    // và phát
    let outputBuffer = audioProcessingEvent.outputBuffer;

    // Lặp qua các kênh đầu ra (trong trường hợp này chỉ có một)
    for (let channel = 0; channel < outputBuffer.numberOfChannels; channel++) {
      let inputData = inputBuffer.getChannelData(channel);
      let outputData = outputBuffer.getChannelData(channel);

      // Lặp qua 4096 mẫu
      for (let sample = 0; sample < inputBuffer.length; sample++) {
        // cho đầu ra bằng với đầu vào
        outputData[sample] = inputData[sample];

        // thêm nhiễu vào từng mẫu đầu ra
        outputData[sample] += (Math.random() * 2 - 1) * 0.1;
      }
    }
  });

  source.connect(scriptNode);
  scriptNode.connect(audioCtx.destination);
  source.start();

  // Khi nguồn bộ đệm dừng phát, ngắt kết nối mọi thứ
  source.addEventListener("ended", () => {
    source.disconnect(scriptNode);
    scriptNode.disconnect(audioCtx.destination);
  });
}

// nối nút phát
playButton.addEventListener("click", () => {
  if (!audioCtx) {
    init();
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
