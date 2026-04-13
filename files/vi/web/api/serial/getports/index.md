---
title: "Serial: phương thức getPorts()"
short-title: getPorts()
slug: Web/API/Serial/getPorts
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Serial.getPorts
---

{{APIRef("Web Serial API")}}{{SecureContext_Header}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

**`getPorts()`** là phương thức của giao diện {{domxref("Serial")}} trả về một {{jsxref("Promise")}} phân giải thành một mảng các đối tượng {{domxref("SerialPort")}} đại diện cho các cổng nối tiếp đã kết nối với máy chủ mà origin có quyền truy cập.

## Cú pháp

```js-nolint
getPorts()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một mảng các đối tượng {{domxref("SerialPort")}}.

### Ngoại lệ

- `SecurityError` {{domxref("DOMException")}}
  - : `Promise` trả về sẽ bị từ chối với lỗi này trong một trong các trường hợp sau:
    - Một [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) `{{httpheader('Permissions-Policy/serial','serial')}}` chặn việc sử dụng tính năng này.
    - Yêu cầu cấp quyền của người dùng bị từ chối.

## Ví dụ

Ví dụ sau dùng `getPorts()` để khởi tạo danh sách các cổng khả dụng.

```js
navigator.serial.getPorts().then((ports) => {
  // Khởi tạo danh sách các cổng khả dụng bằng `ports` khi trang tải.
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
