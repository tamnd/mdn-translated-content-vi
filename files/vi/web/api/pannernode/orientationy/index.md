---
title: "PannerNode: orientationY property"
short-title: orientationY
slug: Web/API/PannerNode/orientationY
page-type: web-api-instance-property
browser-compat: api.PannerNode.orientationY
---

{{ APIRef("Web Audio API") }}

Thuộc tính **`orientationY`** của giao diện {{ domxref("PannerNode") }}
cho biết thành phần Y (dọc) của hướng mà nguồn âm thanh đang hướng đến, trong không gian tọa độ Descartes 3D.

Vectơ đầy đủ được xác định bởi vị trí của nguồn âm thanh, được đưa ra dưới dạng
({{domxref("PannerNode.positionX", "positionX")}}, {{domxref("PannerNode.positionY", "positionY")}},
{{domxref("PannerNode.positionZ", "positionZ")}}), và hướng
của nguồn âm thanh (tức là hướng mà nó đang đối mặt), được đưa ra dưới dạng
({{domxref("PannerNode.orientationX", "orientationX")}},
`orientationY`,
{{domxref("PannerNode.orientationZ", "orientationZ")}}).

Tùy thuộc vào tính định hướng của âm thanh (được chỉ định bằng các thuộc tính
{{domxref("PannerNode.coneInnerAngle", "coneInnerAngle")}},
{{domxref("PannerNode.coneOuterAngle", "coneOuterAngle")}}, và
{{domxref("PannerNode.coneOuterGain", "coneOuterGain")}}), hướng của
âm thanh có thể thay đổi âm lượng cảm nhận được khi nó đang phát. Nếu âm thanh
đang hướng về phía người nghe, nó sẽ to hơn so với khi âm thanh hướng ra xa
người nghe.

{{domxref("AudioParam")}} chứa trong thuộc tính này là chỉ đọc; tuy nhiên bạn
vẫn có thể thay đổi giá trị của tham số bằng cách gán giá trị mới cho thuộc tính
{{domxref("AudioParam.value")}} của nó.

## Giá trị

Một {{domxref("AudioParam")}} có `value` là thành phần Y của
hướng mà nguồn âm thanh đang hướng đến, trong không gian tọa độ Descartes 3D.

## Ví dụ

Xem [`PannerNode.orientationX`](/en-US/docs/Web/API/PannerNode/orientationX#example) để có mã ví dụ minh họa hiệu ứng lên âm lượng khi thay đổi các tham số hướng của {{domxref("PannerNode")}} kết hợp với {{domxref("PannerNode.coneInnerAngle", "coneInnerAngle")}} và {{domxref("PannerNode.coneOuterAngle", "coneOuterAngle")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- [Kiến thức cơ bản về không gian hóa âm thanh Web](/en-US/docs/Web/API/Web_Audio_API/Web_audio_spatialization_basics)
- {{domxref("PannerNode")}}
