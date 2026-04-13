---
title: "OscillatorNode: phương thức setPeriodicWave()"
short-title: setPeriodicWave()
slug: Web/API/OscillatorNode/setPeriodicWave
page-type: web-api-instance-method
browser-compat: api.OscillatorNode.setPeriodicWave
---

{{ APIRef("Web Audio API") }}

Phương thức **`setPeriodicWave()`** của giao diện {{domxref("OscillatorNode")}} được dùng để trỏ đến {{domxref("PeriodicWave")}} định nghĩa dạng sóng tuần hoàn có thể dùng để định hình đầu ra của oscillator, khi {{domxref("OscillatorNode.type", "type")}} là `custom`.

## Cú pháp

```js-nolint
setPeriodicWave(wave)
```

### Tham số

- `wave`
  - : Đối tượng {{domxref("PeriodicWave")}} đại diện cho dạng sóng dùng làm hình dạng của đầu ra oscillator.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ dưới đây minh họa cách sử dụng đơn giản của `createPeriodicWave()`, tái tạo sóng sine từ sóng tuần hoàn.

```js
const real = new Float32Array(2);
const imag = new Float32Array(2);
const ac = new AudioContext();
const osc = ac.createOscillator();

real[0] = 0;
imag[0] = 0;
real[1] = 1;
imag[1] = 0;

const wave = ac.createPeriodicWave(real, imag);

osc.setPeriodicWave(wave);

osc.connect(ac.destination);

osc.start();
osc.stop(2);
```

Điều này hoạt động vì âm thanh chỉ chứa âm cơ bản theo định nghĩa là sóng sine.

Ở đây, chúng ta tạo {{domxref("PeriodicWave")}} với hai giá trị. Giá trị đầu tiên là DC offset, là giá trị mà oscillator bắt đầu. 0 là tốt ở đây, vì chúng ta muốn bắt đầu đường cong ở giữa phạm vi \[-1.0; 1.0].

Giá trị thứ hai và các giá trị tiếp theo là các thành phần sine và cosine. Bạn có thể nghĩ nó như kết quả của biến đổi Fourier, nơi bạn nhận được các giá trị miền tần số từ giá trị miền thời gian. Ở đây, với `createPeriodicWave()`, bạn chỉ định các tần số, và trình duyệt thực hiện biến đổi Fourier ngược để nhận buffer miền thời gian cho tần số của oscillator. Ở đây, chúng ta chỉ đặt một thành phần ở âm lượng đầy đủ (1.0) trên âm cơ bản, vì vậy chúng ta nhận được sóng sine.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [AudioContext.createPeriodicWave](/en-US/docs/Web/API/BaseAudioContext/createPeriodicWave)
