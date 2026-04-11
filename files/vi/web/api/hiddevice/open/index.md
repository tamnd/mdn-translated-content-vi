---
title: "HIDDevice: phương thức open()"
short-title: open()
slug: Web/API/HIDDevice/open
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.HIDDevice.open
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Phương thức **`open()`** của giao diện {{domxref("HIDDevice")}} yêu cầu hệ điều hành mở thiết bị HID.

> [!NOTE]
> Các thiết bị HID không được mở tự động. Do đó, một {{domxref("HIDDevice")}} được trả về bởi {{domxref("HID.requestDevice()")}} phải được mở bằng phương thức này trước khi có thể truyền dữ liệu.

## Cú pháp

```js-nolint
open()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với giá trị `undefined` khi kết nối đã được mở.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu kết nối đã mở.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném nếu việc mở kết nối thất bại vì bất kỳ lý do nào.

## Ví dụ

Trong ví dụ sau, chúng ta chờ kết nối HID mở trước khi gửi hay nhận dữ liệu.

```js
await device.open();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
