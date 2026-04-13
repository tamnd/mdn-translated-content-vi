---
title: "PeriodicWave: hàm khởi tạo PeriodicWave()"
short-title: PeriodicWave()
slug: Web/API/PeriodicWave/PeriodicWave
page-type: web-api-constructor
browser-compat: api.PeriodicWave.PeriodicWave
---

{{APIRef("Web Audio API")}}

Hàm khởi tạo **`PeriodicWave()`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) tạo một phiên bản đối tượng {{domxref("PeriodicWave")}} mới.

## Cú pháp

```js-nolint
new PeriodicWave(context)
new PeriodicWave(context, options)
```

### Tham số

- `context`
  - : Một {{domxref("BaseAudioContext")}} đại diện cho ngữ cảnh âm thanh mà bạn muốn nút được liên kết.
- `options` {{optional_inline}}
  - : Một đối tượng từ điển [`PeriodicWaveOptions`](https://webaudio.github.io/web-audio-api/#idl-def-PeriodicWaveOptions) xác định các thuộc tính bạn muốn `PeriodicWave` có:
    - `real`
      - : Một {{jsxref("Float32Array")}} chứa các hệ số cosin mà bạn muốn sử dụng để tạo dạng sóng (tương đương với tham số `real` của {{domxref("BaseAudioContext.createPeriodicWave")}}).
    - `imag`
      - : Một {{jsxref("Float32Array")}} chứa các hệ số sin mà bạn muốn sử dụng để tạo dạng sóng (tương đương với tham số `imag` của {{domxref("BaseAudioContext.createPeriodicWave")}}).
    - `channelCount`
      - : Đại diện cho một số nguyên được sử dụng để xác định có bao nhiêu kênh được sử dụng khi [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) kết nối với bất kỳ đầu vào nào của nút.
    - `channelCountMode`
      - : Đại diện cho một giá trị liệt kê mô tả cách các kênh phải khớp nhau giữa đầu vào và đầu ra của nút.
    - `channelInterpretation`
      - : Đại diện cho một giá trị liệt kê mô tả ý nghĩa của các kênh. Cách diễn giải này sẽ xác định cách audio [up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing) sẽ xảy ra.
        Các giá trị có thể là `"speakers"` hoặc `"discrete"`.

### Giá trị trả về

Một phiên bản đối tượng {{domxref("PeriodicWave")}} mới.

## Ví dụ

```js
const real = new Float32Array(2);
const imag = new Float32Array(2);
const ac = new AudioContext();

real[0] = 0;
imag[0] = 0;
real[1] = 1;
imag[1] = 0;

const wave = new PeriodicWave(ac, {
  real,
  imag,
  disableNormalization: false,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
