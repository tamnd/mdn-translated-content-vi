---
title: "HID: sự kiện connect"
short-title: connect
slug: Web/API/HID/connect_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.HID.connect_event
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Sự kiện **`connect`** của giao diện {{domxref("HID")}} được phát ra khi user agent kết nối với một thiết bị HID.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("connect", (event) => { })

onconnect = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("HIDConnectionEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("HIDConnectionEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref("HIDConnectionEvent.device", "device")}} {{ReadOnlyInline}}
  - : {{domxref("HIDDevice")}} mà sự kiện được phát ra cho nó.

## Ví dụ

Trong ví dụ sau, một trình nghe sự kiện được đăng ký để lắng nghe khi thiết bị được kết nối. Sau đó tên của thiết bị được in ra console bằng {{domxref("HIDDevice.productName")}}.

```js
navigator.hid.addEventListener("connect", ({ device }) => {
  console.log(`HID đã kết nối: ${device.productName}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
