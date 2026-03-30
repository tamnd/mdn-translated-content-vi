---
title: Request header
slug: Glossary/Request_header
page-type: glossary-definition
sidebar: glossarysidebar
---

**Request header** (tiêu đề yêu cầu) là một {{glossary("HTTP header")}} có thể được sử dụng trong một yêu cầu HTTP để cung cấp thông tin về ngữ cảnh yêu cầu, để máy chủ có thể điều chỉnh phản hồi phù hợp. Ví dụ, các tiêu đề {{HTTPHeader("Accept", "Accept-*")}} chỉ ra các định dạng được phép và được ưu tiên của phản hồi. Các tiêu đề khác có thể được sử dụng để cung cấp thông tin xác thực (ví dụ, {{HTTPHeader("Authorization")}}), để kiểm soát bộ nhớ đệm, hoặc để lấy thông tin về user agent hoặc referrer, v.v.

Không phải tất cả các tiêu đề có thể xuất hiện trong một yêu cầu đều được đặc tả gọi là _request header_. Ví dụ, tiêu đề {{HTTPHeader("Content-Type")}} được gọi là {{glossary("representation header")}}.

Ngoài ra, {{Glossary("CORS")}} định nghĩa một tập con các request header là {{glossary('CORS-safelisted request header', 'simple headers')}}, các request header luôn được coi là được ủy quyền và không được liệt kê rõ ràng trong các phản hồi cho các yêu cầu {{glossary("preflight request", "preflight")}}.

Tin nhắn HTTP dưới đây hiển thị một số request header sau một yêu cầu {{HTTPMethod("GET")}}:

```http
GET /home.html HTTP/1.1
Host: developer.mozilla.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:50.0) Gecko/20100101 Firefox/50.0
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Language: en-US,en;q=0.5
Accept-Encoding: gzip, deflate, br
Referer: https://developer.mozilla.org/testpage.html
Connection: keep-alive
Upgrade-Insecure-Requests: 1
If-Modified-Since: Mon, 18 Jul 2016 02:36:04 GMT
If-None-Match: "c561c68d0ba92bbeb8b0fff2a9199f722e3a621a"
Cache-Control: max-age=0
```

## Xem thêm

- [Danh sách tất cả các tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers)
- [RFC 9110, mục 6.3: Header Fields](https://httpwg.org/specs/rfc9110.html#header.fields)
