---
title: "<small>: The Side Comment element"
slug: Web/HTML/Reference/Elements/small
page-type: html-element
browser-compat: html.elements.small
sidebar: htmlsidebar
---

Phần tử **`<small>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho các nhận xét phụ và chữ nhỏ, như bản quyền và văn bản pháp lý, độc lập với cách trình bày theo kiểu dáng của nó. Theo mặc định, nó hiển thị văn bản bên trong với cỡ chữ nhỏ hơn một cấp, ví dụ từ `small` xuống `x-small`.

{{InteractiveExample("HTML Demo: &lt;small&gt;", "tabbed-shorter")}}

```html interactive-example
<p>
  MDN Web Docs is a learning platform for Web technologies and the software that
  powers the Web.
</p>

<hr />

<p>
  <small
    >The content is licensed under a Creative Commons Attribution-ShareAlike 2.5
    Generic License.</small
  >
</p>
```

```css interactive-example
small {
  font-size: 0.7em;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ví dụ

### Sử dụng cơ bản

```html
<p>
  This is the first sentence.
  <small>This whole sentence is in small letters.</small>
</p>
```

#### Kết quả

{{EmbedLiveSample("Basic_usage")}}

### Thay thế CSS

```html
<p>
  This is the first sentence.
  <span class="small">This whole sentence is in small letters.</span>
</p>
```

```css
.small {
  font-size: 0.8em;
}
```

#### Kết quả

{{EmbedLiveSample("CSS_alternative")}}

## Ghi chú

Mặc dù phần tử `<small>`, giống như các phần tử {{htmlelement("b")}} và {{htmlelement("i")}}, có thể bị coi là vi phạm nguyên tắc phân tách giữa cấu trúc và trình bày, cả ba đều hợp lệ trong HTML. Các tác giả được khuyến khích sử dụng phán đoán tốt nhất của mình khi quyết định có nên dùng `<small>` hay CSS.

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
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ thẻ</th>
      <td>Không được phép; phải có cả thẻ mở và thẻ đóng.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >, hoặc bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role"
            >generic</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("b")}}
- {{HTMLElement("sub")}} và {{HTMLElement("sup")}}
- {{HTMLElement("font")}}
- {{HTMLElement("style")}}
