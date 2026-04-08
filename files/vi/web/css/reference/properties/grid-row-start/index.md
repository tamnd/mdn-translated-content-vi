---
title: grid-row-start
slug: Web/CSS/Reference/Properties/grid-row-start
page-type: css-property
browser-compat: css.properties.grid-row-start
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`grid-row-start`** xác định vị trí bắt đầu của một phần tử lưới trong hàng lưới bằng cách đóng góp một đường, một khoảng span, hoặc không có gì (tự động) vào việc đặt phần tử trong lưới, qua đó xác định cạnh bắt đầu inline của {{glossary("grid areas", "vùng lưới")}} của nó.

{{InteractiveExample("CSS Demo: grid-row-start")}}

```css interactive-example-choice
grid-row-start: auto;
```

```css interactive-example-choice
grid-row-start: 3;
```

```css interactive-example-choice
grid-row-start: -1;
```

```css interactive-example-choice
grid-row-start: span 2;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">One</div>
    <div>Two</div>
    <div>Three</div>
  </div>
</section>
```

```css interactive-example
.example-container {
  border: 1px solid #c5c5c5;
  display: grid;
  grid-template-columns: 1fr 1.5fr 1fr;
  grid-template-rows: repeat(3, minmax(40px, auto));
  grid-gap: 10px;
  width: 200px;
}

.example-container > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}

#example-element {
  background-color: rgb(255 0 200 / 0.2);
  border: 3px solid rebeccapurple;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
grid-row-start: auto;

/* Giá trị <custom-ident> */
grid-row-start: some-grid-area;

/* Giá trị <integer> + <custom-ident> */
grid-row-start: 2;
grid-row-start: some-grid-area 4;

/* Giá trị span + <integer> + <custom-ident> */
grid-row-start: span 3;
grid-row-start: span some-grid-area;
grid-row-start: 5 some-grid-area span;

/* Giá trị toàn cục */
grid-row-start: inherit;
grid-row-start: initial;
grid-row-start: revert;
grid-row-start: revert-layer;
grid-row-start: unset;
```

Thuộc tính này được chỉ định là một giá trị `<grid-line>` duy nhất. Giá trị `<grid-line>` có thể được chỉ định là:

- từ khóa `auto`
- hoặc giá trị `<custom-ident>`
- hoặc giá trị `<integer>`
- hoặc cả `<custom-ident>` và `<integer>`, cách nhau bằng dấu cách
- hoặc từ khóa `span` cùng với `<custom-ident>` hoặc `<integer>` hoặc cả hai.

### Giá trị

- `auto`
  - : Là từ khóa cho biết thuộc tính không đóng góp gì vào việc đặt phần tử lưới, nghĩa là tự động đặt, tự động tạo span, hoặc span mặc định là `1`.
- `<custom-ident>`
  - : Nếu có một đường được đặt tên với tên '\<custom-ident>-start', đường đầu tiên như vậy sẽ được tính vào việc đặt phần tử trong lưới.

    > [!NOTE]
    > Các vùng lưới được đặt tên sẽ tự động tạo ra các đường ẩn có tên theo dạng này, vì vậy chỉ định `grid-row-start: foo;` sẽ chọn cạnh bắt đầu của vùng lưới được đặt tên đó (trừ khi một đường tên `foo-start` khác được chỉ định rõ ràng trước đó).

    Nếu không, điều này được xử lý như thể số nguyên `1` đã được chỉ định cùng với `<custom-ident>`.

- `<integer> && <custom-ident>?`
  - : Đóng góp đường lưới thứ n vào việc đặt phần tử trong lưới. Nếu một số nguyên âm được đưa ra, thay vào đó nó đếm ngược từ cạnh kết thúc của lưới tường minh.

    Nếu một tên được đưa ra dưới dạng \<custom-ident>, chỉ các đường có tên đó mới được tính. Nếu không đủ các đường có tên đó, thì tất cả các đường lưới ẩn được coi là có tên đó cho mục đích tìm vị trí này.

    Giá trị {{cssxref("integer")}} là `0` không hợp lệ.

- `span && [ <integer> || <custom-ident> ]`
  - : Đóng góp một span lưới vào việc đặt phần tử lưới; sao cho cạnh bắt đầu hàng của vùng lưới phần tử lưới cách cạnh kết thúc n đường.

    Nếu một tên được đưa ra dưới dạng \<custom-ident>, chỉ các đường có tên đó mới được tính. Nếu không đủ các đường có tên đó, tất cả các đường lưới ẩn ở phía lưới tường minh tương ứng với hướng tìm kiếm được coi là có tên đó cho mục đích đếm span này.

    Nếu \<integer> bị bỏ qua, mặc định là `1`. Số nguyên âm hoặc 0 không hợp lệ.

    `<custom-ident>` không thể nhận giá trị `span` và `auto`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt vị trí bắt đầu hàng cho phần tử lưới

#### HTML

```html
<div class="wrapper">
  <div class="box1">One</div>
  <div class="box2">Two</div>
  <div class="box3">Three</div>
  <div class="box4">Four</div>
  <div class="box5">Five</div>
</div>
```

#### CSS

```css
.wrapper {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-auto-rows: 100px;
}

.box1 {
  grid-column-start: 1;
  grid-column-end: 4;
  grid-row-start: 1;
  grid-row-end: 3;
}

.box2 {
  grid-column-start: 1;
  grid-row-start: 3;
  grid-row-end: 5;
}
```

```css hidden
* {
  box-sizing: border-box;
}

.wrapper {
  border: 2px solid #f76707;
  border-radius: 5px;
  background-color: #fff4e6;
}

.wrapper > div {
  border: 2px solid #ffa94d;
  border-radius: 5px;
  background-color: #ffd8a8;
  padding: 1em;
  color: #d9480f;
}

.nested {
  border: 2px solid #ffec99;
  border-radius: 5px;
  background-color: #fff9db;
  padding: 1em;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_row_start_for_a_grid_item', '230', '420') }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("grid-row-end")}}
- {{cssxref("grid-row")}}
- {{cssxref("grid-column-start")}}
- {{cssxref("grid-column-end")}}
- {{cssxref("grid-column")}}
- [Đặt vị trí theo đường trong lưới CSS](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement)
- Video: [Line-based placement](https://gridbyexample.com/video/series-line-based-placement/)
