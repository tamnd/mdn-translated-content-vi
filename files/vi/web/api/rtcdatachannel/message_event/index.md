---
title: "RTCDataChannel: sự kiện tin nhắn"
short-title: message
slug: Web/API/RTCDataChannel/message_event
page-type: web-api-event
browser-compat: api.RTCDataChannel.message_event
---

{{APIRef("WebRTC")}}

Sự kiện WebRTC **`message`** được gửi đến trình xử lý sự kiện `onmessage` trên đối tượng {{domxref("RTCDataChannel")}} khi nhận được tin nhắn từ thiết bị ngang hàng từ xa.

> [!LƯU Ý]
> Sự kiện `message` sử dụng loại đối tượng sự kiện là giao diện {{domxref("MessageEvent")}} được xác định bởi đặc tả HTML.

Sự kiện này không thể hủy và không bong bóng.


## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("message", (event) => { })

onmessage = (event) => { }
```


## Loại sự kiện

Một {{domxref("MessageEvent")}}. Kế thừa từ {{domxref("Event")}}.


{{InheritanceDiagram("MessageEvent")}}

## Thuộc tính sự kiện

_Cũng kế thừa các thuộc tính từ giao diện chính của nó, {{domxref("Event")}}._

- {{domxref("MessageEvent.data")}} {{ReadOnlyInline}}
  - : Dữ liệu được gửi bởi bộ phát tin nhắn.
- {{domxref("MessageEvent.origin")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị nguồn gốc của bộ phát thông báo.
- {{domxref("MessageEvent.lastEventId")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho một ID duy nhất cho sự kiện.
- {{domxref("MessageEvent.source")}} {{ReadOnlyInline}}
  - : Tham chiếu đến bộ phát thông báo, một trong {{glossary("WindowProxy")}}, {{domxref("MessagePort")}} hoặc {{domxref("ServiceWorker")}}.

- {{domxref("MessageEvent.ports")}} {{ReadOnlyInline}}
  - : Một mảng các đối tượng {{domxref("MessagePort")}} đại diện cho các cổng được liên kết với kênh mà tin nhắn đang được gửi qua (nếu thích hợp, ví dụ: trong nhắn tin kênh hoặc khi gửi tin nhắn đến nhân viên dùng chung).

## Ví dụ

Đối với {{domxref("RTCDataChannel")}}, `dc` nhất định, được tạo cho kết nối ngang hàng bằng phương thức {{domxref("RTCPeerConnection.createDataChannel", "createDataChannel()")}} của nó, mã này thiết lập trình xử lý cho các tin nhắn đến và xử lý chúng bằng cách thêm dữ liệu có trong tin nhắn vào tài liệu hiện tại dưới dạng phần tử {{HTMLElement("p")}} (đoạn) mới.

```js
dc.addEventListener("message", (event) => {
  let newParagraph = document.createElement("p");
  let textNode = document.createTextNode(event.data);
  newParagraph.appendChild(textNode);

  document.body.appendChild(newParagraph);
});
```

Trước tiên, chúng tôi tạo thành phần đoạn văn mới và thêm dữ liệu tin nhắn vào đó dưới dạng nút văn bản mới. Sau đó, chúng tôi nối đoạn văn mới vào cuối nội dung tài liệu.

Bạn cũng có thể sử dụng thuộc tính trình xử lý sự kiện `onmessage` của đối tượng `RTCDataChannel` để đặt trình xử lý sự kiện:

```js
dc.onmessage = (event) => {
  let newParagraph = document.createElement("p");
  let textNode = document.createTextNode(event.data);
  newParagraph.appendChild(textNode);


  document.body.appendChild(newParagraph);
};
```


## Thông số kỹ thuật


{{Specifications}}

## Khả năng tương thích của trình duyệt


{{Compat}}

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Một ví dụ RTCDataChannel đơn giản](/en-US/docs/Web/API/WebRTC_API/Simple_RTCDataChannel_sample)
- Sự kiện liên quan: {{domxref("RTCDataChannel.open_event", "open")}}, {{domxref("RTCDataChannel.close_event", "close")}} và {{domxref("RTCDataChannel.error_event", "error")}}
- {{domxref("RTCDataChannel.send()")}}
