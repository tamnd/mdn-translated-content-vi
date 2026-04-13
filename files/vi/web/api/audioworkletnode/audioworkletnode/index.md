---
title: "AudioWorkletNode: hàm tạo AudioWorkletNode()"
short-title: AudioWorkletNode()
slug: Web/API/AudioWorkletNode/AudioWorkletNode
page-type: web-api-constructor
browser-compat: api.AudioWorkletNode.AudioWorkletNode
---

{{APIRef("Web Audio API")}}{{SecureContext_Header}}

Hàm tạo **`AudioWorkletNode()`** tạo một đối tượng {{domxref("AudioWorkletNode")}} mới, biểu diễn một {{domxref("AudioNode")}} sử dụng một hàm JavaScript để thực hiện xử lý âm thanh tùy chỉnh.

## Cú pháp

```js-nolint
new AudioWorkletNode(context, name)
new AudioWorkletNode(context, name, options)
```

### Tham số

- `context`
  - : Thể hiện {{domxref("BaseAudioContext")}} mà nút này sẽ được liên kết với.
- `name`
  - : Một chuỗi biểu diễn tên của {{domxref("AudioWorkletProcessor")}} mà nút này sẽ dựa vào. Một processor với tên được cung cấp phải được đăng ký trước bằng phương thức {{domxref("AudioWorkletGlobalScope.registerProcessor()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chứa không hoặc nhiều thuộc tính tùy chọn sau đây để cấu hình nút mới:

    <!-- The specification refers to this object as: AudioWorkletNodeOptions -->

    > [!NOTE]
    > Kết quả của [thuật toán sao chép có cấu trúc](/en-US/docs/Web/API/Web_Workers_API/Structured_clone_algorithm) áp dụng lên đối tượng này cũng sẽ được truyền nội bộ vào hàm tạo {{domxref("AudioWorkletProcessor.AudioWorkletProcessor", "AudioWorkletProcessor()")}} liên kết, cho phép khởi tạo tùy chỉnh cho {{domxref("AudioWorkletProcessor")}} do người dùng định nghĩa ở tầng dưới.
    - `numberOfInputs` {{optional_inline}}
      - : Giá trị dùng để khởi tạo thuộc tính {{domxref("AudioNode.numberOfInputs", "numberOfInputs")}}. Mặc định là 1.
    - `numberOfOutputs` {{optional_inline}}
      - : Giá trị dùng để khởi tạo thuộc tính {{domxref("AudioNode.numberOfOutputs", "numberOfOutputs")}}. Mặc định là 1.
    - `outputChannelCount` {{optional_inline}}
      - : Một **mảng** xác định số kênh cho mỗi đầu ra. Ví dụ, _outputChannelCount: \[n, m]_ chỉ định số kênh ở đầu ra thứ nhất là _n_ và ở đầu ra thứ hai là _m_. Độ dài mảng phải khớp với `numberOfOutputs`.
    - `parameterData` {{optional_inline}}
      - : Một đối tượng chứa các giá trị ban đầu của các đối tượng {{domxref("AudioParam")}} tùy chỉnh trên nút này (trong thuộc tính {{domxref("AudioWorkletNode.parameters", "parameters")}} của nó), trong đó `key` là tên của tham số tùy chỉnh và `value` là giá trị ban đầu của tham số đó.
    - `processorOptions` {{optional_inline}}
      - : Bất kỳ dữ liệu bổ sung nào có thể được dùng để khởi tạo tùy chỉnh cho {{domxref("AudioWorkletProcessor")}} cơ sở.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : `options.outputChannelCount` được chỉ định là `0` hoặc lớn hơn mức mà cách triển khai hiện tại hỗ trợ.

    Cả `options.numberOfInputs` và `options.numberOfOutputs` đều bằng 0.

- `IndexSizeError` {{domxref("DOMException")}}
  - : Độ dài của mảng `options.outputChannelCount` không khớp với `options.numberOfOutputs`.

## Lưu ý sử dụng

Các giá trị khác nhau của tham số `options` có thể dẫn đến những tác động sau.

Nếu cả số lượng đầu vào và số lượng đầu ra đều được đặt thành 0, một `NotSupportedError` sẽ được ném ra và quá trình tạo nút bị hủy. Nếu độ dài của mảng `outputChannelCount` không khớp với `numberOfOutputs`, một {{domxref("DOMException")}} kiểu `IndexSizeError` sẽ được ném ra.

Nếu `outputChannelCount` không được chỉ định, đồng thời `numberOfInputs` và `numberOfOutputs` đều bằng 1, số lượng kênh ban đầu của `AudioWorkletNode` sẽ được đặt thành 1. Điều này khiến số lượng kênh đầu ra thay đổi động theo số lượng kênh đã tính toán được, dựa trên số lượng kênh đầu vào và thiết lập hiện tại của thuộc tính {{domxref("AudioNode.channelCountMode", "channelCountMode")}} của {{domxref("AudioNode")}}.

Ngược lại, nếu `outputChannelCount` được cung cấp _và_ `numberOfInputs` và `numberOfOutputs` đều bằng 1, số lượng kênh của audio worklet node sẽ được đặt thành giá trị của `outputChannelCount`. Trong các trường hợp khác, số lượng kênh của từng kênh trong tập các kênh đầu ra sẽ được đặt khớp với giá trị tương ứng trong mảng `outputChannelCount`.

## Ví dụ

_Để xem một ví dụ đầy đủ minh họa việc xử lý âm thanh do người dùng định nghĩa, hãy xem trang {{domxref("AudioWorkletNode")}}._

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Xử lý âm thanh nền bằng AudioWorklet](/en-US/docs/Web/API/Web_Audio_API/Using_AudioWorklet)
- Giao diện {{domxref("AudioWorkletNode", "AudioWorkletNode")}}
