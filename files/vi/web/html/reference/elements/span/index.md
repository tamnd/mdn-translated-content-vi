---
title: "<span>: The Content Span element"
slug: Web/HTML/Reference/Elements/span
page-type: html-element
browser-compat: html.elements.span
sidebar: htmlsidebar
---

Phần tử **`<span>`** trong [HTML](/en-US/docs/Web/HTML) là một vùng chứa nội tuyến chung cho nội dung cụm từ, không tự nó đại diện cho bất kỳ điều gì. Nó có thể được dùng để nhóm các phần tử lại để tạo kiểu dáng (sử dụng các thuộc tính [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class) hoặc [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id)), hoặc vì chúng chia sẻ giá trị thuộc tính, chẳng hạn như [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang). Nó chỉ nên được dùng khi không có phần tử ngữ nghĩa nào khác phù hợp. `<span>` rất giống với phần tử {{HTMLElement("div")}}, nhưng {{HTMLElement("div")}} là [phần tử cấp khối](/en-US/docs/Glossary/Block-level_content) trong khi `<span>` là [phần tử cấp nội tuyến](/en-US/docs/Glossary/Inline-level_content).

{{InteractiveExample("HTML Demo: &lt;span&gt;", "tabbed-shorter")}}

```html interactive-example
<p>
  Add the <span class="ingredient">basil</span>,
  <span class="ingredient">pine nuts</span> and
  <span class="ingredient">garlic</span> to a blender and blend into a paste.
</p>

<p>
  Gradually add the <span class="ingredient">olive oil</span> while running the
  blender slowly.
</p>
```

```css interactive-example
span.ingredient {
  color: red;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ví dụ

### Ví dụ 1

#### HTML

```html
<p><span>Some text</span></p>
```

#### Kết quả

{{EmbedLiveSample('Example_1')}}

### Ví dụ 2

#### HTML

```html
<li>
  <span>
    <a href="portfolio.html" target="_blank">See my portfolio</a>
  </span>
</li>
```

#### CSS

```css
li span {
  background: gold;
}
```

#### Kết quả

{{EmbedLiveSample('Example_2')}}

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
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ thẻ</th>
      <td>Không được phép, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
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
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>
        {{domxref("HTMLSpanElement")}}
      </td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{HTMLElement("div")}}
