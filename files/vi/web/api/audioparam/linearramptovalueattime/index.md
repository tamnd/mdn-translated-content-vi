---
title: "AudioParam: phương thức linearRampToValueAtTime()"
short-title: linearRampToValueAtTime()
slug: Web/API/AudioParam/linearRampToValueAtTime
page-type: web-api-instance-method
browser-compat: api.AudioParam.linearRampToValueAtTime
---

{{ APIRef("Web Audio API") }}

Phương thức `linearRampToValueAtTime()` của giao diện {{ domxref("AudioParam") }} lên lịch một thay đổi tuyến tính dần dần cho giá trị của `AudioParam`. Thay đổi bắt đầu tại thời điểm được chỉ định cho sự kiện _trước đó_, đi theo một đường dốc tuyến tính đến giá trị mới được cung cấp trong tham số `value`, và đạt đến giá trị mới tại thời điểm được cung cấp trong tham số `endTime`.

## Cú pháp

```js-nolint
linearRampToValueAtTime(value, endTime)
```

### Tham số

- `value`
  - : Một số dấu chấm động biểu diễn giá trị mà `AudioParam` sẽ tăng hoặc giảm dần tới tại thời điểm đã cho.
- `endTime`
  - : Một số thực kép biểu diễn chính xác thời điểm (tính bằng giây) kể từ khi quá trình thay đổi dần bắt đầu mà việc thay đổi giá trị sẽ dừng lại.

### Giá trị trả về

Tham chiếu đến đối tượng `AudioParam` này. Trong một số trình duyệt, các cách triển khai cũ hơn của giao diện này trả về {{jsxref('undefined')}}.

## Ví dụ

Trong ví dụ này, chúng ta có một nguồn phương tiện với hai nút điều khiển (xem [repo audio-param](https://github.com/mdn/webaudio-examples/tree/main/audio-param) để xem mã nguồn, hoặc [xem ví dụ trực tiếp](https://mdn.github.io/webaudio-examples/audio-param/).) Khi nhấn các nút này, `linearRampToValueAtTime()` được dùng để tăng dần giá trị gain lên 1.0 và giảm dần xuống 0 tương ứng. Cách này khá hữu ích cho các hiệu ứng fade in/fade out, dù {{domxref("AudioParam.exponentialRampToValueAtTime()")}} thường được cho là tự nhiên hơn đôi chút.

```js
// create audio context
const audioCtx = new AudioContext();

// set basic variables for example
const myAudio = document.querySelector("audio");

const linearRampPlus = document.querySelector(".linear-ramp-plus");
const linearRampMinus = document.querySelector(".linear-ramp-minus");

// Create a MediaElementAudioSourceNode
// Feed the HTMLMediaElement into it
const source = audioCtx.createMediaElementSource(myAudio);

// Create a gain node and set its gain value to 0.5
const gainNode = audioCtx.createGain();

// connect the AudioBufferSourceNode to the gainNode
// and the gainNode to the destination
gainNode.gain.setValueAtTime(0, audioCtx.currentTime);
source.connect(gainNode);
gainNode.connect(audioCtx.destination);

// set buttons to do something onclick
linearRampPlus.onclick = () => {
  gainNode.gain.linearRampToValueAtTime(1.0, audioCtx.currentTime + 2);
};

linearRampMinus.onclick = () => {
  gainNode.gain.linearRampToValueAtTime(0, audioCtx.currentTime + 2);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
