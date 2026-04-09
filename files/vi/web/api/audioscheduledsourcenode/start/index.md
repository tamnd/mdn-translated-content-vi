---
title: "AudioScheduledSourceNode: phương thức start()"
short-title: start()
slug: Web/API/AudioScheduledSourceNode/start
page-type: web-api-instance-method
browser-compat: api.AudioScheduledSourceNode.start
---

{{APIRef("Web Audio API")}}

Phương thức `start()` của {{domxref("AudioScheduledSourceNode")}} lên lịch để một âm thanh bắt đầu phát tại thời điểm được chỉ định.
Nếu không chỉ định thời gian, âm thanh sẽ bắt đầu phát ngay lập tức.

## Cú pháp

```js-nolint
start()
start(when)
```

### Tham số

- `when` {{optional_inline}}
  - : Thời điểm, tính bằng giây, mà âm thanh sẽ bắt đầu phát. Giá trị này được
    chỉ định trong cùng hệ tọa độ thời gian mà {{domxref("AudioContext")}} dùng
    cho thuộc tính {{domxref("BaseAudioContext/currentTime", "currentTime")}} của
    nó. Giá trị `0` (hoặc bỏ qua hoàn toàn tham số `when`) sẽ làm âm thanh bắt
    đầu phát ngay lập tức.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateNode` {{domxref("DOMException")}}
  - : Được ném ra nếu nút đã được khởi động trước đó. Lỗi này xảy ra ngay cả khi
    nút không còn chạy nữa do một lần gọi trước đó tới
    {{domxref("AudioScheduledSourceNode.stop", "stop()")}}.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu giá trị được chỉ định cho `when` là số âm.

## Ví dụ

Ví dụ này minh họa cách tạo một {{domxref("OscillatorNode")}} được lên lịch để bắt đầu phát sau 2 giây và dừng phát sau đó 1 giây. Các mốc thời gian được tính bằng cách cộng số giây mong muốn vào dấu thời gian hiện tại của ngữ cảnh trả về bởi {{domxref("BaseAudioContext/currentTime", "AudioContext.currentTime")}}.

```js
context = new AudioContext();
osc = context.createOscillator();
osc.connect(context.destination);

/* Lên lịch thời điểm bắt đầu và dừng cho bộ dao động */

osc.start(context.currentTime + 2);
osc.stop(context.currentTime + 3);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- {{domxref("AudioScheduledSourceNode.stop", "stop()")}}
- {{domxref("AudioScheduledSourceNode")}}
- {{domxref("AudioBufferSourceNode")}}
- {{domxref("ConstantSourceNode")}}
- {{domxref("OscillatorNode")}}
