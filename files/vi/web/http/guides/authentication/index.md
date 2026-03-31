---
title: Xác thực HTTP
slug: Web/HTTP/Guides/Authentication
page-type: guide
sidebar: http
---

HTTP cung cấp một khung chung để kiểm soát truy cập và xác thực.
Trang này là giới thiệu về khung xác thực HTTP và cho thấy cách hạn chế quyền truy cập vào máy chủ của bạn bằng cách sử dụng phương thức "Basic" của HTTP.

## Khung xác thực HTTP chung

{{RFC("7235")}} định nghĩa khung xác thực HTTP, có thể được máy chủ sử dụng để {{glossary("challenge", "thách thức")}} yêu cầu của client, và bởi client để cung cấp thông tin xác thực.

Luồng thách thức và phản hồi hoạt động như sau:

1. Máy chủ phản hồi client với mã trạng thái {{HTTPStatus("401")}} (Unauthorized) và cung cấp thông tin về cách ủy quyền với tiêu đề phản hồi {{HTTPHeader("WWW-Authenticate")}} chứa ít nhất một thách thức.
2. Client muốn xác thực với máy chủ có thể làm như vậy bằng cách bao gồm tiêu đề yêu cầu {{HTTPHeader("Authorization")}} với thông tin xác thực.
3. Thường một client sẽ trình bày cửa sổ nhập mật khẩu cho người dùng và sau đó sẽ gửi yêu cầu bao gồm tiêu đề `Authorization` chính xác.

