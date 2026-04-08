---
title: grid-template
slug: Web/CSS/Reference/Properties/grid-template
page-type: css-shorthand-property
browser-compat: css.properties.grid-template
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`grid-template`** là [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) để định nghĩa {{glossary("grid column", "cột lưới")}}, {{glossary("grid_row", "hàng lưới")}}, và {{glossary("grid areas", "vùng lưới")}}.

{{InteractiveExample("CSS Demo: grid-template")}}

```css interactive-example-choice
grid-template:
  "a a a" 40px
  "b c c" 40px
  "b c c" 40px / 1fr 1fr 1fr;
```

```css interactive-example-choice
grid-template:
  "b b a" auto
  "b b c" 2ch
  "b b c" 1em / 20% 20px 1fr;
```

```css interactive-example-choice
grid-template:
  "a a ." minmax(50px, auto)
  "a a ." 80px
  "b b c" auto / 2em 3em auto;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">
      <div>One</div>
      <div>Two</div>
      <div>Three</div>
    </div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  display: grid;
  grid-gap: 10px;
  width: 200px;
}

#example-element :nth-child(1) {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
  grid-area: a;
}

#example-element :nth-child(2) {
  background-color: rgb(255 0 200 / 0.2);
  border: 3px solid rebeccapurple;
  grid-area: b;
}

#example-element :nth-child(3) {
  background-color: rgb(94 255 0 / 0.2);
  border: 3px solid green;
  grid-area: c;
}
```

## Thuộc tính thành phần

Thuộc tính này là viết tắt cho các thuộc tính CSS sau:

- {{cssxref("grid-template-areas")}}
- {{cssxref("grid-template-columns")}}
- {{cssxref("grid-template-rows")}}

## Cú pháp

```css
/* Giá trị từ khóa */
grid-template: none;

/* Giá trị grid-template-rows / grid-template-columns */
grid-template: 100px 1fr / 50px 1fr;
grid-template: auto 1fr / auto 1fr auto;
grid-template: [line-name] 100px / [column-name1] 30% [column-name2] 70%;
grid-template: fit-content(100px) / fit-content(40%);

/* Giá trị grid-template-areas grid-template-rows / grid-template-column */
grid-template:
  "a a a"
  "b b b";
grid-template:
  "a a a" 20%
  "b b b" auto;
grid-template:
  [header-top] "a a a" [header-bottom]
  [main-top] "b b b" 1fr [main-bottom]
  / auto 1fr auto;

/* Giá trị toàn cục */
grid-template: inherit;
grid-template: initial;
grid-template: revert;
grid-template: revert-layer;
grid-template: unset;
```

### Giá trị

- `none`
  - : Đặt cả ba thuộc tính dài thành `none`, nghĩa là không có lưới tường minh. Không có vùng lưới được đặt tên. Các hàng và cột sẽ được tạo ra ẩn; kích thước của chúng sẽ được xác định bởi các thuộc tính {{cssxref("grid-auto-rows")}} và {{cssxref("grid-auto-columns")}}. Đây là giá trị mặc định.
- `<'grid-template-rows'> / <'grid-template-columns'>`
  - : Đặt {{cssxref("grid-template-rows")}} và {{cssxref("grid-template-columns")}} theo các giá trị được chỉ định, và đặt {{cssxref("grid-template-areas")}} thành `none`.
- `[ <line-names>? <string> <track-size>? <line-names>? ]+ [ / <explicit-track-list> ]?`
  - : Đặt {{cssxref("grid-template-areas")}} theo các chuỗi được liệt kê, {{cssxref("grid-template-rows")}} theo các kích thước track theo sau mỗi chuỗi (điền `auto` cho bất kỳ kích thước bị thiếu nào), và nối các đường được đặt tên xác định trước/sau mỗi kích thước, và {{cssxref("grid-template-columns")}} theo danh sách track được chỉ định sau dấu gạch chéo (hoặc `none`, nếu không được chỉ định).

    > [!NOTE]
    > Hàm {{cssxref("repeat()")}} không được phép trong các danh sách track này, vì các track được thiết kế để căn chỉnh trực quan một-một với các hàng/cột trong "ASCII art".

> [!NOTE]
> Viết tắt {{cssxref("grid")}} chấp nhận cú pháp tương tự, nhưng cũng đặt lại các thuộc tính lưới ẩn về giá trị ban đầu của chúng. Sử dụng `grid` (thay vì `grid-template`) để ngăn các giá trị này cascade riêng biệt.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Định nghĩa một mẫu lưới

#### CSS

```css
#page {
  display: grid;
  width: 100%;
  height: 200px;
  grid-template:
    [header-left] "head head" 30px [header-right]
    [main-left] "nav  main" 1fr [main-right]
    [footer-left] "nav  foot" 30px [footer-right]
    / 120px 1fr;
}

header {
  background-color: lime;
  grid-area: head;
}

nav {
  background-color: lightblue;
  grid-area: nav;
}

main {
  background-color: yellow;
  grid-area: main;
}

footer {
  background-color: red;
  grid-area: foot;
}
```

#### HTML

```html
<div id="page">
  <header>Header</header>
  <nav>Navigation</nav>
  <main>Main area</main>
  <footer>Footer</footer>
</div>
```

#### Kết quả

{{EmbedLiveSample("Defining_a_grid_template", "100%", "200px")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("grid-template-rows")}}
- {{cssxref("grid-template-columns")}}
- {{cssxref("grid-template-areas")}}
- [Đặt vị trí theo đường trong lưới CSS](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement)
- [Vùng mẫu lưới: viết tắt định nghĩa lưới](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas#grid_definition_shorthands)
- Video: [Grid template shorthand](https://gridbyexample.com/video/grid-template-shorthand/)
