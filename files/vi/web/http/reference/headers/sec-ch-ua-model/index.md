---
title: Sec-CH-UA-Model header
short-title: Sec-CH-UA-Model
slug: Web/HTTP/Reference/Headers/Sec-CH-UA-Model
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-UA-Model
sidebar: http
---

{{SeeCompatTable}}{{SecureContext_Header}}

Tiêu đề HTTP **`Sec-CH-UA-Model`** {{Glossary("request header")}} là một [gợi ý máy khách tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) cho biết mẫu thiết bị mà trình duyệt đang chạy trên đó.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}},
        <a href="/en-US/docs/Web/HTTP/Guides/Client_hints">Client hint</a>
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có (tiền tố <code>Sec-</code>)</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Sec-CH-UA-Model: <device-version>
```

### Chỉ thị

- `<device-version>`
  - : Chuỗi chứa phiên bản thiết bị. Ví dụ: "Pixel 3".

## Ví dụ

### Sử dụng Sec-CH-UA-Model

Máy chủ yêu cầu tiêu đề `Sec-CH-UA-Model` bằng cách bao gồm {{HTTPHeader("Accept-CH")}} trong _phản hồi_ cho bất kỳ yêu cầu nào từ máy khách, sử dụng tên của tiêu đề mong muốn làm token:

```http
HTTP/1.1 200 OK
Accept-CH: Sec-CH-UA-Model
```

Máy khách có thể chọn cung cấp gợi ý, và thêm tiêu đề `Sec-CH-UA-Model` vào các yêu cầu tiếp theo.
Ví dụ: trên điện thoại di động, máy khách có thể thêm tiêu đề như sau:

```http
GET /my/page HTTP/1.1
Host: example.site

Sec-CH-UA: " Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"
Sec-CH-UA-Mobile: ?1
Sec-CH-UA-Platform: "Android"
Sec-CH-UA-Bitness: "64"
Sec-CH-UA-Model: "Pixel 3 XL"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Client hints](/en-US/docs/Web/HTTP/Guides/Client_hints)
- [User-Agent Client Hints API](/en-US/docs/Web/API/User-Agent_Client_Hints_API)
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và tiêu đề {{HTTPHeader("Vary")}}
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
