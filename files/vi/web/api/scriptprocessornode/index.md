---
title: ScriptProcessorNode
slug: Web/API/ScriptProcessorNode
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.ScriptProcessorNode
---

{{APIRef("Web Audio API")}}{{Deprecated_Header}}

Giao diện `ScriptProcessorNode` cho phép tạo, xử lý hoặc phân tích âm thanh bằng JavaScript.

{{InheritanceDiagram}}

> [!NOTE]
> Tính năng này đã được thay thế bởi [AudioWorklets](/en-US/docs/Web/API/AudioWorklet) và giao diện {{domxref("AudioWorkletNode")}}.

Giao diện `ScriptProcessorNode` là một mô-đun xử lý âm thanh {{domxref("AudioNode")}} được liên kết với hai bộ đệm: một chứa dữ liệu âm thanh đầu vào và một chứa dữ liệu âm thanh đầu ra đã xử lý. Một sự kiện triển khai giao diện {{domxref("AudioProcessingEvent")}} được gửi đến đối tượng mỗi khi bộ đệm đầu vào chứa dữ liệu mới, và trình xử lý sự kiện kết thúc khi nó đã điền đầy bộ đệm đầu ra với dữ liệu.

![ScriptProcessorNode lưu trữ đầu vào trong bộ đệm, gửi sự kiện audioprocess. EventHandler lấy bộ đệm đầu vào và điền vào bộ đệm đầu ra được gửi đến đầu ra bởi ScriptProcessorNode.](webaudioscriptprocessingnode.png)

Kích thước của bộ đệm đầu vào và đầu ra được xác định khi tạo, khi phương thức {{domxref("BaseAudioContext.createScriptProcessor")}} được gọi (cả hai đều được xác định bởi tham số `bufferSize` của {{domxref("BaseAudioContext.createScriptProcessor")}}). Kích thước bộ đệm phải là lũy thừa của 2 trong khoảng `256` đến `16384`, tức là `256`, `512`, `1024`, `2048`, `4096`, `8192` hoặc `16384`. Các số nhỏ giảm _độ trễ_, nhưng các số lớn có thể cần thiết để tránh âm thanh bị ngắt và nhiễu.

Nếu kích thước bộ đệm không được xác định, điều được khuyến nghị, trình duyệt sẽ chọn một kích thước mà thuật toán heuristic của nó cho là phù hợp.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Số lượng đầu vào</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Số lượng đầu ra</th>
      <td><code>1</code></td>
    </tr>
    <tr>
      <th scope="row">Chế độ đếm kênh</th>
      <td><code>"max"</code></td>
    </tr>
    <tr>
      <th scope="row">Số lượng kênh</th>
      <td><code>2</code> (không được sử dụng trong chế độ đếm mặc định)</td>
    </tr>
    <tr>
      <th scope="row">Diễn giải kênh</th>
      <td><code>"speakers"</code></td>
    </tr>
  </tbody>
</table>

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ cha của nó, {{domxref("AudioNode")}}_.

- {{domxref("ScriptProcessorNode.bufferSize")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Trả về một số nguyên đại diện cho cả kích thước bộ đệm đầu vào và đầu ra. Giá trị của nó có thể là lũy thừa của 2 trong khoảng `256` – `16384`.

## Phương thức phiên bản

_Không có phương thức cụ thể nào; kế thừa các phương thức từ cha của nó, {{domxref("AudioNode")}}_.

## Sự kiện

Lắng nghe các sự kiện này bằng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) hoặc bằng cách gán trình xử lý sự kiện vào thuộc tính `oneventname` của giao diện này:

- [`audioprocess`](/en-US/docs/Web/API/ScriptProcessorNode/audioprocess_event) {{Deprecated_Inline}}
  - : Kích hoạt khi bộ đệm đầu vào của `ScriptProcessorNode` sẵn sàng để được xử lý.
    Cũng có sẵn thông qua thuộc tính trình xử lý sự kiện `onaudioprocess`.

## Ví dụ

Xem [`BaseAudioContext.createScriptProcessor()`](/en-US/docs/Web/API/BaseAudioContext/createScriptProcessor#examples) để biết ví dụ code.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
