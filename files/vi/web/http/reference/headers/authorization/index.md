---
title: Authorization header
short-title: Authorization
slug: Web/HTTP/Reference/Headers/Authorization
page-type: http-header
browser-compat: http.headers.Authorization
sidebar: http
---

Tiêu đề HTTP **`Authorization`** {{Glossary("request header", "yêu cầu")}} có thể được sử dụng để cung cấp thông tin xác thực xác minh tác nhân người dùng với máy chủ, cho phép truy cập vào các tài nguyên được bảo vệ.

Tiêu đề `Authorization` thường, nhưng không phải lúc nào cũng, được gửi sau khi tác nhân người dùng lần đầu cố gắng yêu cầu tài nguyên được bảo vệ mà không có thông tin xác thực.
Máy chủ phản hồi với thông điệp {{HTTPStatus("401", "401 Unauthorized")}} bao gồm ít nhất một tiêu đề {{HTTPHeader("WWW-Authenticate")}}.
Tiêu đề này chỉ ra các scheme xác thực có thể được sử dụng để truy cập tài nguyên và bất kỳ thông tin bổ sung nào cần thiết bởi máy khách để sử dụng chúng.
Tác nhân người dùng nên chọn scheme xác thực an toàn nhất mà nó hỗ trợ từ những cái được cung cấp, nhắc người dùng nhập thông tin xác thực của họ, sau đó yêu cầu lại tài nguyên với thông tin xác thực đã mã hóa trong tiêu đề `Authorization`.

Tiêu đề này bị loại bỏ trong các chuyển hướng cross-origin.

