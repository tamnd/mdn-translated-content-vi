---
title: Sec-CH-DPR header
short-title: Sec-CH-DPR
slug: Web/HTTP/Reference/Headers/Sec-CH-DPR
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-DPR
sidebar: http
---

{{SecureContext_Header}}{{SeeCompatTable}}

Tiêu đề HTTP **`Sec-CH-DPR`** {{Glossary("request header")}} cung cấp [gợi ý máy khách thiết bị](/en-US/docs/Web/HTTP/Guides/Client_hints) về tỷ lệ pixel thiết bị máy khách (DPR).
Tỷ lệ này là số pixel vật lý của thiết bị tương ứng với mỗi {{Glossary("CSS pixel")}}.

Gợi ý hữu ích khi chọn nguồn hình ảnh phù hợp nhất với mật độ pixel của màn hình.
Điều này tương tự vai trò của bộ mô tả `x` trong thuộc tính [`srcset`](/en-US/docs/Web/HTML/Reference/Elements/img#srcset) của `<img>` để cho phép user agent chọn hình ảnh ưa thích.

Nếu tiêu đề `Sec-CH-DPR` xuất hiện nhiều lần trong một thông điệp thì lần xuất hiện cuối cùng được sử dụng.

Các máy chủ đồng ý nhận gợi ý máy khách `Sec-CH-DPR` thường cũng chỉ định nó trong tiêu đề {{HTTPHeader("Vary")}} để thông báo cho bộ nhớ đệm rằng máy chủ có thể gửi các phản hồi khác nhau dựa trên giá trị tiêu đề trong yêu cầu.

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
Sec-CH-DPR: <number>
```

## Chỉ thị

- `<number>`
  - : Tỷ lệ pixel thiết bị của máy khách.

## Ví dụ

Máy chủ phải trước tiên đồng ý nhận tiêu đề `Sec-CH-DPR` bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} có chứa chỉ thị `Sec-CH-DPR`.

```http
Accept-CH: Sec-CH-DPR
```

Sau đó, trong các yêu cầu tiếp theo, máy khách có thể gửi tiêu đề `Sec-CH-DPR` đến máy chủ:

```http
Sec-CH-DPR: 2.0
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Gợi ý máy khách thiết bị và hình ảnh phản hồi
  - {{HTTPHeader("Sec-CH-Device-Memory")}}
  - {{HTTPHeader("Sec-CH-Viewport-Height")}}
  - {{HTTPHeader("Sec-CH-Viewport-Width")}}
  - {{HTTPHeader("DPR")}} {{deprecated_inline}}
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và {{HTTPHeader("Vary")}}
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
