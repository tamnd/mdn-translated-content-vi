---
title: "HID: phương thức getDevices()"
short-title: getDevices()
slug: Web/API/HID/getDevices
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.HID.getDevices
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

**`getDevices()`** là phương thức của giao diện {{domxref("HID")}} lấy danh sách các thiết bị HID đang kết nối mà người dùng trước đó đã cấp quyền truy cập thông qua lệnh gọi {{domxref("HID.requestDevice","requestDevice()")}}.

## Cú pháp

```js-nolint
getDevices()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} phân giải thành một danh sách các đối tượng {{domxref("HIDDevice")}}.

## Ví dụ

Ví dụ sau lấy danh sách thiết bị và ghi tên thiết bị ra console.

```js
let devices = await navigator.hid.getDevices();
devices.forEach((device) => {
  console.log(`Thiết bị HID: ${device.productName}`);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
