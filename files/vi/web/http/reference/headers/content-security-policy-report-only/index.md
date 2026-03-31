---
title: Content-Security-Policy-Report-Only header
short-title: Content-Security-Policy-Report-Only
slug: Web/HTTP/Reference/Headers/Content-Security-Policy-Report-Only
page-type: http-header
browser-compat: http.headers.Content-Security-Policy-Report-Only
sidebar: http
---

Tiêu đề HTTP **`Content-Security-Policy-Report-Only`** {{Glossary("response header", "phản hồi")}} giúp giám sát các vi phạm Content Security Policy (CSP) và các hiệu ứng của chúng mà không thực thi các chính sách bảo mật.
Tiêu đề này cho phép bạn kiểm tra hoặc sửa các vi phạm trước khi một {{HTTPHeader("Content-Security-Policy")}} cụ thể được áp dụng và thực thi.

Chỉ thị CSP {{CSP("report-to")}} phải được chỉ định để các báo cáo được gửi: nếu không, thao tác sẽ không có hiệu lực.

Các vi phạm chính sách có thể được báo cáo bằng cách sử dụng [Reporting API](/en-US/docs/Web/API/Reporting_API).
Các báo cáo có thể được quan sát trong trang mà chính sách đang được thực thi, sử dụng [`ReportingObserver`](/en-US/docs/Web/API/ReportingObserver), và gửi đến các điểm cuối máy chủ được xác định trong tiêu đề phản hồi HTTP {{HTTPHeader("Reporting-Endpoints")}} và được chọn bằng chỉ thị CSP {{CSP("report-to")}}.
Để biết thêm thông tin, xem {{domxref("CSPViolationReport")}}.

Để biết thêm thông tin, xem hướng dẫn [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP) của chúng tôi.

> [!NOTE]
> Tiêu đề cũng có thể được sử dụng với chỉ thị {{CSP("report-uri")}} không còn dùng nữa (đang được thay thế bởi {{CSP("report-to")}}).
> Việc sử dụng và cú pháp báo cáo kết quả hơi khác nhau; xem chủ đề {{CSP("report-uri")}} để biết thêm chi tiết.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header", "Tiêu đề phản hồi")}}</td>
    </tr>
    <tr>
      <th colspan="2" scope="row">
        Tiêu đề này không được hỗ trợ bên trong phần tử {{HTMLElement("meta")}}.
      </th>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy-Report-Only: <policy-directive>; …; <policy-directive>; report-to <endpoint-name>
```

## Chỉ thị

Tiêu đề `Content-Security-Policy-Report-Only` hỗ trợ tất cả các chỉ thị {{HTTPHeader("Content-Security-Policy")}} ngoại trừ `sandbox`, bị bỏ qua.

> [!NOTE]
> Chỉ thị CSP {{CSP("report-to")}} nên được sử dụng với tiêu đề này hoặc nó sẽ không có hiệu lực.

## Ví dụ

### Sử dụng Content-Security-Policy-Report-Only để gửi báo cáo CSP

Để sử dụng chỉ thị {{CSP("report-to")}}, trước tiên bạn cần xác định điểm cuối tương ứng bằng cách sử dụng tiêu đề phản hồi {{HTTPHeader("Reporting-Endpoints")}}.
Trong ví dụ dưới đây, chúng ta định nghĩa một điểm cuối duy nhất có tên `csp-endpoint`.

```http
Reporting-Endpoints: csp-endpoint="https://example.com/csp-reports"
```

Sau đó chúng ta có thể xác định đích đến của báo cáo bằng cách sử dụng {{CSP("report-to")}} và {{CSP("report-uri")}}, như được hiển thị bên dưới.
Lưu ý rằng báo cáo cụ thể này sẽ được kích hoạt nếu trang tải tài nguyên không an toàn, hoặc từ code inline.

```http
Content-Security-Policy-Report-Only: default-src https:;
  report-uri /csp-report-url/;
  report-to csp-endpoint;
```

> [!NOTE]
> Chỉ thị `report-to` được ưu tiên hơn `report-uri` không còn dùng nữa, nhưng chúng ta khai báo cả hai vì `report-to` chưa có hỗ trợ đầy đủ trên tất cả trình duyệt.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- Chỉ thị CSP {{CSP("report-to")}}
- {{httpheader("Reporting-Endpoints")}}
- {{domxref("CSPViolationReport")}}
- Chỉ thị CSP {{CSP("report-uri")}} {{deprecated_inline}}
- [Reporting API](/en-US/docs/Web/API/Reporting_API).
