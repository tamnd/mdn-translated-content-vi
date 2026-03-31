---
title: X-Forwarded-Proto header
short-title: X-Forwarded-Proto
slug: Web/HTTP/Reference/Headers/X-Forwarded-Proto
page-type: http-header
status:
  - non-standard
sidebar: http
---

Tiêu đề HTTP **`X-Forwarded-Proto`** (XFP) {{Glossary("request header")}} là tiêu đề de-facto chuẩn để xác định giao thức (HTTP hoặc HTTPS) mà máy khách đã sử dụng để kết nối đến {{Glossary("Proxy_server", "proxy")}} hoặc load balancer.

Nhật ký truy cập máy chủ chứa giao thức được sử dụng giữa máy chủ và load balancer, nhưng không phải giao thức được sử dụng giữa máy khách và load balancer.
Để xác định giao thức được sử dụng giữa máy khách và load balancer, tiêu đề yêu cầu `X-Forwarded-Proto` có thể được sử dụng.

Phiên bản chuẩn hóa của tiêu đề này là tiêu đề HTTP {{HTTPHeader("Forwarded")}}, mặc dù nó ít được sử dụng hơn nhiều.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
X-Forwarded-Proto: <protocol>
```

## Chỉ thị

- `<protocol>`
  - : Giao thức được chuyển tiếp (`http` hoặc `https`).

## Ví dụ

### Giao thức máy khách X-Forwarded-Proto

Tiêu đề sau cho biết rằng yêu cầu ban đầu được thực hiện qua HTTPS trước khi được chuyển tiếp bởi proxy hoặc load balancer:

```http
X-Forwarded-Proto: https
```

### Các dạng không chuẩn

Các dạng sau có thể được thấy trong tiêu đề yêu cầu:

```http
# Microsoft
Front-End-Https: on

X-Forwarded-Protocol: https
X-Forwarded-Ssl: on
X-Url-Scheme: https
```

## Đặc tả

Không phải là một phần của bất kỳ đặc tả hiện tại nào. Phiên bản chuẩn hóa của tiêu đề này là {{HTTPHeader("Forwarded")}}.

## Xem thêm

- Tiêu đề {{HTTPHeader("X-Forwarded-Host")}}, {{HTTPHeader("X-Forwarded-For")}}
- {{HTTPHeader("Forwarded")}}
