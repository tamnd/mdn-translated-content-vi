---
title: Report-To header
short-title: Report-To
slug: Web/HTTP/Reference/Headers/Report-To
page-type: http-header
status:
  - deprecated
  - non-standard
browser-compat: http.headers.Report-To
sidebar: http
---

{{deprecated_header}}{{non-standard_header}}

> [!WARNING]
> Tiêu đề này đã được thay thế bởi tiêu đề phản hồi HTTP {{HTTPHeader("Reporting-Endpoints")}}.
> Đây là một phần không còn được dùng của phiên bản đặc tả [Reporting API](/en-US/docs/Web/API/Reporting_API) trước đó.

Tiêu đề HTTP **`Report-To`** {{Glossary("response header")}} cho phép quản trị viên trang web xác định các nhóm endpoint được đặt tên có thể được dùng làm đích cho các báo cáo cảnh báo và lỗi, chẳng hạn như báo cáo vi phạm CSP, báo cáo {{HTTPHeader("Cross-Origin-Opener-Policy")}}, báo cáo không dùng nữa, hoặc các vi phạm chung khác.

`Report-To` thường được dùng kết hợp với các tiêu đề khác để chọn một nhóm endpoint cho một loại báo cáo cụ thể.
Ví dụ, chỉ thị {{CSP("report-to")}} của tiêu đề {{HTTPHeader("Content-Security-Policy")}} có thể được dùng để chọn nhóm dùng để báo cáo vi phạm CSP.

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
Report-To: <json-field-value>
```

- `<json-field-value>`
  - : Một hoặc nhiều định nghĩa nhóm endpoint, được định nghĩa là mảng JSON bỏ qua các ký tự `[` và `]` bao quanh.
    Mỗi đối tượng trong mảng có các thành phần sau:
    - `group`
      - : Tên cho nhóm endpoint.
    - `max_age`
      - : Thời gian tính bằng giây mà trình duyệt nên lưu vào bộ nhớ đệm cấu hình báo cáo.
    - `endpoints`
      - : Mảng một hoặc nhiều URL nơi các báo cáo trong nhóm sẽ được gửi đến.

## Ví dụ

### Đặt endpoint báo cáo vi phạm CSP

Ví dụ này cho thấy cách máy chủ có thể dùng `Report-To` để xác định một nhóm endpoint, sau đó đặt nhóm đó làm vị trí gửi báo cáo vi phạm CSP.

Trước tiên, máy chủ có thể gửi phản hồi với tiêu đề HTTP `Report-To` như dưới đây.
Điều này chỉ định một nhóm các endpoint `url` được xác định bằng tên nhóm `csp-endpoints`.

```http
Report-To: { "group": "csp-endpoints",
              "max_age": 10886400,
              "endpoints": [
                { "url": "https://example.com/reports" },
                { "url": "https://backup.com/reports" }
              ] }
```

Máy chủ có thể chỉ định rằng nó muốn nhóm này là mục tiêu gửi báo cáo vi phạm CSP bằng cách đặt tên nhóm làm giá trị của chỉ thị {{CSP("report-to")}}:

```http
Content-Security-Policy: script-src https://example.com/; report-to csp-endpoints
```

Với các tiêu đề trên, bất kỳ vi phạm CSP nào đối với `script-src` sẽ dẫn đến việc gửi báo cáo vi phạm đến cả hai giá trị `url` được liệt kê trong `Report-To`.

### Chỉ định nhiều nhóm báo cáo

Ví dụ dưới đây minh họa tiêu đề `Report-To` chỉ định nhiều nhóm endpoint.
Lưu ý rằng mỗi nhóm có tên duy nhất, và các nhóm không bị giới hạn bởi các ký tự mảng.

```http
Report-To: { "group": "csp-endpoint-1",
              "max_age": 10886400,
              "endpoints": [
                { "url": "https://example.com/csp-reports" }
              ] },
            { "group": "hpkp-endpoint",
              "max_age": 10886400,
              "endpoints": [
                { "url": "https://example.com/hpkp-reports" }
              ] }
```

Chúng ta có thể chọn một nhóm endpoint làm mục tiêu cho báo cáo vi phạm theo tên, giống như đã làm trong ví dụ trước:

```http
Content-Security-Policy: script-src https://example.com/; report-to csp-endpoint-1
```

## Thông số kỹ thuật

Tiêu đề này không còn là một phần của bất kỳ thông số kỹ thuật nào.
Trước đây nó là một phần của [Reporting API](/en-US/docs/Web/API/Reporting_API). <!-- https://github.com/w3c/reporting/pull/197 -->

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Reporting API](/en-US/docs/Web/API/Reporting_API) và tiêu đề {{HTTPHeader("Reporting-Endpoints")}}
- Chỉ thị CSP {{CSP("report-to")}}
- Các tiêu đề {{HTTPHeader("Content-Security-Policy")}}, {{HTTPHeader("Content-Security-Policy-Report-Only")}}
- Hướng dẫn [Content Security Policy (CSP)](/en-US/docs/Web/HTTP/Guides/CSP#violation_reporting)
