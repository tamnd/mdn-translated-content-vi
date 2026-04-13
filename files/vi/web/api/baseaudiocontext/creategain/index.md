---
title: "BaseAudioContext: phương thức createGain()"
short-title: createGain()
slug: Web/API/BaseAudioContext/createGain
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createGain
---

{{ APIRef("Web Audio API") }}

Phương thức `createGain()` của giao diện {{ domxref("BaseAudioContext") }}
tạo một {{ domxref("GainNode") }}, có thể được dùng để điều khiển gain tổng thể (hay âm lượng) của đồ thị âm thanh.

> [!NOTE]
> Hàm dựng {{domxref("GainNode.GainNode", "GainNode()")}}
> là cách được khuyến nghị để tạo một {{domxref("GainNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createGain()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("GainNode")}} nhận một hoặc nhiều nguồn âm thanh làm đầu vào và xuất ra âm thanh đã được điều chỉnh gain (âm lượng) tới mức được chỉ định bởi tham số [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) {{domxref("GainNode.gain")}} của node.

## Ví dụ

Ví dụ sau cho thấy cách dùng cơ bản một {{domxref("AudioContext")}} để tạo một `GainNode`, sau đó dùng node này để tắt tiếng và bật lại tiếng khi nhấp vào nút Mute bằng cách thay đổi giá trị thuộc tính `gain`.

Đoạn mã dưới đây sẽ không chạy nguyên trạng. Để xem ví dụ hoạt động đầy đủ, hãy xem bản demo [Voice-change-O-matic](https://mdn.github.io/webaudio-examples/voice-change-o-matic/) của chúng tôi ([xem mã nguồn](https://github.com/mdn/webaudio-examples/blob/main/voice-change-o-matic/scripts/app.js).)

```html
<div>
  <button class="mute">Mute button</button>
</div>
```

```js
const audioCtx = new AudioContext();
const gainNode = audioCtx.createGain();
const mute = document.querySelector(".mute");
let source;

if (navigator.mediaDevices.getUserMedia) {
  navigator.mediaDevices.getUserMedia(
    // constraints - chỉ cần âm thanh cho ứng dụng này
    {
      audio: true,
    },

    // Callback thành công
    (stream) => {
      source = audioCtx.createMediaStreamSource(stream);
    },

    // Callback lỗi
    (err) => {
      console.error(`The following gUM error occurred: ${err}`);
    },
  );
} else {
  console.error("getUserMedia not supported on your browser!");
}

source.connect(gainNode);
gainNode.connect(audioCtx.destination);

// …

mute.onclick = () => {
  if (mute.id === "") {
    // 0 nghĩa là tắt tiếng. Nếu bạn vẫn nghe thấy âm thanh, hãy chắc chắn
    // rằng bạn chưa kết nối nguồn vào đầu ra ngoài việc dùng GainNode.
    gainNode.gain.setValueAtTime(0, audioCtx.currentTime);
    mute.id = "activated";
    mute.textContent = "Unmute";
  } else {
    gainNode.gain.setValueAtTime(1, audioCtx.currentTime);
    mute.id = "";
    mute.textContent = "Mute";
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
