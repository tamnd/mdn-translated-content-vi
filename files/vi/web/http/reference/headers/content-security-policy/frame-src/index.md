---
title: "Content-Security-Policy: frame-src directive"
short-title: frame-src
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/frame-src
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.frame-src
sidebar: http
---

Chỉ thị **`frame-src`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) chỉ định các nguồn hợp lệ cho các ngữ cảnh duyệt lồng nhau được tải bằng các phần tử như {{HTMLElement("frame")}} và {{HTMLElement("iframe")}}.

> [!NOTE]
> **`frame-src`** cho phép bạn chỉ định nơi các iframe trong một trang có thể được tải từ đâu.
> Điều này khác với **`frame-ancestors`**, cho phép bạn chỉ định nguồn cha nào có thể nhúng một trang.

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
      <th scope="row">Dự phòng</th>
      <td>
        Nếu chỉ thị này vắng mặt thì trình duyệt sẽ tìm kiếm chỉ thị
        {{CSP("child-src")}} (chỉ thị này dự phòng sang chỉ thị
        {{CSP("default-src")}}).
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: frame-src 'none';
Content-Security-Policy: frame-src <source-expression-list>;
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
Content-Security-Policy: frame-src https://example.com/
```

{{HTMLElement("iframe")}} sau bị chặn và sẽ không tải:

```html
<iframe src="https://not-example.com/"></iframe>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- {{HTMLElement("frame")}} và {{HTMLElement("iframe")}}
- {{CSP("frame-ancestors")}}
