---
title: DynamicsCompressorNode
slug: Web/API/DynamicsCompressorNode
page-type: web-api-interface
browser-compat: api.DynamicsCompressorNode
---

{{ APIRef("Web Audio API") }}

Giao diện `DynamicsCompressorNode` cung cấp hiệu ứng nén âm thanh, giúp hạ âm lượng của các phần tín hiệu to nhất nhằm ngăn chặn hiện tượng clipping và méo tiếng có thể xảy ra khi nhiều âm thanh được phát và ghép lại cùng một lúc. Hiệu ứng này thường được sử dụng trong sản xuất âm nhạc và âm thanh trò chơi. `DynamicsCompressorNode` là một {{domxref("AudioNode")}} có đúng một đầu vào và một đầu ra.

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

- {{domxref("DynamicsCompressorNode.DynamicsCompressorNode", "DynamicsCompressorNode()")}}
  - : Tạo một phiên bản mới của đối tượng `DynamicsCompressorNode`.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha {{domxref("AudioNode")}}._

- {{domxref("DynamicsCompressorNode.threshold")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioParam")}} tốc độ [k-rate](/en-US/docs/Web/API/AudioParam#k-rate) đại diện cho giá trị decibel mà trên đó quá trình nén sẽ bắt đầu có hiệu lực.
- {{domxref("DynamicsCompressorNode.knee")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioParam")}} tốc độ [k-rate](/en-US/docs/Web/API/AudioParam#k-rate) chứa giá trị decibel đại diện cho phạm vi trên ngưỡng mà đường cong chuyển tiếp mượt mà sang phần nén.
- {{domxref("DynamicsCompressorNode.ratio")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioParam")}} tốc độ [k-rate](/en-US/docs/Web/API/AudioParam#k-rate) đại diện cho lượng thay đổi, tính bằng dB, cần thiết ở đầu vào để tạo ra thay đổi 1 dB ở đầu ra.
- {{domxref("DynamicsCompressorNode.reduction")}} {{ReadOnlyInline}}
  - : Một `float` đại diện cho lượng giảm gain hiện đang được bộ nén áp dụng lên tín hiệu.
- {{domxref("DynamicsCompressorNode.attack")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioParam")}} tốc độ [k-rate](/en-US/docs/Web/API/AudioParam#k-rate) đại diện cho lượng thời gian, tính bằng giây, cần thiết để giảm gain xuống 10 dB.
- {{domxref("DynamicsCompressorNode.release")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioParam")}} tốc độ [k-rate](/en-US/docs/Web/API/AudioParam#k-rate) đại diện cho lượng thời gian, tính bằng giây, cần thiết để tăng gain lên 10 dB.

## Phương thức phiên bản

_Không có phương thức riêng; kế thừa các phương thức từ lớp cha {{domxref("AudioNode")}}._

## Ví dụ

Xem ví dụ tại [`BaseAudioContext.createDynamicsCompressor()`](/en-US/docs/Web/API/BaseAudioContext/createDynamicsCompressor#examples).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
