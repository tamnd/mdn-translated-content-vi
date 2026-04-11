---
title: "PannerNode: positionX property"
short-title: positionX
slug: Web/API/PannerNode/positionX
page-type: web-api-instance-property
browser-compat: api.PannerNode.positionX
---

{{ APIRef("Web Audio API") }}

Thuộc tính **`positionX`** của giao diện {{ domxref("PannerNode")}} xác định tọa độ X của vị trí nguồn âm thanh trong tọa độ Descartes 3D, tương ứng với trục _ngang_ (trái-phải).

Vectơ đầy đủ được xác định bởi vị trí của nguồn âm thanh, được đưa ra dưới dạng
(`positionX`, {{domxref("PannerNode.positionY", "positionY")}},
{{domxref("PannerNode.positionZ", "positionZ")}}), và hướng
của nguồn âm thanh (tức là hướng mà nó đang đối mặt), được đưa ra dưới dạng
({{domxref("PannerNode.orientationX", "orientationX")}},
{{domxref("PannerNode.orientationY", "orientationY")}},
{{domxref("PannerNode.orientationZ", "orientationZ")}}).

Tùy thuộc vào tính định hướng của âm thanh (được chỉ định bằng các thuộc tính
{{domxref("PannerNode.coneInnerAngle", "coneInnerAngle")}},
{{domxref("PannerNode.coneOuterAngle", "coneOuterAngle")}}, và
{{domxref("PannerNode.coneOuterGain", "codeOuterGain")}}), hướng của
âm thanh có thể thay đổi âm lượng cảm nhận được khi nó đang phát. Nếu âm thanh
đang hướng về phía người nghe, nó sẽ to hơn so với khi âm thanh hướng ra xa
người nghe.

{{domxref("AudioParam")}} chứa trong thuộc tính này là chỉ đọc; tuy nhiên bạn
vẫn có thể thay đổi giá trị của tham số bằng cách gán giá trị mới cho thuộc tính
{{domxref("AudioParam.value")}} của nó.

## Giá trị

Một {{domxref("AudioParam")}} có `value` là tọa độ X của vị trí
nguồn âm thanh, trong tọa độ Descartes 3D. Giá trị mặc định là 0.

## Ví dụ

Ví dụ sau khởi động một bộ dao động và dịch chuyển nó sang trái sau 1 giây, sang
phải sau 2 giây, và về giữa sau 3 giây.

```js
const context = new AudioContext();

const osc = new OscillatorNode(context);
const panner = new PannerNode(context);

panner.positionX.setValueAtTime(-1, context.currentTime + 1);
panner.positionX.setValueAtTime(1, context.currentTime + 2);
panner.positionX.setValueAtTime(0, context.currentTime + 3);

osc.connect(panner).connect(context.destination);

osc.start(0);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Kiến thức cơ bản về không gian hóa âm thanh Web](/en-US/docs/Web/API/Web_Audio_API/Web_audio_spatialization_basics)
- {{domxref("PannerNode")}}
