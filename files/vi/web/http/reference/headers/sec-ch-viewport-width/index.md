---
title: Sec-CH-Viewport-Width header
short-title: Sec-CH-Viewport-Width
slug: Web/HTTP/Reference/Headers/Sec-CH-Viewport-Width
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-Viewport-Width
sidebar: http
---

{{SecureContext_header}}{{SeeCompatTable}}

Tiêu đề HTTP **`Sec-CH-Viewport-Width`** {{Glossary("request header")}} là một [gợi ý máy khách thiết bị](/en-US/docs/Web/HTTP/Guides/Client_hints) cung cấp chiều rộng khung nhìn bố cục của máy khách tính bằng {{Glossary("CSS pixel", "CSS pixel")}}.
Giá trị được làm tròn lên đến số nguyên nhỏ nhất tiếp theo (tức là giá trị trần).

Gợi ý có thể được dùng với các gợi ý màn hình cụ thể khác để cung cấp hình ảnh được tối ưu hóa cho kích thước màn hình cụ thể, hoặc bỏ qua các tài nguyên không cần thiết cho một chiều rộng màn hình cụ thể.
Nếu tiêu đề `Sec-CH-Viewport-Width` xuất hiện nhiều lần trong một thông điệp thì lần xuất hiện cuối cùng được sử dụng.

Máy chủ phải đồng ý nhận tiêu đề `Sec-CH-Viewport-Width` từ máy khách, bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}}.
Các máy chủ đồng ý thường cũng chỉ định nó trong tiêu đề {{HTTPHeader("Vary")}} để thông báo cho bộ nhớ đệm rằng máy chủ có thể gửi các phản hồi khác nhau dựa trên giá trị tiêu đề trong yêu cầu.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>
        {{Glossary("Request header")}},
        <a href="/en-US/docs/Web/HTTP/Guides/Client_hints">Gợi ý máy khách</a>
      </td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Sec-CH-Viewport-Width: <number>
```

## Chỉ thị

- `<number>`
  - : Chiều rộng khung nhìn của người dùng tính bằng {{Glossary("CSS pixel","CSS pixel")}}, được làm tròn lên đến số nguyên gần nhất.

## Ví dụ

### Sử dụng Sec-CH-Viewport-Width

Máy chủ phải trước tiên đồng ý nhận tiêu đề `Sec-CH-Viewport-Width` bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} có chứa chỉ thị `Sec-CH-Viewport-Width`.

```http
Accept-CH: Sec-CH-Viewport-Width
```

Trong các yêu cầu tiếp theo, máy khách có thể gửi tiêu đề `Sec-CH-Viewport-Width`:

```http
Sec-CH-Viewport-Width: 320
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
- Gợi ý máy khách thiết bị và hình ảnh phản hồi
  - {{HTTPHeader("Sec-CH-Device-Memory")}}
  - {{HTTPHeader("Sec-CH-DPR")}}
  - {{HTTPHeader("Sec-CH-Viewport-Height")}}
  - {{HTTPHeader("Viewport-Width")}} {{deprecated_inline}}
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và tiêu đề {{HTTPHeader("Vary")}}
