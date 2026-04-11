---
title: "USBDevice: phương thức forget()"
short-title: forget()
slug: Web/API/USBDevice/forget
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.USBDevice.forget
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức **`forget()`** của giao diện {{domxref("USBDevice")}} trả về một {{jsxref("Promise")}} được giải quyết khi tất cả các thao tác đang chờ bị hủy bỏ, tất cả các giao diện đang mở được giải phóng, phiên làm việc với thiết bị đã kết thúc, và quyền truy cập được đặt lại.

## Cú pháp

```js-nolint
forget()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với `undefined` khi quyền truy cập thiết bị bị thu hồi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
