---
title: Channel Messaging API
slug: Web/API/Channel_Messaging_API
page-type: web-api-overview
browser-compat:
  - api.MessageChannel
  - api.MessagePort
spec-urls: https://html.spec.whatwg.org/multipage/web-messaging.html#channel-messaging
---

{{DefaultAPISidebar("Channel Messaging API")}} {{AvailableInWorkers}}

**Channel Messaging API** cho phép hai script riêng biệt đang chạy trong các ngữ cảnh duyệt khác nhau được gắn với cùng một tài liệu (ví dụ: hai IFrame, hoặc tài liệu chính và một IFrame, hai tài liệu thông qua {{domxref("SharedWorker")}}, hoặc hai worker) giao tiếp trực tiếp, truyền thông điệp qua lại với nhau thông qua các kênh hai chiều (hoặc pipe) với một cổng ở mỗi đầu.

## Khái niệm và cách dùng

Một kênh thông điệp được tạo bằng hàm khởi tạo {{domxref("MessageChannel.MessageChannel", "MessageChannel()")}}. Sau khi tạo, hai cổng của kênh có thể được truy cập thông qua các thuộc tính {{domxref("MessageChannel.port1")}} và {{domxref("MessageChannel.port2")}} (cả hai đều trả về các đối tượng {{domxref("MessagePort")}}.) Ứng dụng tạo ra kênh sẽ dùng `port1`, còn ứng dụng ở đầu kia của cổng sẽ dùng `port2` — bạn gửi một thông điệp tới `port2`, rồi chuyển quyền sở hữu cổng đó sang ngữ cảnh duyệt khác bằng {{domxref("window.postMessage")}} cùng với hai đối số (thông điệp cần gửi, và đối tượng cần chuyển quyền sở hữu, trong trường hợp này chính là cổng đó.)

Khi các đối tượng có thể chuyển giao này được chuyển đi, chúng sẽ không còn dùng được trong ngữ cảnh mà trước đó chúng thuộc về. Một cổng sau khi đã được gửi sẽ không thể tiếp tục được dùng bởi ngữ cảnh ban đầu.

Ngữ cảnh duyệt còn lại có thể lắng nghe thông điệp bằng {{domxref("MessagePort.message_event", "onmessage")}}, và lấy nội dung thông điệp thông qua thuộc tính `data` của sự kiện. Sau đó bạn có thể phản hồi bằng cách gửi một thông điệp ngược lại tài liệu ban đầu bằng {{domxref("MessagePort.postMessage")}}.

Khi muốn ngừng gửi thông điệp qua kênh, bạn có thể gọi {{domxref("MessagePort.close")}} để đóng các cổng.

Tìm hiểu thêm về cách dùng API này trong [Sử dụng channel messaging](/vi/docs/Web/API/Channel_Messaging_API/Using_channel_messaging).

## Giao diện

- {{domxref("MessageChannel")}}
  - : Tạo một kênh thông điệp mới để gửi thông điệp qua lại.
- {{domxref("MessagePort")}}
  - : Điều khiển các cổng trên kênh thông điệp, cho phép gửi thông điệp từ một cổng và lắng nghe chúng đến ở cổng còn lại.

## Ví dụ

- Chúng tôi đã phát hành một [demo cơ bản về channel messaging](https://github.com/mdn/dom-examples/tree/main/channel-messaging-basic) trên GitHub ([chạy thử trực tiếp](https://mdn.github.io/dom-examples/channel-messaging-basic/)), minh họa một lần truyền thông điệp rất đơn giản giữa một trang và một {{htmlelement("iframe")}} được nhúng.
- Bạn cũng có thể xem [demo gửi nhiều thông điệp](https://github.com/mdn/dom-examples/tree/main/channel-messaging-multimessage) ([chạy trực tiếp tại đây](https://mdn.github.io/dom-examples/channel-messaging-multimessage/)), minh họa một thiết lập phức tạp hơn một chút có thể gửi nhiều thông điệp giữa trang chính và IFrame.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng channel messaging](/vi/docs/Web/API/Channel_Messaging_API/Using_channel_messaging)
- [Web Workers API](/en-US/docs/Web/API/Web_Workers_API)
- [Broadcast Channel API](/en-US/docs/Web/API/Broadcast_Channel_API)
