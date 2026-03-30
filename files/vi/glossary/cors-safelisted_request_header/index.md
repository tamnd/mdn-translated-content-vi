---
title: CORS-safelisted request header
slug: Glossary/CORS-safelisted_request_header
page-type: glossary-definition
sidebar: glossarysidebar
---

[**CORS-safelisted request header**](https://fetch.spec.whatwg.org/#cors-safelisted-request-header) (còn được gọi là "header đơn giản") là một trong các [HTTP header](/en-US/docs/Web/HTTP/Reference/Headers) sau:

- {{HTTPHeader("Accept")}}
- {{HTTPHeader("Accept-Language")}}
- {{HTTPHeader("Content-Language")}}
- {{HTTPHeader("Content-Type")}}
- {{HTTPHeader("Range")}}

Khi chỉ chứa các header này (và các giá trị đáp ứng các yêu cầu bổ sung được nêu dưới đây), một yêu cầu không cần gửi {{glossary("preflight request", "yêu cầu preflight")}} trong ngữ cảnh {{Glossary("CORS")}}.

Bạn có thể đưa thêm các header vào danh sách cho phép bằng cách sử dụng header {{HTTPHeader("Access-Control-Allow-Headers")}} và cũng liệt kê các header trên đó để bỏ qua các hạn chế bổ sung sau đây.

## Hạn chế bổ sung

Các header được CORS cho phép cũng phải đáp ứng các yêu cầu sau để được coi là header yêu cầu được CORS cho phép:

- {{HTTPHeader("Accept-Language")}} và {{HTTPHeader("Content-Language")}} chỉ có thể có các giá trị bao gồm `0-9`, `A-Z`, `a-z`, dấu cách hoặc `*,-.;=`.
- {{HTTPHeader("Accept")}} và {{HTTPHeader("Content-Type")}} không được chứa _byte header yêu cầu không an toàn CORS_: `0x00-0x1F` (ngoại trừ `0x09 (HT)`, được cho phép), `"():<>?@[\]{}`, và `0x7F (DEL)`.
- {{HTTPHeader("Content-Type")}} cần có kiểu MIME của giá trị đã phân tích cú pháp (bỏ qua các tham số) là `application/x-www-form-urlencoded`, `multipart/form-data`, hoặc `text/plain`.
- {{HTTPHeader("Range")}} cần có giá trị là phạm vi byte đơn theo dạng `bytes=[0-9]+-[0-9]*`.
- Đối với bất kỳ header nào: độ dài giá trị không được lớn hơn 128.

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("CORS-safelisted response header")}}
  - {{Glossary("Forbidden request header")}}
  - {{Glossary("Request header")}}
