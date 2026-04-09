---
title: AudioWorkletProcessor
slug: Web/API/AudioWorkletProcessor
page-type: web-api-interface
browser-compat: api.AudioWorkletProcessor
---

{{APIRef("Web Audio API")}}

Giao diện **`AudioWorkletProcessor`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) biểu diễn mã xử lý âm thanh đứng sau một {{domxref("AudioWorkletNode")}} tùy chỉnh. Nó tồn tại trong {{domxref("AudioWorkletGlobalScope")}} và chạy trên luồng kết xuất của Web Audio. Ngược lại, một {{domxref("AudioWorkletNode")}} dựa trên nó sẽ chạy trên luồng chính.

## Hàm khởi tạo

> [!NOTE]
> Không thể khởi tạo trực tiếp `AudioWorkletProcessor` và các lớp kế thừa từ nó từ mã do người dùng cung cấp. Thay vào đó, chúng chỉ được tạo nội bộ khi một {{domxref("AudioWorkletNode")}} liên kết được tạo ra. Hàm khởi tạo của lớp dẫn xuất được gọi với một đối tượng tùy chọn, nên bạn có thể thực hiện quy trình khởi tạo tùy chỉnh; xem trang hàm khởi tạo để biết chi tiết.

- {{domxref("AudioWorkletProcessor.AudioWorkletProcessor", "AudioWorkletProcessor()")}}
  - : Tạo một thể hiện mới của đối tượng `AudioWorkletProcessor`.

## Thuộc tính thể hiện

- {{domxref("AudioWorkletProcessor.port", "port")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("MessagePort")}} dùng cho giao tiếp hai chiều giữa bộ xử lý và {{domxref("AudioWorkletNode")}} mà nó thuộc về. Đầu còn lại có sẵn qua thuộc tính {{domxref("AudioWorkletNode.port", "port")}} của nút.

## Phương thức thể hiện

_Giao diện `AudioWorkletProcessor` không tự định nghĩa phương thức nào. Tuy nhiên, bạn phải cung cấp phương thức {{domxref("AudioWorkletProcessor.process", "process()")}}, được gọi để xử lý luồng âm thanh._

## Sự kiện

_Giao diện `AudioWorkletProcessor` không phản hồi sự kiện nào._

## Ghi chú sử dụng

### Các lớp dẫn xuất

Để định nghĩa mã xử lý âm thanh tùy chỉnh, bạn phải tạo một lớp kế thừa từ giao diện `AudioWorkletProcessor`. Dù không được định nghĩa trên chính giao diện, lớp dẫn xuất bắt buộc phải có phương thức {{domxref("AudioWorkletProcessor.process", "process")}}. Phương thức này được gọi cho mỗi khối gồm 128 khung mẫu và nhận các mảng đầu vào, đầu ra cùng các giá trị đã tính của các {{domxref("AudioParam")}} tùy chỉnh làm tham số nếu chúng được định nghĩa. Bạn có thể dùng đầu vào và các giá trị tham số âm thanh để điền vào mảng đầu ra, vốn mặc định chứa im lặng.

Ngoài ra, nếu muốn có các {{domxref("AudioParam")}} tùy chỉnh trên nút của mình, bạn có thể cung cấp thuộc tính {{domxref("AudioWorkletProcessor.parameterDescriptors", "parameterDescriptors")}} dưới dạng một _getter tĩnh_ trên processor. Mảng các đối tượng dựa trên {{domxref("AudioParamDescriptor")}} được trả về sẽ được dùng nội bộ để tạo các {{domxref("AudioParam")}} trong quá trình khởi tạo `AudioWorkletNode`.

Các `AudioParam` thu được nằm trong thuộc tính {{domxref("AudioWorkletNode.parameters", "parameters")}} của nút và có thể được tự động hóa bằng các phương thức tiêu chuẩn như [`linearRampToValueAtTime`](/en-US/docs/Web/API/AudioParam/linearRampToValueAtTime). Các giá trị đã tính của chúng sẽ được truyền vào phương thức {{domxref("AudioWorkletProcessor.process", "process()")}} của processor để bạn điều chỉnh đầu ra của nút cho phù hợp.

### Xử lý âm thanh

Một thuật toán mẫu để tạo cơ chế xử lý âm thanh tùy chỉnh là:

1. Tạo một tệp riêng.
2. Trong tệp đó:
   1. Mở rộng lớp `AudioWorkletProcessor` (xem [phần "Các lớp dẫn xuất"](#các_lớp_dẫn_xuất)) và cung cấp phương thức {{domxref("AudioWorkletProcessor.process", "process()")}} của riêng bạn trong đó.
   2. Đăng ký processor bằng phương thức {{domxref("AudioWorkletGlobalScope.registerProcessor()")}}.
3. Tải tệp bằng phương thức {{domxref("Worklet.addModule", "addModule()")}} trên thuộc tính {{domxref("BaseAudioContext.audioWorklet", "audioWorklet")}} của ngữ cảnh âm thanh.
4. Tạo một {{domxref("AudioWorkletNode")}} dựa trên processor. Processor sẽ được khởi tạo nội bộ bởi hàm khởi tạo `AudioWorkletNode`.
5. Kết nối nút với các nút khác.

## Ví dụ

Trong ví dụ bên dưới, chúng ta tạo một {{domxref("AudioWorkletNode")}} tùy chỉnh tạo ra nhiễu trắng.

Trước hết, chúng ta cần định nghĩa một `AudioWorkletProcessor` tùy chỉnh sẽ tạo ra nhiễu trắng và đăng ký nó. Lưu ý rằng việc này nên được thực hiện trong một tệp riêng.

```js
// white-noise-processor.js
class WhiteNoiseProcessor extends AudioWorkletProcessor {
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

registerProcessor("white-noise-processor", WhiteNoiseProcessor);
```

Tiếp theo, trong tệp script chính, chúng ta sẽ tải processor, tạo một thể hiện của {{domxref("AudioWorkletNode")}} bằng cách truyền vào tên của processor, rồi kết nối nút đó với một đồ thị âm thanh.

```js
const audioContext = new AudioContext();
await audioContext.audioWorklet.addModule("white-noise-processor.js");
const whiteNoiseNode = new AudioWorkletNode(
  audioContext,
  "white-noise-processor",
);
whiteNoiseNode.connect(audioContext.destination);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Sử dụng AudioWorklet](/en-US/docs/Web/API/Web_Audio_API/Using_AudioWorklet)
