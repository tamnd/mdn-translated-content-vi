---
title: "OscillatorNode: thuộc tính detune"
short-title: detune
slug: Web/API/OscillatorNode/detune
page-type: web-api-instance-property
browser-compat: api.OscillatorNode.detune
---

{{ APIRef("Web Audio API") }}

Thuộc tính `detune` của giao diện {{ domxref("OscillatorNode") }} là một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) đại diện cho độ chỉnh âm của dao động tính bằng [cents](https://en.wikipedia.org/wiki/Cent_%28music%29).

> [!NOTE]
> Mặc dù `AudioParam` trả về là chỉ đọc, giá trị mà nó đại diện thì không.

## Giá trị

Một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate).

## Ví dụ

Ví dụ dưới đây cho thấy cách sử dụng cơ bản của {{ domxref("AudioContext") }} để tạo oscillator node. Để xem ví dụ được áp dụng/thông tin, hãy xem [Violent Theremin demo](https://mdn.github.io/webaudio-examples/violent-theremin/) ([xem app.js](https://github.com/mdn/webaudio-examples/blob/main/violent-theremin/scripts/app.js) để biết mã liên quan).

```js
// create web audio api context
const audioCtx = new AudioContext();

// create Oscillator node
const oscillator = audioCtx.createOscillator();

oscillator.type = "square";
oscillator.frequency.setValueAtTime(440, audioCtx.currentTime); // value in hertz
oscillator.detune.setValueAtTime(100, audioCtx.currentTime); // value in cents
oscillator.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
