---
title: AudioWorkletNode
slug: Web/API/AudioWorkletNode
page-type: web-api-interface
browser-compat: api.AudioWorkletNode
---

{{APIRef("Web Audio API")}}{{SecureContext_Header}}

> [!NOTE]
> Mặc dù giao diện này khả dụng bên ngoài [secure contexts](/en-US/docs/Web/Security/Defenses/Secure_Contexts), thuộc tính {{domxref("BaseAudioContext.audioWorklet")}} thì không; do đó không thể định nghĩa các {{domxref("AudioWorkletProcessor")}} tùy chỉnh bên ngoài các ngữ cảnh đó.

Giao diện **`AudioWorkletNode`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) biểu diễn một lớp cơ sở cho {{domxref("AudioNode")}} do người dùng định nghĩa, có thể được kết nối vào một đồ thị định tuyến âm thanh cùng với các nút khác. Nó có một {{domxref("AudioWorkletProcessor")}} liên kết, thành phần thực hiện việc xử lý âm thanh thực tế trong một luồng dựng hình Web Audio.

{{InheritanceDiagram}}

## Hàm tạo

- {{domxref("AudioWorkletNode.AudioWorkletNode", "AudioWorkletNode()")}}
  - : Tạo một thể hiện mới của đối tượng `AudioWorkletNode`.

## Thuộc tính thể hiện

_Cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("AudioNode")}}._

- {{domxref("AudioWorkletNode.port")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("MessagePort")}} dùng cho giao tiếp hai chiều giữa nút và {{domxref("AudioWorkletProcessor")}} liên kết của nó. Đầu còn lại có sẵn qua thuộc tính {{domxref("AudioWorkletProcessor.port", "port")}} của processor.
- {{domxref("AudioWorkletNode.parameters")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("AudioParamMap")}} — một tập hợp các đối tượng {{domxref("AudioParam")}}. Chúng được khởi tạo trong quá trình tạo `AudioWorkletProcessor` cơ sở. Nếu `AudioWorkletProcessor` có getter tĩnh {{domxref("AudioWorkletProcessor.parameterDescriptors", "parameterDescriptors")}}, mảng {{domxref("AudioParamDescriptor")}} trả về từ getter đó sẽ được dùng để tạo các đối tượng `AudioParam` trên `AudioWorkletNode`. Cơ chế này cho phép bạn đưa các đối tượng `AudioParam` tùy chỉnh của riêng mình ra để truy cập từ `AudioWorkletNode`. Sau đó, bạn có thể dùng các giá trị của chúng trong `AudioWorkletProcessor` liên kết.

### Sự kiện

- {{domxref("AudioWorkletNode.processorerror_event", "processorerror")}}
  - : Kích hoạt khi có lỗi được ném ra trong {{domxref("AudioWorkletProcessor")}} liên kết. Sau khi sự kiện này xảy ra, processor và do đó cả nút sẽ xuất ra sự im lặng trong suốt vòng đời của nó.

## Phương thức thể hiện

_Cũng kế thừa các phương thức từ giao diện cha của nó, {{domxref("AudioNode")}}._

_Giao diện `AudioWorkletNode` không tự định nghĩa phương thức nào._

## Ví dụ

Trong ví dụ này, chúng ta tạo một `AudioWorkletNode` tùy chỉnh tạo ra nhiễu ngẫu nhiên.

Trước tiên, chúng ta cần định nghĩa một {{domxref("AudioWorkletProcessor")}} tùy chỉnh có nhiệm vụ xuất ra nhiễu ngẫu nhiên và đăng ký nó. Lưu ý rằng việc này nên được thực hiện trong một tệp riêng.

```js
// random-noise-processor.js
class RandomNoiseProcessor extends AudioWorkletProcessor {
  process(inputs, outputs, parameters) {
    const output = outputs[0];
    output.forEach((channel) => {
      for (let i = 0; i < channel.length; i++) {
        channel[i] = Math.random() * 2 - 1;
      }
    });
    return true;
  }
}

registerProcessor("random-noise-processor", RandomNoiseProcessor);
```

Tiếp theo, trong tệp kịch bản chính, chúng ta sẽ tải processor, tạo một thể hiện `AudioWorkletNode` bằng cách truyền vào tên của processor, rồi kết nối nút này vào một đồ thị âm thanh.

```js
const audioContext = new AudioContext();
await audioContext.audioWorklet.addModule("random-noise-processor.js");
const randomNoiseNode = new AudioWorkletNode(
  audioContext,
  "random-noise-processor",
);
randomNoiseNode.connect(audioContext.destination);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Sử dụng AudioWorklet](/en-US/docs/Web/API/Web_Audio_API/Using_AudioWorklet)
