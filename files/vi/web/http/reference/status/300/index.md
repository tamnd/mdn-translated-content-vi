---
title: 300 Multiple Choices
slug: Web/HTTP/Reference/Status/300
page-type: http-status-code
spec-urls: https://httpwg.org/specs/rfc9110.html#status.300
sidebar: http
---

Mã trạng thái [phản hồi chuyển hướng](/en-US/docs/Web/HTTP/Reference/Status#redirection_messages) HTTP **`300 Multiple Choices`** cho biết rằng yêu cầu có nhiều phản hồi có thể.
User agent hoặc người dùng nên chọn một trong số đó.

> [!NOTE]
> Trong [thương lượng nội dung do tác nhân điều khiển](/en-US/docs/Web/HTTP/Guides/Content_negotiation#agent-driven_negotiation), client và máy chủ cùng nhau quyết định biến thể tốt nhất của một tài nguyên khi máy chủ có nhiều biến thể.
> Hầu hết các client thiếu phương thức để tự động chọn từ các phản hồi, và các vòng lặp bổ sung làm chậm sự tương tác giữa client và máy chủ.
> [Thương lượng nội dung do máy chủ điều khiển](/en-US/docs/Web/HTTP/Guides/Content_negotiation#server-driven_content_negotiation) phổ biến hơn nhiều, trong đó máy chủ chọn tài nguyên phù hợp nhất cho client dựa trên các tiêu đề yêu cầu ({{HTTPHeader("Accept-Language")}}, {{HTTPHeader("Accept")}}, v.v.).

Máy chủ nên bao gồm nội dung trong phản hồi chứa danh sách metadata tài nguyên và URI mà người dùng hoặc user agent có thể chọn.
Định dạng của nội dung phụ thuộc vào triển khai, nhưng nên dễ dàng phân tích cú pháp bởi user agent (chẳng hạn như HTML hoặc JSON).

Nếu máy chủ có lựa chọn ưu tiên mà client nên yêu cầu, nó có thể đưa vào tiêu đề {{HTTPHeader("Location")}}.

## Trạng thái

```http
300 Multiple Choices
```

## Ví dụ

### Phản hồi 300 với danh sách tài nguyên

Ví dụ sau đây minh họa trao đổi yêu cầu-phản hồi Transparent Content Negotiation.
Máy chủ Apache cung cấp nhiều biến thể của tài nguyên được định nghĩa trong [type map](https://httpd.apache.org/docs/trunk/mod/mod_negotiation.html#typemaps); `index.html.en` cho tài nguyên bằng tiếng Anh, và `index.html.fr` cho phiên bản tiếng Pháp:

```http
URI: index.html.en
Content-Language: en

URI: index.html.fr
Content-Language: fr
```

Tiêu đề yêu cầu `Negotiate: trans` cho biết client muốn sử dụng TCN để chọn tài nguyên.
Do hỗ trợ trình duyệt kém cho cơ chế này, cần sử dụng user agent như curl thay thế:

```bash
 curl -v -H "Negotiate: trans" http://localhost/index
```

Điều này tạo ra yêu cầu sau:

```http
GET /index HTTP/1.1
Host: localhost
User-Agent: curl/8.7.1
Accept: */*
Negotiate: trans
```

Chúng ta nhận được phản hồi `300` với thông tin chi tiết về các biểu diễn khác nhau của tài nguyên được yêu cầu:

```http
HTTP/1.1 300 Multiple Choices
Date: Fri, 30 Aug 2024 09:21:48 GMT
Server: Apache/2.4.59 (Unix)
Alternates: {"index.html.en" 1 {type text/html} {language en} {length 48}}, {"index.html.fr" 1 {type text/html} {language fr} {length 45}}
Vary: negotiate,accept-language
TCN: list
Content-Length: 419
Content-Type: text/html; charset=iso-8859-1

<html><head>
<title>300 Multiple Choices</title>
</head><body>
<h1>Multiple Choices</h1>
Available variants:
<ul>
<li><a href="index.html.en">index.html.en</a> , type text/html, language en</li>
<li><a href="index.html.fr">index.html.fr</a> , type text/html, language fr</li>
</ul>
</body></html>
```

## Đặc tả

{{Specifications}}

## Xem thêm

- [Chuyển hướng trong HTTP](/en-US/docs/Web/HTTP/Guides/Redirections)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- {{HTTPStatus("301", "301 Moved Permanently")}}
- {{HTTPStatus("302", "302 Found")}} chuyển hướng tạm thời
- {{HTTPStatus("308", "308 Permanent Redirect")}}
- {{HTTPStatus("506", "506 Variant Also Negotiates")}}
- [Thuật toán thương lượng Apache Server](https://httpd.apache.org/docs/current/en/content-negotiation.html#algorithm)
- {{RFC("2295", "Transparent Content Negotiation in HTTP")}}
