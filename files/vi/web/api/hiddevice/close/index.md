---
title: "HIDDevice: phương thức close()"
short-title: close()
slug: Web/API/HIDDevice/close
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.HIDDevice.close
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Phương thức **`close()`** của giao diện {{domxref("HIDDevice")}} đóng kết nối đến thiết bị HID.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với giá trị `undefined` khi kết nối đã đóng.

## Ví dụ

Trong ví dụ sau, chúng ta đóng thiết bị HID sau khi tất cả dữ liệu đã được gửi và nhận.

```js
await device.close();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
