---
title: "BaseAudioContext: phương thức createDynamicsCompressor()"
short-title: createDynamicsCompressor()
slug: Web/API/BaseAudioContext/createDynamicsCompressor
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createDynamicsCompressor
---

{{ APIRef("Web Audio API") }}

Phương thức `createDynamicsCompressor()` của {{domxref("BaseAudioContext")}} được dùng để tạo một {{domxref("DynamicsCompressorNode")}}, có thể dùng để áp dụng nén lên tín hiệu âm thanh.

Nén làm giảm âm lượng của những phần lớn nhất trong tín hiệu và tăng âm lượng của những phần nhỏ nhất. Nhìn chung, có thể đạt được âm thanh to hơn, giàu hơn và đầy đặn hơn. Điều này đặc biệt quan trọng trong trò chơi và các ứng dụng âm nhạc, nơi có nhiều âm thanh riêng lẻ được phát đồng thời, khi bạn muốn kiểm soát mức tín hiệu tổng thể và giúp tránh hiện tượng clipping (méo) ở đầu ra âm thanh.

> [!NOTE]
> Hàm dựng {{domxref("DynamicsCompressorNode.DynamicsCompressorNode", "DynamicsCompressorNode()")}}
> là cách được khuyến nghị để tạo một {{domxref("DynamicsCompressorNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createDynamicsCompressor()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("DynamicsCompressorNode")}}.

## Ví dụ

Đoạn mã dưới đây cho thấy cách dùng `createDynamicsCompressor()`
để thêm hiệu ứng nén vào một track âm thanh. Để xem ví dụ đầy đủ hơn, hãy xem [ví dụ Compressor cơ bản](https://mdn.github.io/webaudio-examples/compressor-example/) của chúng tôi ([xem mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/compressor-example)).

```js
// Tạo một MediaElementAudioSourceNode
// Đưa HTMLMediaElement vào đó
const source = audioCtx.createMediaElementSource(myAudio);

// Tạo một compressor node
const compressor = audioCtx.createDynamicsCompressor();
compressor.threshold.setValueAtTime(-50, audioCtx.currentTime);
compressor.knee.setValueAtTime(40, audioCtx.currentTime);
compressor.ratio.setValueAtTime(12, audioCtx.currentTime);
compressor.attack.setValueAtTime(0, audioCtx.currentTime);
compressor.release.setValueAtTime(0.25, audioCtx.currentTime);

// kết nối AudioBufferSourceNode với đích
source.connect(audioCtx.destination);

button.onclick = () => {
  const active = button.getAttribute("data-active");
  if (active === "false") {
    button.setAttribute("data-active", "true");
    button.textContent = "Remove compression";

    source.disconnect(audioCtx.destination);
    source.connect(compressor);
    compressor.connect(audioCtx.destination);
  } else if (active === "true") {
    button.setAttribute("data-active", "false");
    button.textContent = "Add compression";

    source.disconnect(compressor);
    compressor.disconnect(audioCtx.destination);
    source.connect(audioCtx.destination);
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
