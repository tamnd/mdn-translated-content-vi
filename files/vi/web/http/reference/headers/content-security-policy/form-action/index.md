---
title: "Content-Security-Policy: form-action directive"
short-title: form-action
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/form-action
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.form-action
sidebar: http
---

Chỉ thị **`form-action`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) giới hạn các URL có thể được sử dụng làm mục tiêu gửi biểu mẫu từ ngữ cảnh nhất định.

> [!WARNING]
> Liệu `form-action` có nên chặn các chuyển hướng sau khi gửi biểu mẫu hay không vẫn còn [đang tranh luận](https://github.com/w3c/webappsec-csp/issues/8) và cách triển khai trong trình duyệt của khía cạnh này không nhất quán (ví dụ: Firefox 57 không chặn các chuyển hướng trong khi Chrome 63 thì có).

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
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: form-action 'none';
Content-Security-Policy: form-action <source-expression-list>;
```

Chỉ thị này có thể nhận một trong các giá trị sau:

- `'none'`
  - : Không được phép gửi biểu mẫu. Dấu nháy đơn là bắt buộc.
- `<source-expression-list>`
  - : Danh sách các giá trị _biểu thức nguồn_ phân cách bằng khoảng trắng. Biểu mẫu có thể được gửi đến các URL khớp với bất kỳ biểu thức nguồn nào. Đối với chỉ thị này, các giá trị biểu thức nguồn sau đây có thể áp dụng:
    - [`<host-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#host-source)
    - [`<scheme-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#scheme-source)
    - [`'self'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#self)

## Ví dụ

### Cấu hình thẻ meta

```html
<meta http-equiv="Content-Security-Policy" content="form-action 'none'" />
```

### Cấu hình Apache

```apacheconf
<IfModule mod_headers.c>
  Header set Content-Security-Policy "form-action 'none';"
</IfModule>
```

### Cấu hình Nginx

```nginx
add_header Content-Security-Policy "form-action 'none';"
```

### Trường hợp vi phạm

Sử dụng phần tử {{HTMLElement("form")}} với thuộc tính action đặt thành JavaScript nội tuyến sẽ gây ra vi phạm CSP.

```html example-bad
<meta http-equiv="Content-Security-Policy" content="form-action 'none'" />

<form action="javascript:alert('Foo')" id="form1" method="post">
  <input type="text" name="fieldName" value="fieldValue" />
  <input type="submit" id="submit" value="submit" />
</form>

<!--
// Lỗi: Từ chối gửi dữ liệu biểu mẫu vì nó vi phạm chỉ thị
// Content Security Policy sau: "form-action 'none'".
-->
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPheader("Content-Security-Policy")}}
- {{HTMLElement("form")}}
