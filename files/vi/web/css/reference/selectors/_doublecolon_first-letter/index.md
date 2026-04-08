---
title: ::first-letter
slug: Web/CSS/Reference/Selectors/::first-letter
page-type: css-pseudo-element
browser-compat: css.selectors.first-letter
sidebar: cssref
---

[Phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) [CSS](/en-US/docs/Web/CSS) **`::first-letter`** áp dụng kiểu cho chữ cái đầu tiên của dòng đầu tiên trong một [block container](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model#block_containers), nhưng chỉ khi không có nội dung nào khác đứng trước (chẳng hạn như hình ảnh hoặc bảng inline).

{{InteractiveExample("CSS Demo: ::first-letter", "tabbed-shorter")}}

```css interactive-example
p::first-letter {
  font-size: 1.5rem;
  font-weight: bold;
  color: brown;
}
```

```html interactive-example
<p>
  Scientists exploring the depths of Monterey Bay unexpectedly encountered a
  rare and unique species of dragonfish. This species is the rarest of its
  species.
</p>

<p>
  When Robison and a team of researchers discovered this fish, they were aboard
  a week-long expedition.
</p>
```

Chữ cái đầu tiên của một phần tử không phải lúc nào cũng dễ xác định:

- Dấu câu đứng trước hoặc ngay sau chữ cái đầu tiên được bao gồm trong kết quả khớp. Dấu câu bao gồm bất kỳ ký tự Unicode nào được định nghĩa trong các lớp _mở_ (Ps), _đóng_ (Pe), _trích dẫn đầu_ (Pi), _trích dẫn cuối_ (Pf), và _dấu câu khác_ (Po).
- Một số ngôn ngữ có chữ ghép đôi luôn được viết hoa cùng nhau, như `IJ` trong tiếng Hà Lan. Trong những trường hợp này, cả hai chữ cái của chữ ghép đôi đều phải được khớp bởi phần tử giả `::first-letter`.
- Sự kết hợp của phần tử giả {{ cssxref("::before") }} và thuộc tính {{ cssxref("content") }} có thể chèn một số văn bản vào đầu phần tử. Trong trường hợp đó, `::first-letter` sẽ khớp với chữ cái đầu tiên của nội dung được tạo ra này.

> [!NOTE]
> CSS đã giới thiệu ký hiệu `::first-letter` (với hai dấu hai chấm) để phân biệt [lớp giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) với [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements). Để tương thích ngược, các trình duyệt cũng chấp nhận `:first-letter`, được giới thiệu trước đó.
>
> Hỗ trợ trình duyệt cho chữ ghép đôi như `IJ` trong tiếng Hà Lan còn kém. Kiểm tra bảng tương thích bên dưới để xem trạng thái hỗ trợ hiện tại.

## Các thuộc tính được phép

Chỉ một tập hợp nhỏ các thuộc tính CSS có thể được dùng với phần tử giả `::first-letter`:

- Tất cả thuộc tính font: {{ Cssxref("font") }}, {{ Cssxref("font-style") }}, {{cssxref("font-feature-settings")}}, {{cssxref("font-kerning")}}, {{cssxref("font-language-override")}}, {{cssxref("font-stretch")}}, {{cssxref("font-synthesis")}}, {{ Cssxref("font-variant") }}, {{cssxref("font-variant-alternates")}}, {{cssxref("font-variant-caps")}}, {{cssxref("font-variant-east-asian")}}, {{cssxref("font-variant-ligatures")}}, {{cssxref("font-variant-numeric")}}, {{cssxref("font-variant-position")}}, {{ Cssxref("font-weight") }}, {{ Cssxref("font-size") }}, {{cssxref("font-size-adjust")}}, {{ Cssxref("line-height") }} và {{ Cssxref("font-family") }}
- Tất cả thuộc tính background: {{ Cssxref("background") }}, {{ Cssxref("background-color") }}, {{ Cssxref("background-image") }}, {{cssxref("background-clip")}}, {{cssxref("background-origin")}}, {{ Cssxref("background-position") }}, {{ Cssxref("background-repeat") }}, {{ cssxref("background-size") }}, {{ Cssxref("background-attachment") }}, và {{cssxref("background-blend-mode")}}
- Tất cả thuộc tính margin: {{ Cssxref("margin") }}, {{ Cssxref("margin-top") }}, {{ Cssxref("margin-right") }}, {{ Cssxref("margin-bottom") }}, {{ Cssxref("margin-left") }}
- Tất cả thuộc tính padding: {{ Cssxref("padding") }}, {{ Cssxref("padding-top") }}, {{ Cssxref("padding-right") }}, {{ Cssxref("padding-bottom") }}, {{ Cssxref("padding-left") }}
- Tất cả thuộc tính border: các tốc ký {{ Cssxref("border") }}, {{ Cssxref("border-style") }}, {{ Cssxref("border-color") }}, {{ cssxref("border-width") }}, {{ cssxref("border-radius") }}, {{cssxref("border-image")}}, và các thuộc tính viết dài
- Thuộc tính {{ cssxref("color") }}
- Các thuộc tính CSS {{ cssxref("text-decoration") }}, {{cssxref("text-shadow")}}, {{ cssxref("text-transform") }}, {{ cssxref("letter-spacing") }}, {{ cssxref("word-spacing") }} (khi phù hợp), {{ cssxref("line-height") }}, {{cssxref("text-decoration-color")}}, {{cssxref("text-decoration-line")}}, {{cssxref("text-decoration-style")}}, {{cssxref("box-shadow")}}, {{ cssxref("float") }}, {{ cssxref("vertical-align") }} (chỉ khi `float` là `none`)

## Cú pháp

```css
::first-letter {
  /* ... */
}
```

## Ví dụ

### Chữ cái lớn cơ bản

Trong ví dụ này chúng ta sẽ dùng phần tử giả `::first-letter` để tạo hiệu ứng chữ cái lớn (drop cap) trên chữ cái đầu tiên của đoạn văn ngay sau `<h2>`.

#### HTML

```html
<h2>My heading</h2>
<p>
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
  eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam
  voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita
  kasd gubergren, no sea takimata sanctus est.
</p>
<p>
  Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
  consequat.
</p>
```

#### CSS

```css
p {
  width: 500px;
  line-height: 1.5;
}

h2 + p::first-letter {
  color: white;
  background-color: black;
  border-radius: 2px;
  box-shadow: 3px 3px 0 red;
  font-size: 250%;
  padding: 6px 3px;
  margin-right: 6px;
  float: left;
}
```

#### Kết quả

{{ EmbedLiveSample('Basic_drop_cap', '100%', 350) }}

### Hiệu ứng trên dấu câu đặc biệt và ký tự không phải Latin

Ví dụ này minh họa hiệu ứng của `::first-letter` trên dấu câu đặc biệt và các ký tự không phải Latin.

#### HTML

```html
<p>
  Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie
  consequat.
</p>
<p>-The beginning of a special punctuation mark.</p>
<p>_The beginning of a special punctuation mark.</p>
<p>"The beginning of a special punctuation mark.</p>
<p>'The beginning of a special punctuation mark.</p>
<p>*The beginning of a special punctuation mark.</p>
<p>#The beginning of a special punctuation mark.</p>
<p>「特殊的汉字标点符号开头。</p>
<p>《特殊的汉字标点符号开头。</p>
<p>"特殊的汉字标点符号开头。</p>
```

#### CSS

```css
p::first-letter {
  color: red;
  font-size: 150%;
}
```

#### Kết quả

{{ EmbedLiveSample('Effect_on_special_punctuation_and_non-Latin_characters', '100%', 350) }}

### Tạo kiểu chữ cái đầu trong phần tử text SVG

Trong ví dụ này, chúng ta dùng phần tử giả `::first-letter` để tạo kiểu cho chữ cái đầu tiên của phần tử {{SVGElement("text")}} SVG.

> [!NOTE]
> Tính năng này hiện có [hỗ trợ hạn chế](#browser_compatibility).

#### HTML

```html
<svg viewBox="0 0 300 40">
  <text y="30">First letter in &lt;text&gt; SVG</text>
</svg>
```

#### CSS

```css
text {
  font-family: sans-serif;
}

text::first-letter {
  font-family: serif;
  font-size: 2rem;
  font-weight: 600;
  fill: tomato;
  stroke: indigo;
}
```

#### Kết quả

{{ EmbedLiveSample("styling_first_letter_in_SVG_text_element", "100%", "100") }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("::first-line")}}
