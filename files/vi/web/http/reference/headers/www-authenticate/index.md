---
title: WWW-Authenticate header
short-title: WWW-Authenticate
slug: Web/HTTP/Reference/Headers/WWW-Authenticate
page-type: http-header
browser-compat: http.headers.WWW-Authenticate
sidebar: http
---

Tiêu đề HTTP **`WWW-Authenticate`** {{Glossary("response header")}} quảng cáo các phương thức [xác thực HTTP](/en-US/docs/Web/HTTP/Guides/Authentication) (hoặc {{Glossary("challenge", "thử thách")}}) có thể được sử dụng để truy cập vào tài nguyên cụ thể.
Tiêu đề này là một phần của [khung xác thực HTTP chung](/en-US/docs/Web/HTTP/Guides/Authentication#the_general_http_authentication_framework), có thể được sử dụng với một số [scheme xác thực](/en-US/docs/Web/HTTP/Guides/Authentication#authentication_schemes).
Mỗi thử thách xác định một scheme được máy chủ hỗ trợ và các tham số bổ sung được định nghĩa cho loại scheme đó.

Máy chủ sử dụng [xác thực HTTP](/en-US/docs/Web/HTTP/Guides/Authentication) sẽ phản hồi với phản hồi {{HTTPStatus("401", "401 Unauthorized")}} cho yêu cầu tài nguyên được bảo vệ.
Phản hồi này phải bao gồm ít nhất một tiêu đề `WWW-Authenticate` và ít nhất một thử thách để chỉ ra các scheme xác thực nào có thể được sử dụng để truy cập tài nguyên và bất kỳ dữ liệu bổ sung nào mà mỗi scheme cụ thể cần.

Nhiều thử thách được phép trong một tiêu đề `WWW-Authenticate`, và nhiều tiêu đề `WWW-Authenticate` được phép trong một phản hồi.
Máy chủ cũng có thể bao gồm tiêu đề `WWW-Authenticate` trong các thông điệp phản hồi khác để chỉ ra rằng việc cung cấp thông tin xác thực có thể ảnh hưởng đến phản hồi.

Sau khi nhận tiêu đề `WWW-Authenticate`, máy khách thường sẽ nhắc người dùng nhập thông tin xác thực, và sau đó yêu cầu lại tài nguyên.
Yêu cầu mới này sử dụng tiêu đề {{HTTPHeader("Authorization")}} để cung cấp thông tin xác thực cho máy chủ, được mã hóa phù hợp cho phương thức xác thực được chọn.
Máy khách dự kiến sẽ chọn thử thách an toàn nhất trong số những thử thách nó hiểu (lưu ý rằng trong một số trường hợp, phương thức "an toàn nhất" là có thể tranh luận).

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
WWW-Authenticate: <challenge>
```

Trong đó `<challenge>` bao gồm `<auth-scheme>`, theo sau là `<token68>` tùy chọn hoặc danh sách phân cách bằng dấu phẩy của `<auth-params>`:

```plain
challenge = <auth-scheme> <auth-param>, …, <auth-paramN>
challenge = <auth-scheme> <token68>
```

Ví dụ:

```http
WWW-Authenticate: <auth-scheme>
WWW-Authenticate: <auth-scheme> token68
WWW-Authenticate: <auth-scheme> auth-param1=param-token1
WWW-Authenticate: <auth-scheme> auth-param1=param-token1, …, auth-paramN=param-tokenN
```

Sự hiện diện của `token68` hoặc các tham số xác thực phụ thuộc vào `<auth-scheme>` được chọn.
Ví dụ, [xác thực Basic](/en-US/docs/Web/HTTP/Guides/Authentication#basic_authentication_scheme) yêu cầu `<realm>`, và cho phép sử dụng tùy chọn khóa `charset`, nhưng không hỗ trợ `token68`:

```http
WWW-Authenticate: Basic realm="Dev", charset="UTF-8"
```

Nhiều thử thách có thể được gửi trong danh sách phân cách bằng dấu phẩy

```http
WWW-Authenticate: <challenge>, …, <challengeN>
```

Nhiều tiêu đề cũng có thể được gửi trong một phản hồi duy nhất:

```http
WWW-Authenticate: <challenge>
WWW-Authenticate: <challengeN>
```

## Chỉ thị

- `<auth-scheme>`
  - : Token không phân biệt chữ hoa chữ thường cho biết [scheme xác thực](/en-US/docs/Web/HTTP/Guides/Authentication#authentication_schemes) được sử dụng.
    Một số loại phổ biến hơn là [`Basic`](/en-US/docs/Web/HTTP/Guides/Authentication#basic_authentication_scheme), `Digest`, `Negotiate` và `AWS4-HMAC-SHA256`.
    IANA duy trì [danh sách các scheme xác thực](https://www.iana.org/assignments/http-authschemes/http-authschemes.xhtml), nhưng có các scheme khác được cung cấp bởi các dịch vụ host.
- `<auth-param>` {{optional_inline}}
  - : Tham số xác thực có định dạng phụ thuộc vào `<auth-scheme>`.
    `<realm>` được mô tả bên dưới vì nó là tham số xác thực phổ biến trong nhiều scheme xác thực.
    - `<realm>` {{optional_inline}}
      - : Chuỗi `realm` theo sau là `=` và chuỗi được trích dẫn mô tả vùng được bảo vệ, ví dụ `realm="staging environment"`.
        Realm cho phép máy chủ phân vùng các vùng nó bảo vệ (nếu được hỗ trợ bởi scheme cho phép phân vùng như vậy).
        Một số máy khách hiển thị giá trị này cho người dùng để thông báo cho họ về thông tin xác thực cụ thể nào được yêu cầu — mặc dù hầu hết các trình duyệt đã ngừng làm vậy để chống phishing.
        Bộ ký tự duy nhất được hỗ trợ một cách đáng tin cậy cho giá trị này là `us-ascii`.
        Nếu không có realm nào được chỉ định, các máy khách thường hiển thị tên máy chủ được định dạng thay thế.
- `<token68>` {{optional_inline}}
  - : Token có thể hữu ích cho một số scheme.
    Token cho phép 66 ký tự URI không dành riêng cộng với một số ký tự khác.
    Nó có thể giữ mã hóa {{glossary("base64")}}, base64url, base32, hoặc base16 (hex), có hoặc không có đệm, nhưng không bao gồm khoảng trắng.
    Lựa chọn token68 thay vì danh sách auth-param được hỗ trợ để tương thích với các scheme xác thực cũ hơn.

Nói chung, bạn sẽ cần kiểm tra các đặc tả liên quan cho các tham số xác thực cần thiết cho mỗi `<auth-scheme>`.
Các phần sau mô tả token và tham số xác thực cho một số scheme xác thực phổ biến.

### Chỉ thị xác thực Basic

- `<realm>`
  - : `<realm>` như [được mô tả ở trên](#realm).
    Lưu ý rằng realm là bắt buộc cho xác thực `Basic`.
- `charset="UTF-8"` {{optional_inline}}
  - : Cho máy khách biết scheme mã hóa ưu tiên của máy chủ khi gửi tên người dùng và mật khẩu.
    Giá trị được phép duy nhất là chuỗi không phân biệt chữ hoa chữ thường `UTF-8`.
    Điều này không liên quan đến mã hóa của chuỗi realm.

### Chỉ thị xác thực Digest

- `<realm>` {{optional_inline}}
  - : `<realm>` như [được mô tả ở trên](#realm) cho biết tên người dùng/mật khẩu nào cần sử dụng.
    Tối thiểu nên bao gồm tên máy chủ, nhưng có thể chỉ ra người dùng hoặc nhóm có quyền truy cập.
- `domain` {{optional_inline}}
  - : Danh sách phân cách bằng dấu cách được trích dẫn của các tiền tố URI xác định tất cả các vị trí có thể sử dụng thông tin xác thực.
    Nếu khóa này không được chỉ định thì thông tin xác thực có thể được sử dụng ở bất kỳ đâu trên web root.
- `nonce`
  - : Chuỗi được trích dẫn do máy chủ chỉ định mà máy chủ có thể sử dụng để kiểm soát thời gian sống trong đó thông tin xác thực cụ thể sẽ được coi là hợp lệ.
    Điều này phải được tạo duy nhất mỗi lần thực hiện phản hồi 401, và có thể được tạo lại thường xuyên hơn (ví dụ, cho phép digest chỉ được sử dụng một lần).
    Đặc tả chứa lời khuyên về các thuật toán có thể để tạo giá trị này.
    Giá trị {{Glossary("Nonce", "nonce")}} là không rõ ràng với máy khách.
- `opaque`
  - : Chuỗi được trích dẫn do máy chủ chỉ định cần được trả lại không thay đổi trong {{HTTPHeader("Authorization")}}.
    Điều này là không rõ ràng với máy khách. Máy chủ được khuyến nghị bao gồm dữ liệu Base64 hoặc thập lục phân.
- `stale` {{optional_inline}}
  - : Cờ không phân biệt chữ hoa chữ thường cho biết rằng yêu cầu trước đó từ máy khách đã bị từ chối vì `nonce` được sử dụng quá cũ (stale).
    Nếu điều này là `true` thì yêu cầu có thể được thử lại bằng cách sử dụng cùng tên người dùng/mật khẩu được mã hóa bằng `nonce` mới.
    Nếu nó là bất kỳ giá trị nào khác thì tên người dùng/mật khẩu không hợp lệ và phải được yêu cầu lại từ người dùng.
- `algorithm` {{optional_inline}}
  - : Chuỗi cho biết thuật toán được sử dụng để tạo digest.
    Giá trị không phải phiên hợp lệ là: `MD5` (mặc định nếu không chỉ định `algorithm`), `SHA-256`, `SHA-512`.
    Giá trị phiên hợp lệ là: `MD5-sess`, `SHA-256-sess`, `SHA-512-sess`.
- `qop`
  - : Chuỗi được trích dẫn cho biết chất lượng bảo vệ được máy chủ hỗ trợ. Điều này phải được cung cấp, và các tùy chọn không được nhận ra phải bị bỏ qua.
    - `"auth"`: Xác thực
    - `"auth-int"`: Xác thực với bảo vệ toàn vẹn
- `charset="UTF-8"` {{optional_inline}}
  - : Cho máy khách biết scheme mã hóa ưu tiên của máy chủ khi gửi tên người dùng và mật khẩu.
    Giá trị được phép duy nhất là chuỗi không phân biệt chữ hoa chữ thường "UTF-8".
- `userhash` {{optional_inline}}
  - : Máy chủ có thể chỉ định `"true"` để cho biết rằng nó hỗ trợ băm tên người dùng (mặc định là `"false"`)

### HTTP Origin-Bound Authentication (HOBA)

- `<challenge>`
  - : Tập hợp các cặp theo định dạng `<len>:<value>` được nối với nhau để đưa cho máy khách.
    Thử thách được tạo từ nonce, thuật toán, nguồn gốc, realm, định danh khóa, và thử thách.
- `<max-age>`
  - : Số giây từ thời điểm phản hồi HTTP được phát ra mà các phản hồi cho thử thách này có thể được chấp nhận.
- `<realm>` {{optional_inline}}
  - : Như trên trong phần [chỉ thị](#directives).

## Ví dụ

### Phát hành nhiều thử thách xác thực

Nhiều thử thách có thể được chỉ định trong một tiêu đề phản hồi đơn:

```http
HTTP/1.1 401 Unauthorized
WWW-Authenticate: challenge1, …, challengeN
```

Nhiều thử thách có thể được gửi trong các tiêu đề `WWW-Authenticate` riêng biệt trong cùng phản hồi:

```http
HTTP/1.1 401 Unauthorized
WWW-Authenticate: challenge1
WWW-Authenticate: challengeN
```

### Xác thực Basic

Máy chủ chỉ hỗ trợ xác thực basic có thể có tiêu đề phản hồi `WWW-Authenticate` trông như thế này:

```http
HTTP/1.1 401 Unauthorized
WWW-Authenticate: Basic realm="Staging server", charset="UTF-8"
```

Tác nhân người dùng nhận tiêu đề này trước tiên sẽ nhắc người dùng nhập tên người dùng và mật khẩu, và sau đó yêu cầu lại tài nguyên với thông tin xác thực được mã hóa trong tiêu đề `Authorization`.
Tiêu đề `Authorization` có thể trông như thế này:

```http
Authorization: Basic YWxhZGRpbjpvcGVuc2VzYW1l
```

Đối với xác thực `Basic`, thông tin xác thực được xây dựng bằng cách đầu tiên kết hợp tên người dùng và mật khẩu với dấu hai chấm (`aladdin:opensesame`), và sau đó mã hóa chuỗi kết quả trong [`base64`](/en-US/docs/Glossary/Base64) (`YWxhZGRpbjpvcGVuc2VzYW1l`).

> [!NOTE]
> Xem thêm [xác thực HTTP](/en-US/docs/Web/HTTP/Guides/Authentication) để biết ví dụ về cách cấu hình máy chủ Apache hoặc Nginx để bảo vệ trang web của bạn bằng mật khẩu với xác thực HTTP basic.

### Xác thực Digest với SHA-256 và MD5

> [!NOTE]
> Ví dụ này được lấy từ {{RFC("7616")}} "HTTP Digest Access Authentication" (các ví dụ khác trong đặc tả cho thấy việc sử dụng `SHA-512`, `charset`, và `userhash`).

Máy khách cố gắng truy cập tài liệu tại URI `http://www.example.org/dir/index.html` được bảo vệ qua xác thực digest.
Tên người dùng cho tài liệu này là "Mufasa" và mật khẩu là "Circle of Life" (lưu ý khoảng trắng đơn giữa mỗi từ).

Lần đầu tiên máy khách yêu cầu tài liệu, không có trường tiêu đề {{HTTPHeader("Authorization")}} nào được gửi.
Ở đây máy chủ phản hồi với thông điệp HTTP 401 bao gồm thử thách cho mỗi thuật toán digest mà nó hỗ trợ, theo thứ tự ưu tiên của nó (`SHA256` và sau đó `MD5`)

```http
HTTP/1.1 401 Unauthorized
WWW-Authenticate: Digest
    realm="http-auth@example.org",
    qop="auth, auth-int",
    algorithm=SHA-256,
    nonce="7ypf/xlj9XXwfDPEoM4URrv/xwf94BcCAzFZH4GiTo0v",
    opaque="FQhe/qaU925kfnzjCev0ciny7QMkPqMAFRtzCUYo5tdS"
WWW-Authenticate: Digest
    realm="http-auth@example.org",
    qop="auth, auth-int",
    algorithm=MD5,
    nonce="7ypf/xlj9XXwfDPEoM4URrv/xwf94BcCAzFZH4GiTo0v",
    opaque="FQhe/qaU925kfnzjCev0ciny7QMkPqMAFRtzCUYo5tdS"
```

Máy khách nhắc người dùng nhập tên người dùng và mật khẩu, và sau đó phản hồi với yêu cầu mới mã hóa thông tin xác thực trong trường tiêu đề {{HTTPHeader("Authorization")}}.
Nếu máy khách chọn digest MD5, trường tiêu đề {{HTTPHeader("Authorization")}} có thể trông như được hiển thị bên dưới:

```http
Authorization: Digest username="Mufasa",
    realm="http-auth@example.org",
    uri="/dir/index.html",
    algorithm=MD5,
    nonce="7ypf/xlj9XXwfDPEoM4URrv/xwf94BcCAzFZH4GiTo0v",
    nc=00000001,
    cnonce="f2/wE4q74E6zIJEtWaHKaf5wv/H5QzzpXusqGemxURZJ",
    qop=auth,
    response="8ca523f5e9506fed4657c9700eebdbec",
    opaque="FQhe/qaU925kfnzjCev0ciny7QMkPqMAFRtzCUYo5tdS"
```

Nếu máy khách chọn digest SHA-256, trường tiêu đề {{HTTPHeader("Authorization")}} có thể trông như được hiển thị bên dưới:

```http
Authorization: Digest username="Mufasa",
    realm="http-auth@example.org",
    uri="/dir/index.html",
    algorithm=SHA-256,
    nonce="7ypf/xlj9XXwfDPEoM4URrv/xwf94BcCAzFZH4GiTo0v",
    nc=00000001,
    cnonce="f2/wE4q74E6zIJEtWaHKaf5wv/H5QzzpXusqGemxURZJ",
    qop=auth,
    response="753927fa0e85d155564e2e272a28d1802ca10daf449
        6794697cf8db5856cb6c1",
    opaque="FQhe/qaU925kfnzjCev0ciny7QMkPqMAFRtzCUYo5tdS"
```

### Xác thực HOBA

Máy chủ hỗ trợ xác thực HOBA có thể có tiêu đề phản hồi `WWW-Authenticate` trông như thế này:

```http
HTTP/1.1 401 Unauthorized
WWW-Authenticate: HOBA max-age="180", challenge="16:MTEyMzEyMzEyMw==1:028:https://www.example.com:8080:3:MTI48:NjgxNDdjOTctNDYxYi00MzEwLWJlOWItNGM3MDcyMzdhYjUz"
```

Blob cần được ký là thử thách được tạo từ các phần này: `www.example.com` sử dụng cổng 8080, nonce là `1123123123`, thuật toán ký là RSA-SHA256, định danh khóa là `123`, và cuối cùng thử thách là `68147c97-461b-4310-be9b-4c707237ab53`.

Máy khách sẽ nhận tiêu đề này, trích xuất thử thách, ký nó bằng khóa riêng tư tương ứng với định danh khóa 123 trong ví dụ của chúng tôi bằng RSA-SHA256, và sau đó gửi kết quả trong tiêu đề `Authorization` dưới dạng id khóa, thử thách, nonce và chữ ký phân cách bằng dấu chấm.

```http
Authorization: 123.16:MTEyMzEyMzEyMw==1:028:https://www.example.com:8080:3:MTI48:NjgxNDdjOTctNDYxYi00MzEwLWJlOWItNGM3MDcyMzdhYjUz.1123123123.<signature-of-challenge>
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Xác thực HTTP](/en-US/docs/Web/HTTP/Guides/Authentication)
- {{HTTPHeader("Authorization")}}
- {{HTTPHeader("Proxy-Authorization")}}
- {{HTTPHeader("Proxy-Authenticate")}}
- {{HTTPStatus("401")}}, {{HTTPStatus("403")}}, {{HTTPStatus("407")}}
