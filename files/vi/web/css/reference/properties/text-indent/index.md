---
title: text-indent
slug: Web/CSS/Reference/Properties/text-indent
page-type: css-property
browser-compat: css.properties.text-indent
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`text-indent`** xác định độ dài khoảng trắng (thụt lề) được đặt trước các dòng văn bản trong một khối.

{{InteractiveExample("CSS Demo: text-indent")}}

```css interactive-example-choice
text-indent: 0;
```

```css interactive-example-choice
text-indent: 30%;
```

```css interactive-example-choice
text-indent: -3em;
```

```css interactive-example-choice
text-indent: 3em each-line;
```

```css interactive-example-choice
text-indent: 3em hanging;
```

```css interactive-example-choice
text-indent: 3em hanging each-line;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">
    <p>
      This text is contained within a single paragraph. This paragraph is two
      sentences long.
    </p>
    <p>
      This is a new paragraph. There is a line break element
      <code>&lt;br&gt;</code> after this sentence.<br />There it is! Notice how
      it affects the indentation.
    </p>
  </div>
</section>
```

```css interactive-example
section {
  font-size: 1.25em;
  background-color: darkslateblue;
  align-items: start;
}

#example-element {
  text-align: left;
  margin-left: 3em;
  background-color: slateblue;
  color: white;
}
```

Khoảng cách ngang được tính so với cạnh trái (hoặc phải, đối với bố cục từ phải sang trái) của hộp nội dung của phần tử cấp khối chứa.

## Cú pháp

```css
/* Giá trị <length> */
text-indent: 3mm;
text-indent: 40px;

/* Giá trị <percentage>
   tương đối với chiều rộng khối chứa */
text-indent: 15%;

/* Giá trị từ khóa */
text-indent: 5em each-line;
text-indent: 5em hanging;
text-indent: 5em hanging each-line;

/* Giá trị toàn cục */
text-indent: inherit;
text-indent: initial;
text-indent: revert;
text-indent: revert-layer;
text-indent: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Thụt lề được chỉ định là {{cssxref("&lt;length&gt;")}} tuyệt đối. Giá trị âm được cho phép. Xem {{cssxref("&lt;length&gt;")}} để biết các đơn vị có thể dùng.
- {{cssxref("&lt;percentage&gt;")}}
  - : Thụt lề là {{cssxref("&lt;percentage&gt;")}} của chiều rộng khối chứa.
- `each-line`
  - : Thụt lề ảnh hưởng đến dòng đầu tiên của container khối cũng như mỗi dòng sau _ngắt dòng bắt buộc_, nhưng không ảnh hưởng đến các dòng sau _ngắt dòng mềm_.
- `hanging`
  - : Đảo ngược các dòng nào được thụt lề. Tất cả các dòng _trừ_ dòng đầu tiên sẽ được thụt lề.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Thụt lề cơ bản

#### HTML

```html
<p>
  Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy
  nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
</p>
<p>
  Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy
  nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
</p>
```

#### CSS

```css
p {
  text-indent: 5em;
  background: powderblue;
}
```

#### Kết quả

{{ EmbedLiveSample('Basic_indent','100%','100%') }}

### Bỏ qua thụt lề ở đoạn văn đầu tiên

Một thực hành kiểu chữ phổ biến khi có thụt lề đoạn văn là bỏ qua thụt lề cho đoạn văn đầu tiên. Như _The Chicago Manual of Style_ nêu: "dòng văn bản đầu tiên sau tiêu đề phụ có thể bắt đầu ở lề trái hoặc được thụt lề theo đoạn văn thông thường."

Xử lý đoạn văn đầu tiên khác với các đoạn văn tiếp theo có thể được thực hiện bằng cách sử dụng [bộ kết hợp phần tử kế tiếp](/vi/docs/Web/CSS/Reference/Selectors/Next-sibling_combinator), như trong ví dụ sau:

#### HTML

```html
<h2>Lorem ipsum</h2>

<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse eu
  venenatis quam. Vivamus euismod eleifend metus vitae pharetra. In vel tempor
  metus. Donec dapibus feugiat euismod. Vivamus interdum tellus dolor. Vivamus
  blandit eros et imperdiet auctor. Mauris sapien nunc, condimentum a efficitur
  non, elementum ac sapien. Cras consequat turpis non augue ullamcorper, sit
  amet porttitor dui interdum.
</p>

<p>
  Sed laoreet luctus erat at rutrum. Proin velit metus, luctus in sapien in,
  tincidunt mattis ex. Praesent venenatis orci at sagittis eleifend. Nulla
  facilisi. In feugiat vehicula magna iaculis vehicula. Nulla suscipit tempor
  odio a semper. Donec vitae dapibus ipsum. Donec libero purus, convallis eu
  efficitur id, pulvinar elementum diam. Maecenas mollis blandit placerat. Ut
  gravida pellentesque nunc, in eleifend ante convallis sit amet.
</p>

<h2>Donec ullamcorper elit nisl</h2>

<p>
  Donec ullamcorper elit nisl, sagittis bibendum massa gravida in. Fusce tempor
  in ante gravida iaculis. Integer posuere tempor metus. Vestibulum lacinia,
  nunc et dictum viverra, urna massa aliquam tellus, id mollis sem velit
  vestibulum nulla. Pellentesque habitant morbi tristique senectus et netus et
  malesuada fames ac turpis egestas. Donec vulputate leo ut iaculis ultrices.
  Cras egestas rhoncus lorem. Nunc blandit tempus lectus, rutrum hendrerit orci
  eleifend id. Ut at quam velit.
</p>

<p>
  Aenean rutrum tempor ligula, at luctus ligula auctor vestibulum. Sed
  sollicitudin velit in leo fringilla sollicitudin. Proin eu gravida arcu. Nam
  iaculis malesuada massa, eget aliquet turpis sagittis sed. Sed mollis tellus
  ac dui ullamcorper, nec lobortis diam pellentesque. Quisque dapibus accumsan
  libero, sed euismod ipsum ullamcorper sed.
</p>
```

#### CSS

```css
p {
  text-align: justify;
  margin: 1em 0 0 0;
}
p + p {
  text-indent: 2em;
  margin: 0;
}
```

#### Kết quả

{{ EmbedLiveSample('Skipping_indentation_on_the_first_paragraph','','500px') }}

### Thụt lề theo phần trăm

#### HTML

```html
<p>
  Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy
  nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
</p>
<p>
  Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy
  nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.
</p>
```

#### CSS

```css
p {
  text-indent: 30%;
  background: plum;
}
```

#### Kết quả

{{ EmbedLiveSample('Percentage_indent','100%','100%') }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học cách tạo kiểu HTML bằng CSS](/vi/docs/Learn_web_development/Core/Styling_basics)
- Các thuộc tính CSS liên quan:
  - {{cssxref("text-justify")}}
  - {{cssxref("text-orientation")}}
  - {{cssxref("text-overflow")}}
  - {{cssxref("text-rendering")}}
  - {{cssxref("text-transform")}}
  - {{cssxref('hanging-punctuation')}}
- Mô-đun CSS [CSS Text Decoration](/vi/docs/Web/CSS/Guides/Text_decoration)
- [Mô-đun CSS Text](/vi/docs/Web/CSS/Guides/Text)
