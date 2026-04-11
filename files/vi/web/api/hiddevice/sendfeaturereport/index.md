---
title: "HIDDevice: phương thức sendFeatureReport()"
short-title: sendFeatureReport()
slug: Web/API/HIDDevice/sendFeatureReport
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.HIDDevice.sendFeatureReport
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Phương thức **`sendFeatureReport()`** của giao diện {{domxref("HIDDevice")}} gửi báo cáo tính năng đến thiết bị HID. Báo cáo tính năng là cách để các thiết bị HID và ứng dụng trao đổi dữ liệu HID không được chuẩn hóa.

`reportId` cho mỗi định dạng báo cáo mà thiết bị này hỗ trợ có thể được lấy từ {{domxref("HIDDevice.collections")}}.

## Cú pháp

```js-nolint
sendFeatureReport(reportId, data)
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

Trong ví dụ sau, `sendFeatureReport()` làm thiết bị nhấp nháy. Bạn có thể xem thêm ví dụ và bản demo trực tiếp trong bài viết [Kết nối với các thiết bị HID không phổ biến](https://developer.chrome.com/docs/capabilities/hid).

```js
const reportId = 1;
for (let i = 0; i < 10; i++) {
  // Turn off
  await device.sendFeatureReport(reportId, Uint32Array.from([0, 0]));
  await new Promise((resolve) => setTimeout(resolve, 100));
  // Turn on
  await device.sendFeatureReport(reportId, Uint32Array.from([512, 0]));
  await new Promise((resolve) => setTimeout(resolve, 100));
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
