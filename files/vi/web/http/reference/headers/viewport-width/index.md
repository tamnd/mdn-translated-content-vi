---
title: Viewport-Width header
short-title: Viewport-Width
slug: Web/HTTP/Reference/Headers/Viewport-Width
page-type: http-header
status:
  - deprecated
  - non-standard
browser-compat: http.headers.Viewport-Width
sidebar: http
---

{{Deprecated_Header}}{{SecureContext_Header}}{{Non-standard_Header}}

> [!WARNING]
> Tiêu đề `Viewport-Width` đã được chuẩn hóa là {{HTTPHeader("Sec-CH-Viewport-Width")}} và tên mới hiện được ưu tiên.

Tiêu đề HTTP **`Viewport-Width`** {{Glossary("request header")}} là [device client hint](/en-US/docs/Web/HTTP/Guides/Client_hints) cung cấp chiều rộng viewport bố cục của máy khách tính bằng {{Glossary("CSS pixel", "CSS pixels")}}.
Giá trị được làm tròn lên đến số nguyên nhỏ nhất tiếp theo (tức là, giá trị ceiling).

Hint có thể được sử dụng với các hint dành riêng cho màn hình khác để cung cấp hình ảnh được tối ưu hóa cho kích thước màn hình cụ thể, hoặc để bỏ qua các tài nguyên không cần thiết cho chiều rộng màn hình cụ thể.
Nếu tiêu đề `Viewport-Width` xuất hiện nhiều hơn một lần trong thông điệp, lần xuất hiện cuối cùng sẽ được sử dụng.

Máy chủ phải đăng ký để nhận tiêu đề `Viewport-Width` từ máy khách, bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}}.
Các máy chủ đăng ký thường cũng chỉ định nó trong tiêu đề {{HTTPHeader("Vary")}} để thông báo cho bộ đệm rằng máy chủ có thể gửi các phản hồi khác nhau dựa trên giá trị tiêu đề trong yêu cầu.

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
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Viewport-Width: <number>
```

## Chỉ thị

- `<number>`
  - : Chiều rộng viewport của người dùng tính bằng {{Glossary("CSS pixel","CSS pixels")}}, được làm tròn lên đến số nguyên gần nhất.

## Ví dụ

### Sử dụng Viewport-Width

Máy chủ phải trước tiên đăng ký để nhận tiêu đề `Viewport-Width` bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} chứa chỉ thị `Viewport-Width`.

```http
Accept-CH: Viewport-Width
```

Trong các yêu cầu tiếp theo, máy khách có thể gửi tiêu đề `Viewport-Width`:

```http
Viewport-Width: 320
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
- Device và responsive image client hints
  - {{HTTPHeader("Sec-CH-Viewport-Width")}}
  - {{HTTPHeader("Sec-CH-Viewport-Height")}}
  - {{HTTPHeader("Sec-CH-Device-Memory")}}
  - {{HTTPHeader("Sec-CH-DPR")}}
  - {{HTTPHeader("Sec-CH-Width")}}
  - {{HTTPHeader("DPR")}} {{deprecated_inline}}
  - {{HTTPHeader("Content-DPR")}} {{deprecated_inline}}
  - {{HTTPHeader("Device-Memory")}} {{deprecated_inline}}
  - {{HTTPHeader("Width")}} {{deprecated_inline}}
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và tiêu đề {{HTTPHeader("Vary")}}
