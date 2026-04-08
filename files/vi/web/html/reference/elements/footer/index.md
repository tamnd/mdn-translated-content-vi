---
title: "<footer>: The Footer element"
slug: Web/HTML/Reference/Elements/footer
page-type: html-element
browser-compat: html.elements.footer
sidebar: htmlsidebar
---

Phần tử **`<footer>`** trong [HTML](/en-US/docs/Web/HTML) biểu diễn footer cho phần tử tổ tiên [nội dung sectioning](/en-US/docs/Web/HTML/Guides/Content_categories#sectioning_content) hoặc [sectioning root](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements#labeling_section_content) gần nhất của nó. Một `<footer>` thường chứa thông tin về tác giả của section, dữ liệu bản quyền hoặc các liên kết đến các tài liệu liên quan.

{{InteractiveExample("HTML Demo: &lt;footer&gt;", "tabbed-standard")}}

```html interactive-example
<article>
  <h1>How to be a wizard</h1>
  <ol>
    <li>Grow a long, majestic beard.</li>
    <li>Wear a tall, pointed hat.</li>
    <li>Have I mentioned the beard?</li>
  </ol>
  <footer>
    <p>© 2018 Gandalf</p>
  </footer>
</article>
```

```css interactive-example
article {
  min-height: 100%;
  display: grid;
  grid-template-rows: auto 1fr auto;
}

footer {
  display: flex;
  justify-content: center;
  padding: 5px;
  background-color: #45a1ff;
  color: white;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

- Đặt thông tin về tác giả trong phần tử {{HTMLElement("address")}} có thể được bao gồm trong phần tử `<footer>`.
- Khi phần tử sectioning content hoặc sectioning root tổ tiên gần nhất là phần tử body, footer áp dụng cho toàn bộ trang.
- Phần tử `<footer>` không phải là nội dung sectioning và do đó không giới thiệu một section mới trong [outline](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements).

## Khả năng tiếp cận

Trước khi phát hành Safari 13, vai trò landmark `contentinfo` không được VoiceOver hiển thị đúng cách. Nếu cần hỗ trợ các trình duyệt Safari cũ, hãy thêm `role="contentinfo"` vào phần tử `footer` để đảm bảo landmark sẽ được hiển thị đúng cách.

- Liên quan: [WebKit Bugzilla: 146930 – AX: HTML native elements (header, footer, main, aside, nav) should work the same as ARIA landmarks, sometimes they don't](https://webkit.org/b/146930)

## Ví dụ

```html
<body>
  <h3>FIFA World Cup top goalscorers</h3>
  <ol>
    <li>Miroslav Klose, 16</li>
    <li>Ronaldo Nazário, 15</li>
    <li>Gerd Müller, 14</li>
  </ol>

  <footer>
    <small>
      Copyright © 2023 Football History Archives. All Rights Reserved.
    </small>
  </footer>
</body>
```

```css
footer {
  text-align: center;
  padding: 5px;
  background-color: #abbaba;
  color: black;
}
```

{{EmbedLiveSample('Examples')}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories">Danh mục nội dung</a>
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung flow</a>, nội dung palpable.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">Nội dung flow</a>, nhưng không có phần tử con <code>&#x3C;footer></code> hay
        {{HTMLElement("header")}}.
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
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">nội dung flow</a>. Lưu ý rằng phần tử <code>&#x3C;footer></code> không được là
        phần tử con của {{HTMLElement("address")}},
        {{HTMLElement("header")}} hoặc phần tử
        <code>&#x3C;footer></code> khác.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/contentinfo_role">contentinfo</a>, hoặc
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role">generic</a>
        nếu là phần tử con của
        <a href="/en-US/docs/Web/HTML/Reference/Elements/article">article</a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/aside">aside</a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/main">main</a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/nav">nav</a> hoặc
        <a href="/en-US/docs/Web/HTML/Reference/Elements/section">section</a> element, hoặc
        một phần tử với
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/article_role">article</a></code>,
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/complementary_role">complementary</a></code>,
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/main_role">main</a></code>,
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/navigation_role">navigation</a></code>
        hoặc
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/region_role">region</a></code> role
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role"><code>group</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a> hoặc
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>
      </td>
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

- Các phần tử liên quan đến section khác: {{HTMLElement("body")}}, {{HTMLElement("nav")}}, {{HTMLElement("article")}}, {{HTMLElement("aside")}}, {{HTMLElement("Heading_Elements", "h1")}}, {{HTMLElement("Heading_Elements", "h2")}}, {{HTMLElement("Heading_Elements", "h3")}}, {{HTMLElement("Heading_Elements", "h4")}}, {{HTMLElement("Heading_Elements", "h5")}}, {{HTMLElement("Heading_Elements", "h6")}}, {{HTMLElement("hgroup")}}, {{HTMLElement("header")}}, {{HTMLElement("section")}}, {{HTMLElement("address")}};
- [Sử dụng các section và outline HTML](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements)
- [ARIA: Contentinfo role](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/contentinfo_role)
