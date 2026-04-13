---
title: "RTCDataChannel: đóng sự kiện"
short-title: close
slug: Web/API/RTCDataChannel/close_event
page-type: web-api-event
browser-compat: api.RTCDataChannel.close_event
---

{{APIRef("WebRTC")}}

Sự kiện **`close`** được gửi đến trình xử lý sự kiện `onclose` trên phiên bản {{domxref("RTCDataChannel")}} khi quá trình truyền dữ liệu cho kênh dữ liệu đã đóng. Trước khi có thể truyền thêm bất kỳ dữ liệu nào bằng `RTCDataChannel`, một phiên bản 'RTCDataChannel' mới phải được tạo.

Sự kiện này không thể hủy và không bong bóng.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}} hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("close", (event) => { })

onclose = (event) => { }
```

## Loại sự kiện

Một [[[PH3]] chung chung.

## Ví dụ

Ví dụ này thiết lập trình xử lý cho sự kiện `close` cho {{domxref("RTCDataChannel")}} có tên `dc`; trách nhiệm của nó trong ví dụ này là cập nhật các thành phần giao diện người dùng để phản ánh rằng không còn cuộc gọi nào đang diễn ra nữa và cho phép bắt đầu cuộc gọi mới.

```js
dc.addEventListener("close", (ev) => {
  messageInputBox.disabled = true;
  sendButton.disabled = true;
  connectButton.disabled = false;
  disconnectButton.disabled = true;
});
```

Tất cả những gì mã này thực hiện để phản hồi việc nhận sự kiện `close` là tắt hộp nhập liệu và nút "Gửi" của nó, đồng thời bật nút được sử dụng để bắt đầu cuộc gọi (đồng thời tắt nút kết thúc cuộc gọi).

Bạn cũng có thể sử dụng thuộc tính trình xử lý sự kiện `onclose` để đặt trình xử lý cho các sự kiện `close`:

```js
dc.onclose = (ev) => {
  messageInputBox.disabled = true;
  sendButton.disabled = true;
  connectButton.disabled = false;
  disconnectButton.disabled = true;
};
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [API WebRTC](/en-US/docs/Web/API/WebRTC_API)
- [Một ví dụ RTCDataChannel đơn giản](/en-US/docs/Web/API/WebRTC_API/Simple_RTCDataChannel_sample)
- Sự kiện liên quan: {{domxref("RTCDataChannel.open_event", "open")}}, {{domxref("RTCDataChannel.message_event", "message")}} và {{domxref("RTCDataChannel.error_event", "error")}}
