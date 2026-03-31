---
title: Reporting-Endpoints header
short-title: Reporting-Endpoints
slug: Web/HTTP/Reference/Headers/Reporting-Endpoints
page-type: http-header
browser-compat: http.headers.Reporting-Endpoints
sidebar: http
---

Tiêu đề HTTP **`Reporting-Endpoints`** {{Glossary("response header")}} cho phép quản trị viên trang web chỉ định một hoặc nhiều endpoint có thể nhận báo cáo được tạo ra bởi [Reporting API](/en-US/docs/Web/API/Reporting_API).

Các endpoint có thể được dùng, ví dụ, làm mục tiêu gửi báo cáo vi phạm CSP, báo cáo {{HTTPHeader("Cross-Origin-Opener-Policy")}}, hoặc các vi phạm chung khác.

Khi dùng để báo cáo lỗi [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP#violation_reporting), tiêu đề được dùng kết hợp với chỉ thị {{CSP("report-to")}} của tiêu đề {{HTTPHeader("Content-Security-Policy")}}.
Để biết thêm chi tiết về thiết lập báo cáo CSP, xem tài liệu [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP#violation_reporting).

> [!NOTE]
> Tiêu đề này thay thế {{HTTPHeader("Report-To")}} {{deprecated_inline}} để khai báo endpoint, và nên được ưu tiên sử dụng thay thế.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
    <tr>
      <th scope="row">
        {{Glossary("CORS-safelisted response header")}}
      </th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Reporting-Endpoints: <endpoint>
Reporting-Endpoints: <endpoint>, …, <endpointN>
```

- `<endpoint>`
  - : Một endpoint báo cáo theo định dạng `<endpoint-name>="<URL>"`.
    Các endpoint phải có URI hợp lệ trong chuỗi có dấu ngoặc kép (ví dụ: `my-endpoint="https://example.com/reports"`) và các endpoint không bảo mật sẽ bị bỏ qua.
    Có thể cung cấp danh sách endpoint phân cách bằng dấu phẩy.

## Ví dụ

### Đặt endpoint báo cáo vi phạm CSP

Ví dụ sau cho thấy cách tiêu đề phản hồi `Reporting-Endpoints` được dùng kết hợp với tiêu đề {{HTTPHeader("Content-Security-Policy")}} để chỉ ra nơi gửi báo cáo vi phạm CSP:

```http
Reporting-Endpoints: csp-endpoint="https://example.com/csp-reports"
Content-Security-Policy: default-src 'self'; report-to csp-endpoint
```

### Chỉ định nhiều endpoint báo cáo

Có thể chỉ định nhiều endpoint có thể được dùng cho các loại báo cáo vi phạm khác nhau.

```http
Reporting-Endpoints: csp-endpoint="https://example.com/csp-reports",
                     permissions-endpoint="https://example.com/permissions-policy-reports"
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Reporting API](/en-US/docs/Web/API/Reporting_API)
- Hướng dẫn [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP#violation_reporting)
- Tiêu đề {{HTTPHeader("Content-Security-Policy")}}
- Chỉ thị {{CSP("report-to")}}
