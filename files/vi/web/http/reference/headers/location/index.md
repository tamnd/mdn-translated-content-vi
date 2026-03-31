---
title: Location header
short-title: Location
slug: Web/HTTP/Reference/Headers/Location
page-type: http-header
browser-compat: http.headers.Location
sidebar: http
---

Tiêu đề HTTP **`Location`** {{Glossary("response header")}} chỉ báo URL để chuyển hướng trang đến.
Nó chỉ có ý nghĩa khi được phục vụ với phản hồi chuyển hướng `3XX` [redirection response](/en-US/docs/Web/HTTP/Reference/Status#redirection_messages) hoặc phản hồi trạng thái {{HTTPStatus("201", "201 Created")}}.

Trong các chuyển hướng, phương thức HTTP được sử dụng để thực hiện yêu cầu chuyển hướng đến trang trỏ bởi `Location` phụ thuộc vào phương thức ban đầu và loại chuyển hướng:

- Phản hồi {{HTTPStatus("303", "303 See Other")}} luôn dẫn đến yêu cầu {{HTTPMethod("GET")}} trong chuyển hướng.
- Phản hồi {{HTTPStatus("307", "307 Temporary Redirect")}} và {{HTTPStatus("308", "308 Permanent Redirect")}} sử dụng cùng phương thức với yêu cầu khởi tạo.
- Phản hồi {{HTTPStatus("301", "301 Moved Permanently")}} và {{HTTPStatus("302", "302 Found")}} nên sử dụng cùng phương thức yêu cầu với yêu cầu khởi tạo, mặc dù điều này không được đảm bảo đối với các tác nhân người dùng cũ hơn.

Tất cả các phản hồi với một trong các mã trạng thái trên đều bao gồm tiêu đề `Location`.

Trong trường hợp tạo tài nguyên, nó chỉ báo URL của tài nguyên mới được tạo để máy khách có thể thực hiện yêu cầu cho nó ngay lập tức.

`Location` và {{HTTPHeader("Content-Location")}} khác nhau.
`Content-Location` chỉ báo URL để sử dụng để truy cập trực tiếp tài nguyên trong tương lai khi [thương lượng nội dung](/en-US/docs/Web/HTTP/Guides/Content_negotiation) đã xảy ra.
`Location` được liên kết với phản hồi, trong khi {{HTTPHeader("Content-Location")}} được liên kết với biểu diễn được trả về.

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
Location: <url>
```

## Chỉ thị

- `<url>`
  - : Có thể tương đối với URL yêu cầu hoặc là URL tuyệt đối.

## Ví dụ

```http
Location: /index.html
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Location")}}
- Các phản hồi trạng thái bao gồm tiêu đề `Location`: {{HTTPStatus("201")}}, {{HTTPStatus("301")}}, {{HTTPStatus("302")}}, {{HTTPStatus("303")}}, {{HTTPStatus("307")}}, {{HTTPStatus("308")}}.
