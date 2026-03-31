---
title: Sec-CH-Width header
short-title: Sec-CH-Width
slug: Web/HTTP/Reference/Headers/Sec-CH-Width
page-type: http-header
status:
  - experimental
browser-compat: http.headers.Sec-CH-Width
sidebar: http
---

{{SecureContext_header}}{{SeeCompatTable}}

Tiêu đề HTTP **`Sec-CH-Width`** {{Glossary("request header")}} là một [gợi ý máy khách thiết bị](/en-US/docs/Web/HTTP/Guides/Client_hints#device_client_hints) cho biết chiều rộng tài nguyên mong muốn tính bằng pixel vật lý — kích thước nội tại của một hình ảnh. Giá trị pixel được cung cấp là số làm tròn lên đến số nguyên nhỏ nhất tiếp theo (tức là giá trị trần).

Gợi ý này chỉ được gửi trên các yêu cầu hình ảnh.

Gợi ý cho phép máy khách yêu cầu tài nguyên tối ưu cho cả màn hình và bố cục: tính đến cả chiều rộng màn hình đã hiệu chỉnh mật độ và kích thước ngoại tại của hình ảnh trong bố cục.

Nếu chiều rộng tài nguyên mong muốn không được biết tại thời điểm yêu cầu hoặc tài nguyên không có chiều rộng hiển thị, trường tiêu đề `Sec-CH-Width` có thể bị bỏ qua.
Nếu tiêu đề `Sec-CH-Width` xuất hiện nhiều hơn một lần trong một thông điệp, lần xuất hiện cuối cùng được sử dụng.

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
  - : Chiều rộng của tài nguyên tính bằng pixel vật lý, làm tròn lên đến số nguyên gần nhất.

## Ví dụ

Máy chủ trước tiên cần chọn nhận tiêu đề `Sec-CH-Width` bằng cách gửi tiêu đề phản hồi {{HTTPHeader("Accept-CH")}} chứa `Sec-CH-Width`.

```http
Accept-CH: Sec-CH-Width
```

Sau đó, trong các yêu cầu hình ảnh tiếp theo, máy khách có thể gửi lại tiêu đề `Sec-CH-Width`:

```http
Width: 1920
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Gợi ý máy khách thiết bị và hình ảnh đáp ứng
  - {{HTTPHeader("Width")}} {{deprecated_inline}}
  - {{HTTPHeader("Sec-CH-Viewport-Width")}}
  - {{HTTPHeader("Sec-CH-Viewport-Height")}}
  - {{HTTPHeader("Sec-CH-Device-Memory")}}
  - {{HTTPHeader("Sec-CH-DPR")}}
- {{HTTPHeader("Accept-CH")}}
- [HTTP Caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary) và tiêu đề {{HTTPHeader("Vary")}}
- [Improving user privacy and developer experience with User-Agent Client Hints](https://developer.chrome.com/docs/privacy-security/user-agent-client-hints) (developer.chrome.com)
