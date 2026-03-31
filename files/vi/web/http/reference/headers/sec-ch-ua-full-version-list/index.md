---
title: Sec-CH-UA-Full-Version-List header
short-title: Sec-CH-UA-Full-Version-List
slug: Web/HTTP/Reference/Headers/Sec-CH-UA-Full-Version-List
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-UA-Full-Version-List
sidebar: http
---

{{SeeCompatTable}}{{SecureContext_Header}}

Tiêu đề HTTP **`Sec-CH-UA-Full-Version-List`** {{Glossary("request header")}} là một [gợi ý máy khách tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) cung cấp thông tin về thương hiệu và phiên bản đầy đủ của tác nhân người dùng.

Tiêu đề **`Sec-CH-UA-Full-Version-List`** cung cấp thương hiệu và thông tin phiên bản đầy đủ cho mỗi thương hiệu liên quan đến trình duyệt, trong một danh sách phân cách bằng dấu phẩy.

Tiêu đề có thể bao gồm các thương hiệu "giả" ở bất kỳ vị trí nào và với bất kỳ tên nào.
Đây là tính năng được thiết kế để ngăn máy chủ từ chối các tác nhân người dùng không quen biết ngay lập tức, buộc các tác nhân người dùng phải nói dối về danh tính thương hiệu của họ.

> [!NOTE]
> Tiêu đề này tương tự {{HTTPHeader("Sec-CH-UA")}}, nhưng bao gồm số phiên bản đầy đủ thay vì số phiên bản quan trọng cho mỗi thương hiệu.

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
Sec-CH-UA-Full-Version-List: "<brand>";v="<full version>", …
```

Giá trị là danh sách phân cách bằng dấu phẩy của các thương hiệu trong danh sách thương hiệu tác nhân người dùng, và số phiên bản đầy đủ liên quan của chúng.

### Chỉ thị

- `<brand>`
  - : Thương hiệu liên quan đến tác nhân người dùng, như "Chromium", "Google Chrome".
    Đây có thể là thương hiệu sai cố ý như `" Not A;Brand"` hoặc `"(Not(A:Brand"` (giá trị thực tế dự kiến sẽ thay đổi theo thời gian và không thể đoán trước).
- `<full version>`
  - : Số phiên bản đầy đủ, chẳng hạn 98.0.4750.0.

## Mô tả

Thương hiệu là tên thương mại của tác nhân người dùng như: Chromium, Opera, Google Chrome, Microsoft Edge, Firefox, và Safari.
Một tác nhân người dùng có thể có một số thương hiệu liên quan.
Ví dụ: Opera, Chrome, và Edge đều dựa trên Chromium, và sẽ cung cấp cả hai thương hiệu trong tiêu đề `Sec-CH-UA-Full-Version-List`.

Tiêu đề cho phép máy chủ tùy chỉnh phản hồi dựa trên cả thương hiệu chung và các tùy chỉnh cụ thể trong các bản build tương ứng của chúng.

## Ví dụ

### Sử dụng Sec-CH-UA-Full-Version-List

Máy chủ yêu cầu tiêu đề `Sec-CH-UA-Full-Version-List` bằng cách bao gồm {{HTTPHeader("Accept-CH")}} trong _phản hồi_ cho bất kỳ yêu cầu nào từ máy khách, sử dụng tên của tiêu đề mong muốn làm token:

```http
HTTP/1.1 200 OK
Accept-CH: Sec-CH-UA-Full-Version-List
```

Máy khách có thể chọn cung cấp gợi ý, và thêm tiêu đề `Sec-CH-UA-Full-Version-List` vào các yêu cầu tiếp theo, như sau:

```http
GET /my/page HTTP/1.1
Host: example.site

Sec-CH-UA: " Not A;Brand";v="99", "Chromium";v="98", "Google Chrome";v="98"
Sec-CH-UA-Mobile: ?0
Sec-CH-UA-Full-Version-List: " Not A;Brand";v="99.0.0.0", "Chromium";v="98.0.4750.0", "Google Chrome";v="98.0.4750.0"
Sec-CH-UA-Platform: "Linux"
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
