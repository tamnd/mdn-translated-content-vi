---
title: URI authority
short-title: Authority
slug: Web/URI/Reference/Authority
page-type: uri-component
spec-urls: https://www.rfc-editor.org/rfc/rfc3986.html#section-3.2
sidebar: urlsidebar
---

**authority** của một URI là phần nằm sau [scheme](/en-US/docs/Web/URI/Reference/Schemes) và trước path. Nó có thể gồm tối đa ba phần: thông tin người dùng, host và cổng.

## Cú pháp

```url
host
host:port
user@host
user@host:port
```

- `host`
  - : _Host_ thường là tên miền hoặc địa chỉ IP của máy chủ lưu trữ tài nguyên. Tên miền được phân giải thành địa chỉ IP bằng {{glossary("DNS", "Domain Name System")}}.
- `port` {{optional_inline}}
  - : _Port_ là một số cho biết cổng mà máy chủ đang lắng nghe yêu cầu. Nó là tùy chọn và mặc định là 80 cho HTTP và 443 cho HTTPS. Các scheme khác có thể tự định nghĩa giá trị mặc định hoặc bắt buộc phải có.
- `user` {{optional_inline}}
  - : _User_ là tùy chọn và được dùng cho mục đích xác thực. Nó không thường được dùng trong URI trên web.

    > [!WARNING]
    > Không nên cung cấp trực tiếp thông tin người dùng trong URL HTTP, vì điều đó có thể làm lộ thông tin nhạy cảm. Hãy dùng các phương thức khác như xác thực HTTP hoặc cookie phiên thay thế. Đôi khi, các trang lừa đảo đánh lừa người dùng bằng cách hiển thị những URL gây hiểu nhầm, trong đó phần "user" trông như thể là tên miền, được gọi là [semantic URL attack](https://en.wikipedia.org/wiki/Semantic_URL_attack).

## Mô tả

Hãy xem URL sau:

```url
http://www.example.com:80/path/to/myfile.html?key1=value1&key2=value2#SomewhereInTheDocument
```

Authority trong trường hợp này là `www.example.com:80`, bao gồm tên host (cụ thể là một tên miền) và một cổng.

![Domain Name](mdn-url-domain@x2.png)

`www.example.com` là _host name_ của URI, cho biết máy chủ web nào đang được yêu cầu. Ở đây ta dùng tên miền, nhưng cũng có thể dùng {{Glossary("IP address")}} của host.
Vì địa chỉ IP kém tiện hơn và khó nhớ hơn, nên thường dùng tên miền trừ khi máy chủ không có tên miền đã đăng ký.

![Port](mdn-url-port@x2.png)

`:80` là _port_ của URL, cho biết "cổng" kỹ thuật dùng để truy cập tài nguyên trên máy chủ web. Nó thường được bỏ qua nếu máy chủ web dùng các cổng chuẩn của giao thức HTTP (80 cho HTTP và 443 cho HTTPS) để cấp quyền truy cập tài nguyên. Nếu không, nó là bắt buộc.

## Ví dụ

- `https://developer.mozilla.org`
  - : Host là `developer.mozilla.org`. Port không được chỉ định nhưng sẽ mặc định là 443 nếu truy cập qua `https:`.
- `http://localhost:8080`
  - : Host là `localhost` và port là `8080`. `localhost` là một tên host đặc biệt mà trình duyệt phân giải thành địa chỉ cục bộ `127.0.0.1`.
- `postgresql://postgres:admin123@db:5432`
  - : Host là `db`, và port là `5432`. Nó cũng chỉ định user `postgres` và mật khẩu của nó là `admin123`. Điều này có thể được dùng để kết nối với cơ sở dữ liệu PostgreSQL.
- `https://cnn.example.com&story=breaking_news@10.0.0.1`
  - : Một URL gây hiểu nhầm trông như đang trỏ tới một trang web đáng tin cậy. Tuy nhiên, tên host là `10.0.0.1`, và phần `cnn.example.com&story=breaking_news` là "user".

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [URIs](/en-US/docs/Web/URI)
- [Chọn giữa URL www và không có www](/en-US/docs/Web/URI/Guides/Choosing_between_www_and_non-www_URLs)
