---
title: "HIDInputReportEvent: device property"
short-title: device
slug: Web/API/HIDInputReportEvent/device
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HIDInputReportEvent.device
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Thuộc tính **`device`** của giao diện {{domxref("HIDInputReportEvent")}} trả về phiên bản {{domxref("HIDDevice")}} đại diện cho giao diện HID đã gửi báo cáo đầu vào.

## Giá trị

Một {{domxref("HIDDevice")}}.

## Ví dụ

Trong ví dụ sau, `device` là một phiên bản {{domxref("HIDDevice")}}, đại diện cho thiết bị đang gửi báo cáo. `productName` của thiết bị này được ghi vào console.

```js
device.addEventListener("inputreport", (event) => {
  const { data, device, reportId } = event;
  console.log(device.productName);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
