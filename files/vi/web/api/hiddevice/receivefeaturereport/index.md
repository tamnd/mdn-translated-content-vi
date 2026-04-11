---
title: "HIDDevice: phương thức receiveFeatureReport()"
short-title: receiveFeatureReport()
slug: Web/API/HIDDevice/receiveFeatureReport
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.HIDDevice.receiveFeatureReport
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Phương thức **`receiveFeatureReport()`** của giao diện {{domxref("HIDDevice")}} nhận báo cáo tính năng từ thiết bị HID. Báo cáo tính năng là cách để các thiết bị HID và ứng dụng trao đổi dữ liệu HID không được chuẩn hóa.

`reportId` cho mỗi định dạng báo cáo mà thiết bị này hỗ trợ có thể được lấy từ {{domxref("HIDDevice.collections")}}.

## Cú pháp

```js-nolint
receiveFeatureReport(reportId)
```

### Tham số

- `reportId`
  - : Một ID báo cáo 8-bit. Nếu thiết bị HID không sử dụng ID báo cáo, truyền `0`.

### Giá trị trả về

Một {{jsxref("Promise")}} được giải quyết với một đối tượng {{jsxref("DataView")}} chứa báo cáo tính năng.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném nếu việc nhận báo cáo thất bại vì bất kỳ lý do nào.

## Ví dụ

Trong ví dụ sau, một báo cáo được nhận từ thiết bị sử dụng `reportId` bằng `1`.

```js
const dataView = await device.receiveFeatureReport(1);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
