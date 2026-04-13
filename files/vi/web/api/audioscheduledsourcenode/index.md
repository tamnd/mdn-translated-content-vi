---
title: AudioScheduledSourceNode
slug: Web/API/AudioScheduledSourceNode
page-type: web-api-interface
browser-compat: api.AudioScheduledSourceNode
---

{{APIRef("Web Audio API")}}

Giao diện `AudioScheduledSourceNode`, một phần của Web Audio API, là giao diện cha cho một số loại giao diện nút nguồn âm thanh có chung khả năng được khởi động và dừng lại, có thể tại các thời điểm được chỉ định. Cụ thể, giao diện này định nghĩa các phương thức {{domxref("AudioScheduledSourceNode.start", "start()")}} và {{domxref("AudioScheduledSourceNode.stop", "stop()")}}, cũng như sự kiện {{domxref("AudioScheduledSourceNode.ended_event", "ended")}}.

> [!NOTE]
> Bạn không thể tạo trực tiếp một đối tượng `AudioScheduledSourceNode`. Thay vào đó, hãy dùng một giao diện mở rộng từ nó, chẳng hạn như {{domxref("AudioBufferSourceNode")}}, {{domxref("OscillatorNode")}} hoặc {{domxref("ConstantSourceNode")}}.

Trừ khi có ghi chú khác, các nút dựa trên `AudioScheduledSourceNode` sẽ xuất ra sự im lặng khi không phát (nghĩa là trước khi `start()` được gọi và sau khi `stop()` được gọi). Sự im lặng, như mọi khi, được biểu diễn bằng một luồng mẫu có giá trị bằng không (`0`).

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("AudioNode")}}._

## Phương thức thể hiện

_Kế thừa các phương thức từ giao diện cha của nó, {{domxref("AudioNode")}}, và bổ sung các phương thức sau:_

- {{domxref("AudioScheduledSourceNode.start", "start()")}}
  - : Lên lịch để nút bắt đầu phát âm thanh hằng tại thời điểm đã chỉ định. Nếu không chỉ định thời gian, nút sẽ bắt đầu phát ngay lập tức.
- {{domxref("AudioScheduledSourceNode.stop", "stop()")}}
  - : Lên lịch để nút dừng phát tại thời điểm đã chỉ định. Nếu không chỉ định thời gian, nút sẽ dừng phát ngay lập tức.

## Sự kiện

Lắng nghe các sự kiện này bằng [`addEventListener()`](/en-US/docs/Web/API/EventTarget/addEventListener) hoặc bằng cách gán một trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này:

- [`ended`](/en-US/docs/Web/API/AudioScheduledSourceNode/ended_event)
  - : Được kích hoạt khi nút nguồn đã dừng phát, do nó đạt tới thời điểm dừng được xác định trước, đã phát hết toàn bộ thời lượng âm thanh, hoặc toàn bộ bộ đệm đã được phát xong.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
- {{domxref("AudioNode")}}
