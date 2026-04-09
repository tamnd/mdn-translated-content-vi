---
title: "BaseAudioContext: phương thức createPeriodicWave()"
short-title: createPeriodicWave()
slug: Web/API/BaseAudioContext/createPeriodicWave
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createPeriodicWave
---

{{ APIRef("Web Audio API") }}

Phương thức `createPeriodicWave()` của giao diện {{ domxref("BaseAudioContext") }} được dùng để tạo một {{domxref("PeriodicWave")}}. Dạng sóng này được dùng để định nghĩa một dạng sóng tuần hoàn có thể được dùng để định hình đầu ra của một {{ domxref("OscillatorNode") }}.

## Cú pháp

```js-nolint
createPeriodicWave(real, imag)
createPeriodicWave(real, imag, constraints)
```

### Tham số

- `real`
  - : Một mảng các số hạng cosin (theo truyền thống là các số hạng A).
- `imag`
  - : Một mảng các số hạng sin (theo truyền thống là các số hạng B).

Hai mảng `real` và `imag` phải có cùng độ dài, nếu không một lỗi sẽ được ném ra.

- `constraints` {{optional_inline}}
  - : Một đối tượng từ điển chỉ định liệu có tắt chuẩn hóa hay không. Nếu không được chỉ định, chuẩn hóa được bật theo mặc định. Nó có một thuộc tính:
    - `disableNormalization`
      - : Nếu đặt là `true`, chuẩn hóa sẽ bị tắt cho dạng sóng tuần hoàn. Giá trị mặc định là `false`.

> [!NOTE]
> Nếu được chuẩn hóa, dạng sóng thu được sẽ có giá trị đỉnh tuyệt đối tối đa bằng 1.

### Giá trị trả về

Một {{domxref("PeriodicWave")}}.

## Ví dụ

Ví dụ sau minh họa cách dùng đơn giản của `createPeriodicWave()`, để tạo một đối tượng {{domxref("PeriodicWave")}} chứa một sóng sin đơn giản.

```js
const real = new Float32Array(2);
const imag = new Float32Array(2);
const ac = new AudioContext();
const osc = ac.createOscillator();

real[0] = 0;
imag[0] = 0;
real[1] = 1;
imag[1] = 0;

const wave = ac.createPeriodicWave(real, imag, { disableNormalization: true });

osc.setPeriodicWave(wave);

osc.connect(ac.destination);

osc.start();
osc.stop(2);
```

Điều này hoạt động vì một âm thanh chỉ chứa tần số cơ bản theo định nghĩa chính là sóng sin.

Ở đây, chúng ta tạo một `PeriodicWave` với hai giá trị. Giá trị đầu tiên là độ lệch DC, tức giá trị mà oscillator bắt đầu tại đó. Giá trị `0` là phù hợp ở đây vì nó khởi đầu đường cong ở giữa phạm vi `[-1.0; 1.0]`. Giá trị thứ hai và các giá trị tiếp theo là các thành phần sin và cosin, tương tự như kết quả của một phép biến đổi Fourier, vốn chuyển các giá trị miền thời gian sang các giá trị miền tần số. Ở đây, với `createPeriodicWave()`, bạn chỉ định các tần số và trình duyệt thực hiện một phép biến đổi Fourier ngược để lấy bộ đệm miền thời gian cho tần số của oscillator. Trong ví dụ này, chúng ta chỉ đặt một thành phần ở âm lượng tối đa (`1.0`) trên tần số cơ bản, nên sẽ thu được một sóng sin. Hãy nhớ rằng tần số cơ bản tương ứng với tần số của oscillator (mặc định là `440 Hz`). Do đó, việc thay đổi tần số của oscillator sẽ thực sự dịch chuyển tần số của dạng sóng tuần hoàn này cùng với nó.

Các hệ số của phép biến đổi Fourier nên được cung cấp theo thứ tự _tăng dần_ (tức là <math><semantics><mrow><mrow><mo>(</mo><mrow><mi>a</mi><mo>+</mo><mi>b</mi><mi>i</mi></mrow><mo>)</mo></mrow><msup><mi>e</mi><mi>i</mi></msup><mo>,</mo><mrow><mo>(</mo><mrow><mi>c</mi><mo>+</mo><mi>d</mi><mi>i</mi></mrow><mo>)</mo></mrow><msup><mi>e</mi><mrow><mn>2</mn><mi>i</mi></mrow></msup><mo>,</mo><mrow><mo>(</mo><mrow><mi>f</mi><mo>+</mo><mi>g</mi><mi>i</mi></mrow><mo>)</mo></mrow><msup><mi>e</mi><mrow><mn>3</mn><mi>i</mi></mrow></msup></mrow><annotation encoding="TeX">\left(a+bi\right)e^{i} , \left(c+di\right)e^{2i} ,\left(f+gi\right)e^{3i} </annotation></semantics></math> v.v.) và có thể dương hoặc âm. Một cách đơn giản để tự lấy các hệ số như vậy bằng tay (dù không phải tốt nhất) là dùng máy tính vẽ đồ thị.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
