---
title: IntegrityViolationReport
slug: Web/API/IntegrityViolationReport
page-type: web-api-interface
browser-compat: api.ReportingObserver.ReportingObserver.options_parameter.types_property.integrity-violation
spec-urls: https://w3c.github.io/webappsec-subresource-integrity/#report-violations
---

{{APIRef("Reporting API")}}

Dictionary `IntegrityViolationReport` của [Reporting API](/en-US/docs/Web/API/Reporting_API) đại diện cho một báo cáo được tạo ra khi tài liệu vi phạm [Chính sách Tính toàn vẹn](/en-US/docs/Web/HTTP/Reference/Headers/Integrity-Policy) của nó.

Báo cáo loại này có thể được quan sát từ trong trang bằng cách sử dụng {{domxref("ReportingObserver")}} và phiên bản tuần tự hóa có thể được gửi đến điểm cuối máy chủ báo cáo.

## Thuộc tính phiên bản

- `body`
  - : Nội dung của báo cáo. Đây là đối tượng với các thuộc tính sau:
    - `blockedURL`
      - : Một chuỗi đại diện cho URL của tài nguyên bị chặn bởi chính sách tính toàn vẹn được thực thi (hoặc chỉ được báo cáo cho chính sách [`reportOnly`](#reportonly)).
    - `documentURL`
      - : Một chuỗi đại diện cho URL của tài liệu đang cố tải tài nguyên.
    - `destination`
      - : Một chuỗi cho biết [`Request.destination`](/en-US/docs/Web/API/Request/destination#script) của tài nguyên bị chặn. Hiện tại chỉ có thể là `"script"`.
    - `reportOnly`
      - : Một boolean: `false` nếu chính sách được thực thi và `true` nếu vi phạm chỉ được báo cáo.
- `type`
  - : Chuỗi `"integrity-violation"` cho biết đây là báo cáo vi phạm tính toàn vẹn.
- `url`
  - : Một chuỗi đại diện cho URL của tài liệu đã tạo ra báo cáo.

## Ví dụ

### Sử dụng giao diện `ReportingObserver`

```js
const observer = new ReportingObserver(
  (reports, observer) => {
    reports.forEach((violation) => {
      console.log(violation);
      console.log(JSON.stringify(violation));
    });
  },
  {
    types: ["integrity-violation"],
    buffered: true,
  },
);

observer.observe();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ReportingObserver")}}
- {{HTTPHeader("Integrity-Policy")}}
- {{HTTPHeader("Integrity-Policy-Report-Only")}}
- {{HTTPHeader("Reporting-Endpoints")}}
- [Reporting API](/en-US/docs/Web/API/Reporting_API)
