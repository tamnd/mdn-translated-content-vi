---
title: "<noscript>: The Noscript element"
slug: Web/HTML/Reference/Elements/noscript
page-type: html-element
browser-compat: html.elements.noscript
sidebar: htmlsidebar
---

Phần tử **`<noscript>`** trong [HTML](/en-US/docs/Web/HTML) định nghĩa một phần HTML được chèn vào nếu loại script trên trang không được hỗ trợ hoặc nếu scripting hiện đang bị tắt trong trình duyệt.

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ví dụ

```html
<noscript>
  <!-- anchor linking to external file -->
  <a href="https://www.mozilla.org/">External Link</a>
</noscript>
<p>Rocks!</p>
```

### Kết quả khi scripting được bật

Rocks!

### Kết quả khi scripting bị tắt

[External Link](https://www.mozilla.org/)

Rocks!

## Ghi chú sử dụng

Phần tử `<noscript>` biểu diễn các phần tử con của nó theo cách khác nhau tùy thuộc vào việc scripting có được bật hay không:

- Nếu scripting bị tắt, phần tử `<noscript>` biểu diễn các phần tử con của nó như là [nội dung HTML](/en-US/docs/Web/API/HTMLElement).
- Nếu scripting được bật, phần tử `<noscript>` biểu diễn các phần tử con của nó như là [text](/en-US/docs/Web/API/Text).

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#metadata_content"
          >Nội dung metadata</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung flow</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung phrasing</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        Khi scripting bị tắt và khi là phần tử con của
        {{HTMLElement("head")}}: theo bất kỳ thứ tự nào, không hoặc nhiều
        phần tử {{HTMLElement("link")}}, không hoặc nhiều
        phần tử {{HTMLElement("style")}}, và không hoặc nhiều
        phần tử {{HTMLElement("meta")}}.<br />Khi scripting bị
        tắt và khi không phải là phần tử con của
        {{HTMLElement("head")}}: bất kỳ
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#transparent_content_model"
          >nội dung transparent</a
        >, nhưng không có phần tử <code>&#x3C;noscript></code> nào trong số các phần tử con
        của nó.<br />Ngược lại: nội dung flow hoặc nội dung phrasing.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung phrasing</a
        >, nếu không có phần tử <code>&#x3C;noscript></code> tổ tiên, hoặc trong
        phần tử {{HTMLElement("head")}} (nhưng chỉ đối với tài liệu HTML),
        ở đây một lần nữa nếu không có phần tử
        <code>&#x3C;noscript></code> tổ tiên.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> nào được phép</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
