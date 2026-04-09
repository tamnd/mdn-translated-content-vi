---
title: AudioWorkletGlobalScope
slug: Web/API/AudioWorkletGlobalScope
page-type: web-api-interface
browser-compat: api.AudioWorkletGlobalScope
---

{{APIRef("Web Audio API")}}

Giao diện **`AudioWorkletGlobalScope`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) biểu thị một ngữ cảnh thực thi toàn cục cho mã do người dùng cung cấp, dùng để định nghĩa các lớp tùy chỉnh kế thừa từ {{domxref("AudioWorkletProcessor")}}.

Mỗi {{domxref("BaseAudioContext")}} có một {{domxref("AudioWorklet")}} duy nhất, có sẵn qua thuộc tính {{domxref("BaseAudioContext.audioWorklet", "audioWorklet")}}, và nó chạy mã của mình trong một `AudioWorkletGlobalScope` duy nhất.

Vì ngữ cảnh thực thi toàn cục được chia sẻ trong `BaseAudioContext` hiện tại, bạn có thể định nghĩa các biến khác và thực hiện mọi thao tác được cho phép trong worklet, ngoài việc định nghĩa các lớp kế thừa từ `AudioWorkletProcessor`.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Giao diện này cũng kế thừa các thuộc tính được định nghĩa trên giao diện cha của nó, {{domxref("WorkletGlobalScope")}}._

- {{domxref("AudioWorkletGlobalScope.currentFrame", "currentFrame")}} {{ReadOnlyInline}}
  - : Trả về một số nguyên biểu thị sample-frame hiện tại của khối âm thanh đang được xử lý và liên tục tăng lên. Giá trị này tăng thêm 128 (kích thước của một render quantum) sau khi mỗi khối âm thanh được xử lý xong.
- {{domxref("AudioWorkletGlobalScope.currentTime", "currentTime")}} {{ReadOnlyInline}}
  - : Trả về một số thực double biểu thị thời gian ngữ cảnh của khối âm thanh đang được xử lý và liên tục tăng lên. Giá trị này bằng với thuộc tính {{domxref("BaseAudioContext.currentTime", "currentTime")}} của {{domxref("BaseAudioContext")}} mà worklet thuộc về.
- {{domxref("AudioWorkletGlobalScope.sampleRate", "sampleRate")}} {{ReadOnlyInline}}
  - : Trả về một số thực float biểu thị tốc độ lấy mẫu của {{domxref("BaseAudioContext")}} liên kết.
- {{domxref("AudioWorkletGlobalScope.port", "port")}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Trả về một {{domxref("MessagePort")}} để giao tiếp tùy chỉnh, bất đồng bộ giữa mã trên luồng chính và phạm vi toàn cục của audio worklet.
    Điều này cho phép gửi và nhận các thông điệp tùy chỉnh, chẳng hạn như dữ liệu điều khiển hoặc thiết lập toàn cục.

## Phương thức thể hiện

_Giao diện này cũng kế thừa các phương thức được định nghĩa trên giao diện cha của nó, {{domxref("WorkletGlobalScope")}}._

- {{domxref("AudioWorkletGlobalScope.registerProcessor", "registerProcessor()")}}
  - : Đăng ký một lớp kế thừa từ giao diện {{domxref('AudioWorkletProcessor')}}. Sau đó lớp này có thể được sử dụng bằng cách tạo một {{domxref("AudioWorkletNode")}} và cung cấp tên đã đăng ký của nó.

## Ví dụ

Trong ví dụ này, chúng ta xuất tất cả các thuộc tính toàn cục ra console trong hàm khởi tạo của một {{domxref("AudioWorkletProcessor")}} tùy chỉnh.

Trước tiên, chúng ta cần định nghĩa processor và đăng ký nó. Lưu ý rằng việc này nên được thực hiện trong một tệp riêng.

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
// for example it may be an ArrayBuffer with a wavetable
const usefulVariable = 42;
console.log(usefulVariable);

registerProcessor("test-processor", TestProcessor);
```

Tiếp theo, trong tệp kịch bản chính, chúng ta sẽ tải processor, tạo một thể hiện của {{domxref("AudioWorkletNode")}} bằng cách truyền cho nó tên của processor, rồi kết nối node đó vào một đồ thị âm thanh. Chúng ta sẽ thấy đầu ra của các lệnh gọi {{domxref("console/log_static", "console.log()")}} trong console:

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
- [Using AudioWorklet](/en-US/docs/Web/API/Web_Audio_API/Using_AudioWorklet)
