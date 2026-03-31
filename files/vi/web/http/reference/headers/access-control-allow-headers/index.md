---
title: Access-Control-Allow-Headers header
short-title: Access-Control-Allow-Headers
slug: Web/HTTP/Reference/Headers/Access-Control-Allow-Headers
page-type: http-header
browser-compat: http.headers.Access-Control-Allow-Headers
sidebar: http
---

Tiêu đề HTTP **`Access-Control-Allow-Headers`** {{Glossary("response header", "phản hồi")}} được sử dụng trong phản hồi cho {{Glossary("preflight request", "yêu cầu preflight")}} để chỉ ra các tiêu đề HTTP có thể được sử dụng trong yêu cầu thực tế.
Tiêu đề này là bắt buộc nếu yêu cầu preflight chứa {{HTTPHeader("Access-Control-Request-Headers")}}.

> [!NOTE]
> Các {{glossary("CORS-safelisted_request_header", "tiêu đề yêu cầu được CORS chấp nhận")}} luôn được phép và thường không được liệt kê trong `Access-Control-Allow-Headers` trừ khi cần bỏ qua [các hạn chế bổ sung của danh sách được chấp nhận](/en-US/docs/Glossary/CORS-safelisted_request_header#additional_restrictions).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header", "Tiêu đề phản hồi")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Access-Control-Allow-Headers: <header-name>
Access-Control-Allow-Headers: <header-name>, <header-name>
Access-Control-Allow-Headers: *
```

## Chỉ thị

- `<header-name>`
  - : Tên của tiêu đề yêu cầu được hỗ trợ. Tiêu đề có thể liệt kê bất kỳ số tiêu đề nào, được phân tách bằng dấu phẩy.
- `*` (ký tự đại diện)
  - : Bất kỳ tiêu đề nào. Giá trị `*` chỉ tính là giá trị ký tự đại diện đặc biệt cho các yêu cầu không có thông tin xác thực (các yêu cầu không có [cookie HTTP](/en-US/docs/Web/HTTP/Guides/Cookies) hoặc thông tin xác thực HTTP). Trong các yêu cầu có thông tin xác thực, nó được coi là tên tiêu đề chữ `*` không có ngữ nghĩa đặc biệt. Tiêu đề {{HTTPHeader("Authorization")}} không chấp nhận ký tự đại diện và luôn cần được liệt kê rõ ràng.

## Ví dụ

### Triển khai tiêu đề tùy chỉnh

Dưới đây là ví dụ về tiêu đề `Access-Control-Allow-Headers`.
Nó chỉ ra rằng tiêu đề tùy chỉnh có tên `X-Custom-Header` được hỗ trợ bởi các yêu cầu CORS đến máy chủ, ngoài {{Glossary("CORS-safelisted_request_header", "các tiêu đề yêu cầu được CORS chấp nhận")}}.

```http
Access-Control-Allow-Headers: X-Custom-Header
```

### Hỗ trợ nhiều tiêu đề

Ví dụ này hiển thị `Access-Control-Allow-Headers` khi nó chỉ định hỗ trợ cho nhiều tiêu đề.

```http
Access-Control-Allow-Headers: X-Custom-Header, Upgrade-Insecure-Requests
```

### Bỏ qua các hạn chế bổ sung đối với tiêu đề được CORS chấp nhận

Mặc dù {{glossary("CORS-safelisted_request_header", "các tiêu đề yêu cầu được CORS chấp nhận")}} luôn được phép và thường không cần được liệt kê trong `Access-Control-Allow-Headers`, việc liệt kê chúng dù sao sẽ bỏ qua [các hạn chế bổ sung](/en-US/docs/Glossary/CORS-safelisted_request_header#additional_restrictions) áp dụng.

```http
Access-Control-Allow-Headers: Accept
```

### Xử lý yêu cầu preflight

Hãy xem ví dụ về {{glossary("preflight request", "yêu cầu preflight")}} liên quan đến `Access-Control-Allow-Headers`.

#### Yêu cầu

Đầu tiên, yêu cầu preflight là yêu cầu {{HTTPMethod("OPTIONS")}} bao gồm một số kết hợp của ba tiêu đề yêu cầu preflight: {{HTTPHeader("Access-Control-Request-Method")}}, {{HTTPHeader("Access-Control-Request-Headers")}}, và {{HTTPHeader("Origin")}}.

Yêu cầu preflight bên dưới cho máy chủ biết rằng chúng ta muốn gửi yêu cầu CORS `GET` với các tiêu đề được liệt kê trong {{HTTPHeader("Access-Control-Request-Headers")}} ({{HTTPHeader("Content-Type")}} và `X-Requested-With`).

```http
OPTIONS /resource/foo
Access-Control-Request-Method: GET
Access-Control-Request-Headers: content-type,x-requested-with
Origin: https://www.example.com
```

#### Phản hồi

Nếu yêu cầu CORS được chỉ ra bởi yêu cầu preflight được ủy quyền, máy chủ sẽ phản hồi yêu cầu preflight bằng thông điệp chỉ ra nguồn gốc, phương thức và tiêu đề được phép. Bên dưới, chúng ta thấy rằng `Access-Control-Allow-Headers` bao gồm các tiêu đề đã được yêu cầu.

```http
HTTP/1.1 200 OK
Content-Length: 0
Connection: keep-alive
Access-Control-Allow-Origin: https://www.example.com
Access-Control-Allow-Methods: POST, GET, OPTIONS, DELETE
Access-Control-Allow-Headers: Content-Type, x-requested-with
Access-Control-Max-Age: 86400
```

Nếu phương thức được yêu cầu không được hỗ trợ, máy chủ sẽ phản hồi bằng lỗi.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Access-Control-Allow-Origin")}}
- {{HTTPHeader("Access-Control-Expose-Headers")}}
- {{HTTPHeader("Access-Control-Allow-Methods")}}
- {{HTTPHeader("Access-Control-Request-Headers")}}
