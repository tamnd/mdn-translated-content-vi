---
title: "AudioParam: phương thức setTargetAtTime()"
short-title: setTargetAtTime()
slug: Web/API/AudioParam/setTargetAtTime
page-type: web-api-instance-method
browser-compat: api.AudioParam.setTargetAtTime
---

{{ APIRef("Web Audio API") }}

Phương thức `setTargetAtTime()` của giao diện {{domxref("AudioParam")}} lên lịch bắt đầu một thay đổi dần dần đối với giá trị `AudioParam`. Phương thức này hữu ích cho các phần decay hoặc release của các đường bao ADSR.

## Cú pháp

```js-nolint
setTargetAtTime(target, startTime, timeConstant)
```

### Tham số

- `target`
  - : Giá trị mà tham số sẽ bắt đầu chuyển đổi về phía nó tại thời điểm bắt đầu đã cho.
- `startTime`
  - : Thời điểm mà quá trình chuyển đổi theo hàm mũ sẽ bắt đầu, trong cùng hệ tọa độ thời gian với {{domxref("BaseAudioContext/currentTime", "AudioContext.currentTime")}}. Nếu nhỏ hơn hoặc bằng `AudioContext.currentTime`, tham số sẽ bắt đầu thay đổi ngay lập tức.
- `timeConstant`
  - : Giá trị hằng số thời gian, tính bằng giây, của quá trình tiếp cận theo hàm mũ tới giá trị đích. Giá trị này càng lớn thì quá trình chuyển đổi càng chậm.

### Giá trị trả về

Tham chiếu đến đối tượng `AudioParam` này. Một số cách triển khai trình duyệt cũ hơn của giao diện này trả về {{jsxref('undefined')}}.

## Mô tả

Thay đổi bắt đầu tại thời điểm được chỉ định trong `startTime` và di chuyển theo hàm mũ về phía giá trị được cung cấp bởi tham số `target`. Tốc độ suy giảm như được định nghĩa bởi tham số `timeConstant` là theo hàm mũ; do đó giá trị sẽ không bao giờ đạt tới `target` hoàn toàn, nhưng sau mỗi bước thời gian có độ dài `timeConstant`, giá trị sẽ tiến gần `target` thêm <math><semantics><mrow><mn>1</mn><mo>-</mo><msup><mi>e</mi><mrow><mo>-</mo><mn>1</mn></mrow></msup><mo>≈</mo><mn>63.2</mn><mtext>%</mtext></mrow><annotation encoding="TeX">1 - e^{-1} \approx 63.2%</annotation></semantics></math>. Để xem công thức đầy đủ (dùng một hệ tuyến tính bất biến theo thời gian liên tục bậc một), hãy xem [đặc tả Web Audio](https://webaudio.github.io/web-audio-api/#dom-audioparam-settargetattime).

Nếu bạn thực sự cần đạt đến giá trị đích tại một thời điểm cụ thể, bạn có thể dùng {{domxref("AudioParam.exponentialRampToValueAtTime()")}}. Tuy nhiên, vì lý do toán học, phương thức đó không hoạt động nếu giá trị hiện tại hoặc giá trị đích là `0`.

### Chọn `timeConstant` phù hợp

Như đã đề cập ở trên, giá trị thay đổi theo hàm mũ, với mỗi `timeConstant` đưa bạn tiến thêm 63.2% về phía giá trị đích. Bạn không cần lo việc chạm tới đúng giá trị đích; khi đã đủ gần, mọi thay đổi tiếp theo sẽ không thể cảm nhận được đối với người nghe.

Tùy vào trường hợp sử dụng, đạt được 95% giá trị đích có thể đã là đủ; trong trường hợp đó, bạn có thể đặt `timeConstant` bằng một phần ba thời lượng mong muốn.

Để biết thêm chi tiết, hãy xem bảng sau về cách giá trị thay đổi từ 0% đến 100% khi thời gian trôi qua.

| Thời gian kể từ `startTime` | Giá trị                                                     |
| --------------------------- | ----------------------------------------------------------- |
| `0 * timeConstant`          | 0%                                                          |
| `0.5 * timeConstant`        | 39.3%                                                       |
| `1 * timeConstant`          | 63.2%                                                       |
| `2 * timeConstant`          | 86.5%                                                       |
| `3 * timeConstant`          | 95.0%                                                       |
| `4 * timeConstant`          | 98.2%                                                       |
| `5 * timeConstant`          | 99.3%                                                       |
| `n * timeConstant`          | <math><semantics><mrow><mn>1</mn></mrow></semantics></math> |

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mn>1</mn><mo>-</mo><msup><mi>e</mi><mrow><mo>-</mo><mi>n</mi></mrow></msup></mrow><annotation encoding="TeX">1 - e^{-n}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

## Ví dụ

Trong ví dụ này, chúng ta có một nguồn phương tiện với hai nút điều khiển (xem [repo webaudio-examples](https://github.com/mdn/webaudio-examples/blob/main/audio-param/index.html) để xem mã nguồn, hoặc [xem ví dụ trực tiếp](https://mdn.github.io/webaudio-examples/audio-param/).) Khi nhấn các nút này, `setTargetAtTime()` được dùng để tăng dần giá trị gain lên 1.0 và giảm dần xuống 0 tương ứng, với hiệu ứng bắt đầu sau 1 giây và thời lượng hiệu ứng được điều khiển bởi `timeConstant`.

```js
// create audio context
const audioCtx = new AudioContext();

// set basic variables for example
const myAudio = document.querySelector("audio");

const atTimePlus = document.querySelector(".at-time-plus");
const atTimeMinus = document.querySelector(".at-time-minus");

// Create a MediaElementAudioSourceNode
// Feed the HTMLMediaElement into it
const source = audioCtx.createMediaElementSource(myAudio);

// Create a gain node and set its gain value to 0.5
const gainNode = audioCtx.createGain();
gainNode.gain.value = 0.5;
let currGain = gainNode.gain.value;

// connect the AudioBufferSourceNode to the gainNode
// and the gainNode to the destination
source.connect(gainNode);
gainNode.connect(audioCtx.destination);

// set buttons to do something onclick
atTimePlus.onclick = () => {
  currGain = 1.0;
  gainNode.gain.setTargetAtTime(1.0, audioCtx.currentTime + 1, 0.5);
};

atTimeMinus.onclick = () => {
  currGain = 0;
  gainNode.gain.setTargetAtTime(0, audioCtx.currentTime + 1, 0.5);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
