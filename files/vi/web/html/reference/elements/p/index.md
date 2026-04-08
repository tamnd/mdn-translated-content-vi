---
title: "<p>: Phần tử Đoạn văn"
slug: Web/HTML/Reference/Elements/p
page-type: html-element
browser-compat: html.elements.p
sidebar: htmlsidebar
---

Phần tử **`<p>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho một đoạn văn. Các đoạn văn thường được thể hiện trong phương tiện trực quan dưới dạng các khối văn bản được phân tách khỏi các khối liền kề bằng các dòng trống và/hoặc thụt lề dòng đầu tiên, nhưng các đoạn văn HTML có thể là bất kỳ nhóm cấu trúc nào của nội dung liên quan, chẳng hạn như hình ảnh hoặc các trường biểu mẫu.

Các đoạn văn là [phần tử cấp khối](/en-US/docs/Glossary/Block-level_content), và đáng chú ý là sẽ tự động đóng nếu một phần tử cấp khối khác được phân tích trước thẻ đóng `</p>`. Xem phần "Bỏ qua thẻ" bên dưới.

{{InteractiveExample("HTML Demo: &lt;p&gt;", "tabbed-standard")}}

```html interactive-example
<p>
  Geckos are a group of usually small, usually nocturnal lizards. They are found
  on every continent except Antarctica.
</p>

<p>
  Some species live in houses where they hunt insects attracted by artificial
  light.
</p>
```

```css interactive-example
p {
  margin: 10px 0;
  padding: 5px;
  border: 1px solid #999999;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

> [!NOTE]
> Thuộc tính `align` trên thẻ `<p>` đã lỗi thời và không nên được sử dụng.

## Khả năng tiếp cận

Chia nội dung thành các đoạn văn giúp trang trở nên dễ tiếp cận hơn. Trình đọc màn hình và các công nghệ hỗ trợ khác cung cấp các phím tắt để cho phép người dùng bỏ qua đến đoạn tiếp theo hoặc trước đó, giúp họ duyệt qua nội dung giống như cách khoảng trắng cho phép người dùng thị giác di chuyển.

Sử dụng các phần tử `<p>` trống để thêm khoảng cách giữa các đoạn văn gây ra vấn đề cho những người điều hướng bằng công nghệ đọc màn hình. Trình đọc màn hình có thể thông báo sự hiện diện của đoạn văn, nhưng không có nội dung nào chứa bên trong — vì không có gì cả. Điều này có thể gây nhầm lẫn và bực bội cho người dùng trình đọc màn hình.

Nếu muốn thêm khoảng cách, hãy sử dụng các thuộc tính {{glossary("CSS")}} như {{cssxref("margin")}} để tạo hiệu ứng:

```css
p {
  margin-bottom: 2em; /* tăng khoảng trắng sau một đoạn văn */
}
```

## Ví dụ

### HTML

```html
<p>
  This is the first paragraph of text. This is the first paragraph of text. This
  is the first paragraph of text. This is the first paragraph of text.
</p>
<p>
  This is the second paragraph. This is the second paragraph. This is the second
  paragraph. This is the second paragraph.
</p>
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Định dạng đoạn văn

Theo mặc định, trình duyệt phân tách các đoạn văn bằng một dòng trống. Các phương pháp phân tách thay thế, chẳng hạn như thụt lề dòng đầu tiên, có thể đạt được bằng {{glossary("CSS")}}:

### HTML

```html
<p>
  Separating paragraphs with blank lines is easiest for readers to scan, but
  they can also be separated by indenting their first lines. This is often used
  to take up less space, such as to save paper in print.
</p>

<p>
  Writing that is intended to be edited, such as school papers and rough drafts,
  uses both blank lines and indentation for separation. In finished works,
  combining both is considered redundant and amateurish.
</p>

<p>
  In very old writing, paragraphs were separated with a special character: ¶,
  the <i>pilcrow</i>. Nowadays, this is considered claustrophobic and hard to
  read.
</p>

<p>
  How hard to read? See for yourself:
  <button data-toggle-text="Oh no! Switch back!">
    Use pilcrow for paragraphs
  </button>
</p>
```

### CSS

```css
p {
  margin: 0;
  text-indent: 3ch;
}

p.pilcrow {
  text-indent: 0;
  display: inline;
}
p.pilcrow + p.pilcrow::before {
  content: " ¶ ";
}
```

### JavaScript

```js
document.querySelector("button").addEventListener("click", (event) => {
  document.querySelectorAll("p").forEach((paragraph) => {
    paragraph.classList.toggle("pilcrow");
  });

  [event.target.innerText, event.target.dataset.toggleText] = [
    event.target.dataset.toggleText,
    event.target.innerText,
  ];
});
```

### Kết quả

{{EmbedLiveSample('Styling_paragraphs')}}

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
        >, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung diễn đạt</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ mở là bắt buộc. Thẻ đóng có thể bị bỏ qua nếu phần tử
        <code>&lt;p&gt;</code> ngay sau đó là một phần tử
        {{HTMLElement("address")}},
        {{HTMLElement("article")}}, {{HTMLElement("aside")}},
        {{HTMLElement("blockquote")}}, {{HTMLElement("details")}}, {{HTMLElement("div")}},
        {{HTMLElement("dl")}}, {{HTMLElement("fieldset")}},
        {{HTMLElement("figcaption")}}, {{HTMLElement("figure")}},
        {{HTMLElement("footer")}}, {{HTMLElement("form")}},
        {{HTMLElement("Heading_Elements", "h1")}}, {{HTMLElement("Heading_Elements", "h2")}},
        {{HTMLElement("Heading_Elements", "h3")}}, {{HTMLElement("Heading_Elements", "h4")}},
        {{HTMLElement("Heading_Elements", "h5")}}, {{HTMLElement("Heading_Elements", "h6")}},
        {{HTMLElement("header")}}, {{HTMLElement("hgroup")}}, {{HTMLElement("hr")}},
        {{HTMLElement("main")}}, {{HTMLElement("menu")}}, {{HTMLElement("nav")}},
        {{HTMLElement("ol")}}, {{HTMLElement("pre")}}, {{HTMLElement("search")}},
        {{HTMLElement("section")}}, {{HTMLElement("table")}},
        {{HTMLElement("ul")}} hoặc một phần tử <code>&lt;p&gt;</code>
        khác, hoặc nếu không còn nội dung nào trong phần tử cha và phần tử cha
        không phải là {{HTMLElement("a")}}, {{HTMLElement("audio")}},
        {{HTMLElement("del")}}, {{HTMLElement("ins")}}, {{HTMLElement("map")}},
        {{HTMLElement("noscript")}} hay {{HTMLElement("video")}},
        hoặc một phần tử tùy chỉnh tự trị.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles"
          >paragraph</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLParagraphElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("hr")}}
- {{HTMLElement("br")}}
