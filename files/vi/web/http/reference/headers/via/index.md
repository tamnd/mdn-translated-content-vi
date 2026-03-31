---
title: Via header
short-title: Via
slug: Web/HTTP/Reference/Headers/Via
page-type: http-header
browser-compat: http.headers.Via
sidebar: http
---

Tiêu đề **`Via`** {{glossary("request header", "request")}} và {{glossary("response header")}} được thêm bởi {{Glossary("Proxy_server", "proxies")}}, cả proxy chuyển tiếp và ngược.
Nó được sử dụng để theo dõi việc chuyển tiếp thông điệp, tránh các vòng lặp yêu cầu, và xác định khả năng giao thức của người gửi dọc theo chuỗi yêu cầu/phản hồi.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}},
        {{Glossary("Response header")}}
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Via: [<protocol-name>/]<protocol-version> <host>[:<port>]
Via: [<protocol-name>/]<protocol-version> <pseudonym>
```

## Chỉ thị

- `<protocol-name>` {{optional_inline}}
  - : Tên giao thức được sử dụng, chẳng hạn như "HTTP".
- `<protocol-version>`
  - : Phiên bản giao thức được sử dụng, chẳng hạn như "1.1".
- `<host>`
  - : URL proxy công khai và `<port>` tùy chọn.
    Nếu không có máy chủ nào được cung cấp, thì `<pseudonym>` phải được sử dụng.
- `<pseudonym>`
  - : Tên/bí danh của proxy nội bộ.
    Nếu không có pseudonym nào được cung cấp, thì `<host>` phải được sử dụng.

## Ví dụ

```http
Via: 1.1 vegur
Via: HTTP/1.1 GWA
Via: 1.0 fred, 1.1 p.example.net
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("X-Forwarded-For")}}
- [Thư viện proxy Vegur của Heroku](https://github.com/heroku/vegur)
