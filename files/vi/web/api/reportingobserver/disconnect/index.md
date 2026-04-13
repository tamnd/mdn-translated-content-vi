---
title: "ReportingObserver: disconnect() method"
short-title: disconnect()
slug: Web/API/ReportingObserver/disconnect
page-type: web-api-instance-method
browser-compat: api.ReportingObserver.disconnect
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Phương thức **`disconnect()`** của giao diện {{domxref("ReportingObserver")}} dừng một reporting observer đã từng bắt đầu quan sát khỏi việc thu thập báo cáo.

Sau khi gọi `disconnect()`, cả {{domxref("ReportingObserver.takeRecords()")}} và tham số [`reports`](/en-US/docs/Web/API/ReportingObserver/ReportingObserver#reports) của callback `ReportingObserver()` sẽ không trả về báo cáo nào. Observer liên kết sẽ không còn hoạt động.

## Cú pháp

```js-nolint
disconnect()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng cơ bản

```js
const options = {
  types: ["deprecation"],
  buffered: true,
};

const observer = new ReportingObserver((reports, observer) => {
  reportBtn.onclick = () => displayReports(reports);
}, options);

observer.observe();

// …

observer.disconnect();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Reporting API](/en-US/docs/Web/API/Reporting_API)
