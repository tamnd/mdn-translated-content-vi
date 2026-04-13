---
title: "HIDDevice: phương thức forget()"
short-title: forget()
slug: Web/API/HIDDevice/forget
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.HIDDevice.forget
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Phương thức **`forget()`** của giao diện {{domxref("HIDDevice")}} đóng kết nối đến thiết bị HID và xóa bộ nhớ về thiết bị.

## Cú pháp

```js-nolint
forget()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với giá trị `undefined` khi kết nối đã đóng, thiết bị đã bị quên và quyền đã được đặt lại.

## Ví dụ

Trong ví dụ sau, chúng ta kết nối đến thiết bị HID Nintendo Switch Joy-Con Right, nhấp nháy một lần rồi ngắt kết nối.

```js
async function blink() {
  const devices = await navigator.hid.requestDevice({
    filters: [
      {
        vendorId: 0x057e, // Nintendo Co., Ltd
        productId: 0x2007, // Joy-Con Right
      },
    ],
  });
  const device = devices[0];
  await device.open();
  // Turn off
  await device.sendFeatureReport(reportId, Uint32Array.from([0, 0]));
  await new Promise((resolve) => setTimeout(resolve, 100));
  // Turn on
  await device.sendFeatureReport(reportId, Uint32Array.from([512, 0]));
  await new Promise((resolve) => setTimeout(resolve, 100));
  // Finally, disconnect from it
  await device.forget();
}
blink();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
