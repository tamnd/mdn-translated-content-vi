---
title: "AudioScheduledSourceNode: phương thức stop()"
short-title: stop()
slug: Web/API/AudioScheduledSourceNode/stop
page-type: web-api-instance-method
browser-compat: api.AudioScheduledSourceNode.stop
---

{{ APIRef("Web Audio API") }}

Phương thức `stop()` của {{domxref("AudioScheduledSourceNode")}} lên lịch để một
âm thanh ngừng phát tại thời điểm được chỉ định. Nếu không chỉ định thời gian, âm thanh
sẽ dừng phát ngay lập tức.

Mỗi lần bạn gọi `stop()` trên cùng một nút, thời điểm được chỉ định sẽ thay thế
bất kỳ thời điểm dừng đã được lên lịch trước đó nhưng vẫn chưa xảy ra. Nếu nút đã
dừng, phương thức này sẽ không có tác dụng.

> [!NOTE]
> Nếu thời điểm dừng đã được lên lịch xảy ra trước thời điểm bắt đầu đã được lên lịch của nút,
> nút sẽ không bao giờ bắt đầu phát.

## Cú pháp

```js-nolint
stop()
stop(when)
```

### Tham số

- `when` {{optional_inline}}
  - : Thời điểm, tính bằng giây, mà âm thanh sẽ dừng phát. Giá trị này được
    chỉ định trong cùng hệ tọa độ thời gian mà {{domxref("AudioContext")}} đang
    dùng cho thuộc tính {{domxref("BaseAudioContext/currentTime", "currentTime")}}
    của nó. Bỏ qua tham số này, chỉ định giá trị `0`, hoặc truyền một giá trị âm
    sẽ làm âm thanh dừng phát ngay lập tức.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateNode` {{domxref("DOMException")}}
  - : Được ném ra nếu nút chưa được khởi động bằng cách gọi {{domxref("AudioScheduledSourceNode.start", "start()")}}.
- {{jsxref("RangeError")}}
  - : Được ném ra nếu giá trị được chỉ định cho `when` là số âm.

## Ví dụ

Ví dụ này minh họa việc khởi động một nút dao động, được lên lịch để bắt đầu phát ngay lập tức và dừng phát sau một giây. Thời điểm dừng được xác định bằng cách lấy thời gian hiện tại của ngữ cảnh âm thanh từ {{domxref("BaseAudioContext/currentTime", "AudioContext.currentTime")}} rồi cộng thêm 1 giây.

```js
context = new AudioContext();
osc = context.createOscillator();
osc.connect(context.destination);

/* Hãy phát một sóng sin trong một giây. */

osc.start();
osc.stop(context.currentTime + 1);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- {{domxref("AudioScheduledSourceNode.start", "start()")}}
- {{domxref("AudioScheduledSourceNode")}}
- {{domxref("AudioBufferSourceNode")}}
- {{domxref("ConstantSourceNode")}}
- {{domxref("OscillatorNode")}}
