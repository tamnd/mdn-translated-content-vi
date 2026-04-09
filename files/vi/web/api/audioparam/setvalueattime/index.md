---
title: "AudioParam: phương thức setValueAtTime()"
short-title: setValueAtTime()
slug: Web/API/AudioParam/setValueAtTime
page-type: web-api-instance-method
browser-compat: api.AudioParam.setValueAtTime
---

{{ APIRef("Web Audio API") }}

Phương thức `setValueAtTime()` của giao diện {{domxref("AudioParam")}} lên lịch một thay đổi tức thời đối với giá trị `AudioParam` tại một thời điểm chính xác, được đo dựa trên {{domxref("BaseAudioContext/currentTime", "AudioContext.currentTime")}}. Giá trị mới được cung cấp trong tham số `value`.

## Cú pháp

```js-nolint
setValueAtTime(value, startTime)
```

### Tham số

- `value`
  - : Một số dấu chấm động biểu diễn giá trị mà AudioParam sẽ thay đổi thành tại thời điểm đã cho.
- `startTime`
  - : Một số thực kép biểu diễn thời điểm (tính bằng giây) kể từ sau khi {{domxref("AudioContext")}} được tạo lần đầu mà việc thay đổi giá trị sẽ xảy ra. Nếu thời điểm này nhỏ hơn {{domxref("BaseAudioContext/currentTime", "AudioContext.currentTime")}}, thay đổi sẽ diễn ra ngay lập tức. Một {{jsxref("TypeError")}} sẽ được ném ra nếu giá trị này là số âm.

### Giá trị trả về

Tham chiếu đến đối tượng `AudioParam` này. Trong một số trình duyệt, các cách triển khai cũ hơn của giao diện này trả về {{jsxref('undefined')}}.

## Ví dụ

Ví dụ đơn giản này có một nguồn phần tử phương tiện với hai nút điều khiển (xem [repo webaudio-examples](https://github.com/mdn/webaudio-examples/blob/main/audio-param/index.html) để xem mã nguồn, hoặc [xem ví dụ trực tiếp](https://mdn.github.io/webaudio-examples/audio-param/)). Khi nhấn các nút, biến `currGain` được tăng hoặc giảm thêm 0.25, sau đó phương thức `setValueAtTime()` được dùng để đặt giá trị gain bằng `currGain` sau một giây kể từ bây giờ (`audioCtx.currentTime + 1`).

```js
// create audio context
const audioCtx = new AudioContext();

// set basic variables for example
const myAudio = document.querySelector("audio");
const pre = document.querySelector("pre");
const myScript = document.querySelector("script");

pre.textContent = myScript.textContent;

const targetAtTimePlus = document.querySelector(".set-target-at-time-plus");
const targetAtTimeMinus = document.querySelector(".set-target-at-time-minus");

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
targetAtTimePlus.onclick = () => {
  currGain += 0.25;
  gainNode.gain.setValueAtTime(currGain, audioCtx.currentTime + 1);
};

targetAtTimeMinus.onclick = () => {
  currGain -= 0.25;
  gainNode.gain.setValueAtTime(currGain, audioCtx.currentTime + 1);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
