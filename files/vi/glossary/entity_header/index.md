---
title: Entity header
slug: Glossary/Entity_header
page-type: glossary-definition
sidebar: glossarysidebar
---

> [!WARNING]
> Đặc tả HTTP/1.1 hiện tại không còn đề cập đến các thực thể, entity header hoặc entity-body. Một số trường hiện nay được gọi là các trường {{glossary("Representation header")}}.

Entity header là một {{glossary("HTTP_header","HTTP header")}} mô tả {{Glossary("HTTP content","nội dung")}} của một thông điệp HTTP (tức là metadata về phần thân thông điệp). Entity header bao gồm: {{HTTPHeader("Content-Length")}}, {{HTTPHeader("Content-Language")}}, {{HTTPHeader("Content-Encoding")}}, {{HTTPHeader("Content-Type")}}, {{HTTPHeader("Expires")}}, v.v. Entity header có thể có mặt trong cả thông điệp yêu cầu và phản hồi HTTP.

Trong ví dụ sau, {{HTTPHeader("Content-Length")}} là entity header, trong khi {{HTTPHeader("Host")}} và {{HTTPHeader("User-Agent")}} là request header:

```http
POST /my-form.html HTTP/1.1
Host: developer.mozilla.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9; rv:50.0) Gecko/20100101 Firefox/50.0
Content-Length: 128
```

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("Representation header")}}
