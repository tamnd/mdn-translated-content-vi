---
title: "ReportingObserver: observe() method"
short-title: observe()
slug: Web/API/ReportingObserver/observe
page-type: web-api-instance-method
browser-compat: api.ReportingObserver.observe
---

{{APIRef("Reporting API")}}{{AvailableInWorkers}}

Phương thức **`observe()`** của giao diện {{domxref("ReportingObserver")}} hướng dẫn một reporting observer bắt đầu thu thập báo cáo trong hàng đợi báo cáo của nó.

## Cú pháp

```js-nolint
observe()
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
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Reporting API](/en-US/docs/Web/API/Reporting_API)
