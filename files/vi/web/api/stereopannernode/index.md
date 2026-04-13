---
title: StereoPannerNode
slug: Web/API/StereoPannerNode
page-type: web-api-interface
browser-compat: api.StereoPannerNode
---

{{APIRef("Web Audio API")}}

Giao diện `StereoPannerNode` của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) đại diện cho một nút panner stereo đơn giản có thể được dùng để chuyển luồng âm thanh sang trái hoặc phải. Đây là mô-đun xử lý âm thanh {{domxref("AudioNode")}} định vị luồng âm thanh đến trong hình ảnh stereo bằng thuật toán [panning](https://webaudio.github.io/web-audio-api/#panning-algorithm) equal-power chi phí thấp.

Thuộc tính {{domxref("StereoPannerNode.pan", "pan")}} nhận giá trị không có đơn vị giữa `-1` (pan trái hoàn toàn) và `1` (pan phải hoàn toàn). Giao diện này được giới thiệu như một cách đơn giản hơn nhiều để áp dụng hiệu ứng panning đơn giản thay vì phải sử dụng {{domxref("PannerNode")}} đầy đủ.

![Nút Stereo Panner di chuyển vị trí âm thanh từ giữa hai loa sang trái.](stereopannernode.png)

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Số đầu vào</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Số đầu ra</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Chế độ đếm kênh</th>
      <td><code>"clamped-max"</code></td>
    </tr>
    <tr>
      <th scope="row">Số kênh</th>
      <td><code>2</code></td>
    </tr>
    <tr>
      <th scope="row">Diễn giải kênh</th>
      <td><code>"speakers"</code></td>
    </tr>
  </tbody>
</table>

## Hàm khởi tạo

- {{domxref("StereoPannerNode.StereoPannerNode", "StereoPannerNode()")}}
  - : Tạo instance mới của đối tượng `StereoPannerNode`.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ cha của nó, {{domxref("AudioNode")}}_.

- {{domxref("StereoPannerNode.pan")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) đại diện cho lượng panning cần áp dụng.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa các phương thức từ cha của nó, {{domxref("AudioNode")}}_.

## Ví dụ

Xem [`BaseAudioContext.createStereoPanner()`](/en-US/docs/Web/API/BaseAudioContext/createStereoPanner#examples) để biết code ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
