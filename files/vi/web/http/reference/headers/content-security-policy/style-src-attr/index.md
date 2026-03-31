---
title: "Content-Security-Policy: style-src-attr directive"
short-title: style-src-attr
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/style-src-attr
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.style-src-attr
sidebar: http
---

Chỉ thị **`style-src-attr`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) chỉ định các nguồn hợp lệ cho các style nội tuyến được áp dụng cho các phần tử DOM riêng lẻ.

Chỉ thị này không đặt các nguồn hợp lệ cho các phần tử {{HTMLElement("style")}} và các phần tử {{HTMLElement("link")}} với `rel="stylesheet"`.
Chúng được đặt bằng {{CSP("style-src-elem")}} (và các nguồn hợp lệ cho tất cả style có thể được đặt bằng {{CSP("style-src")}}).

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
        <p>
          Có.
          Nếu chỉ thị này vắng mặt thì trình duyệt sẽ tìm kiếm chỉ thị {{CSP("style-src")}}, và nếu cả hai đều vắng mặt thì dự phòng sang chỉ thị <code>default-src</code>.
        </p>
      </td>
    </tr>
  </tbody>
</table>

## Cú pháp

```http
Content-Security-Policy: style-src-attr 'none';
Content-Security-Policy: style-src-attr <source-expression-list>;
```

Chỉ thị này có thể nhận một trong các giá trị sau:

- `'none'`
  - : Không có tài nguyên nào thuộc loại này được tải. Dấu nháy đơn là bắt buộc.
- `<source-expression-list>`
  - : Danh sách các giá trị _biểu thức nguồn_ phân cách bằng khoảng trắng. Tài nguyên thuộc loại này có thể được tải nếu chúng khớp với bất kỳ biểu thức nguồn nào. Đối với chỉ thị này, các giá trị biểu thức nguồn sau đây có thể áp dụng:
    - [`'unsafe-hashes'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-hashes)
    - [`'unsafe-inline'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-inline)
    - [`'report-sample'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#report-sample)

`style-src-attr` có thể được sử dụng kết hợp với {{CSP("style-src")}}:

```http
Content-Security-Policy: style-src <source>;
Content-Security-Policy: style-src-attr <source>;
```

## Ví dụ

### Trường hợp vi phạm

Với tiêu đề CSP này:

```http
Content-Security-Policy: style-src-attr 'none'
```

…style nội tuyến áp dụng cho phần tử bên dưới sẽ không được áp dụng:

```html
<div style="display:none">Foo</div>
```

Chính sách này cũng sẽ chặn bất kỳ style nào được áp dụng trong JavaScript bằng cách đặt thuộc tính `style` trực tiếp, hoặc bằng cách đặt {{domxref("CSSStyleDeclaration.cssText", "cssText")}}:

```js
document.querySelector("div").setAttribute("style", "display:none;");
document.querySelector("div").style.cssText = "display:none;";
```

Các thuộc tính style được đặt trực tiếp trên thuộc tính {{domxref("HTMLElement/style", "style")}} của phần tử sẽ không bị chặn, cho phép người dùng an toàn thao tác style qua JavaScript:

```js
document.querySelector("div").style.display = "none";
```

Lưu ý rằng việc sử dụng JavaScript có thể độc lập bị chặn bằng chỉ thị CSP {{CSP("script-src")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- {{CSP("style-src")}}
- {{CSP("style-src-elem")}}
- Tiêu đề {{HTTPHeader("Link")}}
- {{HTMLElement("style")}}, {{HTMLElement("link")}}
- {{cssxref("@import")}}
- {{domxref("CSSStyleSheet.insertRule()")}}
- {{domxref("CSSGroupingRule.insertRule()")}}
- {{domxref("CSSStyleDeclaration.cssText")}}
