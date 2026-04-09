---
title: "AudioWorkletProcessor: hàm khởi tạo AudioWorkletProcessor()"
short-title: AudioWorkletProcessor()
slug: Web/API/AudioWorkletProcessor/AudioWorkletProcessor
page-type: web-api-constructor
browser-compat: api.AudioWorkletProcessor.AudioWorkletProcessor
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`AudioWorkletProcessor()`** tạo một đối tượng {{domxref("AudioWorkletProcessor")}} mới, đối tượng này biểu diễn cơ chế xử lý âm thanh nền tảng của một {{domxref("AudioWorkletNode")}}.

> [!NOTE]
> Không thể khởi tạo trực tiếp `AudioWorkletProcessor` và các lớp kế thừa từ nó từ mã do người dùng cung cấp. Thay vào đó, chúng chỉ được tạo nội bộ khi một {{domxref("AudioWorkletNode")}} liên kết được tạo ra.

## Cú pháp

```js-nolint
new AudioWorkletProcessor(options)
```

### Tham số

- `options`
  - : Một đối tượng được truyền làm tham số _options_ cho hàm khởi tạo {{domxref("AudioWorkletNode.AudioWorkletNode", "AudioWorkletNode()")}} và được chuyển qua [thuật toán structured clone](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm). Các thuộc tính có sẵn như sau:

    <!-- The specification refers to this object as: AudioWorkletNodeOptions -->
    - `numberOfInputs` {{optional_inline}}
      - : Giá trị dùng để khởi tạo thuộc tính {{domxref("AudioNode.numberOfInputs", "numberOfInputs")}}. Mặc định là 1.
    - `numberOfOutputs` {{optional_inline}}
      - : Giá trị dùng để khởi tạo thuộc tính {{domxref("AudioNode.numberOfOutputs", "numberOfOutputs")}}. Mặc định là 1.
    - `outputChannelCount` {{optional_inline}}
      - : Một **mảng** xác định số lượng kênh cho từng đầu ra. Ví dụ, _outputChannelCount: \[n, m]_ chỉ định số kênh của đầu ra thứ nhất là _n_ và của đầu ra thứ hai là _m_. Độ dài của mảng phải khớp với `numberOfOutputs`.
    - `parameterData` {{optional_inline}}
      - : Một đối tượng chứa các giá trị khởi tạo của các đối tượng {{domxref("AudioParam")}} tùy chỉnh trên nút này (trong thuộc tính {{domxref("AudioWorkletNode.parameters", "parameters")}} của nó), trong đó `key` là tên của tham số tùy chỉnh và `value` là giá trị khởi tạo của tham số đó.
    - `processorOptions` {{optional_inline}}
      - : Bất kỳ dữ liệu bổ sung nào có thể được dùng để khởi tạo tùy chỉnh cho {{domxref("AudioWorkletProcessor")}} nền tảng.

    Lưu ý rằng hai thuộc tính đầu tiên có giá trị mặc định, nên ngay cả khi không truyền đối tượng _options_ cho hàm khởi tạo {{domxref("AudioWorkletNode.AudioWorkletNode", "AudioWorkletNode()")}}, đối tượng _options_ mà nút truyền cho hàm khởi tạo `AudioWorkletProcessor` vẫn sẽ tồn tại và tối thiểu có `numberOfInputs` cùng `numberOfOutputs`.

### Giá trị trả về

Thể hiện {{domxref("AudioWorkletProcessor")}} mới được tạo.

## Ví dụ

Trong ví dụ này, chúng ta truyền các tùy chọn tùy chỉnh cho hàm khởi tạo {{domxref("AudioWorkletNode.AudioWorkletNode", "AudioWorkletNode()")}} và quan sát cách một [structured clone](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm) của chúng được truyền vào hàm khởi tạo `AudioWorkletProcessor`.

Trước hết, chúng ta cần định nghĩa một {{domxref("AudioWorkletProcessor")}} tùy chỉnh và đăng ký nó. Lưu ý rằng việc này nên được thực hiện trong một tệp riêng.

```js
// test-processor.js
class TestProcessor extends AudioWorkletProcessor {
  constructor(options) {
    super();
    console.log(options.numberOfInputs);
    console.log(options.processorOptions.someUsefulVariable);
  }
  process(inputs, outputs, parameters) {
    return true;
  }
}

registerProcessor("test-processor", TestProcessor);
```

Tiếp theo, trong tệp script chính, chúng ta sẽ tải processor, tạo một thể hiện của `AudioWorkletNode` bằng cách truyền vào tên của processor và đối tượng _options_.

Trong đối tượng _options_, chúng ta truyền `processorOptions` với một thể hiện {{jsxref("Map")}} dưới khóa `someUsefulVariable`. Chúng ta không truyền `numberOfInputs` và sẽ thấy nó nhận giá trị mặc định.

```js
const audioContext = new AudioContext();
await audioContext.audioWorklet.addModule("test-processor.js");
const testNode = new AudioWorkletNode(audioContext, "test-processor", {
  processorOptions: {
    someUsefulVariable: new Map([
      [1, "one"],
      [2, "two"],
    ]),
  },
});
```

Đầu ra của console sẽ như sau:

```plain
> 1 // options.numberOfInputs của AudioWorkletNode được đặt thành giá trị mặc định
> Map(2) { 1 => "one", 2 => "two" } // Bản sao của Map dưới someUsefulVariable
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("AudioWorkletNode", "AudioWorkletNode")}}
