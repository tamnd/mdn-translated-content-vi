---
title: "AudioNode: thuộc tính channelInterpretation"
short-title: channelInterpretation
slug: Web/API/AudioNode/channelInterpretation
page-type: web-api-instance-property
browser-compat: api.AudioNode.channelInterpretation
---

{{ APIRef("Web Audio API") }}

Thuộc tính **`channelInterpretation`** của giao diện {{domxref("AudioNode")}} biểu diễn một giá trị liệt kê mô tả cách các kênh đầu vào được ánh xạ sang các kênh đầu ra khi số lượng đầu vào/đầu ra khác nhau. Ví dụ, thiết lập này xác định cách một đầu vào mono sẽ được up-mix thành đầu ra stereo hoặc 5.1 kênh, hoặc cách một đầu vào bốn kênh sẽ được down-mix thành đầu ra stereo hoặc mono.

Thuộc tính này có hai tùy chọn: `speakers` và `discrete`. Chúng được ghi lại trong [Các khái niệm cơ bản đằng sau Web Audio API > up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing).

## Giá trị

Các giá trị được ghi lại trong [Các khái niệm cơ bản đằng sau Web Audio API > up-mixing và down-mixing](/en-US/docs/Web/API/Web_Audio_API/Basic_concepts_behind_Web_Audio_API#up-mixing_and_down-mixing).

Tóm lại:

- `speakers`
  - : Dùng một tập ánh xạ "tiêu chuẩn" cho các tổ hợp đầu vào và đầu ra loa phổ biến (mono, stereo, quad, 5.1). Ví dụ, với thiết lập này, một đầu vào mono sẽ xuất ra cả hai kênh của đầu ra stereo.
- `discrete`
  - : Các kênh đầu vào được ánh xạ lần lượt sang các kênh đầu ra. Nếu số đầu vào nhiều hơn số đầu ra thì các đầu vào dư sẽ bị loại bỏ; nếu ít hơn thì các đầu ra chưa dùng sẽ im lặng.

## Ví dụ

```js
const audioCtx = new AudioContext();

const oscillator = audioCtx.createOscillator();
const gainNode = audioCtx.createGain();

oscillator.connect(gainNode);
gainNode.connect(audioCtx.destination);

oscillator.channelInterpretation = "discrete";
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
