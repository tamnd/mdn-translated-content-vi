---
title: USB
slug: Web/API/USB
page-type: web-api-interface
status:
  - experimental
browser-compat: api.USB
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`USB`** của [WebUSB API](/en-US/docs/Web/API/WebUSB_API) cung cấp các thuộc tính và phương thức để tìm và kết nối với thiết bị USB từ một trang web.

Sử dụng {{domxref("navigator.usb")}} để truy cập đối tượng `USB`.

Giao diện `USB` kế thừa từ {{domxref("EventTarget")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

Không có.

## Phương thức thể hiện

- {{domxref("USB.getDevices()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một mảng các đối tượng {{domxref("USBDevice")}} cho những thiết bị đã ghép đôi và đang được kết nối.
- {{domxref("USB.requestDevice()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một thể hiện {{domxref("USBDevice")}} nếu tìm thấy thiết bị được chỉ định. Gọi hàm này sẽ kích hoạt luồng ghép đôi của user agent.

## Sự kiện

- {{domxref("USB.connect_event", "connect")}} {{Experimental_Inline}}
  - : Được phát ra bất cứ khi nào một thiết bị đã ghép đôi trước đó được kết nối.
- {{domxref("USB.disconnect_event", "disconnect")}} {{Experimental_Inline}}
  - : Được phát ra bất cứ khi nào một thiết bị đã ghép đôi bị ngắt kết nối.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
