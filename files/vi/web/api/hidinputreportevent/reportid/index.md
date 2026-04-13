---
title: "HIDInputReportEvent: reportId property"
short-title: reportId
slug: Web/API/HIDInputReportEvent/reportId
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HIDInputReportEvent.reportId
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Thuộc tính **`reportId`** của giao diện {{domxref("HIDInputReportEvent")}} trả về tiền tố nhận dạng một byte cho báo cáo này, hoặc 0 nếu giao diện HID không sử dụng ID báo cáo.

## Giá trị

Một tiền tố nhận dạng một byte.

## Ví dụ

Trong ví dụ sau, `reportId` của báo cáo đầu vào đến được ghi vào console.

```js
device.addEventListener("inputreport", (event) => {
  const { data, device, reportId } = event;
  console.log(reportId);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
