---
title: "BaseAudioContext: phương thức createPanner()"
short-title: createPanner()
slug: Web/API/BaseAudioContext/createPanner
page-type: web-api-instance-method
browser-compat: api.BaseAudioContext.createPanner
---

{{ APIRef("Web Audio API") }}

Phương thức `createPanner()` của {{ domxref("BaseAudioContext") }}
được dùng để tạo một {{domxref("PannerNode")}} mới, dùng để định vị không gian cho một luồng âm thanh đầu vào trong không gian 3D.

Panner node được định vị theo tương quan với {{domxref("AudioListener")}} của AudioContext (được định nghĩa bởi thuộc tính {{domxref("BaseAudioContext/listener", "AudioContext.listener")}}), đại diện cho vị trí và hướng của người đang nghe âm thanh.

> [!NOTE]
> Hàm dựng {{domxref("PannerNode.PannerNode", "PannerNode()")}}
> là cách được khuyến nghị để tạo một {{domxref("PannerNode")}}; xem
> [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Cú pháp

```js-nolint
createPanner()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("PannerNode")}}.

## Ví dụ

Trong ví dụ sau, bạn có thể thấy cách phương thức `createPanner()`, {{domxref("AudioListener")}} và {{domxref("PannerNode")}} được dùng để điều khiển định vị không gian âm thanh. Thông thường, bạn sẽ xác định vị trí trong không gian 3D mà audio listener và panner (nguồn) chiếm giữ lúc đầu, rồi cập nhật vị trí của một hoặc cả hai khi ứng dụng được sử dụng. Ví dụ, bạn có thể đang di chuyển một nhân vật trong thế giới game và muốn cách âm thanh được truyền tới thay đổi một cách chân thực khi nhân vật tiến lại gần hoặc ra xa một máy phát nhạc như một dàn stereo. Trong ví dụ này, việc đó được điều khiển bởi các hàm `moveRight()`, `moveLeft()`, v.v., vốn đặt các giá trị mới cho vị trí của panner thông qua hàm `PositionPanner()`.

Để xem một cách triển khai hoàn chỉnh, hãy xem [ví dụ panner-node](https://mdn.github.io/webaudio-examples/panner-node/) của chúng tôi
([xem mã nguồn](https://github.com/mdn/webaudio-examples/tree/main/panner-node)) — bản demo này đưa bạn vào "Room of metal" 2.5D, nơi bạn có thể phát một track trên boombox rồi đi vòng quanh nó để thấy âm thanh thay đổi thế nào!

Lưu ý rằng chúng tôi đã dùng một số kiểm tra tính năng để hoặc cung cấp cho trình duyệt các giá trị thuộc tính mới hơn (như {{domxref("AudioListener.forwardX")}}) nhằm đặt vị trí, v.v. nếu trình duyệt hỗ trợ, hoặc các phương thức cũ hơn (như {{domxref("AudioListener.setOrientation()")}}) nếu nó vẫn hỗ trợ các phương thức đó nhưng không hỗ trợ thuộc tính mới.

```js
// thiết lập thông tin vị trí listener và panner
const WIDTH = window.innerWidth;
const HEIGHT = window.innerHeight;

const xPos = Math.floor(WIDTH / 2);
const yPos = Math.floor(HEIGHT / 2);
const zPos = 295;

// định nghĩa các biến khác

const audioCtx = new AudioContext();

const panner = audioCtx.createPanner();
panner.panningModel = "HRTF";
panner.distanceModel = "inverse";
panner.refDistance = 1;
panner.maxDistance = 10000;
panner.rolloffFactor = 1;
panner.coneInnerAngle = 360;
panner.coneOuterAngle = 0;
panner.coneOuterGain = 0;

if (panner.orientationX) {
  panner.orientationX.setValueAtTime(1, audioCtx.currentTime);
  panner.orientationY.setValueAtTime(0, audioCtx.currentTime);
  panner.orientationZ.setValueAtTime(0, audioCtx.currentTime);
} else {
  panner.setOrientation(1, 0, 0);
}

const listener = audioCtx.listener;

if (listener.forwardX) {
  listener.forwardX.setValueAtTime(0, audioCtx.currentTime);
  listener.forwardY.setValueAtTime(0, audioCtx.currentTime);
  listener.forwardZ.setValueAtTime(-1, audioCtx.currentTime);
  listener.upX.setValueAtTime(0, audioCtx.currentTime);
  listener.upY.setValueAtTime(1, audioCtx.currentTime);
  listener.upZ.setValueAtTime(0, audioCtx.currentTime);
} else {
  listener.setOrientation(0, 0, -1, 0, 1, 0);
}

let source;

const play = document.querySelector(".play");
const stop = document.querySelector(".stop");

const boomBox = document.querySelector(".boom-box");

const listenerData = document.querySelector(".listener-data");
const pannerData = document.querySelector(".panner-data");

leftBound = -xPos + 50;
rightBound = xPos - 50;

xIterator = WIDTH / 150;

// listener sẽ luôn ở cùng một vị trí trong bản demo này

if (listener.positionX) {
  listener.positionX.setValueAtTime(xPos, audioCtx.currentTime);
  listener.positionY.setValueAtTime(yPos, audioCtx.currentTime);
  listener.positionZ.setValueAtTime(300, audioCtx.currentTime);
} else {
  listener.setPosition(xPos, yPos, 300);
}

listenerData.textContent = `Listener data: X ${xPos} Y ${yPos} Z 300`;

// panner sẽ di chuyển khi đồ họa boombox di chuyển trên màn hình
function positionPanner() {
  if (panner.positionX) {
    panner.positionX.setValueAtTime(xPos, audioCtx.currentTime);
    panner.positionY.setValueAtTime(yPos, audioCtx.currentTime);
    panner.positionZ.setValueAtTime(zPos, audioCtx.currentTime);
  } else {
    panner.setPosition(xPos, yPos, zPos);
  }
  pannerData.textContent = `Panner data: X ${xPos} Y ${yPos} Z ${zPos}`;
}
```

> [!NOTE]
> Xét về việc tính ra những giá trị vị trí cần áp dụng cho listener và panner để âm thanh phù hợp với những gì hình ảnh đang thể hiện trên màn hình, có khá nhiều phép toán liên quan, nhưng bạn sẽ sớm quen với điều đó sau một chút thử nghiệm.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
