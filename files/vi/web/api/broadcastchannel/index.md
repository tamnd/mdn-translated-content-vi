---
title: BroadcastChannel
slug: Web/API/BroadcastChannel
page-type: web-api-interface
browser-compat: api.BroadcastChannel
---

{{APIRef("Broadcast Channel API")}} {{AvailableInWorkers}}

Giao diện **`BroadcastChannel`** biểu diễn một kênh có tên mà bất kỳ {{glossary("browsing context")}} nào thuộc cùng một {{glossary("origin")}} đều có thể đăng ký theo dõi. Giao diện này cho phép giao tiếp giữa các tài liệu khác nhau (trong các cửa sổ, thẻ, frame hoặc iframe khác nhau) có cùng nguồn gốc. Thông điệp được phát đi thông qua sự kiện {{domxref("BroadcastChannel/message_event", "message")}} kích hoạt trên mọi đối tượng `BroadcastChannel` đang lắng nghe kênh đó, ngoại trừ đối tượng đã gửi thông điệp.

{{InheritanceDiagram}}

## Hàm tạo

- {{domxref("BroadcastChannel.BroadcastChannel", "BroadcastChannel()")}}
  - : Tạo một đối tượng liên kết tới kênh có tên đã chỉ định.

## Thuộc tính thể hiện

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha {{domxref("EventTarget")}}._

- {{domxref("BroadcastChannel.name")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi là tên của kênh.

## Phương thức thể hiện

_Giao diện này cũng kế thừa các phương thức từ giao diện cha {{domxref("EventTarget")}}._

- {{domxref("BroadcastChannel.postMessage()")}}
  - : Gửi thông điệp, thuộc bất kỳ kiểu đối tượng nào, tới từng đối tượng `BroadcastChannel` đang lắng nghe cùng một kênh.
- {{domxref("BroadcastChannel.close()")}}
  - : Đóng đối tượng kênh, cho biết nó sẽ không nhận thêm thông điệp mới nào nữa và cho phép nó cuối cùng được bộ gom rác thu hồi.

## Sự kiện

_Giao diện này cũng kế thừa các sự kiện từ giao diện cha {{domxref("EventTarget")}}._

- {{domxref("BroadcastChannel/message_event", "message")}}
  - : Kích hoạt khi một thông điệp đến trên kênh.
    Cũng có thể truy cập qua thuộc tính `onmessage`.
- {{domxref("BroadcastChannel/messageerror_event", "messageerror")}}
  - : Kích hoạt khi một thông điệp đến nhưng không thể giải tuần tự.
    Cũng có thể truy cập qua thuộc tính `onmessageerror`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Một cách khác, nặng hơn, để giao tiếp giữa các ngữ cảnh trình duyệt: {{domxref("ServiceWorker")}}.
- [Tổng quan về Broadcast Channel API](/en-US/docs/Web/API/Broadcast_Channel_API)
