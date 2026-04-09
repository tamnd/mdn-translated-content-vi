---
title: "<html>: The HTML Document / Root element"
slug: Web/HTML/Reference/Elements/html
page-type: html-element
browser-compat: html.elements.html
sidebar: htmlsidebar
---

Phần tử **`<html>`** [HTML](/en-US/docs/Web/HTML) đại diện cho gốc (phần tử cấp cao nhất) của một tài liệu HTML, vì vậy nó còn được gọi là _phần tử gốc_. Tất cả các phần tử khác phải là con của phần tử này. Chỉ có thể có một phần tử `<html>` trong một tài liệu.

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `version` {{deprecated_inline}}
  - : Chỉ định phiên bản của {{glossary("Doctype", "Document Type Definition")}} HTML quản lý tài liệu hiện tại. Thuộc tính này không cần thiết vì nó dư thừa với thông tin phiên bản trong khai báo loại tài liệu.
- `xmlns`
  - : Chỉ định {{glossary("Namespace")}} {{glossary("XML")}} của tài liệu. Giá trị mặc định là `"http://www.w3.org/1999/xhtml"`. Điều này được yêu cầu trong các tài liệu được phân tích cú pháp bằng {{glossary("parser", "parsers")}} XML, và tùy chọn trong các tài liệu text/html.

## Khả năng tiếp cận

Mặc dù HTML không yêu cầu tác giả chỉ định thẻ mở và thẻ đóng của phần tử `<html>`, nhưng điều quan trọng là tác giả nên làm vậy vì điều đó sẽ cho phép họ chỉ định [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) cho trang web. Cung cấp thuộc tính `lang` với {{glossary("BCP 47 language tag")}} hợp lệ trên phần tử `<html>` sẽ giúp công nghệ đọc màn hình xác định ngôn ngữ phù hợp để thông báo. Thẻ ngôn ngữ nhận dạng nên mô tả ngôn ngữ được sử dụng bởi phần lớn nội dung của trang. Nếu không có nó, trình đọc màn hình thường mặc định theo ngôn ngữ được đặt của hệ điều hành, có thể gây ra phát âm sai.

Bao gồm khai báo `lang` hợp lệ trên phần tử `<html>` cũng đảm bảo rằng các metadata quan trọng có trong {{HTMLElement("head")}} của trang, chẳng hạn như {{HTMLElement("title")}} của trang, cũng được thông báo đúng cách.

- [MDN Understanding WCAG, Guideline 3.1 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Understandable#guideline_3.1_%e2%80%94_readable_make_text_content_readable_and_understandable)
- [Understanding Success Criterion 3.1.1 | W3C Understanding WCAG 2.1](https://www.w3.org/WAI/WCAG21/Understanding/language-of-page.html)

## Ví dụ

```html
<!doctype html>
<html lang="en">
  <head>
    <!-- … -->
  </head>
  <body>
    <!-- … -->
  </body>
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
        Một phần tử {{HTMLElement("head")}}, theo sau là một
        phần tử {{HTMLElement("body")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở có thể bỏ qua nếu thứ đầu tiên bên trong phần tử
        <code>&#x3C;html></code> không phải là comment.<br>Thẻ đóng có thể
        bỏ qua nếu phần tử <code>&#x3C;html></code> không được theo sau ngay
        bởi comment.
      </td>
    </tr>
    <tr>
      <th scope="row">Cha được phép</th>
      <td>Không có. Đây là phần tử gốc của tài liệu.</td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ẩn</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/document_role"
          >document</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLHtmlElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử cấp cao nhất MathML: {{MathMLElement("math")}}
- Phần tử cấp cao nhất SVG: {{SVGElement("svg")}}
