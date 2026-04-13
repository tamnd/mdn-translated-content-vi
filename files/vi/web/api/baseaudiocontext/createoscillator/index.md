---
title: "BaseAudioContext: phương thức createOscillator()"
short-title: createOscillator()
slug: Web/API/BaseAudioContext/createOscillator
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createOscillator
---

{{APIRef("Web Audio API")}}

Phương thức `createOscillator()` của {{domxref("BaseAudioContext")}}
tạo một {{domxref("OscillatorNode")}}, một nguồn biểu diễn một dạng sóng tuần hoàn.
Về cơ bản, nó tạo ra một âm sắc không đổi.

> [!NOTE]
> Hàm dựng {{domxref("OscillatorNode.OscillatorNode", "OscillatorNode()")}}
> là cách được khuyến nghị để tạo một {{domxref("OscillatorNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createOscillator()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("OscillatorNode")}}.

## Ví dụ

Ví dụ sau cho thấy cách dùng cơ bản một AudioContext để tạo một oscillator
node. Để xem ví dụ/thông tin ứng dụng, hãy xem bản demo [Violent Theremin](https://mdn.github.io/webaudio-examples/violent-theremin/) của chúng tôi ([xem app.js](https://github.com/mdn/webaudio-examples/blob/main/violent-theremin/scripts/app.js) để biết phần mã liên quan); đồng thời xem trang {{domxref("OscillatorNode")}} để biết thêm thông tin.

```js
// tạo ngữ cảnh web audio api
const audioCtx = new AudioContext();

// tạo Oscillator node
const oscillator = audioCtx.createOscillator();

oscillator.type = "square";
oscillator.frequency.setValueAtTime(3000, audioCtx.currentTime); // giá trị tính bằng hertz
oscillator.connect(audioCtx.destination);
oscillator.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
