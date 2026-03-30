---
title: Header yêu cầu bị cấm
slug: Glossary/Forbidden_request_header
page-type: glossary-definition
sidebar: glossarysidebar
---

**Tiêu đề yêu cầu bị cấm** là cặp tên-giá trị [tiêu đề HTTP](/en-US/docs/Web/HTTP/Reference/Headers) không thể được đặt hoặc sửa đổi bằng lập trình trong một yêu cầu. Để biết các tiêu đề bị cấm sửa đổi trong phản hồi, xem {{Glossary("forbidden response header name")}}.

Việc sửa đổi các tiêu đề như vậy bị cấm vì tác nhân người dùng nắm toàn quyền kiểm soát chúng.
Ví dụ, tiêu đề {{HTTPHeader("Date")}} là một tiêu đề yêu cầu bị cấm, vì vậy đoạn code này không thể đặt trường `Date` của thông báo:

```js example-bad
fetch("https://httpbin.org/get", {
  headers: {
    Date: new Date().toUTCString(),
  },
});
```

Các tên bắt đầu bằng `Sec-` được dành riêng để tạo các tiêu đề mới an toàn từ {{glossary("API","APIs")}} cấp cho nhà phát triển quyền kiểm soát tiêu đề, chẳng hạn như {{domxref("Window/fetch", "fetch()")}}.
Các tiêu đề bị cấm là một trong những tiêu đề sau:

- `Accept-Charset`
- {{HTTPHeader("Accept-Encoding")}}
- {{HTTPHeader("Access-Control-Request-Headers")}}
- {{HTTPHeader("Access-Control-Request-Method")}}
- {{HTTPHeader("Connection")}}
- {{HTTPHeader("Content-Length")}}
- {{HTTPHeader("Cookie")}}
- {{HTTPHeader("Date")}}
- {{HTTPHeader("DNT")}}
- {{HTTPHeader("Expect")}}
- {{HTTPHeader("Host")}}
- {{HTTPHeader("Keep-Alive")}}
- {{HTTPHeader("Origin")}}
- Các tiêu đề `Proxy-`
- Các tiêu đề `Sec-`
- {{HTTPHeader("Referer")}}
- {{HTTPHeader("Set-Cookie")}}
- {{HTTPHeader("TE")}}
- {{HTTPHeader("Trailer")}}
- {{HTTPHeader("Transfer-Encoding")}}
- {{HTTPHeader("Upgrade")}}
- {{HTTPHeader("Via")}}
- `X-HTTP-Method`, nhưng chỉ khi nó chứa tên phương thức bị cấm ({{HTTPMethod("CONNECT")}}, {{HTTPMethod("TRACE")}}, {{HTTPMethod("TRACK")}})
- `X-HTTP-Method-Override`, nhưng chỉ khi nó chứa tên phương thức bị cấm
- `X-Method-Override`, nhưng chỉ khi nó chứa tên phương thức bị cấm

> [!NOTE]
> Tiêu đề {{HTTPHeader("User-Agent")}} trước đây bị cấm, nhưng không còn nữa. Tuy nhiên, Chrome vẫn âm thầm bỏ tiêu đề này khỏi các yêu cầu Fetch (xem [Chromium bug 571722](https://crbug.com/571722)).

> [!NOTE]
> Mặc dù tiêu đề {{HTTPHeader("Referer")}} được liệt kê là tiêu đề bị cấm [trong đặc tả](https://fetch.spec.whatwg.org/#forbidden-request-header), tác nhân người dùng không nắm toàn quyền kiểm soát nó và tiêu đề có thể được sửa đổi bằng lập trình. Ví dụ, khi sử dụng [`fetch()`](/en-US/docs/Web/API/Window/fetch), tiêu đề {{HTTPHeader("Referer")}} có thể được sửa đổi bằng lập trình thông qua [tùy chọn `referrer`](/en-US/docs/Web/API/RequestInit#referrer).

> [!NOTE]
> Chrome cũng cấm `Access-Control-Request-Private-Network`

## Xem thêm

- Các thuật ngữ liên quan:
  - {{Glossary("Forbidden response header name")}}
