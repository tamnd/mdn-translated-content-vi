---
title: AudioParam
slug: Web/API/AudioParam
page-type: web-api-interface
browser-compat: api.AudioParam
---

{{APIRef("Web Audio API")}}

Giao diện `AudioParam` của Web Audio API biểu diễn một tham số liên quan đến âm thanh, thường là tham số của một {{domxref("AudioNode")}} (chẳng hạn như {{ domxref("GainNode.gain") }}).

Một `AudioParam` có thể được đặt thành một giá trị cụ thể hoặc một thay đổi giá trị, và có thể được lên lịch để xảy ra vào một thời điểm xác định theo một mẫu xác định.

Mỗi `AudioParam` có một danh sách sự kiện, ban đầu rỗng, xác định khi nào và bằng cách nào các giá trị thay đổi. Khi danh sách này không rỗng, các thay đổi bằng thuộc tính `AudioParam.value` sẽ bị bỏ qua. Danh sách sự kiện này cho phép chúng ta lên lịch các thay đổi cần diễn ra ở những thời điểm cực kỳ chính xác, bằng cách dùng các đường cong tự động hóa dựa trên dòng thời gian tùy ý. Thời gian được dùng là thời gian được định nghĩa trong {{domxref("BaseAudioContext/currentTime", "AudioContext.currentTime")}}.

## Các loại AudioParam

Có hai kiểu `AudioParam`: tham số _a-rate_ và _k-rate_. Mỗi {{domxref("AudioNode")}} định nghĩa trong đặc tả tham số nào của nó là _a-rate_ hoặc _k-rate_.

### a-rate

Một `AudioParam` _a-rate_ lấy giá trị tham số âm thanh hiện tại cho từng [khung mẫu](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#audio_buffers_frames_samples_and_channels) của tín hiệu âm thanh.

### k-rate

Một `AudioParam` _k-rate_ dùng cùng một giá trị tham số âm thanh ban đầu cho toàn bộ khối đang được xử lý; tức là 128 khung mẫu. Nói cách khác, cùng một giá trị được áp dụng cho mọi khung âm thanh khi nút xử lý chúng.

## Thuộc tính thể hiện

- {{domxref("AudioParam.defaultValue")}} {{ReadOnlyInline}}
  - : Biểu diễn giá trị ban đầu của thuộc tính như được định nghĩa bởi {{domxref("AudioNode")}} cụ thể đã tạo ra `AudioParam`.
- {{domxref("AudioParam.maxValue")}} {{ReadOnlyInline}}
  - : Biểu diễn giá trị lớn nhất có thể có đối với phạm vi danh nghĩa (hiệu dụng) của tham số.
- {{domxref("AudioParam.minValue")}} {{ReadOnlyInline}}
  - : Biểu diễn giá trị nhỏ nhất có thể có đối với phạm vi danh nghĩa (hiệu dụng) của tham số.
- {{domxref("AudioParam.value")}}
  - : Biểu diễn giá trị hiện tại của tham số tại thời điểm hiện tại; ban đầu được đặt bằng giá trị của {{domxref("AudioParam.defaultValue", "defaultValue")}}.

## Phương thức thể hiện

- {{domxref("AudioParam.setValueAtTime()")}}
  - : Lên lịch một thay đổi tức thời đối với giá trị của `AudioParam` tại một thời điểm chính xác, được đo dựa trên {{domxref("BaseAudioContext/currentTime", "AudioContext.currentTime")}}. Giá trị mới được cung cấp bởi tham số `value`.
- {{domxref("AudioParam.linearRampToValueAtTime()")}}
  - : Lên lịch một thay đổi tuyến tính dần dần cho giá trị của `AudioParam`. Thay đổi bắt đầu tại thời điểm được chỉ định cho sự kiện _trước đó_, đi theo một đường dốc tuyến tính đến giá trị mới được cung cấp trong tham số `value`, và đạt đến giá trị mới tại thời điểm được chỉ định bởi tham số `endTime`.
- {{domxref("AudioParam.exponentialRampToValueAtTime()")}}
  - : Lên lịch một thay đổi hàm mũ dần dần cho giá trị của `AudioParam`. Thay đổi bắt đầu tại thời điểm được chỉ định cho sự kiện _trước đó_, đi theo một đường dốc hàm mũ đến giá trị mới được cung cấp trong tham số `value`, và đạt đến giá trị mới tại thời điểm được chỉ định bởi tham số `endTime`.
- {{domxref("AudioParam.setTargetAtTime()")}}
  - : Lên lịch bắt đầu một thay đổi đối với giá trị của `AudioParam`. Thay đổi bắt đầu tại thời điểm được chỉ định trong `startTime` và di chuyển theo hàm mũ về phía giá trị được cung cấp bởi tham số `target`. Tốc độ suy giảm theo hàm mũ được xác định bởi tham số `timeConstant`, là một khoảng thời gian tính bằng giây.
- {{domxref("AudioParam.setValueCurveAtTime()")}}
  - : Lên lịch để các giá trị của `AudioParam` đi theo một tập các giá trị, được định nghĩa bằng một mảng số thực dấu chấm động được co giãn để khớp vào khoảng đã cho, bắt đầu tại một thời điểm bắt đầu xác định và kéo dài trong một khoảng thời gian xác định.
- {{domxref("AudioParam.cancelScheduledValues()")}}
  - : Hủy mọi thay đổi trong tương lai đã được lên lịch cho `AudioParam`.
- {{domxref("AudioParam.cancelAndHoldAtTime()")}}
  - : Hủy mọi thay đổi trong tương lai đã được lên lịch cho `AudioParam` nhưng giữ nguyên giá trị của nó tại một thời điểm nhất định cho đến khi có thay đổi tiếp theo bằng các phương thức khác.

## Ví dụ

Đầu tiên là một ví dụ cơ bản cho thấy một {{domxref("GainNode")}} được đặt giá trị `gain`. `gain` là một ví dụ về `AudioParam` _a-rate_, vì giá trị này có thể được đặt khác nhau cho từng khung mẫu của âm thanh.

```js
const audioCtx = new AudioContext();

const gainNode = audioCtx.createGain();
gainNode.gain.value = 0;
```

Tiếp theo là một ví dụ cho thấy một {{ domxref("DynamicsCompressorNode") }} có một số giá trị tham số được thao tác. Đây là các ví dụ về kiểu `AudioParam` _k-rate_, vì các giá trị được đặt cho toàn bộ khối âm thanh cùng một lúc.

```js
const compressor = audioCtx.createDynamicsCompressor();
compressor.threshold.setValueAtTime(-50, audioCtx.currentTime);
compressor.knee.setValueAtTime(40, audioCtx.currentTime);
compressor.ratio.setValueAtTime(12, audioCtx.currentTime);
compressor.attack.setValueAtTime(0, audioCtx.currentTime);
compressor.release.setValueAtTime(0.25, audioCtx.currentTime);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
