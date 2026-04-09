---
title: ConstantSourceNode
slug: Web/API/ConstantSourceNode
page-type: web-api-interface
browser-compat: api.ConstantSourceNode
---

{{APIRef("Web Audio API")}}

Giao diện **`ConstantSourceNode`** là một phần của Web Audio API, đại diện cho một nguồn âm thanh (dựa trên {{domxref("AudioScheduledSourceNode")}}) có đầu ra là một giá trị đơn không thay đổi. Điều này khiến nó hữu ích trong những trường hợp bạn cần một giá trị hằng đi vào từ một nguồn âm thanh. Ngoài ra, nó có thể được dùng như một {{domxref("AudioParam")}} có thể khởi tạo bằng hàm tạo bằng cách tự động hóa giá trị của {{domxref("ConstantSourceNode.offset", "offset")}} hoặc bằng cách nối một nút khác vào nó; xem [Điều khiển nhiều tham số bằng ConstantSourceNode](/en-US/docs/Web/API/Web_Audio_API/Controlling_multiple_parameters_with_ConstantSourceNode).

Một `ConstantSourceNode` không có đầu vào và có đúng một đầu ra đơn âm (một kênh). Giá trị đầu ra luôn giống với giá trị của tham số {{domxref("ConstantSourceNode.offset", "offset")}}.

{{InheritanceDiagram}}

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Số lượng đầu vào</th>
      <td><code>0</code></td>
    </tr>
    <tr>
      <th scope="row">Số lượng đầu ra</th>
      <td><code>1</code></td>
    </tr>
  </tbody>
</table>

## Constructor

- {{domxref("ConstantSourceNode.ConstantSourceNode", "ConstantSourceNode()")}}
  - : Tạo và trả về một thực thể `ConstantSourceNode` mới, có thể chỉ định thêm một đối tượng để thiết lập các giá trị ban đầu cho thuộc tính của đối tượng. Ngoài ra, bạn có thể dùng phương thức factory {{domxref("BaseAudioContext.createConstantSource()")}}; xem [Tạo một AudioNode](/en-US/docs/Web/API/AudioNode#creating_an_audionode).

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("AudioScheduledSourceNode")}}, và bổ sung các thuộc tính sau:_

- {{domxref("ConstantSourceNode.offset", "offset")}}
  - : Một {{domxref("AudioParam")}} chỉ định giá trị mà nguồn này liên tục xuất ra. Giá trị mặc định là 1.0.

### Sự kiện

_Kế thừa các sự kiện từ giao diện cha của nó, {{domxref("AudioScheduledSourceNode")}}._

> [!NOTE]
> Trong một số trình duyệt, cách triển khai các sự kiện này là một phần của giao diện {{domxref("AudioScheduledSourceNode")}}.

- {{domxref("AudioScheduledSourceNode.ended_event","ended")}}
  - : Được kích hoạt bất cứ khi nào dữ liệu của `ConstantSourceNode` dừng phát.

## Phương thức thể hiện

_Kế thừa các phương thức từ giao diện cha của nó, {{domxref("AudioScheduledSourceNode")}}._

> [!NOTE]
> Trong một số trình duyệt, cách triển khai các phương thức này là một phần của giao diện {{domxref("AudioScheduledSourceNode")}}.

- {{domxref("AudioScheduledSourceNode.start", "start()")}}
  - : Lên lịch để âm thanh phát tại một thời điểm chính xác.
- {{domxref("AudioScheduledSourceNode.stop", "stop()")}}
  - : Lên lịch để âm thanh dừng phát tại một thời điểm chính xác.

## Ví dụ

Trong bài viết [Điều khiển nhiều tham số bằng ConstantSourceNode](/en-US/docs/Web/API/Web_Audio_API/Controlling_multiple_parameters_with_ConstantSourceNode), một `ConstantSourceNode` được tạo để cho phép một thanh trượt điều khiển thay đổi hệ số khuếch đại của hai {{domxref("GainNode")}}. Ba nút được thiết lập như sau:

```js
gainNode2 = context.createGain();
gainNode3 = context.createGain();
gainNode2.gain.value = gainNode3.gain.value = 0.5;
volumeSliderControl.value = gainNode2.gain.value;

constantNode = context.createConstantSource();
constantNode.connect(gainNode2.gain);
constantNode.connect(gainNode3.gain);
constantNode.start();

gainNode2.connect(context.destination);
gainNode3.connect(context.destination);
```

Đoạn mã này bắt đầu bằng việc tạo các nút gain và đặt giá trị của chúng, cùng với điều khiển âm lượng sẽ dùng để điều chỉnh chúng, về 0.5. Sau đó `ConstantSourceNode` được tạo bằng cách gọi {{domxref("BaseAudioContext/createConstantSource", "AudioContext.createConstantSource()")}}, rồi các tham số gain của từng nút gain được nối với `ConstantSourceNode`. Sau khi khởi động nguồn hằng bằng cách gọi phương thức {{domxref("AudioScheduledSourceNode.start", "start()")}} của nó, cuối cùng hai nút gain được nối tới đích âm thanh (thường là loa hoặc tai nghe).

Giờ đây, bất cứ khi nào giá trị của {{domxref("ConstantSourceNode.offset", "constantNode.offset")}} thay đổi, hệ số gain của cả `gainNode2` và `gainNode3` cũng sẽ thay đổi theo cùng giá trị đó.

Để xem ví dụ này hoạt động thực tế, cũng như đọc phần còn lại của mã nguồn mà những đoạn trích này được lấy ra, hãy xem [Điều khiển nhiều tham số bằng ConstantSourceNode.](/en-US/docs/Web/API/Web_Audio_API/Controlling_multiple_parameters_with_ConstantSourceNode)

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- {{domxref("AudioScheduledSourceNode")}}
- {{domxref("AudioNode")}}
