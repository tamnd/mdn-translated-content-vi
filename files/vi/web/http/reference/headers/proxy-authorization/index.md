---
title: Proxy-Authorization header
short-title: Proxy-Authorization
slug: Web/HTTP/Reference/Headers/Proxy-Authorization
page-type: http-header
spec-urls: https://httpwg.org/specs/rfc9110.html#field.proxy-authorization
sidebar: http
---

Tiêu đề HTTP **`Proxy-Authorization`** {{Glossary("request header")}} chứa thông tin xác thực để xác thực máy khách với máy chủ proxy, thường sau khi máy chủ đã phản hồi với trạng thái {{HTTPStatus("407", "407 Proxy Authentication Required")}} với tiêu đề {{HTTPHeader("Proxy-Authenticate")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Proxy-Authorization: <auth-scheme> <credentials>
```

## Chỉ thị

- `<auth-scheme>`
  - : Token không phân biệt chữ hoa chữ thường chỉ báo [phương án xác thực](/en-US/docs/Web/HTTP/Guides/Authentication#authentication_schemes) được sử dụng.
    Một số loại phổ biến hơn là [`Basic`](/en-US/docs/Web/HTTP/Guides/Authentication#basic_authentication_scheme), `Digest`, `Negotiate` và `AWS4-HMAC-SHA256`.
    IANA duy trì [danh sách các phương án xác thực](https://www.iana.org/assignments/http-authschemes/http-authschemes.xhtml), nhưng có các phương án khác được các dịch vụ máy chủ cung cấp.
- `<credentials>`
  - : Thông tin xác thực được sử dụng cho phương án xác thực.
    Thông thường, bạn sẽ cần kiểm tra các thông số kỹ thuật liên quan cho định dạng.

> [!NOTE]
> Xem {{HTTPHeader("Authorization")}} để biết thêm chi tiết.

## Ví dụ

### Xác thực Basic

Trong xác thực `Basic`, thông tin xác thực được gửi theo định dạng `<username>:<password>` (ví dụ: `aladdin:opensesame`).
Chuỗi kết quả sau đó được mã hóa [base64](/en-US/docs/Glossary/Base64) (`YWxhZGRpbjpvcGVuc2VzYW1l`).

```http
Proxy-Authorization: Basic YWxhZGRpbjpvcGVuc2VzYW1l
```

> [!WARNING]
> Mã hóa Base64 có thể đảo ngược, và do đó không cung cấp bảo mật mật mã.
> Phương pháp này có thể được coi là tương đương với việc gửi thông tin xác thực ở dạng văn bản thô.
> {{Glossary("HTTPS")}} luôn được khuyến nghị khi sử dụng xác thực, nhưng còn quan trọng hơn khi sử dụng xác thực `Basic`.

### Xác thực Bearer (auth token)

```http
Proxy-Authorization: Bearer kNTktNTA1My00YzLT1234
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [Xác thực HTTP](/en-US/docs/Web/HTTP/Guides/Authentication)
- {{HTTPHeader("Proxy-Authenticate")}}
- {{HTTPHeader("WWW-Authenticate")}}
- {{HTTPHeader("Authorization")}}
- {{HTTPStatus("401")}}, {{HTTPStatus("403")}}, {{HTTPStatus("407")}}
