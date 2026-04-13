---
title: DelayNode
slug: Web/API/DelayNode
page-type: web-api-interface
browser-compat: api.DelayNode
---

{{APIRef("Web Audio API")}}

Giao diện **`DelayNode`** đại diện cho một [delay-line](https://en.wikipedia.org/wiki/Digital_delay_line); một mô-đun xử lý âm thanh {{domxref("AudioNode")}} gây ra độ trễ giữa thời điểm đến của dữ liệu đầu vào và sự lan truyền của nó đến đầu ra.

Một `DelayNode` luôn có đúng một đầu vào và một đầu ra, cả hai đều có cùng số kênh.

![DelayNode hoạt động như một delay-line, ở đây với giá trị là 1s.](webaudiodelaynode.png)

Khi tạo một đồ thị có chu kỳ, bắt buộc phải có ít nhất một `DelayNode` trong chu kỳ đó, hoặc các nút tham gia vào chu kỳ sẽ bị tắt tiếng.

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
      <td><code>2</code> (không được sử dụng trong chế độ đếm mặc định)</td>
    </tr>
    <tr>
      <th scope="row">Diễn giải kênh</th>
      <td><code>"speakers"</code></td>
    </tr>
  </tbody>
</table>

## Hàm khởi tạo

- {{domxref("DelayNode.DelayNode", "DelayNode()")}}
  - : Tạo một phiên bản mới của đối tượng DelayNode. Thay thế, bạn có thể sử dụng phương thức nhà máy {{domxref("BaseAudioContext.createDelay()")}}; xem [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha {{domxref("AudioNode")}}._

- {{domxref("DelayNode.delayTime")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) đại diện cho lượng độ trễ cần áp dụng, được chỉ định bằng giây.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa các phương thức từ lớp cha {{domxref("AudioNode")}}._

## Ví dụ

Xem [`BaseAudioContext.createDelay()`](/en-US/docs/Web/API/BaseAudioContext/createDelay#examples) để biết mã ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
