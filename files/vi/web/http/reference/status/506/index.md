---
title: 506 Variant Also Negotiates
slug: Web/HTTP/Reference/Status/506
page-type: http-status-code
spec-urls: https://www.rfc-editor.org/rfc/rfc2295#section-8.1
sidebar: http
---

Mã trạng thái HTTP **`506 Variant Also Negotiates`** [phản hồi lỗi phía máy chủ](/en-US/docs/Web/HTTP/Reference/Status#server_error_responses) được trả về trong quá trình thương lượng nội dung khi có vòng lặp đệ quy trong quá trình chọn tài nguyên.

[Thương lượng nội dung do agent điều khiển](/en-US/docs/Web/HTTP/Guides/Content_negotiation#agent-driven_negotiation) cho phép client và máy chủ cộng tác quyết định biến thể tốt nhất của tài nguyên khi máy chủ có nhiều biến thể.
Máy chủ gửi mã trạng thái `506` do cấu hình máy chủ sai tạo ra các tham chiếu vòng tròn khi tạo phản hồi.

Sự thiếu chuẩn hóa về cách client tự động chọn từ các phản hồi, và các vòng kết nối bổ sung làm chậm tương tác client-server đồng nghĩa cơ chế này hiếm khi được sử dụng.
[Thương lượng nội dung do máy chủ điều khiển](/en-US/docs/Web/HTTP/Guides/Content_negotiation#server-driven_content_negotiation) phổ biến hơn nhiều, nơi máy chủ trực tiếp chọn tài nguyên phù hợp nhất cho client dựa trên tiêu đề yêu cầu ({{HTTPHeader("Accept-Language")}}, {{HTTPHeader("Accept")}}, v.v.).

## Trạng thái

```http
506 Variant Also Negotiates
```

## Ví dụ

### Tài nguyên với các biến thể

Trong ví dụ sau, client yêu cầu trang trong locale `fr` bằng tiêu đề {{HTTPHeader("Accept-Language")}}.
Điều này có thể được thực hiện bằng curl:

```bash
curl  -H "Negotiate: trans" -H "Accept-Language: fr;" http://example.com/index
```

Điều này tạo ra yêu cầu sau:

```http
GET /index HTTP/1.1
Host: example.com
User-Agent: curl/8.7.1
Accept: */*
Negotiate: trans
Accept-Language: fr
```

Do cấu hình máy chủ sai, phản hồi biến thể cho `fr` trỏ đến [type map](https://httpd.apache.org/docs/trunk/mod/mod_negotiation.html#typemaps) tự nó gây ra thương lượng trong suốt được thực hiện.
Máy chủ có thể phát hiện điều kiện này qua sự hiện diện của tiêu đề `TCN` trong phản hồi lựa chọn trước khi nó được gửi:

```http
HTTP/1.1 506 Variant Also Negotiates
Date: Mon, 22 Jul 2024 10:00:00 GMT
Server: Apache/2.4.41 (Unix)
Content-Type: text/html; charset=UTF-8
Content-Length: 233
TCN: list
Vary: negotiate,accept-language
Alternates: {"index.html.en" 1 {type text/html} {language en} {length 48}}, {"another-map.html.fr.map" 1 {type text/html} {language fr} {length 45}}}}

<html>
<head>
  <title>506 Variant Also Negotiates</title>
</head>
<body>
  <h1>Variant Also Negotiates</h1>
  <p>A variant for the requested resource is itself a negotiable resource. This indicates a configuration error.</p>
</body>
</html>
```

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- {{HTTPStatus("300", "300 Multiple Choices")}}
- {{RFC("2295")}}
- [Thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation)
- [Mã trạng thái phản hồi HTTP](/en-US/docs/Web/HTTP/Reference/Status)
- [Content Negotiation](https://httpd.apache.org/docs/2.4/content-negotiation.html) trong tài liệu Apache HTTP Server
- [Apache httpd `mod_negotiation.c` source](https://github.com/apache/httpd/blob/6a2433cb3fbc30c8a55f450a046e4b0f69e73143/modules/mappers/mod_negotiation.c#L2687-L2691) hiển thị các điều kiện kích hoạt phản hồi `HTTP_VARIANT_ALSO_VARIES`.
