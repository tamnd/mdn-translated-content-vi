---
title: Sec-CH-UA header
short-title: Sec-CH-UA
slug: Web/HTTP/Reference/Headers/Sec-CH-UA
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-UA
sidebar: http
---

{{SeeCompatTable}}{{SecureContext_Header}}

Tiêu đề HTTP **`Sec-CH-UA`** {{Glossary("request header")}} là một [gợi ý máy khách tác nhân người dùng](/en-US/docs/Web/HTTP/Guides/Client_hints#user_agent_client_hints) cung cấp thông tin về thương hiệu và phiên bản quan trọng của tác nhân người dùng.

Tiêu đề `Sec-CH-UA` cung cấp thương hiệu và phiên bản quan trọng của mỗi thương hiệu liên quan đến trình duyệt trong một danh sách phân cách bằng dấu phẩy.
Do đó, tiêu đề cho phép máy chủ tùy chỉnh phản hồi dựa trên cả thương hiệu chung và các tùy chỉnh cụ thể trong các phiên bản tương ứng của chúng.

`Sec-CH-UA` là một [gợi ý entropy thấp](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints).
Trừ khi bị chặn bởi chính sách quyền của tác nhân người dùng, nó được gửi theo mặc định mà không cần máy chủ chọn tham gia bằng cách gửi {{HTTPHeader("Accept-CH")}}.

Tiêu đề có thể bao gồm các thương hiệu "giả" ở bất kỳ vị trí nào và với bất kỳ tên nào.
Đây là tính năng được thiết kế để ngăn máy chủ từ chối các tác nhân người dùng không quen biết ngay lập tức, buộc các tác nhân người dùng phải nói dối về danh tính thương hiệu của họ.

> [!NOTE]
> Tiêu đề {{HTTPHeader("Sec-CH-UA-Full-Version-List")}} giống với `Sec-CH-UA`, nhưng bao gồm số phiên bản đầy đủ thay vì số phiên bản quan trọng cho mỗi thương hiệu.

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
Sec-CH-UA: "<brand>";v="<significant version>", …
```

Giá trị là danh sách phân cách bằng dấu phẩy của các thương hiệu trong danh sách thương hiệu tác nhân người dùng, và số phiên bản quan trọng liên quan của chúng.

### Chỉ thị

- `<brand>`
  - : Thương hiệu liên quan đến tác nhân người dùng, như "Chromium", "Google Chrome", hoặc thương hiệu sai cố ý như `"Not A;Brand"`.
- `<significant version>`
  - : Số phiên bản "marketing" liên quan đến các tính năng web-exposed có thể phân biệt được.

## Mô tả

Thương hiệu là tên thương mại của tác nhân người dùng như: Chromium, Opera, Google Chrome, Microsoft Edge, Firefox, và Safari.
Một tác nhân người dùng có thể có một số thương hiệu liên quan.
Ví dụ: Opera, Chrome, và Edge đều dựa trên Chromium, và sẽ cung cấp cả hai thương hiệu trong tiêu đề `Sec-CH-UA`.

_Phiên bản quan trọng_ là mã định danh phiên bản "marketing" được dùng để phân biệt giữa các phiên bản chính của thương hiệu.
Ví dụ: bản build Chromium với _số phiên bản đầy đủ_ "96.0.4664.45" có số phiên bản quan trọng là "96".

## Ví dụ

### Các thương hiệu Sec-CH-UA khác nhau

`Sec-CH-UA` là một [gợi ý entropy thấp](/en-US/docs/Web/HTTP/Guides/Client_hints#low_entropy_hints).
Trừ khi bị chặn rõ ràng bởi chính sách tác nhân người dùng, nó sẽ được gửi trong tất cả các yêu cầu (mà không cần máy chủ phải chọn tham gia bằng cách gửi {{HTTPHeader("Accept-CH")}}).

Các chuỗi từ trình duyệt máy tính để bàn Chromium, Chrome, Edge, và Opera được hiển thị dưới đây.
Lưu ý rằng tất cả đều chia sẻ thương hiệu "Chromium", nhưng có thêm thương hiệu cho biết nguồn gốc của chúng.
Chúng cũng có chuỗi thương hiệu sai cố ý, có thể xuất hiện ở bất kỳ vị trí nào và có văn bản khác nhau.

```http
Sec-CH-UA: "(Not(A:Brand";v="8", "Chromium";v="98"
```

```http
Sec-CH-UA: " Not A;Brand";v="99", "Chromium";v="96", "Google Chrome";v="96"
```

```http
Sec-CH-UA: " Not A;Brand";v="99", "Chromium";v="96", "Microsoft Edge";v="96"
```

```http
Sec-CH-UA: "Opera";v="81", " Not;A Brand";v="99", "Chromium";v="95"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Client hints](/en-US/docs/Web/HTTP/Guides/Client_hints)
- [User-Agent Client Hints API](/en-US/docs/Web/API/User-Agent_Client_Hints_API)
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và {{HTTPHeader("Vary")}}
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
