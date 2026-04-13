---
title: "OscillatorNode: thuộc tính type"
short-title: type
slug: Web/API/OscillatorNode/type
page-type: web-api-instance-property
browser-compat: api.OscillatorNode.type
---

{{ APIRef("Web Audio API") }}

Thuộc tính **`type`** của giao diện {{domxref("OscillatorNode")}} chỉ định hình dạng [dạng sóng](https://en.wikipedia.org/wiki/Waveform) mà oscillator sẽ phát ra. Có một số dạng sóng phổ biến, cũng như tùy chọn để chỉ định hình dạng dạng sóng tùy chỉnh. Hình dạng của dạng sóng sẽ ảnh hưởng đến âm thanh được tạo ra.

## Giá trị

Một chuỗi chỉ định hình dạng của sóng oscillator. Các giá trị khác nhau có sẵn là:

- `sine`
  - : Một [sóng sine](https://en.wikipedia.org/wiki/Sine_wave). Đây là giá trị mặc định.
- `square`
  - : Một [sóng vuông](https://en.wikipedia.org/wiki/Square_wave) với [duty cycle](https://en.wikipedia.org/wiki/Duty_cycle) 0.5; nghĩa là tín hiệu "cao" trong một nửa mỗi chu kỳ.
- `sawtooth`
  - : Một [sóng răng cưa](https://en.wikipedia.org/wiki/Sawtooth_wave).
- `triangle`
  - : Một [sóng tam giác](https://en.wikipedia.org/wiki/Triangle_wave).
- `custom`
  - : Một dạng sóng tùy chỉnh. Bạn không bao giờ đặt `type` thành `custom` thủ công;
    thay vào đó, hãy dùng phương thức {{domxref("OscillatorNode.setPeriodicWave", "setPeriodicWave()")}}
    để cung cấp dữ liệu đại diện cho dạng sóng. Làm như vậy tự động đặt
    `type` thành `custom`.

Xem thêm [các loại oscillator node khác nhau](/en-US/docs/Web/API/OscillatorNode#different_oscillator_node_types) để xem trực quan hóa các hình dạng dạng sóng khác nhau.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu giá trị `custom` được chỉ định. Để đặt dạng sóng tùy chỉnh, chỉ cần gọi
    {{domxref("OscillatorNode.setPeriodicWave", "setPeriodicWave()")}}. Làm như vậy
    sẽ tự động đặt type cho bạn.

## Ví dụ

Ví dụ dưới đây cho thấy cách sử dụng cơ bản của {{ domxref("AudioContext") }} để tạo oscillator node. Để xem ví dụ được áp dụng, hãy xem [Violent Theremin demo](https://mdn.github.io/webaudio-examples/violent-theremin/) ([xem app.js](https://github.com/mdn/webaudio-examples/blob/main/violent-theremin/scripts/app.js) để biết mã liên quan).

```js
// create web audio api context
const audioCtx = new AudioContext();

// create Oscillator node
const oscillator = audioCtx.createOscillator();

oscillator.type = "square";
oscillator.frequency.setValueAtTime(440, audioCtx.currentTime); // value in hertz
oscillator.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
