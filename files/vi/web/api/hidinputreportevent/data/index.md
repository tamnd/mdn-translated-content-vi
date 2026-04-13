---
title: "HIDInputReportEvent: data property"
short-title: data
slug: Web/API/HIDInputReportEvent/data
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.HIDInputReportEvent.data
---

{{securecontext_header}}{{APIRef("WebHID API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_worker_except_shared")}}

Thuộc tính **`data`** của giao diện {{domxref("HIDInputReportEvent")}} trả về một {{jsxref("DataView")}} chứa dữ liệu từ báo cáo đầu vào, ngoại trừ `reportId` nếu giao diện HID sử dụng ID báo cáo.

## Giá trị

Một {{jsxref("DataView")}}.

## Ví dụ

Trong ví dụ sau, `data` được trả về được ghi vào console.

```js
device.addEventListener("inputreport", (event) => {
  const { data, device, reportId } = event;
  console.log(data);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
