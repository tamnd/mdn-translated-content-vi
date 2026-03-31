---
title: DPR header
short-title: DPR
slug: Web/HTTP/Reference/Headers/DPR
page-type: http-header
status:
  - deprecated
  - non-standard
browser-compat: http.headers.DPR
sidebar: http
---

{{Deprecated_Header}}{{SecureContext_Header}}{{Non-standard_Header}}

> [!WARNING]
> Tiêu đề `DPR` đã được chuẩn hóa thành {{HTTPHeader("Sec-CH-DPR")}} và tên mới hiện được ưu tiên.

Tiêu đề HTTP **`DPR`** {{Glossary("request header")}} cung cấp [device client hints](/en-US/docs/Web/HTTP/Guides/Client_hints) về tỷ lệ pixel thiết bị máy khách (DPR).
Tỷ lệ này là số pixel vật lý thiết bị tương ứng với mỗi {{Glossary("CSS pixel")}}.

Gợi ý này hữu ích khi chọn các nguồn hình ảnh phù hợp nhất với mật độ pixel của màn hình.
Điều này tương tự như vai trò của bộ mô tả `x` trong thuộc tính `srcset` của `<img>` để cho phép user agent chọn hình ảnh ưa thích.

Nếu máy chủ sử dụng gợi ý `DPR` để chọn tài nguyên nào được gửi trong phản hồi, phản hồi phải bao gồm tiêu đề {{HTTPHeader("Content-DPR")}}.
Máy khách phải sử dụng giá trị trong `Content-DPR` cho bố cục nếu nó khác với giá trị trong tiêu đề `DPR` của yêu cầu.

Nếu tiêu đề `DPR` xuất hiện nhiều hơn một lần trong một thông điệp thì lần xuất hiện cuối cùng được sử dụng.

Các máy chủ đăng ký nhận gợi ý client `DPR` thường cũng chỉ định nó trong tiêu đề {{HTTPHeader("Vary")}} để thông báo cho cache rằng máy chủ có thể gửi các phản hồi khác nhau dựa trên giá trị tiêu đề trong một yêu cầu.

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
DPR: <number>
```

## Chỉ thị

- `<number>`
  - : Tỷ lệ pixel thiết bị máy khách.

## Ví dụ

Trước tiên máy chủ phải đăng ký nhận tiêu đề `DPR` bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} chứa chỉ thị `DPR`.

```http
Accept-CH: DPR
```

Sau đó trong các yêu cầu tiếp theo, máy khách có thể gửi tiêu đề `DPR` đến máy chủ:

```http
DPR: 2.0
```

Nếu một yêu cầu với tiêu đề `DPR` (như được hiển thị ở trên) dành cho tài nguyên hình ảnh, thì phản hồi của máy chủ phải bao gồm tiêu đề {{HTTPHeader("Content-DPR")}}:

```http
Content-DPR: 2.0
```

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Device và responsive image client hints
  - {{HTTPHeader("Sec-CH-DPR")}}
  - {{HTTPHeader("Sec-CH-Device-Memory")}}
  - {{HTTPHeader("Sec-CH-Viewport-Height")}}
  - {{HTTPHeader("Sec-CH-Viewport-Width")}}
  - {{HTTPHeader("Sec-CH-Width")}}
  - {{HTTPHeader("Content-DPR")}} {{deprecated_inline}}
  - {{HTTPHeader("Device-Memory")}} {{deprecated_inline}}
  - {{HTTPHeader("Viewport-Width")}} {{deprecated_inline}}
  - {{HTTPHeader("Width")}} {{deprecated_inline}}
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và {{HTTPHeader("Vary")}}
- [Cải thiện quyền riêng tư người dùng và trải nghiệm nhà phát triển với User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
