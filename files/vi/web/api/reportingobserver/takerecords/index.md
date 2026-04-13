---
title: "ReportingObserver: takeRecords() method"
short-title: takeRecords()
slug: Web/API/ReportingObserver/takeRecords
page-type: web-api-instance-method
browser-compat: api.ReportingObserver.takeRecords
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Phương thức **`takeRecords()`** của giao diện {{domxref("ReportingObserver")}} trả về danh sách báo cáo hiện tại chứa trong hàng đợi báo cáo của observer, và làm rỗng hàng đợi.

## Cú pháp

```js-nolint
takeRecords()
```

### Tham số

Không có.

### Giá trị trả về

Một mảng các đối tượng báo cáo, chẳng hạn như {{domxref("COEPViolationReport")}} và {{domxref("IntegrityViolationReport")}}.

Các từ điển đối tượng được liệt kê trong [Reporting API](/en-US/docs/Web/API/Reporting_API#dictionaries).

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

const records = observer.takeRecords();
console.log(records);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Reporting API](/en-US/docs/Web/API/Reporting_API)
