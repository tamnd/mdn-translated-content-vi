---
title: "USBDevice: phương thức releaseInterface()"
short-title: releaseInterface()
slug: Web/API/USBDevice/releaseInterface
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USBDevice.releaseInterface
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`releaseInterface()`** của giao diện {{domxref("USBDevice")}} trả về một {{jsxref("promise")}} được giải quyết khi giao diện đã chiếm giữ được giải phóng khỏi truy cập độc quyền.

## Cú pháp

```js-nolint
releaseInterface(interfaceNumber)
```

### Tham số

- `interfaceNumber`
  - : Chỉ mục dành riêng cho thiết bị của giao diện hiện đang được chiếm giữ.

### Giá trị trả về

Một {{jsxref("promise")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
