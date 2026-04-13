---
title: "AudioBufferSourceNode: phương thức start()"
short-title: start()
slug: Web/API/AudioBufferSourceNode/start
page-type: web-api-instance-method
browser-compat: api.AudioBufferSourceNode.start
---

{{ APIRef("Web Audio API") }}

Phương thức `start()` của giao diện {{ domxref("AudioBufferSourceNode") }} được dùng để lên lịch phát dữ liệu âm thanh chứa trong bộ đệm, hoặc bắt đầu phát ngay lập tức.

## Cú pháp

```js-nolint
start(when)
start(when, offset)
start(when, offset, duration)
```

### Tham số

- `when` {{optional_inline}}
  - : Thời điểm, tính bằng giây, mà âm thanh nên bắt đầu phát, trong cùng hệ tọa độ thời gian được dùng bởi {{domxref("AudioContext")}}. Nếu `when` nhỏ hơn {{domxref("BaseAudioContext/currentTime", "AudioContext.currentTime")}}, hoặc nếu bằng 0, âm thanh sẽ bắt đầu phát ngay. **Giá trị mặc định là 0.**
- `offset` {{optional_inline}}
  - : Một độ lệch, được chỉ định theo số giây trong cùng hệ tọa độ thời gian như `AudioContext`, tới thời điểm bên trong bộ đệm âm thanh mà việc phát nên bắt đầu. Ví dụ, để bắt đầu phát từ giữa một đoạn âm thanh dài 10 giây, `offset` nên là 5. Giá trị mặc định 0 sẽ bắt đầu phát từ đầu bộ đệm âm thanh, và các độ lệch vượt quá phần cuối của âm thanh sẽ được phát (dựa trên {{domxref("AudioBuffer.duration", "duration")}} của bộ đệm âm thanh và/hoặc thuộc tính {{domxref("AudioBufferSourceNode.loopEnd", "loopEnd")}}) sẽ bị giới hạn âm thầm về giá trị tối đa cho phép. Việc tính toán độ lệch vào âm thanh được thực hiện bằng tốc độ lấy mẫu tự nhiên của bộ đệm âm thanh, thay vì tốc độ phát hiện tại, nên ngay cả khi âm thanh đang phát ở tốc độ gấp đôi bình thường, điểm giữa của một bộ đệm âm thanh dài 10 giây vẫn là 5.
- `duration` {{optional_inline}}
  - : Thời lượng của dữ liệu âm thanh sẽ được phát, được chỉ định là số giây của toàn bộ nội dung bộ đệm.
    Nếu tham số này không được chỉ định, âm thanh sẽ phát cho tới khi tới kết thúc tự nhiên của nó hoặc
    bị dừng bằng phương thức {{domxref("AudioScheduledSourceNode.stop", "stop()")}}. Giá trị này
    độc lập với {{domxref("AudioBufferSourceNode.playbackRate")}}, vì vậy ví dụ
    `duration` bằng 2 giây với `playbackRate` bằng `2` sẽ phát 2 giây của nguồn,
    tạo ra đầu ra âm thanh dài 1 giây.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu một giá trị âm được chỉ định cho một hoặc nhiều trong ba tham số thời gian. Xin đừng cố can thiệp vào các định luật vật lý thời gian.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `start()` đã được gọi trước đó. Bạn chỉ có thể gọi hàm này một lần trong vòng đời của một `AudioBufferSourceNode`.

## Ví dụ

Ví dụ đơn giản nhất chỉ bắt đầu phát bộ đệm âm thanh từ đầu, trong trường hợp này bạn không cần chỉ định bất kỳ tham số nào:

```js
source.start();
```

Ví dụ phức tạp hơn dưới đây sẽ bắt đầu phát, sau 1 giây kể từ bây giờ, lượng âm thanh dài 10 giây bắt đầu từ giây thứ 3 trong bộ đệm âm thanh.

```js
source.start(audioCtx.currentTime + 1, 3, 10);
```

> [!NOTE]
> Để xem ví dụ đầy đủ hơn cho thấy `start()` được dùng thế nào, hãy xem ví dụ {{domxref("BaseAudioContext/decodeAudioData", "AudioContext.decodeAudioData()")}} của chúng tôi. Bạn cũng có thể [thử ví dụ trực tiếp](https://mdn.github.io/webaudio-examples/decode-audio-data/promise/), và xem [mã nguồn ví dụ](https://github.com/mdn/webaudio-examples/tree/main/decode-audio-data).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
