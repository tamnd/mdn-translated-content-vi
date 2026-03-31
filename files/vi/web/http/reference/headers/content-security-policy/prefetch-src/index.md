---
title: "Content-Security-Policy: prefetch-src directive"
short-title: prefetch-src
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/prefetch-src
page-type: http-csp-directive
status:
  - deprecated
  - non-standard
browser-compat: http.headers.Content-Security-Policy.prefetch-src
sidebar: http
---

{{Deprecated_Header}}{{Non-standard_header}}

Chỉ thị **`prefetch-src`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) chỉ định các tài nguyên hợp lệ có thể được tải trước hoặc kết xuất trước.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Phiên bản CSP</th>
      <td>3</td>
    </tr>
    <tr>
      <th scope="row">Loại chỉ thị</th>
      <td>{{Glossary("Fetch directive")}}</td>
    </tr>
    <tr>
      <th scope="row">Dự phòng {{CSP("default-src")}}</th>
      <td>
        Có. Nếu chỉ thị này vắng mặt thì trình duyệt sẽ tìm kiếm chỉ thị
        <code>default-src</code>.
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: prefetch-src 'none';
Content-Security-Policy: prefetch-src <source-expression-list>;
```

Chỉ thị này có thể nhận một trong các giá trị sau:

- `'none'`
  - : Không có tài nguyên nào thuộc loại này được tải. Dấu nháy đơn là bắt buộc.
- `<source-expression-list>`
  - : Danh sách các giá trị _biểu thức nguồn_ phân cách bằng khoảng trắng. Tài nguyên thuộc loại này có thể được tải nếu chúng khớp với bất kỳ biểu thức nguồn nào. Đối với chỉ thị này, các giá trị biểu thức nguồn sau đây có thể áp dụng:
    - [`<host-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#host-source)
    - [`<scheme-source>`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#scheme-source)
    - [`'self'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#self)

## Ví dụ

### Tài nguyên prefetch không khớp với tiêu đề

Với một trang có Content Security Policy sau:

```http
Content-Security-Policy: prefetch-src https://example.com/
```

Các lần tải cho mã sau sẽ trả về lỗi mạng vì các URL được cung cấp không khớp với danh sách nguồn của `prefetch-src`:

```html
<link rel="prefetch" href="https://example.org/" />
<link rel="prerender" href="https://example.org/" />
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
