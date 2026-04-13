---
title: "HIDDevice: phương thức sendReport()"
short-title: sendReport()
slug: Web/API/HIDDevice/sendReport
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.HIDDevice.sendReport
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Phương thức **`sendReport()`** của giao diện {{domxref("HIDDevice")}} gửi báo cáo đầu ra đến thiết bị HID.

`reportId` cho mỗi định dạng báo cáo mà thiết bị này hỗ trợ có thể được lấy từ {{domxref("HIDDevice.collections")}}.

## Cú pháp

```js-nolint
sendReport(reportId, data)
```

### Tham số

- `reportId`
  - : Một ID báo cáo 8-bit. Nếu thiết bị HID không sử dụng ID báo cáo, truyền `0`.
- `data`
  - : Các byte dưới dạng {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}}.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với giá trị `undefined` khi báo cáo đã được gửi.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném nếu việc gửi báo cáo thất bại vì bất kỳ lý do nào.

## Ví dụ

Ví dụ dưới đây minh họa cách làm thiết bị Joy-Con rung bằng báo cáo đầu ra. Bạn có thể xem thêm ví dụ và bản demo trực tiếp trong bài viết [Kết nối với các thiết bị HID không phổ biến](https://developer.chrome.com/docs/capabilities/hid).

```js
// First, send a command to enable vibration.
// Magical bytes come from https://github.com/mzyy94/joycon-toolweb
const enableVibrationData = [1, 0, 1, 64, 64, 0, 1, 64, 64, 0x48, 0x01];
await device.sendReport(0x01, new Uint8Array(enableVibrationData));

// Then, send a command to make the Joy-Con device rumble.
// Actual bytes are available in the sample.
const rumbleData = [
  /* … */
];
await device.sendReport(0x10, new Uint8Array(rumbleData));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
