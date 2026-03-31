---
title: Proxy-Authenticate header
short-title: Proxy-Authenticate
slug: Web/HTTP/Reference/Headers/Proxy-Authenticate
page-type: http-header
browser-compat: http.headers.Proxy-Authenticate
sidebar: http
---

Tiêu đề HTTP **`Proxy-Authenticate`** {{Glossary("response header")}} xác định phương pháp [xác thực](/en-US/docs/Web/HTTP/Guides/Authentication) (hoặc {{Glossary("Challenge", "thử thách")}}) nên được sử dụng để có quyền truy cập vào tài nguyên đằng sau {{Glossary("proxy server")}}.
Nó được gửi trong phản hồi {{HTTPStatus("407", "407 Proxy Authentication Required")}} để máy khách có thể xác định mình với proxy yêu cầu xác thực.

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
Proxy-Authenticate: <challenge>, …
```

Giá trị là danh sách các thử thách phân tách bằng dấu phẩy, trong đó `<challenge>` bao gồm `<auth-scheme>`, theo sau là `<token68>` tùy chọn hoặc danh sách `<auth-params>` phân tách bằng dấu phẩy:

```plain
challenge = <auth-scheme> <auth-param>, …, <auth-paramN>
challenge = <auth-scheme> <token68>
```

Ví dụ:

```http
Proxy-Authenticate: <auth-scheme>
Proxy-Authenticate: <auth-scheme> token68
Proxy-Authenticate: <auth-scheme> auth-param1=param-token1
Proxy-Authenticate: <auth-scheme> auth-param1=param-token1, …, auth-paramN=param-tokenN
```

Sự hiện diện của `token68` hoặc các tham số xác thực phụ thuộc vào `<auth-scheme>` được chọn.
Ví dụ: [xác thực Basic](/en-US/docs/Web/HTTP/Guides/Authentication#basic_authentication_scheme) yêu cầu `<realm>`, và cho phép sử dụng tùy chọn khóa `charset`, nhưng không hỗ trợ `token68`:

```http
Proxy-Authenticate: Basic realm="Dev", charset="UTF-8"
```

## Chỉ thị

- `<auth-scheme>`
  - : Token không phân biệt chữ hoa chữ thường chỉ báo [phương án xác thực](/en-US/docs/Web/HTTP/Guides/Authentication#authentication_schemes) được sử dụng.
    Một số loại phổ biến hơn là [`Basic`](/en-US/docs/Web/HTTP/Guides/Authentication#basic_authentication_scheme), `Digest`, `Negotiate` và `AWS4-HMAC-SHA256`.
    IANA duy trì [danh sách các phương án xác thực](https://www.iana.org/assignments/http-authschemes/http-authschemes.xhtml), nhưng có các phương án khác được các dịch vụ máy chủ cung cấp.
- `<auth-param>` {{optional_inline}}
  - : Tham số xác thực có định dạng phụ thuộc vào `<auth-scheme>`.
    `<realm>` được mô tả bên dưới vì nó là tham số xác thực phổ biến trong nhiều phương án auth.
    - `<realm>` {{optional_inline}}
      - : Chuỗi `realm` theo sau `=` và chuỗi được trích dẫn mô tả vùng được bảo vệ, ví dụ `realm="staging environment"`.
        Realm cho phép máy chủ phân vùng các vùng nó bảo vệ (nếu được hỗ trợ bởi phương án cho phép phân vùng như vậy).
        Một số máy khách hiển thị giá trị này cho người dùng để thông báo về thông tin xác thực cụ thể nào được yêu cầu — mặc dù hầu hết trình duyệt đã ngừng làm như vậy để chống phishing.
        Bộ ký tự được hỗ trợ đáng tin cậy duy nhất cho giá trị này là `us-ascii`.
        Nếu không có realm nào được chỉ định, máy khách thường hiển thị tên máy chủ được định dạng thay thế.
- `<token68>` {{optional_inline}}
  - : Token có thể hữu ích cho một số phương án.
    Token cho phép 66 ký tự URI không dành riêng cộng thêm một vài ký tự khác.
    Nó có thể giữ mã hóa {{glossary("base64")}}, base64url, base32, hoặc base16 (hex), có hoặc không có padding, nhưng không bao gồm khoảng trắng.
    Thay thế `token68` cho danh sách auth-param được hỗ trợ để nhất quán với các phương án xác thực cũ.

Thông thường, bạn sẽ cần kiểm tra các thông số kỹ thuật liên quan cho các tham số xác thực cần thiết cho mỗi `<auth-scheme>`.

> [!NOTE]
> Xem {{HTTPHeader("WWW-Authenticate")}} để biết thêm chi tiết về các tham số xác thực.

## Ví dụ

### Xác thực Basic với Proxy-Authenticate

Phản hồi sau chỉ báo rằng cần phương án xác thực Basic với realm:

```http
Proxy-Authenticate: Basic realm="Staging server"
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("WWW-Authenticate")}}
- [Xác thực HTTP](/en-US/docs/Web/HTTP/Guides/Authentication)
- {{HTTPHeader("Authorization")}}, {{HTTPHeader("Proxy-Authorization")}}
- {{HTTPStatus("401")}}, {{HTTPStatus("403")}}, {{HTTPStatus("407")}}
