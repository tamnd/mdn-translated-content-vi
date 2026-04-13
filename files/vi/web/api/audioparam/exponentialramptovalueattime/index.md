---
title: "AudioParam: phương thức exponentialRampToValueAtTime()"
short-title: exponentialRampToValueAtTime()
slug: Web/API/AudioParam/exponentialRampToValueAtTime
page-type: web-api-instance-method
browser-compat: api.AudioParam.exponentialRampToValueAtTime
---

{{ APIRef("Web Audio API") }}

Phương thức **`exponentialRampToValueAtTime()`** của giao diện {{domxref("AudioParam")}} lên lịch một thay đổi dần dần theo hàm mũ đối với giá trị của {{domxref("AudioParam")}}. Thay đổi bắt đầu tại thời điểm được chỉ định cho sự kiện _trước đó_, đi theo một đường dốc hàm mũ đến giá trị mới được cung cấp trong tham số `value`, và đạt đến giá trị mới tại thời điểm được cung cấp trong tham số `endTime`.

> [!NOTE]
> Các đường dốc hàm mũ thường được xem là hữu ích hơn khi thay đổi tần số hoặc tốc độ phát so với đường dốc tuyến tính do cách tai người hoạt động.

## Cú pháp

```js-nolint
exponentialRampToValueAtTime(value, endTime)
```

### Tham số

- `value`
  - : Một số dấu chấm động biểu diễn giá trị mà `AudioParam` sẽ tăng hoặc giảm dần tới tại thời điểm đã cho.
- `endTime`
  - : Một số thực kép biểu diễn chính xác thời điểm (tính bằng giây) kể từ khi quá trình thay đổi dần bắt đầu mà việc thay đổi giá trị sẽ dừng lại.

### Giá trị trả về

Tham chiếu đến đối tượng `AudioParam` này. Trong một số trình duyệt, các cách triển khai cũ hơn của giao diện này trả về {{jsxref('undefined')}}.

## Ví dụ

Trong ví dụ này, chúng ta có một nguồn phương tiện với hai nút điều khiển (xem [repo audio-param](https://github.com/mdn/webaudio-examples/tree/main/audio-param) để xem mã nguồn, hoặc [xem ví dụ trực tiếp](https://mdn.github.io/webaudio-examples/audio-param/).) Khi nhấn các nút này, `exponentialRampToValueAtTime()` được dùng để tăng dần giá trị gain lên 1.0 và giảm dần xuống 0 tương ứng. Cách này khá hữu ích cho các hiệu ứng fade in/fade out:

```js
// create audio context
const audioCtx = new AudioContext();

// set basic variables for example
const myAudio = document.querySelector("audio");

const expRampPlus = document.querySelector(".exp-ramp-plus");
const expRampMinus = document.querySelector(".exp-ramp-minus");

// Create a MediaElementAudioSourceNode
// Feed the HTMLMediaElement into it
const source = audioCtx.createMediaElementSource(myAudio);

// Create a gain node and set its gain value to 0.5
const gainNode = audioCtx.createGain();

// connect the AudioBufferSourceNode to the gainNode
// and the gainNode to the destination
gainNode.gain.setValueAtTime(0, audioCtx.currentTime);
source.connect(gainNode);
gainNode.connect(audioCtx.destination);

// set buttons to do something onclick
expRampPlus.onclick = () => {
  gainNode.gain.exponentialRampToValueAtTime(1.0, audioCtx.currentTime + 2);
};

expRampMinus.onclick = () => {
  gainNode.gain.exponentialRampToValueAtTime(0.01, audioCtx.currentTime + 2);
};
```

> [!NOTE]
> Giá trị 0.01 được dùng làm giá trị giảm dần tới trong hàm cuối thay vì 0, vì nếu dùng 0 thì lỗi _invalid or illegal string_ sẽ được ném ra; giá trị này cần là số dương.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
