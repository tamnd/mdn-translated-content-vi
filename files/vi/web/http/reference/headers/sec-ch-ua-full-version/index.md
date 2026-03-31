---
title: Sec-CH-UA-Full-Version header
short-title: Sec-CH-UA-Full-Version
slug: Web/HTTP/Reference/Headers/Sec-CH-UA-Full-Version
page-type: http-header
status:
  - deprecated
browser-compat: http.headers.Sec-CH-UA-Full-Version
sidebar: http
---

{{Deprecated_Header}}{{SecureContext_Header}}

> [!NOTE]
> Tiêu đề này đang được thay thế bởi {{HTTPHeader("Sec-CH-UA-Full-Version-List")}}.

Tiêu đề HTTP **`Sec-CH-UA-Full-Version`** {{Glossary("request header")}} là một [gợi ý máy khách tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) cung cấp chuỗi phiên bản đầy đủ của tác nhân người dùng.

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
Sec-CH-UA-Full-Version: <version>
```

### Chỉ thị

- `<version>`
  - : Chuỗi chứa số phiên bản đầy đủ, ví dụ: "96.0.4664.93".

## Ví dụ

### Sử dụng Sec-CH-UA-Full-Version

Máy chủ yêu cầu tiêu đề `Sec-CH-UA-Full-Version` bằng cách bao gồm {{HTTPHeader("Accept-CH")}} trong _phản hồi_ cho bất kỳ yêu cầu nào từ máy khách, sử dụng tên của tiêu đề mong muốn làm token:

```http
HTTP/1.1 200 OK
Accept-CH: Sec-CH-UA-Full-Version
```

Máy khách có thể chọn cung cấp gợi ý, và thêm tiêu đề `Sec-CH-UA-Full-Version` vào các yêu cầu tiếp theo.
Ví dụ: máy khách có thể thêm tiêu đề như sau:

```http
GET /my/page HTTP/1.1
Host: example.site

Sec-CH-UA: " Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"
Sec-CH-UA-Mobile: ?0
Sec-CH-UA-Full-Version: "96.0.4664.110"
Sec-CH-UA-Platform: "Windows"
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
