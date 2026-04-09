---
title: "<head>: The Document Metadata (Header) element"
slug: Web/HTML/Reference/Elements/head
page-type: html-element
browser-compat: html.elements.head
sidebar: htmlsidebar
---

Phần tử **`<head>`** [HTML](/en-US/docs/Web/HTML) chứa thông tin có thể đọc được bằng máy ({{glossary("metadata")}}) về tài liệu, như [tiêu đề](/en-US/docs/Web/HTML/Reference/Elements/title), [scripts](/en-US/docs/Web/HTML/Reference/Elements/script) và [style sheets](/en-US/docs/Web/HTML/Reference/Elements/style) của tài liệu. Chỉ có thể có một phần tử `<head>` trong một tài liệu HTML.

> [!NOTE]
> `<head>` chủ yếu chứa thông tin để xử lý bằng máy, không phải để con người đọc. Đối với thông tin có thể nhìn thấy bởi con người, như tiêu đề cấp cao nhất và danh sách tác giả, hãy xem phần tử {{HTMLElement("header")}}.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `profile` {{deprecated_inline}}
  - : {{glossary("URI")}} của một hoặc nhiều metadata profile, được phân tách bằng {{Glossary("whitespace", "khoảng trắng")}}.

## Ví dụ

```html
<!doctype html>
<html lang="en-US">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width" />
    <title>Document title</title>
  </head>
</html>
```

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>Không có.</td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <p>
          Nếu tài liệu là tài liệu {{HTMLElement("iframe")}}
          <a href="/en-US/docs/Web/HTML/Reference/Elements/iframe#srcdoc"><code>srcdoc</code></a>, hoặc nếu thông tin tiêu đề có từ giao thức cấp cao hơn (như
          dòng chủ đề trong email HTML), không có hoặc nhiều phần tử của nội dung metadata.
        </p>
        <p>
          Nếu không, một hoặc nhiều phần tử của nội dung metadata trong đó chính xác một là phần tử {{HTMLElement("title")}}.
        </p>
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở có thể bỏ qua nếu thứ đầu tiên bên trong phần tử
        <code>&#x3C;head></code> là một phần tử.<br />Thẻ đóng có thể bỏ qua nếu thứ đầu tiên theo sau phần tử
        <code>&#x3C;head></code> không phải là ký tự khoảng trắng hoặc comment.
      </td>
    </tr>
    <tr>
      <th scope="row">Cha được phép</th>
      <td>Phần tử {{HTMLElement("html")}}, như con đầu tiên của nó.</td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ẩn</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLHeadElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử có thể được sử dụng bên trong `<head>`:
  - {{HTMLElement("title")}}
  - {{HTMLElement("base")}}
  - {{HTMLElement("link")}}
  - {{HTMLElement("style")}}
  - {{HTMLElement("meta")}}
  - {{HTMLElement("script")}}
  - {{HTMLElement("noscript")}}
  - {{HTMLElement("template")}}
