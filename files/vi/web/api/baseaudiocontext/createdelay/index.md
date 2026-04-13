---
title: "BaseAudioContext: phương thức createDelay()"
short-title: createDelay()
slug: Web/API/BaseAudioContext/createDelay
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createDelay
---

{{APIRef("Web Audio API")}}

Phương thức `createDelay()` của
{{domxref("BaseAudioContext")}} được dùng để tạo một {{domxref("DelayNode")}},
node này dùng để làm trễ tín hiệu âm thanh đầu vào một khoảng thời gian nhất định.

> [!NOTE]
> Hàm dựng {{domxref("DelayNode.DelayNode", "DelayNode()")}}
> là cách được khuyến nghị để tạo một {{domxref("DelayNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createDelay(maxDelayTime)
```

### Tham số

- `maxDelayTime` {{optional_inline}}
  - : Khoảng thời gian tối đa, tính bằng giây, mà tín hiệu âm thanh có thể bị làm trễ.
    Phải nhỏ hơn 180 giây và mặc định là 1 giây nếu không được chỉ định.

### Giá trị trả về

Một {{domxref("DelayNode")}}. Giá trị mặc định của {{domxref("DelayNode.delayTime")}} là 0 giây.

## Ví dụ

Chúng tôi đã tạo một ví dụ cho phép bạn phát liên tục ba mẫu âm thanh khác nhau, xem [create-delay](https://chrisdavidmills.github.io/create-delay/) (bạn cũng có thể [xem mã nguồn](https://github.com/chrisdavidmills/create-delay)). Nếu bạn chỉ nhấn các nút phát, các vòng lặp sẽ bắt đầu ngay; nếu bạn kéo các thanh trượt sang phải rồi nhấn nút phát, một độ trễ sẽ được thêm vào, nhờ đó các âm thanh lặp sẽ không bắt đầu phát ngay lập tức mà sau một khoảng ngắn.

```js
const audioCtx = new AudioContext();

const synthDelay = audioCtx.createDelay(5.0);

// …

let synthSource;

playSynth.onclick = () => {
  synthSource = audioCtx.createBufferSource();
  synthSource.buffer = buffers[2];
  synthSource.loop = true;
  synthSource.start();
  synthSource.connect(synthDelay);
  synthDelay.connect(destination);
  this.setAttribute("disabled", "disabled");
};

stopSynth.onclick = () => {
  synthSource.disconnect(synthDelay);
  synthDelay.disconnect(destination);
  synthSource.stop();
  playSynth.removeAttribute("disabled");
};

// …

let delay1;
rangeSynth.oninput = () => {
  delay1 = rangeSynth.value;
  synthDelay.delayTime.setValueAtTime(delay1, audioCtx.currentTime);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
