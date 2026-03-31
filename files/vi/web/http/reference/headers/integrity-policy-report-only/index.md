---
title: Integrity-Policy-Report-Only header
short-title: Integrity-Policy-Report-Only
slug: Web/HTTP/Reference/Headers/Integrity-Policy-Report-Only
page-type: http-header
browser-compat: http.headers.Integrity-Policy-Report-Only
sidebar: http
---

Tiêu đề phản hồi HTTP **`Integrity-Policy-Report-Only`** cho phép quản trị viên trang web báo cáo về các tài nguyên mà user agent tải sẽ vi phạm các đảm bảo [Subresource Integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity) nếu chính sách toàn vẹn được thực thi (sử dụng tiêu đề {{HTTPHeader("Integrity-Policy")}}).

Các vi phạm của chính sách có thể được báo cáo bằng [Reporting API](/en-US/docs/Web/API/Reporting_API).
Báo cáo có thể được quan sát trong trang mà chính sách đang được thực thi, bằng [`ReportingObserver`](/en-US/docs/Web/API/ReportingObserver), và được gửi đến các endpoint của máy chủ được định nghĩa trong tiêu đề phản hồi HTTP {{HTTPHeader("Reporting-Endpoints")}} và được chọn bằng trường [`endpoints`](#endpoints).
Để biết thêm thông tin xem {{domxref("IntegrityViolationReport")}}.

Tiêu đề cho phép nhà phát triển kiểm tra [các chính sách toàn vẹn](/en-US/docs/Web/Security/Defenses/Subresource_Integrity#integrity_policy) và sửa các vấn đề nội dung trước khi cuối cùng triển khai tiêu đề {{HTTPHeader("Integrity-Policy")}} để thực thi chính sách.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Integrity-Policy-Report-Only: blocked-destinations=(<destination>),sources=(<source>),endpoints=(<endpoint>)
```

Các giá trị tiêu đề được xác định là từ điển structured field với các khóa sau:

- `blocked-destinations`
  - : Danh sách các [request destination](/en-US/docs/Web/API/Request/destination) phải bao gồm metadata toàn vẹn hợp lệ.
    Các giá trị được phép là:
    - `script`
      - : Tài nguyên script.
    - `style`
      - : Tài nguyên stylesheet.

- `sources` {{optional_inline}}
  - : Danh sách các nguồn toàn vẹn phải bao gồm metadata toàn vẹn.
    Các giá trị được phép là:
    - `inline`
      - : Nguồn metadata toàn vẹn là nội tuyến với nội dung, chẳng hạn như [thuộc tính integrity](/en-US/docs/Web/API/HTMLScriptElement/integrity).
        Đây là mặc định.

        Vì đây là giá trị mặc định và duy nhất, bỏ qua `sources` tương đương với chỉ định `sources=(inline)`.

- `endpoints` {{optional_inline}}
  - : Danh sách các [tên endpoint báo cáo](/en-US/docs/Web/HTTP/Reference/Headers/Reporting-Endpoints#endpoint) chỉ ra nơi báo cáo sẽ được gửi.
    Các endpoint báo cáo phải được xác định trong tiêu đề {{httpheader("Reporting-Endpoints")}}.

## Ví dụ

### Báo cáo khi script thiếu metadata toàn vẹn

Ví dụ này hiển thị tài liệu báo cáo đến một endpoint máy chủ khi bất kỳ {{htmlelement("script")}} nào (hoặc `HTMLScriptElement`) không chỉ định thuộc tính `integrity`, hoặc khi tài nguyên script được yêu cầu ở chế độ [no-cors](/en-US/docs/Web/API/Request/mode#no-cors).

Lưu ý rằng `integrity-endpoint` được sử dụng trong `Integrity-Policy-Report-Only` được định nghĩa trong tiêu đề {{httpheader("Reporting-Endpoints")}}.

```http
Reporting-Endpoints: integrity-endpoint=https://example.com/integrity, backup-integrity-endpoint=https://report-provider.example/integrity
Integrity-Policy-Report-Only: blocked-destinations=(script), endpoints=(integrity-endpoint, backup-integrity-endpoint)
```

[Payload báo cáo](/en-US/docs/Web/API/Reporting_API#reporting_server_endpoints) có thể trông như thế này.
Lưu ý rằng thuộc tính `body.reportOnly` là `true`, vì báo cáo này được kích hoạt bởi vi phạm `Integrity-Policy-Report-Only`.

```json
{
  "age": "176279",
  "type": "integrity-violation",
  "url": "https://example.com",
  "body": {
    "documentURL": "https://example.com",
    "blockedURL": "https://example.com/main.js",
    "destination": "script",
    "reportOnly": "true"
  },
  "user_agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/145.0.0.0 Safari/537.36"
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Integrity-Policy")}}
- {{HTTPHeader("Reporting-Endpoints")}}
- {{domxref("ReportingObserver")}}
- {{domxref("IntegrityViolationReport")}}
- [Integrity Policy](/en-US/docs/Web/Security/Defenses/Subresource_Integrity#integrity_policy) trong [Subresource Integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity#integrity_policy)
- [Reporting API](/en-US/docs/Web/API/Reporting_API)