![Sơ đồ tuần tự minh họa các thông điệp HTTP giữa đường thời gian client và máy chủ.](https://mdn.github.io/shared-assets/images/diagrams/http/authentication/basic-auth.svg)

Luồng thông điệp chung ở trên giống nhau cho hầu hết (nếu không phải tất cả) [các phương thức xác thực](#authentication_schemes).
Thông tin thực tế trong các tiêu đề và cách mã hóa nó thay đổi!

> [!WARNING]
> Phương thức xác thực "Basic" được sử dụng trong sơ đồ trên gửi thông tin xác thực được mã hóa nhưng không được mã hóa bảo mật.
> Điều này sẽ hoàn toàn không an toàn trừ khi trao đổi được thực hiện qua kết nối an toàn (HTTPS/TLS).

### Xác thực proxy

Cơ chế thách thức và phản hồi tương tự có thể được sử dụng cho _xác thực proxy_.
Vì cả xác thực tài nguyên và xác thực proxy đều có thể cùng tồn tại, cần một tập hợp tiêu đề và mã trạng thái khác. Trong trường hợp proxy, mã trạng thái thách thức là {{HTTPStatus("407")}} (Proxy Authentication Required), tiêu đề phản hồi {{HTTPHeader("Proxy-Authenticate")}} chứa ít nhất một thách thức áp dụng cho proxy, và tiêu đề yêu cầu {{HTTPHeader("Proxy-Authorization")}} được sử dụng để cung cấp thông tin xác thực cho máy chủ proxy.

### Truy cập bị cấm

Nếu máy chủ (proxy) nhận được _thông tin xác thực không hợp lệ_, nó sẽ phản hồi với {{HTTPStatus("401")}} `Unauthorized` hoặc {{HTTPStatus("407")}} `Proxy Authentication Required`, và người dùng có thể gửi yêu cầu mới hoặc thay thế trường tiêu đề {{HTTPHeader("Authorization")}}.

Nếu máy chủ (proxy) nhận được thông tin xác thực hợp lệ _không đủ_ để truy cập một tài nguyên nhất định, máy chủ sẽ phản hồi với mã trạng thái {{HTTPStatus("403")}} `Forbidden`. Không giống như {{HTTPStatus("401")}} `Unauthorized` hoặc {{HTTPStatus("407")}} `Proxy Authentication Required`, xác thực không thể thực hiện được cho người dùng này và trình duyệt sẽ không đề xuất thử lại.

Trong tất cả các trường hợp, máy chủ có thể muốn trả về mã trạng thái {{HTTPStatus("404")}} `Not Found`, để ẩn sự tồn tại của trang từ người dùng không có đủ đặc quyền hoặc chưa xác thực đúng cách.

### Xác thực hình ảnh từ nguồn gốc chéo

Một lỗ hổng bảo mật tiềm ẩn (đã được vá trong các trình duyệt) là xác thực hình ảnh từ nhiều trang web.
Kể từ [Firefox 59](/en-US/docs/Mozilla/Firefox/Releases/59) trở đi, các tài nguyên hình ảnh được tải từ các nguồn gốc khác với tài liệu hiện tại không còn có thể kích hoạt hộp thoại xác thực HTTP ([Firefox bug 1423146](https://bugzil.la/1423146)), ngăn chặn thông tin xác thực của người dùng bị đánh cắp nếu kẻ tấn công có thể nhúng hình ảnh tùy ý vào trang của bên thứ ba.

### Mã hóa ký tự của xác thực HTTP

Trình duyệt sử dụng mã hóa `utf-8` cho tên người dùng và mật khẩu.

Firefox từng sử dụng `ISO-8859-1`, nhưng đã thay đổi sang `utf-8` để tương đồng với các trình duyệt khác và để tránh các vấn đề tiềm ẩn được mô tả trong [Firefox bug 1419658](https://bugzil.la/1419658).

### Tiêu đề WWW-Authenticate và Proxy-Authenticate

Các tiêu đề phản hồi {{HTTPHeader("WWW-Authenticate")}} và {{HTTPHeader("Proxy-Authenticate")}} định nghĩa phương thức xác thực cần sử dụng để có quyền truy cập vào tài nguyên. Chúng phải chỉ định phương thức xác thực nào được sử dụng, để client muốn ủy quyền biết cách cung cấp thông tin xác thực.

Cú pháp cho các tiêu đề này như sau:

```http
WWW-Authenticate: <type> realm=<realm>
Proxy-Authenticate: <type> realm=<realm>
```

Ở đây, `<type>` là phương thức xác thực ("Basic" là phương thức phổ biến nhất và [được giới thiệu bên dưới](#basic_authentication_scheme)). _realm_ được sử dụng để mô tả vùng được bảo vệ hoặc để chỉ ra phạm vi bảo vệ. Đây có thể là một thông điệp như "Truy cập vào trang staging" hoặc tương tự, để người dùng biết họ đang cố truy cập vào không gian nào.

### Tiêu đề Authorization và Proxy-Authorization

Các tiêu đề yêu cầu {{HTTPHeader("Authorization")}} và {{HTTPHeader("Proxy-Authorization")}} chứa thông tin xác thực để xác thực user agent với máy chủ (proxy). Ở đây, `<type>` là cần thiết một lần nữa theo sau là thông tin xác thực, có thể được mã hóa hoặc được mã hóa bảo mật tùy thuộc vào phương thức xác thực nào được sử dụng.

```http
Authorization: <type> <credentials>
Proxy-Authorization: <type> <credentials>
```

## Các phương thức xác thực

Khung xác thực HTTP chung là cơ sở cho một số phương thức xác thực.

IANA duy trì [danh sách các phương thức xác thực](https://www.iana.org/assignments/http-authschemes/http-authschemes.xhtml), nhưng có các phương thức khác được cung cấp bởi các dịch vụ máy chủ, như Amazon AWS.

Một số phương thức xác thực phổ biến bao gồm:

- **Basic**
  - : Xem {{rfc(7617)}}, thông tin xác thực được mã hóa base64. Thêm thông tin bên dưới.
- **Bearer**
  - : Xem {{rfc(6750)}}, mã thông báo bearer để truy cập các tài nguyên được bảo vệ OAuth 2.0
- **Digest**
  - : Xem {{rfc(7616)}}. Firefox 93 trở lên hỗ trợ thuật toán SHA-256. Các phiên bản trước chỉ hỗ trợ băm MD5 (không được khuyến nghị).
- **HOBA**
  - : Xem {{rfc(7486)}}, Mục 3, **H**TTP **O**rigin-**B**ound **A**uthentication, dựa trên chữ ký số
- **Mutual**
  - : Xem {{rfc(8120)}}
- **Negotiate** / **NTLM**
  - : Xem [RFC4599](https://datatracker.ietf.org/doc/html/rfc4559)
- **VAPID**
  - : Xem {{rfc(8292)}}
- **SCRAM**
  - : Xem {{rfc(7804)}}
- **AWS4-HMAC-SHA256**
  - : Xem [tài liệu AWS](https://docs.aws.amazon.com/AmazonS3/latest/API/sigv4-auth-using-authorization-header.html). Phương thức này được sử dụng cho xác thực máy chủ AWS3.

Các phương thức có thể khác nhau về độ mạnh bảo mật và tính khả dụng trong phần mềm client hoặc máy chủ.

Phương thức xác thực "Basic" cung cấp bảo mật rất kém, nhưng được hỗ trợ rộng rãi và dễ thiết lập.
Nó được giới thiệu chi tiết hơn bên dưới.

## Phương thức xác thực Basic

Phương thức xác thực HTTP "Basic" được định nghĩa trong {{rfc(7617)}}, truyền thông tin xác thực dưới dạng cặp ID người dùng/mật khẩu, được mã hóa bằng base64.

### Bảo mật của xác thực cơ bản

Vì ID người dùng và mật khẩu được truyền qua mạng dưới dạng văn bản thuần (nó được mã hóa base64, nhưng base64 là mã hóa có thể đảo ngược), phương thức xác thực cơ bản không an toàn.
Nên sử dụng HTTPS/TLS với xác thực cơ bản để ngăn chặn chặn bắt thông tin xác thực.

Ngoài ra, các trang web sử dụng HTTP Basic Auth đặc biệt dễ bị tấn công [Cross-Site Request Forgery (CSRF)](/en-US/docs/Glossary/CSRF) vì thông tin xác thực người dùng được gửi trong tất cả các yêu cầu bất kể nguồn gốc (điều này khác với các cơ chế thông tin xác thực dựa trên cookie, vì cookie thường bị chặn trong các yêu cầu cross-site).
Các trang web nên luôn sử dụng các yêu cầu POST khi thay đổi dữ liệu, và bao gồm [mã thông báo CSRF](/en-US/docs/Web/Security/Attacks/CSRF).

Không có các cải tiến bảo mật này, xác thực cơ bản không nên được sử dụng để bảo vệ thông tin nhạy cảm hoặc có giá trị.

### Hạn chế quyền truy cập bằng Apache và xác thực cơ bản

Để bảo vệ bằng mật khẩu một thư mục trên máy chủ Apache, bạn sẽ cần một tệp `.htaccess` và một tệp `.htpasswd`.

Tệp `.htaccess` thường trông như sau:

```apacheconf
AuthType Basic
AuthName "Access to the staging site"
AuthUserFile /path/to/.htpasswd
Require valid-user
```

Tệp `.htaccess` tham chiếu một tệp `.htpasswd` trong đó mỗi dòng bao gồm tên người dùng và mật khẩu được phân tách bằng dấu hai chấm (`:`). Bạn không thể thấy mật khẩu thực vì chúng được [băm](https://httpd.apache.org/docs/2.4/misc/password_encryptions.html) (sử dụng băm dựa trên MD5, trong trường hợp này). Lưu ý rằng bạn có thể đặt tên tệp `.htpasswd` khác nếu muốn, nhưng hãy nhớ rằng tệp này không nên có thể truy cập được bởi bất kỳ ai. (Apache thường được cấu hình để ngăn chặn quyền truy cập vào các tệp `.ht*`).

```apacheconf
aladdin:$apr1$ZjTqBB3f$IF9gdYAGlMrs2fuINjHsz.
user2:$apr1$O04r.y2H$/vEkesPhVInBByJUkXitA/
```

### Hạn chế quyền truy cập bằng Nginx và xác thực cơ bản

Đối với Nginx, bạn cần chỉ định một vị trí mà bạn sẽ bảo vệ và chỉ thị `auth_basic` cung cấp tên cho vùng được bảo vệ bằng mật khẩu.
Chỉ thị `auth_basic_user_file` sau đó trỏ đến tệp `.htpasswd` chứa thông tin xác thực người dùng được mã hóa, giống như trong ví dụ Apache ở trên.

```apacheconf
location /status {
    auth_basic           "Access to the staging site";
    auth_basic_user_file /etc/apache2/.htpasswd;
}
```

### Truy cập bằng thông tin xác thực trong URL

Trong lịch sử, một số trang web cho phép bạn đăng nhập bằng cách sử dụng URL được mã hóa chứa tên người dùng và mật khẩu như được hiển thị:

```plain example-bad
https://username:password@www.example.com/
```

Cú pháp này không còn được phép trong các trình duyệt hiện đại; tên người dùng và mật khẩu bị loại bỏ khỏi yêu cầu trước khi nó được gửi.

## Xem thêm

- {{HTTPHeader("WWW-Authenticate")}}
- {{HTTPHeader("Authorization")}}
- {{HTTPHeader("Proxy-Authorization")}}
- {{HTTPHeader("Proxy-Authenticate")}}
- {{HTTPStatus("401")}}, {{HTTPStatus("403")}}, {{HTTPStatus("407")}}
- [Các thực tiễn tốt nhất về bảo mật HTTP](/en-US/docs/Web/Security)
