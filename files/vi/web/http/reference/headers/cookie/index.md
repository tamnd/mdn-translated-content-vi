---
title: Cookie header
short-title: Cookie
slug: Web/HTTP/Reference/Headers/Cookie
page-type: http-header
browser-compat: http.headers.Cookie
sidebar: http
---

Tiêu đề HTTP **`Cookie`** {{Glossary("request header")}} chứa các [HTTP cookie](/en-US/docs/Web/HTTP/Guides/Cookies) được lưu trữ liên kết với máy chủ (tức là các cookie được máy chủ gửi trước đó bằng tiêu đề {{HTTPHeader("Set-Cookie")}} hoặc được thiết lập trong JavaScript bằng {{domxref("Document.cookie")}}).

Tiêu đề `Cookie` là tùy chọn và có thể bị bỏ qua nếu, ví dụ, cài đặt quyền riêng tư của trình duyệt chặn cookie.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Có</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Cookie: <cookie-list>
Cookie: name=value
Cookie: name=value; name2=value2; name3=value3
```

## Chỉ thị

- `<cookie-list>`
  - : Danh sách các cặp tên-giá trị theo dạng `<cookie-name>=<cookie-value>`.
    Các cặp trong danh sách được phân tách bằng dấu chấm phẩy và dấu cách.

## Ví dụ

```http
Cookie: PHPSESSID=298zf09hf012fh2; csrftoken=u32t4o3tb3gg43; _gat=1
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPStatus("413", "413 Content Too Large")}}
- {{HTTPHeader("Set-Cookie")}}
- {{domxref("Document.cookie")}}
