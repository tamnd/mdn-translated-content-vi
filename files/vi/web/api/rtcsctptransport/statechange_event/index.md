---
title: "RTCSctpTransport: sự kiện statechange"
short-title: statechange
slug: Web/API/RTCSctpTransport/statechange_event
page-type: web-api-event
browser-compat: api.RTCSctpTransport.statechange_event
---

{{APIRef("WebRTC")}}

Sự kiện **`statechange`** được gửi đến {{domxref("RTCSctpTransport")}} để cung cấp thông báo khi thuộc tính {{domxref("RTCSctpTransport.state")}} đã thay đổi.

<!-- This event is not cancelable and does not bubble. -->

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("statechange", (event) => { })

onstatechange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Cho một {{domxref("RTCSctpTransport")}}, `transport`, và một hàm `updateStatus()` trình bày thông tin trạng thái kết nối cho người dùng, đoạn mã này thiết lập một trình xử lý sự kiện để cho người dùng biết khi nào giao thức truyền tải được kết nối.

```js
pc.addEventListener("statechange", (event) => {
  switch (transport.state) {
    case "connected":
      updateStatus("Connection started");
      break;
  }
});
```

Sử dụng `onstatechange`, nó trông như thế này:

```js
transport.onstatechange = (event) => {
  switch (transport.state) {
    case "connected":
      updateStatus("Connection started");
      break;
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebRTC API](/en-US/docs/Web/API/WebRTC_API)
- {{domxref("RTCSctpTransport.state")}}
