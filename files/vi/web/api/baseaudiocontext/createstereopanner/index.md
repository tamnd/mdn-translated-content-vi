---
title: "BaseAudioContext: phương thức createStereoPanner()"
short-title: createStereoPanner()
slug: Web/API/BaseAudioContext/createStereoPanner
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createStereoPanner
---

{{ APIRef("Web Audio API") }}

Phương thức `createStereoPanner()` của giao diện {{ domxref("BaseAudioContext") }} tạo ra một {{ domxref("StereoPannerNode") }}, có thể được dùng để áp dụng panning stereo cho một nguồn âm thanh.
Nó định vị một luồng âm thanh đầu vào trong ảnh stereo bằng một [thuật toán panning chi phí thấp](https://webaudio.github.io/web-audio-api/#stereopanner-algorithm).

> [!NOTE]
> Hàm dựng {{domxref("StereoPannerNode.StereoPannerNode", "StereoPannerNode()")}}
> là cách được khuyến nghị để tạo một {{domxref("StereoPannerNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createStereoPanner()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("StereoPannerNode")}}.

## Ví dụ

Trong [ví dụ StereoPannerNode](https://mdn.github.io/webaudio-examples/stereo-panner-node/) của chúng tôi ([xem mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/stereo-panner-node)), phần HTML có một phần tử {{htmlelement("audio")}} đơn giản cùng một thanh trượt {{HTMLElement("input")}} để tăng và giảm giá trị pan. Trong phần JavaScript, chúng tôi tạo một {{domxref("MediaElementAudioSourceNode")}} và một {{domxref("StereoPannerNode")}}, rồi kết nối hai đối tượng này với nhau bằng phương thức `connect()`. Sau đó chúng tôi dùng trình xử lý sự kiện `oninput` để thay đổi giá trị của tham số {{domxref("StereoPannerNode.pan")}} và cập nhật phần hiển thị giá trị pan khi thanh trượt được di chuyển.

Di chuyển thanh trượt sang trái và phải khi nhạc đang phát sẽ pan nhạc tương ứng sang loa trái và loa phải của đầu ra.

```js
const audioCtx = new AudioContext();
const myAudio = document.querySelector("audio");

const panControl = document.querySelector(".panning-control");
const panValue = document.querySelector(".panning-value");

// Tạo một MediaElementAudioSourceNode
// Đưa HTMLMediaElement vào đó
const source = audioCtx.createMediaElementSource(myAudio);

// Tạo một stereo panner
const panNode = audioCtx.createStereoPanner();

// Hàm xử lý sự kiện để tăng panning sang phải và trái
// khi thanh trượt được di chuyển

panControl.oninput = () => {
  panNode.pan.setValueAtTime(panControl.value, audioCtx.currentTime);
  panValue.textContent = panControl.value;
};

// kết nối MediaElementAudioSourceNode với panNode
// và panNode với đích, để chúng ta có thể phát
// nhạc và điều chỉnh panning bằng các điều khiển
source.connect(panNode);
panNode.connect(audioCtx.destination);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
