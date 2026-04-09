---
title: "AudioWorkletNode: thuộc tính port"
short-title: port
slug: Web/API/AudioWorkletNode/port
page-type: web-api-instance-property
browser-compat: api.AudioWorkletNode.port
---

{{APIRef("Web Audio API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`port`** của giao diện {{domxref("AudioWorkletNode")}} trả về {{domxref("MessagePort")}} liên kết. Nó có thể được dùng để giao tiếp giữa nút và {{domxref("AudioWorkletProcessor")}} liên kết của nút đó.

> [!NOTE]
> Cổng ở đầu còn lại của kênh có sẵn qua thuộc tính {{domxref("AudioWorkletProcessor.port", "port")}} của processor.

## Giá trị

Đối tượng {{domxref("MessagePort")}} kết nối `AudioWorkletNode` với `AudioWorkletProcessor` liên kết của nó.

## Ví dụ

Để minh họa khả năng giao tiếp hai chiều, chúng ta sẽ tạo một `AudioWorkletProcessor` xuất ra sự im lặng và phản hồi các yêu cầu ping từ `AudioWorkletNode` của nó.

Trước tiên, chúng ta cần định nghĩa một `AudioWorkletProcessor` tùy chỉnh và đăng ký nó. Lưu ý rằng việc này nên được thực hiện trong một tệp riêng.

```js
// ping-pong-processor.js
class PingPongProcessor extends AudioWorkletProcessor {
  constructor(...args) {
    super(...args);
    this.port.onmessage = (e) => {
      console.log(e.data);
      this.port.postMessage("pong");
    };
  }
  process(inputs, outputs, parameters) {
    return true;
  }
}

registerProcessor("ping-pong-processor", PingPongProcessor);
```

Bây giờ, trong tệp kịch bản chính, chúng ta sẽ tải processor, tạo một thể hiện `AudioWorkletNode` bằng cách truyền tên của processor, rồi kết nối nút đó vào một đồ thị âm thanh.

```js
const audioContext = new AudioContext();
await audioContext.audioWorklet.addModule("ping-pong-processor.js");
const pingPongNode = new AudioWorkletNode(audioContext, "ping-pong-processor");
// send the message containing 'ping' string
// to the AudioWorkletProcessor from the AudioWorkletNode every second
setInterval(() => pingPongNode.port.postMessage("ping"), 1000);
pingPongNode.port.onmessage = (e) => console.log(e.data);
pingPongNode.connect(audioContext.destination);
```

Điều này sẽ xuất các chuỗi `"ping"` và `"pong"` ra bảng điều khiển sau mỗi giây.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Web Audio API](/en-US/docs/Web/API/Web_Audio_API)
- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
