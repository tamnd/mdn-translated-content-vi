---
title: "Content-Security-Policy: frame-ancestors directive"
short-title: frame-ancestors
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/frame-ancestors
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.frame-ancestors
sidebar: http
---

Chỉ thị **`frame-ancestors`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) chỉ định các phần tử cha hợp lệ có thể nhúng một trang bằng {{HTMLElement("frame")}}, {{HTMLElement("iframe")}}, {{HTMLElement("object")}}, hoặc {{HTMLElement("embed")}}.

Đặt chỉ thị này thành `'none'` tương tự như {{HTTPHeader("X-Frame-Options", "X-Frame-Options: deny")}} (cũng được hỗ trợ trong các trình duyệt cũ hơn).

> [!NOTE]
> **`frame-ancestors`** cho phép bạn chỉ định nguồn cha nào có thể nhúng một trang.
> Điều này khác với **`frame-src`**, cho phép bạn chỉ định nơi các iframe trong một trang có thể được tải từ đâu.

> [!NOTE]
> Chỉ thị **`frame-ancestors`** [kiểm tra từng tổ tiên](https://w3c.github.io/webappsec-csp/#frame-ancestors-and-frame-options). Nếu bất kỳ tổ tiên nào không khớp thì tải bị hủy. Do đó tất cả các tổ tiên phải được cho phép bởi chỉ thị **`frame-ancestors`** của các frame lá khi sử dụng các frame lồng nhau.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Phiên bản CSP</th>
      <td>2</td>
    </tr>
    <tr>
      <th scope="row">Loại chỉ thị</th>
      <td>{{Glossary("Navigation directive")}}</td>
    </tr>
    <tr>
      <th scope="row">Dự phòng {{CSP("default-src")}}</th>
      <td>Không. Nếu không đặt chỉ thị này thì bất kỳ điều gì cũng được phép.</td>
    </tr>
    <tr>
      <th colspan="2" scope="row">
        Chỉ thị này không được hỗ trợ trong phần tử {{HTMLElement("meta")}}.
      </th>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: frame-ancestors 'none';
Content-Security-Policy: frame-ancestors <source-expression-list>;
```

Chỉ thị này có thể nhận một trong các giá trị sau:

- `'none'`
  - : Tài nguyên này không thể được nhúng. Dấu nháy đơn là bắt buộc.
- `<source-expression-list>`
  - : Danh sách các giá trị _biểu thức nguồn_ phân cách bằng khoảng trắng. Tài nguyên này có thể được nhúng nếu người nhúng khớp với bất kỳ biểu thức nguồn nào. Đối với chỉ thị này, các giá trị biểu thức nguồn sau đây có thể áp dụng:
    - [`<host-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#host-source)
    - [`<scheme-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#scheme-source)
    - [`'self'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#self)

> [!NOTE]
> Cú pháp của chỉ thị `frame-ancestors` tương tự như cú pháp danh sách nguồn được chấp nhận bởi các chỉ thị khác (ví dụ: {{CSP("child-src")}}), nhưng nó không dự phòng sang cài đặt `default-src`. Một chính sách khai báo `default-src 'none'` vẫn cho phép tài nguyên được nhúng bởi bất kỳ ai.

## Ví dụ

```http
Content-Security-Policy: frame-ancestors 'none';

Content-Security-Policy: frame-ancestors 'self' https://www.example.org;

Content-Security-Policy: frame-ancestors 'self' https://example.org https://example.com https://store.example.com;
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- {{HTTPHeader("X-Frame-Options")}}
- {{CSP("frame-src")}} CSP
