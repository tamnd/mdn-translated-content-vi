---
title: "Content-Security-Policy: font-src directive"
short-title: font-src
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/font-src
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.font-src
sidebar: http
---

Chỉ thị **`font-src`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) chỉ định các nguồn hợp lệ cho các font được tải bằng {{cssxref("@font-face")}}.

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Phiên bản CSP</th>
      <td>1</td>
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
Content-Security-Policy: font-src 'none';
Content-Security-Policy: font-src <source-expression-list>;
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
Content-Security-Policy: font-src https://example.com/
```

Việc tải tài nguyên font sau bị chặn và sẽ không tải:

```html
<style>
  @font-face {
    font-family: "MyFont";
    src: url("https://not-example.com/font");
  }
  body {
    font-family: "MyFont";
  }
</style>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- {{cssxref("@font-face")}}
