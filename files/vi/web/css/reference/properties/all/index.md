---
title: all
slug: Web/CSS/Reference/Properties/all
page-type: css-shorthand-property
browser-compat: css.properties.all
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) viết tắt **`all`** đặt lại tất cả các thuộc tính của một phần tử, ngoại trừ {{cssxref("unicode-bidi")}}, {{cssxref("direction")}}, và [Thuộc tính tùy chỉnh CSS](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties). Nó có thể đặt các thuộc tính về giá trị ban đầu hoặc giá trị kế thừa, hoặc về các giá trị được chỉ định trong một tầng cascade khác hoặc nguồn gốc stylesheet.

{{InteractiveExample("CSS Demo: all")}}

```css interactive-example-choice
/* no all property */
```

```css interactive-example-choice
all: initial;
```

```css interactive-example-choice
all: inherit;
```

```css interactive-example-choice
all: unset;
```

```css interactive-example-choice
all: revert;
```

```html interactive-example
<section id="default-example">
  <div class="example-container-bg">
    <div class="example-container">
      <p id="example-element">
        This paragraph has a font size of 1.5rem and a color of gold. It also
        has 1rem of vertical margin set by the user-agent. The parent of the
        paragraph is a &lt;div&gt; with a dashed blue border.
      </p>
    </div>
  </div>
</section>
```

```css interactive-example
#example-element {
  color: gold;
  padding: 10px;
  font-size: 1.5rem;
  text-align: left;
  width: 100%;
}

.example-container {
  border: 2px dashed #2d5ae1;
}

.example-container-bg {
  background-color: #77767b;
  padding: 20px;
}
```

## Các thuộc tính cấu thành

Thuộc tính này là viết tắt cho tất cả các thuộc tính CSS ngoại trừ {{cssxref("unicode-bidi")}}, {{cssxref("direction")}}, và [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties).

## Cú pháp

```css
/* Giá trị toàn cục */
all: initial;
all: inherit;
all: unset;
all: revert;
all: revert-layer;
```

Thuộc tính `all` được xác định như một trong các giá trị từ khóa toàn cục của CSS. Lưu ý rằng không có giá trị nào trong số này ảnh hưởng đến các thuộc tính {{cssxref("unicode-bidi")}} và {{cssxref("direction")}}.

### Giá trị

- {{cssxref("initial")}}
  - : Xác định rằng tất cả các thuộc tính của phần tử phải được thay đổi về [giá trị ban đầu](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value) của chúng.
- {{cssxref("inherit")}}
  - : Xác định rằng tất cả các thuộc tính của phần tử phải được thay đổi về [giá trị kế thừa](/en-US/docs/Web/CSS/Guides/Cascade/Inheritance) của chúng.
- {{cssxref("unset")}}
  - : Xác định rằng tất cả các thuộc tính của phần tử phải được thay đổi về giá trị kế thừa của chúng nếu chúng kế thừa theo mặc định, hoặc về giá trị ban đầu của chúng nếu không.
