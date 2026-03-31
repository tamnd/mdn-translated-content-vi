---
title: "Content-Security-Policy: object-src directive"
short-title: object-src
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/object-src
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.object-src
sidebar: http
---

Chỉ thị **`object-src`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} chỉ định các nguồn hợp lệ cho các phần tử {{HTMLElement("object")}} và {{HTMLElement("embed")}}.

> [!NOTE]
> Các phần tử được kiểm soát bởi `object-src` có thể trùng hợp được coi là các phần tử HTML kế thừa và không nhận được các tính năng được chuẩn hóa mới (chẳng hạn như các thuộc tính bảo mật `sandbox` hoặc `allow` cho `<iframe>`). Do đó, [khuyến nghị](https://csp.withgoogle.com/docs/strict-csp.html) hạn chế chỉ thị fetch này (ví dụ: đặt rõ ràng `object-src 'none'` nếu có thể).

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
Content-Security-Policy: object-src 'none';
Content-Security-Policy: object-src <source-expression-list>;
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
Content-Security-Policy: object-src https://example.com/
```

Các phần tử {{HTMLElement("object")}} và {{HTMLElement("embed")}} sau bị chặn và sẽ không tải:

```html
<embed src="https://not-example.com/flash" />
<object data="https://not-example.com/plugin"></object>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- {{HTMLElement("object")}} và {{HTMLElement("embed")}}
