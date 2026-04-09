---
title: "<nav>: The Navigation Section element"
slug: Web/HTML/Reference/Elements/nav
page-type: html-element
browser-compat: html.elements.nav
sidebar: htmlsidebar
---

Phần tử **`<nav>`** trong [HTML](/en-US/docs/Web/HTML) biểu diễn một section của trang có mục đích cung cấp các liên kết điều hướng, trong tài liệu hiện tại hoặc đến các tài liệu khác. Các ví dụ phổ biến về các section điều hướng là menu, mục lục và chỉ mục.

{{InteractiveExample("HTML Demo: &lt;nav&gt;", "tabbed-standard")}}

```html interactive-example
<nav class="crumbs">
  <ol>
    <li class="crumb"><a href="#">Bikes</a></li>
    <li class="crumb"><a href="#">BMX</a></li>
    <li class="crumb">Jump Bike 3000</li>
  </ol>
</nav>

<h1>Jump Bike 3000</h1>
<p>
  This BMX bike is a solid step into the pro world. It looks as legit as it
  rides and is built to polish your skills.
</p>
```

```css interactive-example
nav {
  border-bottom: 1px solid black;
}

.crumbs ol {
  list-style-type: none;
  padding-left: 0;
}

.crumb {
  display: inline-block;
}

.crumb a::after {
  display: inline-block;
  color: black;
  content: ">";
  font-size: 80%;
  font-weight: bold;
  padding: 0 3px;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

- Không cần thiết tất cả các liên kết phải được chứa trong phần tử `<nav>`. `<nav>` chỉ dành cho một khối liên kết điều hướng lớn; thông thường phần tử {{HTMLElement("footer")}} thường có danh sách các liên kết không cần phải nằm trong phần tử `<nav>`.
- Một tài liệu có thể có nhiều phần tử `<nav>`, ví dụ, một cho điều hướng trang web và một cho điều hướng trong trang. Có thể sử dụng [`aria-labelledby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-labelledby) trong trường hợp như vậy để thúc đẩy khả năng tiếp cận, xem [ví dụ](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements#labeling_section_content).
- Các user agent, chẳng hạn như screen reader nhắm đến người dùng khuyết tật, có thể sử dụng phần tử này để xác định xem có bỏ qua việc hiển thị ban đầu nội dung chỉ điều hướng hay không.

## Ví dụ

Trong ví dụ này, một khối `<nav>` được sử dụng để chứa danh sách không có thứ tự ({{HTMLElement("ul")}}) gồm các liên kết. Với CSS phù hợp, đây có thể được trình bày như thanh bên, thanh điều hướng hoặc menu thả xuống.

```html live-sample___unordered-list
<nav class="menu">
  <ul>
    <li><a href="#">Home</a></li>
    <li><a href="#">About</a></li>
    <li><a href="#">Contact</a></li>
  </ul>
</nav>
```

{{EmbedLiveSample('unordered-list')}}

Ngữ nghĩa của phần tử `nav` là cung cấp các liên kết. Tuy nhiên, một phần tử `nav` không nhất thiết phải chứa danh sách, nó cũng có thể chứa các loại nội dung khác. Trong khối điều hướng này, các liên kết được cung cấp dưới dạng văn xuôi:

```html live-sample___prose
<nav>
  <h2>Navigation</h2>
  <p>
    You are on my home page. To the north lies <a href="/blog">my blog</a>, from
    whence the sounds of battle can be heard. To the east you can see a large
    mountain, upon which many <a href="/school">school papers</a> are littered.
    Far up this mountain you can spy a little figure who appears to be me,
    desperately scribbling a <a href="/school/thesis">thesis</a>.
  </p>
  <p>
    To the west are several exits. One fun-looking exit is labeled
    <a href="https://games.example.com/">"games"</a>. Another more
    boring-looking exit is labeled <a href="https://isp.example.net/">ISP™</a>.
  </p>
  <p>
    To the south lies a dark and dank <a href="/about">contacts page</a>.
    Cobwebs cover its disused entrance, and at one point you see a rat run
    quickly out of the page.
  </p>
</nav>
```

{{EmbedLiveSample('prose')}}

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
          >Nội dung flow</a
        >,
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#sectioning_content"
          >nội dung sectioning</a
        >, nội dung palpable.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung flow</a
        >.
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
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung flow</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/navigation_role"
            >navigation</a
          ></code
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

## Xem thêm

- Các phần tử liên quan đến section khác: {{HTMLElement("body")}}, {{HTMLElement("article")}}, {{HTMLElement("section")}}, {{HTMLElement("aside")}}, {{HTMLElement("Heading_Elements", "h1")}}, {{HTMLElement("Heading_Elements", "h2")}}, {{HTMLElement("Heading_Elements", "h3")}}, {{HTMLElement("Heading_Elements", "h4")}}, {{HTMLElement("Heading_Elements", "h5")}}, {{HTMLElement("Heading_Elements", "h6")}}, {{HTMLElement("hgroup")}}, {{HTMLElement("header")}}, {{HTMLElement("footer")}}, {{HTMLElement("address")}};
- [Các section và outline của tài liệu HTML](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements).
- [ARIA: Navigation role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/navigation_role)
