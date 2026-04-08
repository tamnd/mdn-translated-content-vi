---
title: ::first-line
slug: Web/CSS/Reference/Selectors/::first-line
page-type: css-pseudo-element
browser-compat: css.selectors.first-line
sidebar: cssref
---

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::first-line`** áp dụng kiểu cho dòng đầu tiên của một [block container](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model#block_containers).

{{InteractiveExample("CSS Demo: ::first-line", "tabbed-shorter")}}

```css interactive-example
p::first-line {
  font-size: 1.2rem;
  font-weight: bold;
  text-decoration: underline;
}
```

```html interactive-example
<p>
  In warm ocean waters around the world, you may see a strange sight: A fish
  leaping from the water and soaring dozens of meters before returning to the
  ocean's depths. Early Mediterranean sailors thought these flying fish returned
  to the shore at night to sleep, and therefore called this family of marine
  fish Exocoetidae.
</p>
```

Hiệu ứng của `::first-line` bị giới hạn bởi độ dài và nội dung của dòng đầu tiên văn bản trong phần tử. Độ dài của dòng đầu tiên phụ thuộc vào nhiều yếu tố, bao gồm chiều rộng của phần tử, chiều rộng tài liệu, và cỡ chữ. `::first-line` không có hiệu lực khi con đầu tiên của phần tử, vốn sẽ là phần đầu của dòng đầu tiên, là một phần tử block-level inline, chẳng hạn như một bảng inline.

> [!NOTE]
> [Selectors Level 3](https://drafts.csswg.org/selectors-3/#first-line) đã giới thiệu ký hiệu dấu hai chấm đôi (`::`) để phân biệt [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) với dấu hai chấm đơn (`:`) của [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes). Các trình duyệt chấp nhận cả `::first-line` và `:first-line`, được giới thiệu trong CSS2.

Đối với mục đích của CSS {{CSSXref("background")}}, phần tử giả `::first-line` giống như một phần tử inline-level, có nghĩa là trong một dòng đầu tiên căn trái, background có thể không kéo dài đến hết lề phải.

## Các thuộc tính được phép

Chỉ một tập hợp nhỏ các thuộc tính CSS có thể được dùng với phần tử giả `::first-line`:

- Tất cả thuộc tính liên quan đến font: {{Cssxref("font")}}, {{cssxref("font-kerning")}}, {{Cssxref("font-style")}}, {{Cssxref("font-variant")}}, {{cssxref("font-variant-numeric")}}, {{cssxref("font-variant-position")}}, {{cssxref("font-variant-east-asian")}}, {{cssxref("font-variant-caps")}}, {{cssxref("font-variant-alternates")}}, {{cssxref("font-variant-ligatures")}}, {{cssxref("font-synthesis")}}, {{cssxref("font-feature-settings")}}, {{cssxref("font-language-override")}}, {{Cssxref("font-weight")}}, {{Cssxref("font-size")}}, {{cssxref("font-size-adjust")}}, {{cssxref("font-stretch")}}, và {{Cssxref("font-family")}}
- Tất cả thuộc tính liên quan đến background: {{Cssxref("background-color")}}, {{cssxref("background-clip")}}, {{Cssxref("background-image")}}, {{cssxref("background-origin")}}, {{Cssxref("background-position")}}, {{Cssxref("background-repeat")}}, {{cssxref("background-size")}}, {{Cssxref("background-attachment")}}, và {{cssxref("background-blend-mode")}}
- Thuộc tính {{cssxref("color")}}
- {{cssxref("word-spacing")}}, {{cssxref("letter-spacing")}}, {{cssxref("text-decoration")}}, {{cssxref("text-transform")}}, và {{cssxref("line-height")}}
- {{cssxref("text-shadow")}}, {{cssxref("text-decoration")}}, {{cssxref("text-decoration-color")}}, {{cssxref("text-decoration-line")}}, {{cssxref("text-decoration-style")}}, và {{cssxref("vertical-align")}}.

## Cú pháp

```css
::first-line {
  /* ... */
}
```

## Ví dụ

### Tạo kiểu dòng đầu tiên của đoạn văn

#### HTML

```html
<p>
  Styles will only be applied to the first line of this paragraph. After that,
  all text will be styled like normal. See what I mean?
</p>

<span>
  The first line of this text will not receive special styling because it is not
  a block-level element.
</span>
```

#### CSS

```css hidden
* {
  font-size: 20px;
  font-family: sans-serif;
}
```

```css
::first-line {
  color: blue;
  font-weight: bold;

  /* WARNING: DO NOT USE THESE */
  /* Many properties are invalid in ::first-line pseudo-elements */
  margin-left: 20px;
  text-indent: 20px;
}
```

### Kết quả

{{EmbedLiveSample('styling_first_line_of_a_paragraph', 350, 130)}}

### Tạo kiểu dòng đầu tiên của phần tử text SVG

Trong ví dụ này, chúng ta tạo kiểu cho dòng đầu tiên của phần tử {{SVGElement("text")}} SVG bằng cách sử dụng phần tử giả `::first-line`.

> [!NOTE]
> Tính năng này hiện có [hỗ trợ hạn chế](#browser_compatibility).

#### HTML

```html-nolint
<svg viewBox="0 0 320 150">
  <text y="20">Here is an English paragraph
that is broken into multiple lines
in the source code so that it can
be more easily read and edited
in a text editor.
  </text>
</svg>
```

#### CSS

Để làm cho phần tử `<text>` SVG xuống dòng thành nhiều dòng, chúng ta sử dụng thuộc tính CSS {{cssxref("white-space", "", "#multiple_lines_in_svg_text_element")}}. Sau đó chúng ta chọn dòng đầu tiên bằng phần tử giả `::first-line`.

```css hidden
text {
  font-size: 20px;
  font-family: sans-serif;
}
```

```css
text {
  white-space: break-spaces;
}

text::first-line {
  fill: blue;
  font-weight: bold;
}
```

#### Kết quả

{{EmbedLiveSample("styling_the_first_line_of_a_SVG_text_element", "100%", 150)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("::first-letter")}}
- {{cssxref("white-space")}}
