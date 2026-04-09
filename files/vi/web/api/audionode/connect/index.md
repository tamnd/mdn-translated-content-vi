---
title: "AudioNode: phương thức connect()"
short-title: connect()
slug: Web/API/AudioNode/connect
page-type: web-api-instance-method
browser-compat: api.AudioNode.connect
---

{{ APIRef("Web Audio API") }}

Phương thức `connect()` của giao diện {{ domxref("AudioNode") }} cho phép bạn kết nối một trong các đầu ra của nút tới một đích, có thể là một `AudioNode` khác (qua đó chuyển dữ liệu âm thanh tới nút được chỉ định) hoặc một {{domxref("AudioParam")}}, để dữ liệu đầu ra của nút tự động được dùng nhằm thay đổi giá trị của tham số đó theo thời gian.

## Cú pháp

```js-nolint
connect(destination)
connect(destination, outputIndex)
connect(destination, outputIndex, inputIndex)
```

### Tham số

- `destination`
  - : {{domxref("AudioNode")}} hoặc {{domxref("AudioParam")}} mà kết nối sẽ đi tới.
- `outputIndex` {{optional_inline}}
  - : Chỉ mục xác định đầu ra nào của `AudioNode` hiện tại sẽ được kết nối tới đích.
    Các số chỉ mục được xác định theo số lượng kênh đầu ra (xem [Kênh âm thanh](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#audio_channels)).
    Mặc dù bạn chỉ có thể kết nối một đầu ra nhất định tới một đầu vào nhất định một lần
    (các lần thử lặp lại sẽ bị bỏ qua), bạn vẫn có thể kết nối một đầu ra tới nhiều đầu vào bằng cách
    gọi `connect()` nhiều lần. Điều này giúp [fan-out](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#fan-in_and_fan-out)
    khả thi. Giá trị mặc định là 0.
- `inputIndex` {{optional_inline}}
  - : Chỉ mục mô tả đầu vào nào của đích mà bạn muốn kết nối `AudioNode` hiện tại vào; mặc định là 0. Các số chỉ mục được xác định theo số lượng kênh đầu vào
    (xem [Kênh âm thanh](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#audio_channels)). Có thể kết nối một `AudioNode` với một `AudioNode` khác, rồi nút thứ hai lại kết nối trở về `AudioNode` đầu tiên, tạo thành một chu trình.

### Giá trị trả về

Nếu đích là một nút, `connect()` trả về tham chiếu đến đối tượng {{domxref("AudioNode")}} đích, cho phép bạn nối chuỗi nhiều lời gọi `connect()`. Trong một số trình duyệt, các cách triển khai cũ hơn của giao diện này trả về {{jsxref("undefined")}}.

Nếu đích là một `AudioParam`, `connect()` trả về `undefined`.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị chỉ định làm `outputIndex` hoặc `inputIndex` không tương ứng với đầu vào hoặc đầu ra hiện có.
- `InvalidAccessError` {{domxref("DOMException")}}
  - : Được ném ra nếu nút đích không thuộc cùng audio context với nút nguồn.
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu kết nối được chỉ định sẽ tạo thành một chu trình (trong đó âm thanh quay trở lại qua cùng các nút lặp đi lặp lại) và không có đối tượng {{domxref("DelayNode")}} nào trong chu trình để ngăn dạng sóng kết quả bị kẹt trong việc tạo cùng một khung âm thanh vô thời hạn. Ngoài ra cũng được ném ra nếu tham số `inputIndex` được dùng khi đích là một {{domxref("AudioParam")}}.

## Ví dụ

### Kết nối tới đầu vào âm thanh

Cách dùng hiển nhiên nhất của phương thức `connect()` là chuyển đầu ra âm thanh từ một nút vào đầu vào âm thanh của một nút khác để xử lý tiếp. Ví dụ, bạn có thể gửi âm thanh từ một {{domxref("MediaElementAudioSourceNode")}} tức là âm thanh từ một phần tử media HTML như {{HTMLElement("audio")}} qua một bộ lọc thông dải được triển khai bằng {{domxref("BiquadFilterNode")}} để giảm nhiễu trước khi gửi âm thanh tới loa.

Ví dụ này tạo một bộ dao động, rồi liên kết nó với một nút gain, để nút gain điều khiển âm lượng của nút dao động.

```js
const audioCtx = new AudioContext();

const oscillator = audioCtx.createOscillator();
const gainNode = audioCtx.createGain();

oscillator.connect(gainNode);
gainNode.connect(audioCtx.destination);
```

### Ví dụ AudioParam

Trong ví dụ này, chúng ta sẽ thay đổi giá trị gain của một {{domxref("GainNode")}} bằng cách dùng một {{domxref("OscillatorNode")}} có tần số thấp. Kỹ thuật này được gọi là tham số được điều khiển bởi _LFO_.

```js
const audioCtx = new AudioContext();

// tạo một bộ dao động thông thường để phát âm thanh
const oscillator = audioCtx.createOscillator();

// tạo bộ dao động thứ hai sẽ được dùng làm LFO (Low-frequency
// oscillator), và sẽ điều khiển một tham số
const lfo = audioCtx.createOscillator();

// đặt tần số của bộ dao động thứ hai thành một số thấp
lfo.frequency.value = 2.0; // 2Hz: hai dao động mỗi giây

// tạo một gain mà AudioParam gain của nó sẽ được LFO điều khiển
const gain = audioCtx.createGain();

// kết nối LFO tới AudioParam gain. Điều này có nghĩa là giá trị của LFO
// sẽ không tạo ra âm thanh, mà thay vào đó thay đổi giá trị gain
lfo.connect(gain.gain);

// kết nối bộ dao động sẽ phát âm thanh tới gain
oscillator.connect(gain);

// kết nối gain tới đích để chúng ta nghe thấy âm thanh
gain.connect(audioCtx.destination);

// khởi động bộ dao động sẽ phát âm thanh
oscillator.start();

// khởi động bộ dao động sẽ thay đổi giá trị gain
lfo.start();
```

#### Ghi chú về AudioParam

Có thể kết nối một đầu ra `AudioNode` tới nhiều {{domxref("AudioParam")}}, và cũng có thể kết nối đầu ra của nhiều AudioNode tới một {{domxref("AudioParam")}}, bằng nhiều lần gọi `connect()`.
Vì vậy [fan-in và fan-out](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#fan-in_and_fan-out) được hỗ trợ.

Một {{ domxref("AudioParam") }} sẽ lấy dữ liệu âm thanh đã kết xuất từ mọi đầu ra `AudioNode` được kết nối tới nó và chuyển thành mono bằng cách [down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing)
(nếu nó chưa là mono). Tiếp theo, nó sẽ trộn dữ liệu đó với bất kỳ đầu ra nào khác như vậy, cùng với giá trị nội tại của tham số (giá trị mà {{ domxref("AudioParam") }} vốn có nếu không có kết nối âm thanh), bao gồm mọi thay đổi trên dòng thời gian đã được lên lịch cho tham số.

Do đó, có thể chọn phạm vi mà một {{domxref("AudioParam")}} sẽ thay đổi bằng cách đặt giá trị của {{domxref("AudioParam")}} thành tần số trung tâm, rồi dùng một {{domxref("GainNode")}} giữa nguồn âm thanh và {{domxref("AudioParam")}} để điều chỉnh phạm vi thay đổi của {{domxref("AudioParam")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
