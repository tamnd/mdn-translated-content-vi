---
title: Sec-CH-UA-Form-Factors header
short-title: Sec-CH-UA-Form-Factors
slug: Web/HTTP/Reference/Headers/Sec-CH-UA-Form-Factors
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-UA-Form-Factors
sidebar: http
---

{{SecureContext_Header}}{{SeeCompatTable}}

Tiêu đề HTTP **`Sec-CH-UA-Form-Factors`** {{Glossary("Request header", "request header")}} là một [gợi ý máy khách tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) cung cấp thông tin về kiểu dáng thiết bị của tác nhân người dùng.

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
Sec-CH-UA-Form-Factors: <form-factor>
Sec-CH-UA-Form-Factors: <form-factor>, …, <form-factor>
```

### Chỉ thị

- `<form-factor>`
  - : Chuỗi cho biết kiểu dáng thiết bị phổ biến.
    Tất cả các kiểu dáng có thể áp dụng đều có thể được bao gồm.
    Ý nghĩa của các giá trị được phép là:
    - `"Desktop"`
      - : Tác nhân người dùng chạy trên máy tính cá nhân.
    - `"Automotive"`
      - : Tác nhân người dùng được nhúng trong phương tiện, nơi người dùng có thể chịu trách nhiệm vận hành phương tiện và có khả năng tương tác hạn chế.
    - `"Mobile"`
      - : Thiết bị nhỏ, hướng cảm ứng thường được người dùng mang theo.
    - `"Tablet"`
      - : Thiết bị hướng cảm ứng lớn hơn `"Mobile"` và thường không được mang theo.
    - `"XR"`
      - : Thiết bị đắm chìm tăng cường hoặc thay thế môi trường xung quanh người dùng.
    - `"EInk"`
      - : Thiết bị được đặc trưng bởi cập nhật màn hình chậm và độ phân giải màu hạn chế hoặc không có.
    - `"Watch"`
      - : Thiết bị di động với màn hình rất nhỏ (thường dưới 2 inch), được đeo theo cách mà người dùng có thể liếc nhìn nhanh.

## Ví dụ

### Sử dụng Sec-CH-UA-Form-Factors

Máy chủ yêu cầu tiêu đề `Sec-CH-UA-Form-Factors` bằng cách bao gồm {{HTTPHeader("Accept-CH")}} trong _phản hồi_ cho bất kỳ yêu cầu nào từ máy khách, sử dụng tên của tiêu đề mong muốn làm token:

```http
HTTP/1.1 200 OK
Accept-CH: Sec-CH-UA-Form-Factors
```

Máy khách có thể chọn cung cấp gợi ý, và thêm tiêu đề `Sec-CH-UA-Form-Factors` vào các yêu cầu tiếp theo.
Ví dụ: máy khách có thể thêm tiêu đề như sau:

```http
GET /my/page HTTP/1.1
Host: example.site

Sec-CH-UA-Mobile: ?0
Sec-CH-UA-Form-Factors: "EInk"
```

Trong trường hợp này, `"EInk"` có nghĩa là thiết bị được đặc trưng bởi cập nhật màn hình chậm và độ phân giải màu hạn chế, và do đó các phản hồi có thể khác nhau tùy thuộc vào gợi ý này.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Client hints](/en-US/docs/Web/HTTP/Guides/Client_hints)
- [User-Agent Client Hints API](/en-US/docs/Web/API/User-Agent_Client_Hints_API)
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và tiêu đề {{HTTPHeader("Vary")}}
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) trên developer.chrome.com
