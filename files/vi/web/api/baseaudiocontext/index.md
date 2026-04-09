---
title: BaseAudioContext
slug: Web/API/BaseAudioContext
page-type: web-api-interface
browser-compat: api.BaseAudioContext
---

{{APIRef("Web Audio API")}}

Giao diện `BaseAudioContext` của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) đóng vai trò là định nghĩa cơ sở cho các đồ thị xử lý âm thanh trực tuyến và ngoại tuyến, lần lượt được biểu diễn bởi {{domxref("AudioContext")}} và {{domxref("OfflineAudioContext")}}. Bạn không dùng trực tiếp `BaseAudioContext`; thay vào đó, bạn dùng các tính năng của nó thông qua một trong hai giao diện kế thừa này.

`BaseAudioContext` có thể là đích của các sự kiện, do đó nó triển khai giao diện {{domxref("EventTarget")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

- {{domxref("BaseAudioContext.audioWorklet")}} {{ReadOnlyInline}} {{securecontext_inline}}
  - : Trả về đối tượng {{domxref("AudioWorklet")}}, có thể dùng để tạo và quản lý các {{domxref("AudioNode")}} trong đó mã JavaScript triển khai giao diện {{domxref("AudioWorkletProcessor")}} chạy nền để xử lý dữ liệu âm thanh.
- {{domxref("BaseAudioContext.currentTime")}} {{ReadOnlyInline}}
  - : Trả về một số double biểu diễn thời gian phần cứng bằng giây, luôn tăng dần và được dùng để lập lịch. Nó bắt đầu từ `0`.
- {{domxref("BaseAudioContext.destination")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("AudioDestinationNode")}} biểu diễn đích cuối cùng của mọi âm thanh trong ngữ cảnh. Có thể hiểu nó là thiết bị kết xuất âm thanh.
- {{domxref("BaseAudioContext.listener")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("AudioListener")}}, dùng cho định vị không gian 3D.
- {{domxref("BaseAudioContext.sampleRate")}} {{ReadOnlyInline}}
  - : Trả về một số float biểu diễn tốc độ lấy mẫu (số mẫu mỗi giây) được dùng bởi mọi node trong ngữ cảnh này. Tốc độ lấy mẫu của một {{domxref("AudioContext")}} không thể thay đổi.
- {{domxref("BaseAudioContext.state")}} {{ReadOnlyInline}}
  - : Trả về trạng thái hiện tại của `AudioContext`.

## Phương thức thể hiện

_Cũng triển khai các phương thức từ giao diện_ {{domxref("EventTarget")}}.

- {{domxref("BaseAudioContext.createAnalyser()")}}
  - : Tạo một {{domxref("AnalyserNode")}}, có thể dùng để phơi bày dữ liệu âm thanh theo miền thời gian và tần số, chẳng hạn để tạo trực quan hóa dữ liệu.
- {{domxref("BaseAudioContext.createBiquadFilter()")}}
  - : Tạo một {{domxref("BiquadFilterNode")}}, biểu diễn bộ lọc bậc hai có thể cấu hình thành nhiều kiểu bộ lọc thông dụng khác nhau: high-pass, low-pass, band-pass, v.v.
- {{domxref("BaseAudioContext.createBuffer()")}}
  - : Tạo một đối tượng {{ domxref("AudioBuffer") }} mới, rỗng, sau đó có thể nạp dữ liệu vào và phát qua {{ domxref("AudioBufferSourceNode") }}.
- {{domxref("BaseAudioContext.createBufferSource()")}}
  - : Tạo một {{domxref("AudioBufferSourceNode")}}, có thể dùng để phát và thao tác dữ liệu âm thanh chứa trong một đối tượng {{ domxref("AudioBuffer") }}. Các {{ domxref("AudioBuffer") }} được tạo bằng {{domxref("BaseAudioContext/createBuffer", "AudioContext.createBuffer()")}} hoặc được trả về bởi {{domxref("BaseAudioContext/decodeAudioData", "AudioContext.decodeAudioData()")}} khi giải mã thành công một track âm thanh.
- {{domxref("BaseAudioContext.createConstantSource()")}}
  - : Tạo một đối tượng {{domxref("ConstantSourceNode")}}, là một nguồn âm thanh liên tục xuất tín hiệu âm thanh đơn âm (một kênh) mà mọi mẫu đều có cùng một giá trị.
- {{domxref("BaseAudioContext.createChannelMerger()")}}
  - : Tạo một {{domxref("ChannelMergerNode")}}, dùng để kết hợp các kênh từ nhiều luồng âm thanh thành một luồng âm thanh duy nhất.
- {{domxref("BaseAudioContext.createChannelSplitter()")}}
  - : Tạo một {{domxref("ChannelSplitterNode")}}, dùng để truy cập từng kênh riêng lẻ của một luồng âm thanh và xử lý chúng riêng biệt.
- {{domxref("BaseAudioContext.createConvolver()")}}
  - : Tạo một {{domxref("ConvolverNode")}}, có thể dùng để áp dụng các hiệu ứng tích chập lên đồ thị âm thanh của bạn, ví dụ như hiệu ứng hồi âm.
- {{domxref("BaseAudioContext.createDelay()")}}
  - : Tạo một {{domxref("DelayNode")}}, dùng để làm trễ tín hiệu âm thanh đầu vào một khoảng thời gian nhất định. Node này cũng hữu ích để tạo vòng lặp phản hồi trong đồ thị Web Audio API.
- {{domxref("BaseAudioContext.createDynamicsCompressor()")}}
  - : Tạo một {{domxref("DynamicsCompressorNode")}}, có thể dùng để áp dụng nén âm học lên tín hiệu âm thanh.
- {{domxref("BaseAudioContext.createGain()")}}
  - : Tạo một {{domxref("GainNode")}}, có thể dùng để điều khiển âm lượng tổng thể của đồ thị âm thanh.
- {{domxref("BaseAudioContext.createIIRFilter()")}}
  - : Tạo một {{domxref("IIRFilterNode")}}, biểu diễn một bộ lọc bậc hai có thể cấu hình thành nhiều kiểu bộ lọc thông dụng khác nhau.
- {{domxref("BaseAudioContext.createOscillator()")}}
  - : Tạo một {{domxref("OscillatorNode")}}, một nguồn biểu diễn dạng sóng tuần hoàn. Về cơ bản, nó tạo ra một âm sắc.
- {{domxref("BaseAudioContext.createPanner()")}}
  - : Tạo một {{domxref("PannerNode")}}, dùng để định vị không gian cho một luồng âm thanh đầu vào trong không gian 3D.
- {{domxref("BaseAudioContext.createPeriodicWave()")}}
  - : Tạo một {{domxref("PeriodicWave")}}, dùng để định nghĩa một dạng sóng tuần hoàn có thể được dùng để xác định đầu ra của một {{ domxref("OscillatorNode") }}.
- {{domxref("BaseAudioContext.createScriptProcessor()")}} {{deprecated_inline}}
  - : Tạo một {{domxref("ScriptProcessorNode")}}, có thể dùng để xử lý âm thanh trực tiếp bằng JavaScript.
- {{domxref("BaseAudioContext.createStereoPanner()")}}
  - : Tạo một {{domxref("StereoPannerNode")}}, có thể dùng để áp dụng hiệu ứng panning stereo cho một nguồn âm thanh.
- {{domxref("BaseAudioContext.createWaveShaper()")}}
  - : Tạo một {{domxref("WaveShaperNode")}}, dùng để triển khai các hiệu ứng méo phi tuyến.
- {{domxref("BaseAudioContext.decodeAudioData()")}}
  - : Giải mã bất đồng bộ dữ liệu tệp âm thanh chứa trong một {{jsxref("ArrayBuffer")}}. Trong trường hợp này, `ArrayBuffer` thường được tải từ thuộc tính `response` của {{domxref("XMLHttpRequest")}} sau khi đặt `responseType` thành `arraybuffer`. Phương thức này chỉ hoạt động với tệp hoàn chỉnh, không phải các mảnh của tệp âm thanh.

## Sự kiện

- {{domxref("BaseAudioContext.statechange_event", "statechange")}}
  - : Kích hoạt khi trạng thái của `AudioContext` thay đổi do gọi một trong các phương thức đổi trạng thái ({{domxref("AudioContext.suspend")}}, {{domxref("AudioContext.resume")}}, hoặc {{domxref("AudioContext.close")}}).

## Ví dụ

```js
const audioContext = new AudioContext();

const oscillatorNode = audioContext.createOscillator();
const gainNode = audioContext.createGain();
const finish = audioContext.destination;
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- {{domxref("AudioContext")}}
- {{domxref("OfflineAudioContext")}}