- {{cssxref("revert")}}
  - : Xác định hành vi phụ thuộc vào nguồn gốc stylesheet mà khai báo thuộc về:
    - Nếu quy tắc thuộc về [nguồn gốc tác giả](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#author_stylesheets), giá trị `revert` khôi phục lại [cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction) về cấp người dùng, sao cho [các giá trị được chỉ định](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#specified_value) được tính toán như thể không có quy tắc cấp tác giả nào được chỉ định cho phần tử. Đối với `revert`, nguồn gốc tác giả bao gồm nguồn gốc Override và Animation.
    - Nếu quy tắc thuộc về [nguồn gốc người dùng](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#user_stylesheets), giá trị `revert` khôi phục lại [cascade](/en-US/docs/Web/CSS/Guides/Cascade/Introduction) về cấp tác nhân người dùng, sao cho [các giá trị được chỉ định](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#specified_value) được tính toán như thể không có quy tắc cấp tác giả hoặc cấp người dùng nào được chỉ định cho phần tử.
    - Nếu quy tắc thuộc về [nguồn gốc tác nhân người dùng](/en-US/docs/Web/CSS/Guides/Cascade/Introduction#user-agent_stylesheets), giá trị `revert` hoạt động như `unset`.
- {{cssxref("revert-layer")}}
  - : Xác định rằng tất cả các thuộc tính của phần tử phải khôi phục cascade về một [tầng cascade](/en-US/docs/Web/CSS/Reference/At-rules/@layer) trước đó, nếu có. Nếu không có tầng cascade nào khác tồn tại, các thuộc tính của phần tử sẽ khôi phục về quy tắc khớp, nếu có, trong tầng hiện tại hoặc về [nguồn gốc style](/en-US/docs/Glossary/Style_origin) trước đó.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

Trong ví dụ này, tệp CSS chứa kiểu dáng cho phần tử {{HTMLElement("blockquote")}} ngoài một số kiểu dáng cho phần tử `<body>` cha. Các đầu ra khác nhau trong phần Kết quả minh họa cách kiểu dáng của phần tử `<blockquote>` bị ảnh hưởng khi các giá trị khác nhau được áp dụng cho thuộc tính `all` bên trong quy tắc `blockquote`.

### HTML

```html
<blockquote id="quote">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
</blockquote>
Phasellus eget velit sagittis.
```

### CSS

```css
body {
  font-size: small;
  background-color: #f0f0f0;
  color: blue;
  margin: 0;
  padding: 0;
}

blockquote {
  background-color: skyblue;
  color: red;
}
```

### Kết quả

#### A. Không có thuộc tính `all`

```html hidden
<blockquote id="quote">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
</blockquote>
Phasellus eget velit sagittis.
```

```css hidden
body {
  font-size: small;
  background-color: #f0f0f0;
  color: blue;
}
blockquote {
  background-color: skyblue;
  color: red;
}
```

{{EmbedLiveSample("a._no_all_property", "200", "125")}}

Đây là tình huống không có thuộc tính `all` nào được đặt bên trong quy tắc `blockquote`. Phần tử {{HTMLElement("blockquote")}} sử dụng kiểu dáng mặc định của trình duyệt cùng với màu nền và màu văn bản cụ thể được chỉ định trong stylesheet. Nó cũng hoạt động như một phần tử _block_: văn bản theo sau nó nằm bên dưới nó.

#### B. `all: initial`

```html hidden
<blockquote id="quote">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
</blockquote>
Phasellus eget velit sagittis.
```

```css hidden
body {
  font-size: small;
  background-color: #f0f0f0;
  color: blue;
}
blockquote {
  background-color: skyblue;
  color: red;
  all: initial;
}
```

{{EmbedLiveSample("b._all_initial", "200", "125")}}

Với thuộc tính `all` được đặt thành `initial` trong quy tắc `blockquote`, phần tử {{HTMLElement("blockquote")}} không còn sử dụng kiểu dáng mặc định của trình duyệt nữa: nó là phần tử _nội tuyến_ bây giờ (giá trị ban đầu), [`background-color`](/en-US/docs/Web/CSS/Reference/Properties/background-color#formal_definition) của nó là `transparent` (giá trị ban đầu), [`font-size`](/en-US/docs/Web/CSS/Reference/Properties/font-size#formal_definition) của nó là `medium`, và [`color`](/en-US/docs/Web/CSS/Reference/Properties/color#formal_definition) của nó là `black` (giá trị ban đầu).

#### C. `all: inherit`

```html hidden
<blockquote id="quote">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
</blockquote>
Phasellus eget velit sagittis.
```

```css hidden
body {
  font-size: small;
  background-color: #f0f0f0;
  color: blue;
}
blockquote {
  background-color: skyblue;
  color: red;
  all: inherit;
}
```

{{EmbedLiveSample("c._all_inherit", "200", "125")}}

Trong trường hợp này, phần tử {{HTMLElement("blockquote")}} không sử dụng kiểu dáng mặc định của trình duyệt. Thay vào đó, nó kế thừa các giá trị style từ phần tử {{HTMLElement("body")}} cha: nó là phần tử _block_ bây giờ (giá trị kế thừa), {{cssxref("background-color")}} của nó là `#F0F0F0` (giá trị kế thừa), {{cssxref("font-size")}} của nó là `small` (giá trị kế thừa), và {{cssxref("color")}} của nó là `blue` (giá trị kế thừa).

#### D. `all: unset`

```html hidden
<blockquote id="quote">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
</blockquote>
Phasellus eget velit sagittis.
```

```css hidden
body {
  font-size: small;
  background-color: #f0f0f0;
  color: blue;
}
blockquote {
  background-color: skyblue;
  color: red;
  all: unset;
}
```

{{EmbedLiveSample("d._all_unset", "200", "125")}}

Khi giá trị `unset` được áp dụng cho thuộc tính `all` trong quy tắc `blockquote`, phần tử {{HTMLElement("blockquote")}} không sử dụng kiểu dáng mặc định của trình duyệt. Vì [`background-color`](/en-US/docs/Web/CSS/Reference/Properties/background-color#formal_definition) là thuộc tính không kế thừa và [`font-size`](/en-US/docs/Web/CSS/Reference/Properties/font-size#formal_definition) và [`color`](/en-US/docs/Web/CSS/Reference/Properties/color#formal_definition) là các thuộc tính kế thừa, phần tử `<blockquote>` là phần tử _nội tuyến_ bây giờ (giá trị ban đầu), {{cssxref("background-color")}} của nó là `transparent` (giá trị ban đầu), nhưng {{cssxref("font-size")}} của nó vẫn là `small` (giá trị kế thừa), và {{cssxref("color")}} của nó là `blue` (giá trị kế thừa).

#### E. `all: revert`

```html hidden
<blockquote id="quote">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
</blockquote>
Phasellus eget velit sagittis.
```

```css hidden
body {
  font-size: small;
  background-color: #f0f0f0;
  color: blue;
}
blockquote {
  background-color: skyblue;
  color: red;
  all: revert;
}
```

{{EmbedLiveSample("e._all_revert", "200", "125")}}

Khi thuộc tính `all` được đặt thành `revert` trong quy tắc `blockquote`, quy tắc `blockquote` được coi là không tồn tại và các giá trị thuộc tính styling được kế thừa từ những giá trị áp dụng cho phần tử cha `<body>`. Vì vậy phần tử `<blockquote>` được tạo kiểu như một phần tử _block_, với {{cssxref("background-color")}} `#F0F0F0`, {{cssxref("font-size")}} `small`, và {{cssxref("color")}} `blue` - tất cả các giá trị được kế thừa từ quy tắc `body`.

#### F. `all: revert-layer`

```html hidden
<blockquote id="quote">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit.
</blockquote>
Phasellus eget velit sagittis.
```

```css hidden
body {
  font-size: small;
  background-color: #f0f0f0;
  color: blue;
}
blockquote {
  background-color: skyblue;
  color: red;
  all: revert-layer;
}
```

{{EmbedLiveSample("f._all_revert-layer", "200", "125")}}

Không có tầng cascade nào được định nghĩa trong tệp CSS, vì vậy phần tử `<blockquote>` kế thừa kiểu dáng từ quy tắc `body` khớp. Phần tử `<blockquote>` ở đây được tạo kiểu như một phần tử _block_, với {{cssxref("background-color")}} `#F0F0F0`, {{cssxref("font-size")}} `small`, và {{cssxref("color")}} `blue` - tất cả các giá trị được kế thừa từ quy tắc `body`. Tình huống này là ví dụ về trường hợp khi `all` được đặt thành `revert-layer` hoạt động giống như khi `all` được đặt thành `revert`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

Các giá trị từ khóa toàn cục CSS: {{cssxref("initial")}}, {{cssxref("inherit")}}, {{cssxref("unset")}}, {{cssxref("revert")}}, {{cssxref("revert-layer")}}
