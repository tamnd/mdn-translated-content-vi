---
title: "Content-Security-Policy: manifest-src directive"
short-title: manifest-src
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/manifest-src
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.manifest-src
sidebar: http
---

Chỉ thị **`manifest-src`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} chỉ định các [manifest](/en-US/docs/Web/Progressive_web_apps/Manifest) có thể áp dụng cho tài nguyên.

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
Content-Security-Policy: manifest-src 'none';
Content-Security-Policy: manifest-src <source-expression-list>;
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

### Trường hợp vi phạm

Với tiêu đề CSP này:

```http
Content-Security-Policy: manifest-src https://example.com/
```

{{HTMLElement("link")}} sau bị chặn và sẽ không tải:

```html
<link rel="manifest" href="https://not-example.com/manifest" />
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- [Web app manifest](/en-US/docs/Web/Progressive_web_apps/Manifest)
- {{HTMLElement("link")}}
