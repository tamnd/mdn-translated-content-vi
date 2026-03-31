---
title: Vary header
short-title: Vary
slug: Web/HTTP/Reference/Headers/Vary
page-type: http-header
browser-compat: http.headers.Vary
sidebar: http
---

Tiêu đề HTTP **`Vary`** {{Glossary("response header")}} mô tả các phần của thông điệp yêu cầu (ngoài phương thức và URL) đã ảnh hưởng đến nội dung của phản hồi mà nó xuất hiện trong.
Bao gồm tiêu đề `Vary` đảm bảo rằng các phản hồi được lưu trong bộ đệm riêng dựa trên các tiêu đề được liệt kê trong trường `Vary`.
Thường nhất, điều này được sử dụng để tạo cache key khi [content negotiation](/en-US/docs/Web/HTTP/Guides/Content_negotiation) đang được sử dụng.

Giá trị tiêu đề `Vary` giống nhau nên được sử dụng trên tất cả các phản hồi cho một URL đã cho, bao gồm cả phản hồi {{HTTPStatus("304")}} `Not Modified` và phản hồi "mặc định".

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Vary: *
Vary: <header-name>, …, <header-nameN>
```

## Chỉ thị

- `*` (wildcard)
  - : Các yếu tố khác ngoài tiêu đề yêu cầu đã ảnh hưởng đến việc tạo phản hồi này. Ngụ ý rằng phản hồi không thể lưu vào bộ đệm.
- `<header-name>`
  - : Tên tiêu đề yêu cầu có thể đã ảnh hưởng đến việc tạo phản hồi này.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Content negotiation](/en-US/docs/Web/HTTP/Guides/Content_negotiation)
- [HTTP caching: Vary](/en-US/docs/Web/HTTP/Guides/Caching#vary)
- [Understanding The Vary Header](https://www.smashingmagazine.com/2017/11/understanding-vary-header/) trên smashingmagazine.com (2017)
- [Best Practices for Using the Vary Header](https://www.fastly.com/blog/best-practices-using-vary-header) trên fastly.com
