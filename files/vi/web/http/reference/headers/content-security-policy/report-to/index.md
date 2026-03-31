---
title: "Content-Security-Policy: report-to directive"
short-title: report-to
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/report-to
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.report-to
sidebar: http
---

Chỉ thị **`report-to`** trong `Content-Security-Policy` chỉ định tên của endpoint mà trình duyệt nên sử dụng để báo cáo vi phạm CSP.

Khi xảy ra vi phạm CSP, một báo cáo được tạo ra chứa một đối tượng {{domxref("CSPViolationReport")}} được tuần tự hóa.
Báo cáo này được gửi đến URL tương ứng với tên endpoint, sử dụng các cơ chế chung được định nghĩa trong [Reporting API](/en-US/docs/Web/API/Reporting_API).

Máy chủ phải cung cấp riêng biệt ánh xạ giữa tên endpoint và URL tương ứng trong tiêu đề phản hồi HTTP {{HTTPHeader("Reporting-Endpoints")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Phiên bản CSP</th>
      <td>3</td>
    </tr>
    <tr>
      <th scope="row">Loại chỉ thị</th>
      <td>{{Glossary("Reporting directive")}}</td>
    </tr>
    <tr>
      <th colspan="2" scope="row">
        Chỉ thị này không được hỗ trợ trong phần tử {{HTMLElement("meta")}}.
      </th>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: …; report-to <endpoint_name>
```

`<endpoint_name>` là tên của một endpoint được cung cấp bởi tiêu đề phản hồi HTTP {{HTTPHeader("Reporting-Endpoints")}}.
Nó cũng có thể là tên của một nhóm được máy chủ cung cấp trong tiêu đề phản hồi HTTP {{HTTPHeader("Report-To")}} {{deprecated_inline}}.

### Cú pháp báo cáo vi phạm

Báo cáo vi phạm CSP là một đối tượng {{domxref("CSPViolationReport")}} được tuần tự hóa JSON, với thuộc tính `type` có giá trị `"csp-violation"`.
Báo cáo được gửi đến các endpoint đích thông qua thao tác {{httpmethod("POST")}} với {{HTTPHeader("Content-Type")}} là `application/reports+json`.

JSON cho một báo cáo đơn có thể trông như sau:

```json
{
  "age": 53531,
  "body": {
    "blockedURL": "inline",
    "columnNumber": 39,
    "disposition": "enforce",
    "documentURL": "https://example.com/csp-report",
    "effectiveDirective": "script-src-elem",
    "lineNumber": 121,
    "originalPolicy": "default-src 'self'; report-to csp-endpoint-name",
    "referrer": "https://www.google.com/",
    "sample": "console.log(\"lo\")",
    "sourceFile": "https://example.com/csp-report",
    "statusCode": 200
  },
  "type": "csp-violation",
  "url": "https://example.com/csp-report",
  "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36"
}
```

## Ghi chú sử dụng

Chỉ thị `report-to` được thiết kế để thay thế `report-uri`, và các trình duyệt hỗ trợ `report-to` sẽ bỏ qua chỉ thị `report-uri`.
Tuy nhiên, cho đến khi `report-to` được hỗ trợ rộng rãi, bạn có thể chỉ định cả hai chỉ thị như sau:

```http
Content-Security-Policy: …; report-uri https://endpoint.example.com; report-to endpoint_name
```

Lưu ý rằng các ví dụ khác trong chủ đề này không hiển thị `report-uri`.

## Ví dụ

### Đặt endpoint báo cáo vi phạm CSP

Máy chủ có thể xác định ánh xạ giữa tên endpoint và URL bằng tiêu đề {{HTTPHeader("Reporting-Endpoints")}} trong phản hồi HTTP.
Bất kỳ tên nào cũng có thể được sử dụng: ở đây chúng tôi đã chọn `name-of-endpoint`.

```http
Reporting-Endpoints: name-of-endpoint="https://example.com/csp-reports"
```

Máy chủ có thể đặt tên endpoint này làm mục tiêu để gửi báo cáo vi phạm CSP bằng chỉ thị `report-to`:

```http
Content-Security-Policy: default-src 'self'; report-to name-of-endpoint
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Reporting-Endpoints")}}
- {{HTTPHeader("Content-Security-Policy")}}
- {{HTTPHeader("Content-Security-Policy-Report-Only")}}
- [Reporting API](/en-US/docs/Web/API/Reporting_API)
