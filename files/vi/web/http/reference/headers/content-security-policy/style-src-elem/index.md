---
title: "Content-Security-Policy: style-src-elem directive"
short-title: style-src-elem
slug: Web/HTTP/Reference/Headers/Content-Security-Policy/style-src-elem
page-type: http-csp-directive
browser-compat: http.headers.Content-Security-Policy.style-src-elem
sidebar: http
---

Chỉ thị **`style-src-elem`** trong HTTP {{HTTPHeader("Content-Security-Policy")}} (CSP) chỉ định các nguồn hợp lệ cho các phần tử stylesheet {{HTMLElement("style")}} và các phần tử {{HTMLElement("link")}} với `rel="stylesheet"`.

Chỉ thị này không đặt các nguồn hợp lệ cho các thuộc tính style nội tuyến; chúng được đặt bằng {{CSP("style-src-attr")}} (và các nguồn hợp lệ cho tất cả style có thể được đặt bằng {{CSP("style-src")}}).

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
Content-Security-Policy: style-src-elem 'none';
Content-Security-Policy: style-src-elem <source-expression-list>;
```

Chỉ thị này có thể nhận một trong các giá trị sau:

- `'none'`
  - : Không có tài nguyên nào thuộc loại này được tải. Dấu nháy đơn là bắt buộc.
- `<source-expression-list>`
  - : Danh sách các giá trị _biểu thức nguồn_ phân cách bằng khoảng trắng. Tài nguyên thuộc loại này có thể được tải nếu chúng khớp với bất kỳ biểu thức nguồn nào. Đối với chỉ thị này, các giá trị biểu thức nguồn tương tự như đối với [`style-src`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/style-src) đều có thể áp dụng, ngoại trừ [`'unsafe-hashes'`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy#unsafe-hashes).

`style-src-elem` có thể được sử dụng kết hợp với {{CSP("style-src")}}:

```http
Content-Security-Policy: style-src <source>;
Content-Security-Policy: style-src-elem <source>;
```

## Ví dụ

### Trường hợp vi phạm

Với tiêu đề CSP này:

```http
Content-Security-Policy: style-src-elem https://example.com/
```

…các stylesheet sau bị chặn và sẽ không tải:

```html
<link href="https://not-example.com/styles/main.css" rel="stylesheet" />

<style>
  #inline-style {
    background: red;
  }
</style>

<style>
  @import "https://not-example.com/styles/print.css" print;
</style>
```

…cũng như các style được tải bằng tiêu đề {{HTTPHeader("Link")}}:

```http
Link: <https://not-example.com/styles/stylesheet.css>;rel=stylesheet
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Content-Security-Policy")}}
- {{CSP("style-src")}}
- {{CSP("style-src-attr")}}
- Tiêu đề {{HTTPHeader("Link")}}
- {{HTMLElement("style")}}, {{HTMLElement("link")}}
- {{cssxref("@import")}}
- {{domxref("CSSStyleSheet.insertRule()")}}
- {{domxref("CSSGroupingRule.insertRule()")}}
- {{domxref("CSSStyleDeclaration.cssText")}}
