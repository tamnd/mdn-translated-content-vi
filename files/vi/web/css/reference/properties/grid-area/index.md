---
title: grid-area
slug: Web/CSS/Reference/Properties/grid-area
page-type: css-shorthand-property
browser-compat: css.properties.grid-area
sidebar: cssref
---

Thuộc tính **`grid-area`** [CSS](/en-US/docs/Web/CSS) là [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) dùng để chỉ định kích thước và vị trí của một phần tử lưới bên trong {{glossary("grid", "lưới")}} bằng cách đóng góp một đường, một khoảng mở rộng (span), hoặc không có gì (tự động) vào vị trí lưới của nó, từ đó xác định các cạnh của {{glossary("grid areas", "vùng lưới")}} tương ứng.

{{InteractiveExample("CSS Demo: grid-area")}}

```css interactive-example-choice
grid-area: a;
```

```css interactive-example-choice
grid-area: b;
```

```css interactive-example-choice
grid-area: c;
```

```css interactive-example-choice
grid-area: 2 / 1 / 2 / 4;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">Example</div>
  </div>
</section>
```

```css interactive-example
.example-container {
  border: 1px solid #c5c5c5;
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: repeat(3, minmax(40px, auto));
  grid-template-areas:
    "a a a"
    "b c c"
    "b c c";
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

Nếu bốn giá trị `<grid-line>` được chỉ định, `grid-row-start` được đặt thành giá trị đầu tiên, `grid-column-start` được đặt thành giá trị thứ hai, `grid-row-end` được đặt thành giá trị thứ ba, và `grid-column-end` được đặt thành giá trị thứ tư.

Khi `grid-column-end` bị bỏ qua, nếu `grid-column-start` là {{cssxref("&lt;custom-ident&gt;")}}, thì `grid-column-end` được đặt thành `<custom-ident>` đó; ngược lại, nó được đặt thành `auto`.

Khi `grid-row-end` bị bỏ qua, nếu `grid-row-start` là một `<custom-ident>`, thì `grid-row-end` được đặt thành `<custom-ident>` đó; ngược lại, nó được đặt thành `auto`.

Khi `grid-column-start` bị bỏ qua, nếu `grid-row-start` là một `<custom-ident>`, tất cả bốn thuộc tính thành phần đều được đặt thành giá trị đó. Ngược lại, nó được đặt thành `auto`.

Thuộc tính `grid-area` cũng có thể được đặt thành một {{cssxref("&lt;custom-ident&gt;")}} đóng vai trò là tên cho vùng lưới, sau đó có thể được đặt vị trí bằng cách sử dụng {{cssxref("grid-template-areas")}}.

## Thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("grid-row-start")}}
- {{cssxref("grid-column-start")}}
- {{cssxref("grid-row-end")}}
- {{cssxref("grid-column-end")}}

## Cú pháp

```css
/* Giá trị từ khóa */
grid-area: auto;
grid-area: auto / auto;
grid-area: auto / auto / auto;
grid-area: auto / auto / auto / auto;

/* Giá trị <custom-ident> */
grid-area: some-grid-area;
grid-area: some-grid-area / another-grid-area;

/* Giá trị <integer> && <custom-ident>? */
grid-area: 4 some-grid-area;
grid-area: 4 some-grid-area / 2 another-grid-area;

/* Giá trị span && [ <integer> || <custom-ident> ] */
grid-area: span 3;
grid-area: span 3 / span some-grid-area;
grid-area: 2 span / another-grid-area span;

/* Giá trị toàn cục */
grid-area: inherit;
grid-area: initial;
grid-area: revert;
grid-area: revert-layer;
grid-area: unset;
```

### Giá trị

- `auto`
  - : Là từ khóa cho biết thuộc tính không đóng góp gì vào vị trí của phần tử lưới, cho biết tự động đặt vị trí hoặc khoảng mở rộng mặc định là `1`.
- `<custom-ident>`
  - : Nếu có một đường được đặt tên với tên `<custom-ident>-start` hoặc `<custom-ident>-end`, nó đóng góp đường đầu tiên như vậy vào vị trí của phần tử lưới.

    > [!NOTE]
    > Các vùng lưới được đặt tên tự động tạo ra các đường được đặt tên ẩn theo dạng này, vì vậy việc chỉ định `grid-area: foo;` sẽ chọn cạnh bắt đầu/kết thúc của vùng lưới được đặt tên đó (trừ khi một đường khác có tên `foo-start`/`foo-end` được chỉ định rõ ràng trước đó).

    Ngược lại, điều này được xử lý như thể số nguyên `1` đã được chỉ định cùng với `<custom-ident>`.

- `<integer> && <custom-ident>?`
  - : Đóng góp đường lưới thứ n vào vị trí của phần tử lưới. Nếu một số nguyên âm được cho, nó sẽ đếm ngược, bắt đầu từ cạnh kết thúc của lưới tường minh.

    Nếu một tên được cho dưới dạng {{cssxref("&lt;custom-ident&gt;")}}, chỉ các đường có tên đó mới được tính. Nếu không đủ đường có tên đó tồn tại, tất cả các đường lưới ẩn được giả định có tên đó để tìm vị trí này.

    Giá trị {{cssxref("&lt;integer&gt;")}} là `0` không hợp lệ.

- `span && [ <integer> || <custom-ident> ]`
  - : Đóng góp một khoảng mở rộng lưới vào vị trí của phần tử lưới sao cho cạnh tương ứng của vùng lưới của phần tử đó cách _n_ đường so với cạnh đối diện.

    Nếu một tên được cho dưới dạng {{cssxref("&lt;custom-ident&gt;")}}, chỉ các đường có tên đó mới được tính. Nếu không đủ đường có tên đó tồn tại, tất cả các đường lưới ẩn ở phía của lưới tường minh tương ứng với hướng tìm kiếm được giả định có tên đó để đếm khoảng mở rộng này.

    Nếu {{cssxref("&lt;integer&gt;")}} bị bỏ qua, nó mặc định là `1`. Số nguyên âm hoặc 0 không hợp lệ.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt vùng lưới

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
  height: 100px;
  grid-template: repeat(4, 1fr) / 50px 100px;
}

#item1 {
  background-color: lime;
  grid-area: 2 / 2 / auto / span 3;
}

#item2 {
  background-color: yellow;
}

#item3 {
  background-color: blue;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_grid_areas", "100%", "150px")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("grid-row")}}
- {{cssxref("grid-row-start")}}
- {{cssxref("grid-row-end")}}
- {{cssxref("grid-column")}}
- {{cssxref("grid-column-start")}}
- {{cssxref("grid-column-end")}}
- {{cssxref("grid-template-areas")}}
- [Vùng mẫu lưới](/en-US/docs/Web/CSS/Guides/Grid_layout/Grid_template_areas)
- Video: [Grid template areas](https://gridbyexample.com/video/grid-template-areas/)
