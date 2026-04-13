---
title: WaveShaperNode
slug: Web/API/WaveShaperNode
page-type: web-api-interface
browser-compat: api.WaveShaperNode
---

{{ APIRef("Web Audio API") }}

Giao diện **`WaveShaperNode`** đại diện cho bộ méo phi tuyến tính.

Đây là {{domxref("AudioNode")}} sử dụng đường cong để áp dụng méo dạng sóng cho tín hiệu. Bên cạnh các hiệu ứng méo rõ ràng, nó thường được sử dụng để thêm cảm giác ấm áp cho tín hiệu.

Một `WaveShaperNode` luôn có đúng một đầu vào và một đầu ra.

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
      <td><code>"max"</code></td>
    </tr>
    <tr>
      <th scope="row">Số kênh</th>
      <td><code>2</code> (không sử dụng trong chế độ đếm mặc định)</td>
    </tr>
    <tr>
      <th scope="row">Diễn giải kênh</th>
      <td><code>"speakers"</code></td>
    </tr>
  </tbody>
</table>

## Hàm khởi tạo

- {{domxref("WaveShaperNode.WaveShaperNode", "WaveShaperNode()")}}
  - : Tạo phiên bản mới của đối tượng `WaveShaperNode`.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ cha, {{domxref("AudioNode")}}_.

- {{domxref("WaveShaperNode.curve")}}
  - : Một {{jsxref("Float32Array")}} chứa các số mô tả méo cần áp dụng.
- {{domxref("WaveShaperNode.oversample")}}
  - : Một giá trị liệt kê cho biết liệu có phải sử dụng oversampling hay không. Oversampling là kỹ thuật tạo nhiều mẫu hơn (up-sampling) trước khi áp dụng hiệu ứng méo cho tín hiệu âm thanh.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa các phương thức từ cha, {{domxref("AudioNode")}}_.

## Ví dụ

Xem [`BaseAudioContext.createWaveShaper()`](/en-US/docs/Web/API/BaseAudioContext/createWaveShaper#examples) để biết mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
