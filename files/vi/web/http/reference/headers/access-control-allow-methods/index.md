---
title: Access-Control-Allow-Methods header
short-title: Access-Control-Allow-Methods
slug: Web/HTTP/Reference/Headers/Access-Control-Allow-Methods
page-type: http-header
browser-compat: http.headers.Access-Control-Allow-Methods
sidebar: http
---

Tiêu đề HTTP **`Access-Control-Allow-Methods`** {{Glossary("response header", "phản hồi")}} chỉ định một hoặc nhiều [phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods) được phép khi truy cập tài nguyên trong phản hồi cho {{glossary("preflight request", "yêu cầu preflight")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Response header", "Tiêu đề phản hồi")}}</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Access-Control-Allow-Methods: <method>, <method>, …
Access-Control-Allow-Methods: *
```

## Chỉ thị

- `<method>`
  - : Danh sách phân tách bằng dấu phẩy các phương thức yêu cầu được phép. `GET`, `HEAD`, và `POST` luôn được phép, bất kể chúng có được chỉ định trong tiêu đề này hay không, vì chúng được định nghĩa là [phương thức được CORS chấp nhận](https://fetch.spec.whatwg.org/#cors-safelisted-method).
- `*` (ký tự đại diện)
  - : Tất cả các phương thức HTTP. Nó có ý nghĩa này chỉ đối với các yêu cầu không có thông tin xác thực (các yêu cầu không có [cookie HTTP](/en-US/docs/Web/HTTP/Guides/Cookies) hoặc thông tin xác thực HTTP). Trong các yêu cầu có thông tin xác thực, nó được coi là tên phương thức chữ `*` không có ngữ nghĩa đặc biệt.

## Ví dụ

```http
Access-Control-Allow-Methods: PUT, DELETE
Access-Control-Allow-Methods: *
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Access-Control-Allow-Origin")}}
- {{HTTPHeader("Access-Control-Expose-Headers")}}
- {{HTTPHeader("Access-Control-Allow-Headers")}}
- {{HTTPHeader("Access-Control-Request-Method")}}
- [Các phương thức yêu cầu HTTP](/en-US/docs/Web/HTTP/Reference/Methods)
