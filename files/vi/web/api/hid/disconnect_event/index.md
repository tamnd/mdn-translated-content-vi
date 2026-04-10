---
title: "HID: sự kiện disconnect"
short-title: disconnect
slug: Web/API/HID/disconnect_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.HID.disconnect_event
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Sự kiện **`disconnect`** của giao diện {{domxref("HID")}} được phát ra khi user agent ngắt kết nối một thiết bị HID.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("disconnect", (event) => { })

ondisconnect = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("HIDConnectionEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("HIDConnectionEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref("HIDConnectionEvent.device", "device")}} {{ReadOnlyInline}}
  - : {{domxref("HIDDevice")}} mà sự kiện được phát ra cho nó.

## Ví dụ

Trong ví dụ sau, một trình nghe sự kiện được đăng ký để lắng nghe khi thiết bị bị ngắt kết nối. Sau đó tên của thiết bị được in ra console bằng {{domxref("HIDDevice.productName")}}.

```js
navigator.hid.addEventListener("disconnect", ({ device }) => {
  console.log(`HID đã ngắt kết nối: ${device.productName}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
