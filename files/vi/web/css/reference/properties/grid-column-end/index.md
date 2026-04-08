---
title: grid-column-end
slug: Web/CSS/Reference/Properties/grid-column-end
page-type: css-property
browser-compat: css.properties.grid-column-end
sidebar: cssref
---

Thuộc tính **`grid-column-end`** [CSS](/en-US/docs/Web/CSS) chỉ định vị trí kết thúc của một phần tử lưới bên trong cột lưới bằng cách đóng góp một đường, một khoảng mở rộng (span), hoặc không có gì (tự động) vào vị trí lưới của nó, từ đó xác định cạnh kết thúc theo chiều khối của {{glossary("grid areas", "vùng lưới")}} tương ứng.

{{InteractiveExample("CSS Demo: grid-column-end")}}

```css interactive-example-choice
grid-column-end: auto;
```

```css interactive-example-choice
grid-column-end: 3;
```

```css interactive-example-choice
grid-column-end: -1;
```

```css interactive-example-choice
grid-column-end: span 3;
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
grid-column-end: auto;

/* Giá trị <custom-ident> */
grid-column-end: some-grid-area;

/* Giá trị <integer> + <custom-ident> */
grid-column-end: 2;
grid-column-end: some-grid-area 4;

/* Giá trị span + <integer> + <custom-ident> */
grid-column-end: span 3;
grid-column-end: span some-grid-area;
grid-column-end: 5 some-grid-area span;

/* Giá trị toàn cục */
grid-column-end: inherit;
grid-column-end: initial;
grid-column-end: revert;
grid-column-end: revert-layer;
grid-column-end: unset;
```

### Giá trị

- `auto`
  - : Không đóng góp gì vào vị trí của phần tử lưới, cho biết tự động đặt vị trí, khoảng mở rộng tự động, hoặc khoảng mở rộng mặc định là `1`. Đây là giá trị mặc định.
- `<custom-ident>`
  - : Đóng góp đường đầu tiên vào vị trí của phần tử lưới nếu có một đường được đặt tên với tên `<custom-ident>-end`.

    > [!NOTE]
    > Các vùng lưới được đặt tên tự động tạo ra các đường được đặt tên ẩn theo dạng này, vì vậy việc chỉ định `grid-column-end: foo;` sẽ chọn cạnh kết thúc của vùng lưới được đặt tên đó (trừ khi một đường khác có tên `foo-end` được chỉ định rõ ràng trước đó).

    Ngược lại, điều này được xử lý như thể số nguyên `1` đã được chỉ định cùng với `<custom-ident>`.

- `<integer> && <custom-ident>?`
  - : Đóng góp đường lưới thứ n vào vị trí của phần tử lưới. Nếu một số nguyên âm được cho, nó sẽ đếm ngược, bắt đầu từ cạnh kết thúc của lưới tường minh.

    Nếu một tên được cho dưới dạng \<custom-ident>, chỉ các đường có tên đó mới được tính. Nếu không đủ đường có tên đó tồn tại, tất cả các đường lưới ẩn được giả định có tên đó để tìm vị trí này.

    Giá trị {{cssxref("integer")}} là `0` không hợp lệ.

- `span && [ <integer> || <custom-ident> ]`
  - : Đóng góp một khoảng mở rộng lưới vào vị trí của phần tử lưới sao cho cạnh kết thúc theo cột của vùng lưới của phần tử đó cách n đường so với cạnh bắt đầu.

    Nếu một tên được cho dưới dạng \<custom-ident>, chỉ các đường có tên đó mới được tính. Nếu không đủ đường có tên đó tồn tại, tất cả các đường lưới ẩn ở phía của lưới tường minh tương ứng với hướng tìm kiếm được giả định có tên đó để đếm khoảng mở rộng này.

    Nếu \<integer> bị bỏ qua, nó mặc định là `1`. Số nguyên âm hoặc 0 không hợp lệ.

    `<custom-ident>` không thể nhận các giá trị `span` và `auto`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt vị trí kết thúc cột cho phần tử lưới

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

{{ EmbedLiveSample('Setting_column_end_for_a_grid_item', '230', '420') }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("grid-column-start")}}
- {{cssxref("grid-column")}}
- {{cssxref("grid-row-start")}}
- {{cssxref("grid-row-end")}}
- {{cssxref("grid-row")}}
- [Đặt vị trí theo đường trong lưới CSS](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement)
- Video: [Line-based placement](https://gridbyexample.com/video/series-line-based-placement/)
