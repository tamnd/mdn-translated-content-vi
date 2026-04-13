---
title: "USB: sự kiện disconnect"
short-title: disconnect
slug: Web/API/USB/disconnect_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.USB.disconnect_event
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Sự kiện **`disconnect`** của giao diện {{DOMxRef("USB")}} được phát ra bất cứ khi nào một thiết bị đã ghép đôi bị ngắt kết nối.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("disconnect", (event) => { })

ondisconnect = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("USBConnectionEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("USBConnectionEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref("USBConnectionEvent.device", "device")}} {{ReadOnlyInline}}
  - : {{domxref("USBDevice")}} mà sự kiện được phát ra cho nó.

## Ví dụ

Khi một thiết bị USB bị ngắt kết nối, bạn có thể muốn cập nhật giao diện người dùng.

```js
navigator.usb.addEventListener("disconnect", (event) => {
  // Xóa event.device khỏi giao diện người dùng.
});
```

Hoặc bạn có thể dùng thuộc tính trình xử lý sự kiện `USB.ondiscconnect` để thiết lập trình xử lý cho sự kiện `disconnect`:

```js
navigator.usb.ondisconnect = (event) => {
  // Xóa event.device khỏi giao diện người dùng.
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
