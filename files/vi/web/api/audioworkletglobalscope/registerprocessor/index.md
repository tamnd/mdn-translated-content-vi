---
title: "AudioWorkletGlobalScope: phương thức registerProcessor()"
short-title: registerProcessor()
slug: Web/API/AudioWorkletGlobalScope/registerProcessor
page-type: web-api-instance-method
browser-compat: api.AudioWorkletGlobalScope.registerProcessor
---

{{ APIRef("Web Audio API") }}

Phương thức **`registerProcessor`** của giao diện
{{domxref("AudioWorkletGlobalScope")}} đăng ký hàm khởi tạo của một lớp kế thừa từ
giao diện {{domxref("AudioWorkletProcessor")}} dưới một _tên_ xác định.

## Cú pháp

```js-nolint
registerProcessor(name, processorCtor)
```

### Tham số

- `name`
  - : Một chuỗi biểu thị tên mà processor sẽ được đăng ký dưới tên đó.
- `processorCtor`
  - : Hàm khởi tạo của một lớp kế thừa từ {{domxref("AudioWorkletProcessor")}}.

> [!NOTE]
> Một cặp khóa-giá trị `{ name: constructor }`
> được lưu nội bộ trong {{domxref("AudioWorkletGlobalScope")}} sau khi processor
> được đăng ký. _Tên_ này sẽ được tham chiếu tới khi tạo một
> {{domxref("AudioWorkletNode")}} dựa trên processor đã đăng ký. Một processor mới với
> tên đã cho sẽ được tạo nội bộ và liên kết với node mới.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra trong các điều kiện sau:
    - _name_ là một chuỗi rỗng.
    - Một hàm khởi tạo với _name_ đã cho đã được đăng ký trước đó. Không được phép đăng ký cùng một tên hai lần.

- {{jsxref("TypeError")}}
  - : Được ném ra trong các điều kiện sau:
    - _processorCtor_ không phải là một hàm khởi tạo có thể gọi được.
    - Thuộc tính {{domxref("AudioWorkletProcessor.parameterDescriptors", "parameterDescriptors")}} của hàm khởi tạo tồn tại nhưng không trả về một mảng các đối tượng dựa trên {{domxref("AudioParamDescriptor")}}.

## Ví dụ

Trong ví dụ này, chúng ta tạo một `AudioWorkletNode` tùy chỉnh để xuất ra sự im lặng.

Trước tiên, chúng ta cần định nghĩa một {{domxref("AudioWorkletProcessor")}} tùy chỉnh và đăng ký nó.
Lưu ý rằng việc này nên được thực hiện trong một tệp riêng.

```js
// test-processor.js
class TestProcessor extends AudioWorkletProcessor {
  process(inputs, outputs, parameters) {
    return true;
  }
}

registerProcessor("test-processor", TestProcessor);
```

Tiếp theo, trong tệp kịch bản chính, chúng ta sẽ tải processor, tạo một thể hiện của
`AudioWorkletNode`, truyền cho nó tên processor mà chúng ta đã dùng khi gọi
`registerProcessor`, rồi kết nối nó vào một đồ thị âm thanh.

```js
const audioContext = new AudioContext();
await audioContext.audioWorklet.addModule("test-processor.js");
const node = new AudioWorkletNode(audioContext, "test-processor");
node.connect(audioContext.destination);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
