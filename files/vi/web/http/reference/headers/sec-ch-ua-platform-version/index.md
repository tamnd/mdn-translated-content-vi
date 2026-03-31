---
title: Sec-CH-UA-Platform-Version header
short-title: Sec-CH-UA-Platform-Version
slug: Web/HTTP/Reference/Headers/Sec-CH-UA-Platform-Version
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-UA-Platform-Version
sidebar: http
---

{{SeeCompatTable}}{{SecureContext_Header}}

Tiêu đề HTTP **`Sec-CH-UA-Platform-Version`** {{Glossary("request header")}} là một [gợi ý máy khách tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) cung cấp phiên bản của hệ điều hành mà tác nhân người dùng đang chạy trên đó.

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
Sec-CH-UA-Platform-Version: <version>
```

### Chỉ thị

- `<version>`
  - : Chuỗi phiên bản thường chứa phiên bản hệ điều hành dưới dạng chuỗi, bao gồm các số phiên bản chính, phụ và vá lỗi được phân cách bằng dấu chấm, ví dụ `"11.0.0"`.
    Chuỗi phiên bản trên Linux luôn rỗng.

## Ví dụ

### Sử dụng Sec-CH-UA-Platform-Version

Máy chủ yêu cầu tiêu đề `Sec-CH-UA-Platform-Version` bằng cách bao gồm {{HTTPHeader("Accept-CH")}} trong _phản hồi_ cho bất kỳ yêu cầu nào từ máy khách, sử dụng tên của tiêu đề mong muốn làm token:

```http
HTTP/1.1 200 OK
Accept-CH: Sec-CH-UA-Platform-Version
```

Máy khách có thể chọn cung cấp gợi ý, và thêm tiêu đề `Sec-CH-UA-Platform-Version` vào các yêu cầu tiếp theo.
Ví dụ: các tiêu đề yêu cầu sau có thể được gửi từ trình duyệt chạy trên Windows 10.

```http
GET /my/page HTTP/1.1
Host: example.site

Sec-CH-UA: " Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"
Sec-CH-UA-Mobile: ?0
Sec-CH-UA-Platform: "Windows"
Sec-CH-UA-Platform-Version: "10.0.0"
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
