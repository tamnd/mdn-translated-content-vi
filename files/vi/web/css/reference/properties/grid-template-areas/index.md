---
title: grid-template-areas
slug: Web/CSS/Reference/Properties/grid-template-areas
page-type: css-property
browser-compat: css.properties.grid-template-areas
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`grid-template-areas`** chỉ định các {{glossary("grid areas", "vùng lưới")}} được đặt tên, thiết lập các ô trong lưới và gán tên cho chúng.

{{InteractiveExample("CSS Demo: grid-template-areas")}}

```css interactive-example-choice
grid-template-areas:
  "a a a"
  "b c c"
  "b c c";
```

```css interactive-example-choice
grid-template-areas:
  "b b a"
  "b b c"
  "b b c";
```

```css interactive-example-choice
grid-template-areas:
  "a a ."
  "a a ."
  ". b c";
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">
      <div>One (a)</div>
      <div>Two (b)</div>
      <div>Three (c)</div>
    </div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: repeat(3, minmax(40px, auto));
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

Các vùng đó không được liên kết với bất kỳ phần tử lưới cụ thể nào, nhưng có thể được tham chiếu từ các thuộc tính đặt vị trí lưới {{cssxref("grid-row-start")}}, {{cssxref("grid-row-end")}}, {{cssxref("grid-column-start")}}, {{cssxref("grid-column-end")}}, và các viết tắt {{cssxref("grid-row")}}, {{cssxref("grid-column")}}, và {{cssxref("grid-area")}}.

## Cú pháp

```css
/* Giá trị từ khóa */
grid-template-areas: none;

/* Giá trị <string> */
grid-template-areas: "a b";
grid-template-areas:
  "a b ."
  "a c d";

/* Giá trị toàn cục */
grid-template-areas: inherit;
grid-template-areas: initial;
grid-template-areas: revert;
grid-template-areas: revert-layer;
grid-template-areas: unset;
```

### Giá trị

- `none`
  - : Vùng chứa lưới không định nghĩa bất kỳ vùng lưới được đặt tên nào.
- {{cssxref("&lt;string&gt;")}}
  - : Một hàng được tạo cho mỗi chuỗi được liệt kê riêng, và một cột được tạo cho mỗi ô trong chuỗi. Nhiều token ô có cùng tên trong và giữa các hàng tạo ra một vùng lưới được đặt tên duy nhất bao gồm các ô lưới tương ứng. Trừ khi các ô đó tạo thành một hình chữ nhật, khai báo đó không hợp lệ.

    Tất cả các vùng chưa được đặt tên còn lại trong lưới có thể được tham chiếu bằng _token ô null_. Token ô null là một chuỗi một hoặc nhiều ký tự `.` (U+002E FULL STOP), ví dụ: `.`, `...`, hoặc `.....` v.v. Token ô null có thể được dùng để tạo ra các khoảng trống trong lưới.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Chỉ định các vùng lưới được đặt tên

#### HTML

```html
<div id="page">
  <header>Header</header>
  <nav>Navigation</nav>
  <main>Main area</main>
  <footer>Footer</footer>
</div>
```

#### CSS

```css
#page {
  display: grid;
  width: 100%;
  height: 250px;
  grid-template-areas:
    "head head"
    "nav  main"
    ".  foot";
  grid-template-rows: 50px 1fr 30px;
  grid-template-columns: 150px 1fr;
}

#page > header {
  grid-area: head;
  background-color: #8ca0ff;
}

#page > nav {
  grid-area: nav;
  background-color: #ffa08c;
}

#page > main {
  grid-area: main;
  background-color: #ffff64;
}

#page > footer {
  grid-area: foot;
  background-color: #8cffa0;
}
```

Trong đoạn code trên, một token null (`.`) được dùng để tạo ra một vùng không tên trong vùng chứa lưới, mà chúng ta đã dùng để tạo khoảng trống ở góc dưới bên trái của lưới.

#### Kết quả

{{EmbedLiveSample("Specifying_named_grid_areas", "100%", "285px")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("grid-template-rows")}}
- {{cssxref("grid-template-columns")}}
- {{cssxref("grid-template")}}
- [Vùng mẫu lưới](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas)
- Video: [Grid template areas](https://gridbyexample.com/video/grid-template-areas/)
