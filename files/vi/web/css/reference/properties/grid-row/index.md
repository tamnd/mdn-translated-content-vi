---
title: grid-row
slug: Web/CSS/Reference/Properties/grid-row
page-type: css-shorthand-property
browser-compat: css.properties.grid-row
sidebar: cssref
---

Thuộc tính **`grid-row`** [CSS](/en-US/docs/Web/CSS) là [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) dùng để chỉ định kích thước và vị trí của một phần tử lưới bên trong {{glossary("grid row", "hàng lưới")}} bằng cách đóng góp một đường, một khoảng mở rộng (span), hoặc không có gì (tự động) vào vị trí lưới của nó, từ đó xác định cạnh bắt đầu và kết thúc theo chiều inline của {{glossary("grid areas", "vùng lưới")}} tương ứng.

{{InteractiveExample("CSS Demo: grid-row")}}

```css interactive-example-choice
grid-row: 1;
```

```css interactive-example-choice
grid-row: 1 / 3;
```

```css interactive-example-choice
grid-row: 2 / -1;
```

```css interactive-example-choice
grid-row: 1 / span 2;
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

## Thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("grid-row-end")}}
- {{cssxref("grid-row-start")}}

## Cú pháp

```css
/* Giá trị từ khóa */
grid-row: auto;
grid-row: auto / auto;

/* Giá trị <custom-ident> */
grid-row: some-grid-area;
grid-row: some-grid-area / some-other-grid-area;

/* Giá trị <integer> + <custom-ident> */
grid-row: some-grid-area 4;
grid-row: 4 some-grid-area / 6;

/* Giá trị span + <integer> + <custom-ident> */
grid-row: span 3;
grid-row: span some-grid-area;
grid-row: 5 some-grid-area span;
grid-row: span 3 / 6;
grid-row: span some-grid-area / span some-other-grid-area;
grid-row: 5 some-grid-area span / 2 span;

/* Giá trị toàn cục */
grid-row: inherit;
grid-row: initial;
grid-row: revert;
grid-row: revert-layer;
grid-row: unset;
```

Thuộc tính này được chỉ định là một hoặc hai giá trị `<grid-line>`.

Nếu hai giá trị `<grid-line>` được cho, chúng được phân tách bởi `/`. Thuộc tính thành phần `grid-row-start` được đặt thành giá trị trước dấu gạch chéo, và thuộc tính thành phần `grid-row-end` được đặt thành giá trị sau dấu gạch chéo.

Mỗi giá trị `<grid-line>` có thể được chỉ định là:

- từ khóa `auto`
- hoặc một giá trị `<custom-ident>`
- hoặc một giá trị `<integer>`
- hoặc cả `<custom-ident>` và `<integer>`, phân tách bởi dấu cách
- hoặc từ khóa `span` cùng với `<custom-ident>` hoặc `<integer>` hoặc cả hai.

### Giá trị

- `auto`
  - : Là từ khóa cho biết thuộc tính không đóng góp gì vào vị trí của phần tử lưới, cho biết tự động đặt vị trí, khoảng mở rộng tự động, hoặc khoảng mở rộng mặc định là `1`.
- `<custom-ident>`
  - : Nếu có một đường được đặt tên với tên `<custom-ident>-start`/`<custom-ident>-end`, nó đóng góp đường đầu tiên như vậy vào vị trí của phần tử lưới.

    > [!NOTE]
    > Các vùng lưới được đặt tên tự động tạo ra các đường được đặt tên ẩn theo dạng này, vì vậy việc chỉ định `grid-row: foo;` sẽ chọn cạnh bắt đầu/kết thúc của vùng lưới được đặt tên đó (trừ khi một đường khác có tên `foo-start`/`foo-end` được chỉ định rõ ràng trước đó).

    Ngược lại, điều này được xử lý như thể số nguyên `1` đã được chỉ định cùng với `<custom-ident>`.

- `<integer> && <custom-ident>?`
  - : Đóng góp đường lưới thứ n vào vị trí của phần tử lưới. Nếu một số nguyên âm được cho, nó sẽ đếm ngược, bắt đầu từ cạnh kết thúc của lưới tường minh.

    Nếu một tên được cho dưới dạng `<custom-ident>`, chỉ các đường có tên đó mới được tính. Nếu không đủ đường có tên đó tồn tại, tất cả các đường lưới ẩn được giả định có tên đó để tìm vị trí này.

    Giá trị {{cssxref("integer")}} là `0` không hợp lệ.

- `span && [ <integer> || <custom-ident> ]`
  - : Đóng góp một khoảng mở rộng lưới vào vị trí của phần tử lưới sao cho cạnh tương ứng của vùng lưới của phần tử đó cách n đường so với cạnh đối diện.

    Nếu một tên được cho dưới dạng `<custom-ident>`, chỉ các đường có tên đó mới được tính. Nếu không đủ đường có tên đó tồn tại, tất cả các đường lưới ẩn ở phía của lưới tường minh tương ứng với hướng tìm kiếm được giả định có tên đó để đếm khoảng mở rộng này.

    Nếu `<integer>` bị bỏ qua, nó mặc định là `1`. Số nguyên âm hoặc 0 không hợp lệ.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt kích thước và vị trí hàng lưới

#### HTML

```html
<div id="grid">
  <div id="item1"></div>
  <div id="item2"></div>
  <div id="item3"></div>
</div>
```

#### CSS

```css
#grid {
  display: grid;
  height: 200px;
  grid-template-columns: 200px;
  grid-template-rows: repeat(6, 1fr);
}

#item1 {
  background-color: lime;
}

#item2 {
  background-color: yellow;
  grid-row: 2 / 4;
}

#item3 {
  background-color: blue;
  grid-row: span 2 / 7;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_grid_row_size_and_location", "200px", "200px")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("grid-row-start")}}
- {{cssxref("grid-row-end")}}
- {{cssxref("grid-column")}}
- {{cssxref("grid-column-start")}}
- {{cssxref("grid-column-end")}}
- [Đặt vị trí theo đường trong lưới CSS](/en-US/docs/Web/CSS/Guides/Grid_layout/Line-based_placement)
- Video: [Line-based placement](https://gridbyexample.com/video/series-line-based-placement/)
