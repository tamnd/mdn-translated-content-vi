---
title: Width header
short-title: Width
slug: Web/HTTP/Reference/Headers/Width
page-type: http-header
status:
  - deprecated
  - non-standard
browser-compat: http.headers.Width
sidebar: http
---

{{Deprecated_Header}}{{SecureContext_header}}{{Non-standard_Header}}

> [!WARNING]
> Tiêu đề `Width` đã được chuẩn hóa là {{HTTPHeader("Sec-CH-Width")}} và tên mới hiện được ưu tiên.

Tiêu đề HTTP **`Width`** {{Glossary("request header")}} là [device client hint](/en-US/docs/Web/HTTP/Guides/Client_hints#device_client_hints) cho biết chiều rộng tài nguyên mong muốn tính bằng pixel vật lý — kích thước nội tại của hình ảnh. Giá trị pixel được cung cấp là số được làm tròn lên đến số nguyên nhỏ nhất tiếp theo (tức là, giá trị ceiling).

Hint chỉ được gửi trong các yêu cầu hình ảnh.

Hint cho phép máy khách yêu cầu tài nguyên tối ưu cho cả màn hình lẫn bố cục: tính đến cả chiều rộng màn hình được hiệu chỉnh mật độ và kích thước ngoại tại của hình ảnh trong bố cục.

Nếu chiều rộng tài nguyên mong muốn không được biết tại thời điểm yêu cầu hoặc tài nguyên không có chiều rộng hiển thị, trường tiêu đề `Width` có thể bị bỏ qua.
Nếu tiêu đề `Width` xuất hiện nhiều hơn một lần trong thông điệp, lần xuất hiện cuối cùng được sử dụng.

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
Width: <number>
```

## Chỉ thị

- `<number>`
  - : Chiều rộng tài nguyên tính bằng pixel vật lý, được làm tròn lên đến số nguyên gần nhất.

## Ví dụ

Máy chủ trước tiên cần đăng ký để nhận tiêu đề `Width` bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} chứa `Width`.

```http
Accept-CH: Width
```

Sau đó trên các yêu cầu hình ảnh tiếp theo, máy khách có thể gửi lại tiêu đề `Width`:

```http
Width: 1920
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Device và responsive image client hints
  - {{HTTPHeader("Sec-CH-Width")}}
  - {{HTTPHeader("Sec-CH-Viewport-Width")}}
  - {{HTTPHeader("Sec-CH-Viewport-Height")}}
  - {{HTTPHeader("Sec-CH-Device-Memory")}}
  - {{HTTPHeader("Sec-CH-DPR")}}
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và tiêu đề {{HTTPHeader("Vary")}}
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
