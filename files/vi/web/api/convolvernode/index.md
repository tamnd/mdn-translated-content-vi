---
title: ConvolverNode
slug: Web/API/ConvolverNode
page-type: web-api-interface
browser-compat: api.ConvolverNode
---

{{APIRef("Web Audio API")}}

Giao diện `ConvolverNode` là một {{domxref("AudioNode")}} thực hiện phép tích chập tuyến tính trên một {{domxref("AudioBuffer")}} cho trước, thường được dùng để tạo hiệu ứng vang âm (reverb). Một `ConvolverNode` luôn có đúng một đầu vào và một đầu ra.

> [!NOTE]
> Để tìm hiểu thêm về lý thuyết đằng sau phép tích chập tuyến tính, hãy xem [bài viết về Convolution trên Wikipedia](https://en.wikipedia.org/wiki/Convolution).

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Số lượng đầu vào</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Số lượng đầu ra</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Chế độ đếm kênh</th>
      <td><code>"clamped-max"</code></td>
    </tr>
    <tr>
      <th scope="row">Số lượng kênh</th>
      <td><code>1</code>, <code>2</code>, hoặc <code>4</code></td>
    </tr>
    <tr>
      <th scope="row">Diễn giải kênh</th>
      <td><code>"speakers"</code></td>
    </tr>
  </tbody>
</table>

## Constructor

- {{domxref("ConvolverNode.ConvolverNode()", "ConvolverNode()")}}
  - : Tạo một thực thể đối tượng `ConvolverNode` mới.

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ đối tượng cha của nó, {{domxref("AudioNode")}}_.

- {{domxref("ConvolverNode.buffer")}}
  - : Một _{{domxref("AudioBuffer")}}_ đơn âm, stereo hoặc 4 kênh chứa đáp ứng xung (có thể là đa kênh) được `ConvolverNode` dùng để tạo hiệu ứng reverb.
- {{domxref("ConvolverNode.normalize")}}
  - : Một giá trị boolean điều khiển việc đáp ứng xung từ bộ đệm có được scale bằng phép chuẩn hóa equal-power khi thuộc tính `buffer` được đặt hay không.

## Phương thức thể hiện

_Không có phương thức riêng; kế thừa các phương thức từ đối tượng cha của nó, {{domxref("AudioNode")}}_.

## Ví dụ

Ví dụ sau minh họa cách sử dụng cơ bản một `AudioContext` để tạo một nút convolver. Bạn sẽ cần tìm một đáp ứng xung để hoàn thiện ví dụ bên dưới. Hãy xem ví dụ [HolySpaceCow](https://mdn.github.io/webaudio-examples/holy-space-cow/) của chúng tôi để có một ví dụ đầy đủ và thực tế.

```js
let audioCtx = new window.AudioContext();

async function createReverb() {
  let convolver = audioCtx.createConvolver();

  // load impulse response from file
  let response = await fetch("path/to/impulse-response.wav");
  let arraybuffer = await response.arrayBuffer();
  convolver.buffer = await audioCtx.decodeAudioData(arraybuffer);

  return convolver;
}

// …

let reverb = await createReverb();

// someOtherAudioNode -> reverb -> destination
someOtherAudioNode.connect(reverb);
reverb.connect(audioCtx.destination);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
