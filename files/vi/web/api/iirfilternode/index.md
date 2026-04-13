---
title: IIRFilterNode
slug: Web/API/IIRFilterNode
page-type: web-api-interface
browser-compat: api.IIRFilterNode
---

{{APIRef("Web Audio API")}}

Giao diện **`IIRFilterNode`** của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) là một bộ xử lý {{domxref("AudioNode")}} thực hiện bộ lọc **[infinite impulse response](https://en.wikipedia.org/wiki/Infinite_impulse_response)** (IIR) tổng quát; loại bộ lọc này có thể được dùng để triển khai các thiết bị điều chỉnh âm thanh và bộ cân bằng đồ họa. Nó cho phép chỉ định các tham số phản hồi của bộ lọc để có thể điều chỉnh theo nhu cầu.

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
      <td>Same as on the input</td>
    </tr>
    <tr>
      <th scope="row">Channel interpretation</th>
      <td><code>"speakers"</code></td>
    </tr>
  </tbody>
</table>

Thông thường, tốt hơn là sử dụng giao diện {{domxref("BiquadFilterNode")}} để triển khai các bộ lọc bậc cao hơn vì một số lý do:

- Bộ lọc Biquad thường ít nhạy cảm hơn với các vấn đề số học.
- Các tham số bộ lọc của bộ lọc Biquad có thể được tự động hóa.
- Tất cả các bộ lọc IIR bậc chẵn đều có thể được tạo bằng {{domxref("BiquadFilterNode")}}.

Tuy nhiên, nếu bạn cần tạo bộ lọc IIR bậc lẻ, bạn sẽ cần dùng `IIRFilterNode`. Bạn cũng có thể thấy giao diện này hữu ích nếu không cần tự động hóa, hoặc vì các lý do khác.

> [!NOTE]
> Sau khi nút được tạo, bạn không thể thay đổi các hệ số của nó.

`IIRFilterNode` có tham chiếu tail-time; chúng tiếp tục xuất âm thanh không im lặng với đầu vào bằng không. Là bộ lọc IIR, đầu vào khác không tiếp tục mãi mãi, nhưng điều này có thể bị giới hạn sau một khoảng thời gian hữu hạn trong thực tế, khi đầu ra tiến gần đủ đến không. Thời gian thực tế phụ thuộc vào các hệ số bộ lọc được cung cấp.

## Hàm khởi tạo

- {{domxref("IIRFilterNode.IIRFilterNode", "IIRFilterNode()")}}
  - : Tạo một phiên bản mới của đối tượng IIRFilterNode.

## Thuộc tính phiên bản

_Giao diện này không có thuộc tính riêng; tuy nhiên, nó kế thừa các thuộc tính từ thực thể cha, {{domxref("AudioNode")}}_.

## Phương thức phiên bản

_Kế thừa các phương thức từ thực thể cha, {{domxref("AudioNode")}}. Nó cũng có các phương thức bổ sung sau:_

- {{domxref("IIRFilterNode.getFrequencyResponse", "getFrequencyResponse()")}}
  - : Sử dụng các cài đặt tham số hiện tại của bộ lọc để tính toán phản hồi cho các tần số được chỉ định trong mảng tần số được cung cấp.

## Ví dụ

Bạn có thể xem [simple IIR filter demo live](https://mdn.github.io/webaudio-examples/iirfilter-node/). Xem thêm [source code on GitHub](https://github.com/mdn/webaudio-examples/tree/main/iirfilter-node). Nó bao gồm một số giá trị hệ số khác nhau cho các tần số lowpass khác nhau, bạn có thể thay đổi giá trị của hằng số `filterNumber` từ 0 đến 3 để xem các hiệu ứng khác nhau.

Xem thêm hướng dẫn [Using IIR filters](/en-US/docs/Web/API/Web_Audio_API/Using_IIR_filters) để biết giải thích đầy đủ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- {{domxref("AudioNode")}}
- {{domxref("BiquadFilterNode")}}