> [!NOTE]
> Tiêu đề này là một phần của [framework xác thực HTTP chung](/en-US/docs/Web/HTTP/Guides/Authentication#the_general_http_authentication_framework).
> Nó có thể được sử dụng với một số [scheme xác thực](/en-US/docs/Web/HTTP/Guides/Authentication#authentication_schemes).

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header", "Tiêu đề yêu cầu")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header", "Tiêu đề yêu cầu bị cấm")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Authorization: <auth-scheme> <authorization-parameters>

// Basic authentication
Authorization: Basic <credentials>

// Digest authentication
Authorization: Digest username=<username>,
    realm="<realm>",
    uri="<url>",
    algorithm=<algorithm>,
    nonce="<nonce>",
    nc=<nc>,
    cnonce="<cnonce>",
    qop=<qop>,
    response="<response>",
    opaque="<opaque>"
```

## Chỉ thị

- `<auth-scheme>`
  - : [Scheme xác thực](/en-US/docs/Web/HTTP/Guides/Authentication#authentication_schemes) xác định cách thông tin xác thực được mã hóa. Một số loại phổ biến hơn là (không phân biệt chữ hoa/thường): [`Basic`](/en-US/docs/Web/HTTP/Guides/Authentication#basic_authentication_scheme), `Digest`, `Negotiate` và `AWS4-HMAC-SHA256`.

    > [!NOTE]
    > Để biết thêm thông tin/tùy chọn xem [HTTP Authentication > Authentication schemes](/en-US/docs/Web/HTTP/Guides/Authentication#authentication_schemes)

Ngoài `<auth-scheme>`, các chỉ thị còn lại là cụ thể cho từng [scheme xác thực](/en-US/docs/Web/HTTP/Guides/Authentication#authentication_schemes).
Thông thường, bạn sẽ cần kiểm tra các thông số kỹ thuật liên quan cho những điều này (các khóa cho một tập con nhỏ của các scheme được liệt kê bên dưới).

### Xác thực Basic

- `<credentials>`
  - : Thông tin xác thực, được mã hóa theo scheme đã chỉ định.

    > [!NOTE]
    > Để biết thông tin về thuật toán mã hóa, xem các ví dụ: bên dưới, trong {{HTTPHeader("WWW-Authenticate")}}, trong [HTTP Authentication](/en-US/docs/Web/HTTP/Guides/Authentication), và trong các thông số kỹ thuật liên quan.

### Xác thực Digest

- `<response>`
  - : Một chuỗi các chữ số hex chứng minh rằng người dùng biết mật khẩu. Thuật toán mã hóa tên người dùng và mật khẩu, realm, cnonce, qop, nc, v.v. Nó được mô tả chi tiết trong thông số kỹ thuật.
- `username`
  - : Một chuỗi được trích dẫn chứa tên người dùng cho `realm` được chỉ định ở dạng văn bản thuần hoặc mã hash theo ký hiệu thập lục phân. Nếu tên chứa các ký tự không được phép trong trường, thì có thể sử dụng `username*` thay thế (không phải "đồng thời với").
- `username*`
  - : Tên người dùng được định dạng sử dụng ký hiệu mở rộng được xác định trong RFC5987. Chỉ nên sử dụng điều này nếu tên không thể được mã hóa trong `username` và nếu `userhash` được đặt thành `"false"`.
- `uri`
  - : _URI Yêu cầu Hiệu quả_. Xem thông số kỹ thuật để biết thêm thông tin.
- `realm`
  - : Realm của tên người dùng/mật khẩu được yêu cầu (lại, nên khớp với giá trị trong phản hồi {{HTTPHeader("WWW-Authenticate")}} tương ứng cho tài nguyên đang được yêu cầu).
- `opaque`
  - : Giá trị trong phản hồi {{HTTPHeader("WWW-Authenticate")}} tương ứng cho tài nguyên đang được yêu cầu.
- `algorithm`
  - : Thuật toán được sử dụng để tính toán digest. Phải là thuật toán được hỗ trợ từ phản hồi {{HTTPHeader("WWW-Authenticate")}} cho tài nguyên đang được yêu cầu.
- `qop`
  - : Token chỉ ra _chất lượng bảo vệ_ được áp dụng cho thông điệp. Phải khớp với một giá trị trong tập hợp được chỉ định trong phản hồi {{HTTPHeader("WWW-Authenticate")}} cho tài nguyên đang được yêu cầu.
    - `"auth"`: Xác thực
    - `"auth-int"`: Xác thực với bảo vệ toàn vẹn
- `cnonce`
  - : Một giá trị chuỗi chỉ {{Glossary("ASCII")}} được cung cấp bởi máy khách. Điều này được sử dụng bởi cả máy khách và máy chủ để cung cấp xác thực lẫn nhau, cung cấp một số bảo vệ toàn vẹn thông điệp, và tránh các "cuộc tấn công văn bản được chọn". Xem thông số kỹ thuật để biết thêm thông tin.
- `nc`
  - : Đếm nonce. Số lượng yêu cầu thập lục phân mà máy khách đã gửi giá trị `cnonce` hiện tại (bao gồm yêu cầu hiện tại). Máy chủ có thể sử dụng các giá trị `nc` trùng lặp để nhận ra các yêu cầu phát lại.
- `userhash` {{optional_inline}}
  - : `"true"` nếu tên người dùng đã được hash. `"false"` theo mặc định.

## Ví dụ

### Xác thực Basic

Đối với xác thực `Basic`, thông tin xác thực được xây dựng bằng cách đầu tiên kết hợp tên người dùng và mật khẩu bằng dấu hai chấm (ví dụ: `aladdin:opensesame`), và sau đó mã hóa chuỗi kết quả trong [`base64`](/en-US/docs/Glossary/Base64) (ví dụ: `YWxhZGRpbjpvcGVuc2VzYW1l`).

```http
Authorization: Basic YWxhZGRpbjpvcGVuc2VzYW1l
```

> [!WARNING]
> Mã hóa {{Glossary("Base64")}} có thể dễ dàng bị đảo ngược để lấy tên và mật khẩu gốc, vì vậy xác thực `Basic` không cung cấp bảo mật mật mã. {{Glossary("HTTPS")}} luôn được khuyến nghị khi sử dụng xác thực, nhưng càng đặc biệt hơn khi sử dụng xác thực `Basic`.

Xem thêm [HTTP authentication](/en-US/docs/Web/HTTP/Guides/Authentication) để biết ví dụ về cách cấu hình máy chủ Apache hoặc Nginx để bảo vệ trang web của bạn bằng mật khẩu bằng xác thực basic HTTP.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [HTTP authentication](/en-US/docs/Web/HTTP/Guides/Authentication)
- {{HTTPHeader("WWW-Authenticate")}}
- {{HTTPHeader("Proxy-Authorization")}}
- {{HTTPHeader("Proxy-Authenticate")}}
- {{HTTPStatus("401")}}, {{HTTPStatus("403")}}, {{HTTPStatus("407")}}
