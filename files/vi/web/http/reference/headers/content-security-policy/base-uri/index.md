---
title: "Content-Security-Policy: base-uri directive"
short-title: base-uri
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/base-uri
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.base-uri
sidebar: http
---

Chỉ thị **`base-uri`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} giới hạn các URL có thể được sử dụng trong phần tử {{HTMLElement("base")}} của tài liệu. Nếu giá trị này vắng mặt thì bất kỳ URI nào cũng được phép. Nếu chỉ thị này vắng mặt thì trình duyệt sẽ sử dụng giá trị trong phần tử {{HTMLElement("base")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Phiên bản CSP</th>
      <td>2</td>
    </tr>
    <tr>
      <th scope="row">Loại chỉ thị</th>
      <td>{{Glossary("Document directive")}}</td>
    </tr>
    <tr>
      <th scope="row">Dự phòng {{CSP("default-src")}}</th>
      <td>Không. Nếu không đặt chỉ thị này thì bất kỳ URL nào cũng được phép.</td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: base-uri 'none';
Content-Security-Policy: base-uri <source-expression-list>;
```

Chỉ thị này có thể nhận một trong các giá trị sau:

- `'none'`
  - : Không thể đặt URI cơ sở bằng phần tử `<base>`. Dấu nháy đơn là bắt buộc.
- `<source-expression-list>`
  - : Danh sách các giá trị _biểu thức nguồn_ phân cách bằng khoảng trắng. Phần tử `<base>` có thể đặt URI cơ sở nếu giá trị của nó khớp với bất kỳ biểu thức nguồn nào. Đối với chỉ thị này, các giá trị biểu thức nguồn sau đây có thể áp dụng:
    - [`<host-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#host-source)
    - [`<scheme-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#scheme-source)
    - [`'self'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#self)

## Ví dụ

### Cấu hình thẻ meta

```html
<meta http-equiv="Content-Security-Policy" content="base-uri 'self'" />
```

### Cấu hình Apache

```apacheconf
<IfModule mod_headers.c>
Header set Content-Security-Policy "base-uri 'self'";
</IfModule>
```

### Cấu hình Nginx

```nginx
add_header Content-Security-Policy "base-uri 'self';"
```

### Trường hợp vi phạm

Vì tên miền của bạn không phải là `example.com`, phần tử {{HTMLElement("base")}} với `href` được đặt thành `https://example.com` sẽ gây ra vi phạm CSP.

```html example-bad
<meta http-equiv="Content-Security-Policy" content="base-uri 'self'" />
<base href="https://example.com/" />

<!--
// Lỗi: Từ chối đặt URI cơ sở của tài liệu thành 'https://example.com/'
// vì nó vi phạm chỉ thị Content Security Policy sau:
// directive: "base-uri 'self'"
-->
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPheader("Content-Security-Policy")}}
- {{HTMLElement("base")}}
- {{domxref("Node.baseURI")}}
