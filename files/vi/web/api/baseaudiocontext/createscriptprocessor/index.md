---
title: "BaseAudioContext: phương thức createScriptProcessor()"
short-title: createScriptProcessor()
slug: Web/API/BaseAudioContext/createScriptProcessor
page-type: web-api-instance-method
status:
  - deprecated
browser-compat: api.BaseAudioContext.createScriptProcessor
---

{{APIRef("Web Audio API")}}{{deprecated_header}}

Phương thức `createScriptProcessor()` của giao diện {{domxref("BaseAudioContext")}}
tạo một {{domxref("ScriptProcessorNode")}} được dùng để xử lý âm thanh trực tiếp.

> [!NOTE]
> Tính năng này đã được thay thế bằng [AudioWorklets](/en-US/docs/Web/API/AudioWorklet) và giao diện {{domxref("AudioWorkletNode")}}.

## Cú pháp

```js-nolint
createScriptProcessor(bufferSize, numberOfInputChannels, numberOfOutputChannels)
```

### Tham số

- `bufferSize`
  - : Kích thước bộ đệm tính theo đơn vị sample-frame. Nếu được chỉ định, `bufferSize` phải là một trong các giá trị sau: 256, 512, 1024, 2048, 4096, 8192, 16384. Nếu không được truyền vào, hoặc nếu giá trị là 0, thì phần triển khai sẽ chọn kích thước bộ đệm tốt nhất cho môi trường hiện tại; kích thước này sẽ là một lũy thừa cố định của 2 trong suốt vòng đời của node.

    Giá trị này kiểm soát tần suất sự kiện `audioprocess` được gửi đi và số sample-frame cần được xử lý trong mỗi lần gọi. Các giá trị `bufferSize` thấp hơn sẽ cho độ trễ thấp hơn (tốt hơn). Các giá trị cao hơn sẽ cần thiết để tránh hiện tượng vỡ âm và glitch. Tác giả được khuyến nghị không chỉ định kích thước bộ đệm này và để phần triển khai tự chọn một giá trị phù hợp nhằm cân bằng giữa độ trễ và chất lượng âm thanh.

- `numberOfInputChannels`
  - : Số nguyên chỉ định số kênh cho đầu vào của node này, mặc định là 2.
    Hỗ trợ các giá trị lên tới 32.
- `numberOfOutputChannels`
  - : Số nguyên chỉ định số kênh cho đầu ra của node này, mặc định là 2.
    Hỗ trợ các giá trị lên tới 32.

> [!WARNING]
> WebKit hiện tại (phiên bản 31) yêu cầu phải truyền một `bufferSize`
> hợp lệ khi gọi phương thức này.

> [!NOTE]
> Không hợp lệ nếu cả `numberOfInputChannels` và
> `numberOfOutputChannels` đều bằng không.

### Giá trị trả về

Một {{domxref("ScriptProcessorNode")}}.

## Ví dụ

### Thêm nhiễu trắng bằng script processor

Ví dụ sau cho thấy cách dùng một `ScriptProcessorNode` để lấy một track được tải bằng {{domxref("BaseAudioContext/decodeAudioData", "AudioContext.decodeAudioData()")}}, xử lý nó bằng cách thêm một ít nhiễu trắng vào mỗi mẫu âm thanh của track đầu vào, rồi phát nó qua {{domxref("AudioDestinationNode")}}.

Với mỗi kênh và mỗi sample frame, trình xử lý sự kiện {{domxref("ScriptProcessorNode.audioprocess_event", "audioprocess")}} của script node dùng `audioProcessingEvent` liên kết để lặp qua từng kênh của bộ đệm đầu vào, rồi từng mẫu trong mỗi kênh, và thêm một lượng nhỏ nhiễu trắng, trước khi đặt kết quả đó thành mẫu đầu ra trong từng trường hợp.

> [!NOTE]
> Bạn có thể [chạy ví dụ đầy đủ trực tiếp](https://mdn.github.io/webaudio-examples/script-processor-node/), hoặc [xem mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/script-processor-node).

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
  // một kênh đầu vào và đầu ra
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

  // Cung cấp cho node một hàm xử lý sự kiện âm thanh
  scriptNode.addEventListener("audioprocess", (audioProcessingEvent) => {
    // Bộ đệm đầu vào là bài hát chúng ta đã tải trước đó
    let inputBuffer = audioProcessingEvent.inputBuffer;

    // Bộ đệm đầu ra chứa các mẫu sẽ được sửa đổi và phát
    let outputBuffer = audioProcessingEvent.outputBuffer;

    // Lặp qua các kênh đầu ra (trong trường hợp này chỉ có một)
    for (let channel = 0; channel < outputBuffer.numberOfChannels; channel++) {
      let inputData = inputBuffer.getChannelData(channel);
      let outputData = outputBuffer.getChannelData(channel);

      // Lặp qua 4096 mẫu
      for (let sample = 0; sample < inputBuffer.length; sample++) {
        // đặt đầu ra bằng với đầu vào
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

// nối sự kiện cho nút phát
playButton.addEventListener("click", () => {
  if (!audioCtx) {
    init();
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
