---
title: column-gap
slug: Web/CSS/Reference/Properties/column-gap
page-type: css-property
browser-compat: css.properties.column-gap
sidebar: cssref
---

Thuộc tính **`column-gap`** [CSS](/en-US/docs/Web/CSS) đặt kích thước khoảng cách ({{glossary("Gutters","gutter")}}) giữa các cột của một phần tử.

Ban đầu là một phần của [Bố cục nhiều cột](/en-US/docs/Web/CSS/Guides/Multicol_layout), định nghĩa của `column-gap` đã được mở rộng để bao gồm nhiều phương thức bố cục. Hiện được chỉ định trong [Căn chỉnh hộp CSS](/en-US/docs/Web/CSS/Guides/Box_alignment), nó có thể được sử dụng trong bố cục nhiều cột, hộp linh hoạt và lưới.

Các phiên bản đầu của thông số kỹ thuật gọi thuộc tính này là `grid-column-gap`, và để duy trì tương thích với các trang web cũ, trình duyệt vẫn chấp nhận `grid-column-gap` như một bí danh của `column-gap`.

{{InteractiveExample("CSS Demo: column-gap")}}

```css interactive-example-choice
column-gap: 0;
```

```css interactive-example-choice
column-gap: 10%;
```

```css interactive-example-choice
column-gap: 1em;
```

```css interactive-example-choice
column-gap: 20px;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="transition-all" id="example-element">
      <div>One</div>
      <div>Two</div>
      <div>Three</div>
      <div>Four</div>
      <div>Five</div>
    </div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid #c5c5c5;
  display: grid;
  grid-template-columns: 1fr 1fr;
  width: 200px;
}

#example-element > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
column-gap: normal;

/* Giá trị <length> */
column-gap: 3px;
column-gap: 2.5em;

/* Giá trị <percentage> */
column-gap: 3%;

/* Giá trị toàn cục */
column-gap: inherit;
column-gap: initial;
column-gap: revert;
column-gap: revert-layer;
column-gap: unset;
```

Thuộc tính `column-gap` được chỉ định là một trong các giá trị liệt kê bên dưới.

### Giá trị

- `normal`
  - : Khoảng cách mặc định của trình duyệt được sử dụng giữa các cột. Đối với bố cục nhiều cột, giá trị này được chỉ định là `1em`. Đối với tất cả các loại bố cục khác, giá trị là 0.
- {{CSSxRef("&lt;length&gt;")}}
  - : Kích thước khoảng cách giữa các cột, được định nghĩa dưới dạng {{CSSxRef("&lt;length&gt;")}}. Giá trị của thuộc tính {{CSSxRef("&lt;length&gt;")}} phải không âm.
- {{CSSxRef("&lt;percentage&gt;")}}
  - : Kích thước khoảng cách giữa các cột, được định nghĩa dưới dạng {{CSSxRef("&lt;percentage&gt;")}}. Giá trị của thuộc tính {{CSSxRef("&lt;percentage&gt;")}} phải không âm.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Bố cục Flex

Trong ví dụ này, một container flex chứa sáu phần tử flex có hai chiều rộng khác nhau (`200px` và `300px`), tạo ra các phần tử flex không được bố trí như một lưới. Thuộc tính `column-gap` được sử dụng để thêm khoảng cách ngang giữa các phần tử flex liền kề.

#### HTML

```html
<div class="flexbox">
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
</div>
```

#### CSS

Để tạo một container flex, chúng ta đặt giá trị thuộc tính {{cssxref("display")}} của nó thành `flex`. Sau đó chúng ta sử dụng thuộc tính viết tắt {{cssxref("flex-flow")}} để đặt {{cssxref("flex-direction")}} thành row (mặc định) và {{cssxref("flex-wrap")}} thành `wrap`, cho phép các phần tử flex chạy sang dòng mới nếu cần. Theo mặc định, các phần tử flex co giãn theo chiều cao của container. Bằng cách đặt {{cssxref("height")}}, ngay cả các phần tử flex rỗng cũng sẽ cao `100px`.

Để minh họa rõ hơn thuộc tính `column-gap`, các phần tử flex trong ví dụ này có hai giá trị chiều rộng khác nhau. Chiều rộng của các phần tử flex được đặt bên trong các phần tử flex `<div>`. Chúng ta sử dụng thành phần {{cssxref("flex-basis")}} của thuộc tính viết tắt {{cssxref("flex")}} để làm cho tất cả các phần tử flex rộng `200px`. Sau đó chúng ta nhắm vào mỗi phần tử flex thứ ba bằng cách sử dụng bộ chọn {{cssxref(":nth-of-type", ":nth-of-type(3n)")}}, mở rộng chúng thành `300px`.

Giá trị `column-gap` được đặt là `20px` trên container flex để tạo khoảng cách `20px` giữa các phần tử flex liền kề trong mỗi hàng.

```css
.flexbox {
  display: flex;
  flex-flow: row wrap;
  height: 100px;
  column-gap: 20px;
}

.flexbox > div {
  border: 1px solid green;
  background-color: lime;
  flex: 200px;
}
div:nth-of-type(3n) {
  flex: 300px;
}
```

#### Kết quả

{{EmbedLiveSample("Flex_layout", "auto", "220px")}}

> [!NOTE]
> Mặc dù có khoảng cách ngang giữa các phần tử flex liền kề trong mỗi hàng flex, nhưng không có khoảng cách giữa các hàng. Để đặt khoảng cách dọc giữa các hàng flex, bạn có thể chỉ định giá trị khác 0 cho thuộc tính {{cssxref("row-gap")}}. Thuộc tính viết tắt {{cssxref("gap")}} cũng có sẵn để đặt cả `row-gap` và `column-gap` trong một khai báo, theo thứ tự đó.

### Bố cục Grid

#### HTML

```html
<div id="grid">
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
</div>
```

#### CSS

```css
#grid {
  display: grid;
  height: 100px;
  grid-template-columns: repeat(3, 1fr);
  grid-template-rows: 100px;
  column-gap: 20px;
}

#grid > div {
  border: 1px solid green;
  background-color: lime;
}
```

#### Kết quả

{{EmbedLiveSample("Grid_layout", "auto", "220px")}}

### Bố cục nhiều cột

#### HTML

```html
<p class="content-box">
  This is some multi-column text with a 40px column gap created with the CSS
  `column-gap` property. Don't you think that's fun and exciting? I sure do!
</p>
```

#### CSS

```css
.content-box {
  column-count: 3;
  column-gap: 40px;
}
```

#### Kết quả

{{EmbedLiveSample("Multi-column_layout", "auto", "120px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("row-gap")}}
- {{CSSxRef("gap")}}
- [Khái niệm cơ bản về bố cục lưới: gutters](/en-US/docs/Web/CSS/Guides/Grid_layout/Basic_concepts#gutters)
- [Tạo kiểu cho các cột](/en-US/docs/Web/CSS/Guides/Multicol_layout/Styling_columns)
