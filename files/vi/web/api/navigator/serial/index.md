---
title: "Navigator: thuộc tính serial"
short-title: serial
slug: Web/API/Navigator/serial
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Navigator.serial
---

{{APIRef("Web Serial API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`serial`** của giao diện {{domxref("Navigator")}} trả về đối tượng {{domxref("Serial")}} đại diện cho điểm vào [Web Serial API](/en-US/docs/Web/API/Web_Serial_API).

Khi nhận được, phiên bản tương tự của đối tượng {{domxref("Serial")}} sẽ luôn được trả về.

## Giá trị

Đối tượng {{domxref("Serial")}}.

## Ví dụ

Ví dụ sau sử dụng phương thức `getPorts()` để khởi tạo danh sách các cổng khả dụng.

```js
navigator.serial.getPorts().then((ports) => {
  // Initialize the list of available ports with `ports` on page load.
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Read from and write to a serial port](https://developer.chrome.com/docs/capabilities/serial)
- [Getting started with the web serial API](https://codelabs.developers.google.com/codelabs/web-serial#0)
