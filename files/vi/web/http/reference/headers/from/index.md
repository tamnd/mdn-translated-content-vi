---
title: From header
short-title: From
slug: Web/HTTP/Reference/Headers/From
page-type: http-header
browser-compat: http.headers.From
sidebar: http
---

Tiêu đề HTTP **`From`** {{Glossary("request header")}} chứa địa chỉ email Internet cho một quản trị viên kiểm soát tác nhân người dùng tự động.

Nếu bạn đang chạy tác nhân người dùng robot (ví dụ: trình thu thập web), tiêu đề `From` phải được gửi trong các yêu cầu để bạn có thể được liên hệ nếu có vấn đề xảy ra, chẳng hạn như một bot gửi quá nhiều, không mong muốn hoặc yêu cầu không hợp lệ.

> [!WARNING]
> Bạn không được sử dụng tiêu đề `From` để kiểm soát truy cập hoặc xác thực.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Loại tiêu đề</th>
      <td>{{Glossary("Request header")}}</td>
    </tr>
    <tr>
      <th scope="row">{{Glossary("Forbidden request header")}}</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
From: <email>
```

## Chỉ thị

- `<email>`
  - : Địa chỉ email có thể sử dụng bởi máy móc.

## Ví dụ

```http
From: webmaster@example.org
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Host")}}
