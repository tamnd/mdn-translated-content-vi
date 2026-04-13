---
title: GainNode
slug: Web/API/GainNode
page-type: web-api-interface
browser-compat: api.GainNode
---

{{ APIRef("Web Audio API") }}

Giao diện `GainNode` đại diện cho sự thay đổi âm lượng. Đây là mô-đun xử lý âm thanh {{domxref("AudioNode")}} khiến một mức gain nhất định được áp dụng cho dữ liệu đầu vào trước khi truyền ra đầu ra. Một `GainNode` luôn có chính xác một đầu vào và một đầu ra, cả hai đều có cùng số kênh.

Gain là một giá trị không có đơn vị, thay đổi theo thời gian, được nhân với mỗi mẫu tương ứng của tất cả các kênh đầu vào. Nếu được sửa đổi, gain mới được áp dụng ngay lập tức, gây ra các "tiếng click" không thẩm mỹ trong âm thanh kết quả. Để tránh điều này xảy ra, không bao giờ thay đổi giá trị trực tiếp mà hãy sử dụng các phương thức nội suy hàm mũ trên giao diện {{domxref("AudioParam")}}.

![GainNode tăng gain của đầu ra.](webaudiogainnode.png)

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Number of inputs</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Number of outputs</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Channel count mode</th>
      <td><code>"max"</code></td>
    </tr>
    <tr>
      <th scope="row">Channel count</th>
      <td><code>2</code> (not used in the default count mode)</td>
    </tr>
    <tr>
      <th scope="row">Channel interpretation</th>
      <td><code>"speakers"</code></td>
    </tr>
  </tbody>
</table>

## Hàm khởi tạo

- {{domxref("GainNode.GainNode", "GainNode()")}}
  - : Tạo và trả về đối tượng `GainNode` mới. Ngoài ra, bạn có thể sử dụng phương thức factory {{domxref("BaseAudioContext.createGain()")}}; xem [Tạo AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ cha, {{domxref("AudioNode")}}_.

- {{domxref("GainNode.gain")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioParam")}} [a-rate](/en-US/docs/Web/API/AudioParam#a-rate) đại diện cho lượng gain cần áp dụng. Bạn phải đặt {{domxref("AudioParam.value")}} hoặc sử dụng các phương thức của `AudioParam` để thay đổi hiệu ứng gain.

## Phương thức phiên bản

_Không có phương thức cụ thể; kế thừa các phương thức từ cha, {{domxref("AudioNode")}}_.

## Ví dụ

Xem [`BaseAudioContext.createGain()`](/en-US/docs/Web/API/BaseAudioContext/createGain#examples) để biết code ví dụ về cách sử dụng `AudioContext` để tạo `GainNode`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
