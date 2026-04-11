---
title: "RTCDataChannel: sự kiện mở"
short-title: open
slug: Web/API/RTCDataChannel/open_event
page-type: web-api-event
browser-compat: api.RTCDataChannel.open_event
---

{{APIRef("WebRTC")}}

Sự kiện WebRTC **`open`** được gửi đến trình xử lý sự kiện `onopen` của đối tượng `onopen` khi phương thức vận chuyển cơ bản được sử dụng để gửi và nhận tin nhắn của kênh dữ liệu được mở hoặc mở lại.

Sự kiện này không thể hủy và không bong bóng.


## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("open", (event) => { })

onopen = (event) => { }
```


## Loại sự kiện

Một {{domxref("RTCDataChannelEvent")}}. Kế thừa từ {{domxref("Event")}}.


{{InheritanceDiagram("RTCDataChannelEvent")}}

## Thuộc tính sự kiện

_Cũng kế thừa các thuộc tính từ giao diện chính của nó, {{DOMxRef("Event")}}._


- {{DOMxRef("RTCDataChannelEvent.channel", "channel")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("RTCDataChannel")}} được liên kết với sự kiện.

## Ví dụ

Ví dụ này thêm vào {{domxref("RTCDataChannel")}} `dc` một trình xử lý cho sự kiện `open` giúp điều chỉnh giao diện người dùng để cho biết rằng cửa sổ trò chuyện đã sẵn sàng sử dụng sau khi kết nối được thiết lập. Nó kích hoạt hộp nhập tin nhắn và nút gửi cũng như kích hoạt nút ngắt kết nối và vô hiệu hóa nút kết nối. Cuối cùng, hộp nhập tin nhắn được tập trung để người dùng có thể bắt đầu nhập ngay.

```js
dc.addEventListener("open", (ev) => {
  messageInputBox.disabled = false;
  sendMessageButton.disabled = false;
  disconnectButton.disabled = false;
  connectButton.disabled = true;

  messageInputBox.focus();
});
```

Điều này cũng có thể được thực hiện bằng cách trực tiếp đặt giá trị thuộc tính xử lý sự kiện `onopen` của kênh.

```js
dc.onopen = (ev) => {
  messageInputBox.disabled = false;
  sendMessageButton.disabled = false;
  disconnectButton.disabled = false;
  connectButton.disabled = true;


  messageInputBox.focus();
};
```


## Thông số kỹ thuật


{{Specifications}}

## Khả năng tương thích của trình duyệt


{{Compat}}

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Một ví dụ RTCDataChannel đơn giản](/en-US/docs/Web/API/WebRTC_API/Simple_RTCDataChannel_sample)
- Sự kiện liên quan: {{domxref("RTCDataChannel.message_event", "message")}}, {{domxref("RTCDataChannel.close_event", "close")}} và {{domxref("RTCDataChannel.error_event", "error")}}
