---
title: align-self
slug: Web/CSS/Reference/Properties/align-self
page-type: css-property
browser-compat: css.properties.align-self
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`align-self`** ghi đè giá trị {{cssxref("align-items")}} của một mục grid hoặc flex. Trong grid, nó căn chỉnh mục bên trong {{glossary("Grid Areas", "vùng grid")}}. Trong flexbox, nó căn chỉnh mục trên {{glossary("cross axis", "trục chéo")}}.

Thuộc tính không áp dụng cho các hộp cấp khối hoặc ô bảng. Nếu lề trục chéo của một flex item là `auto`, thì `align-self` sẽ bị bỏ qua.

{{InteractiveExample("CSS Demo: align-self")}}

```css interactive-example-choice
align-self: stretch;
```

```css interactive-example-choice
align-self: center;
```

```css interactive-example-choice
align-self: start;
```

```css interactive-example-choice
align-self: end;
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
  width: 200px;
  grid-template-columns: 1fr 1fr;
  grid-auto-rows: 80px;
  grid-gap: 10px;
}

.example-container > div {
  background-color: rgb(0 0 255 / 0.2);
  border: 3px solid blue;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
align-self: auto;
align-self: normal;

/* Căn chỉnh theo vị trí */
/* align-self không nhận giá trị left và right */
align-self: center; /* Đặt mục xung quanh trung tâm */
align-self: start; /* Đặt mục ở đầu */
align-self: end; /* Đặt mục ở cuối */
align-self: self-start; /* Căn chỉnh mục sát đầu */
align-self: self-end; /* Căn chỉnh mục sát cuối */
align-self: flex-start; /* Đặt flex item ở đầu */
align-self: flex-end; /* Đặt flex item ở cuối */
align-self: anchor-center;

/* Căn chỉnh theo đường cơ sở */
align-self: baseline;
align-self: first baseline;
align-self: last baseline;
align-self: stretch; /* Kéo dài các mục có kích thước 'auto' để lấp đầy container */

/* Căn chỉnh tràn */
align-self: safe center;
align-self: unsafe center;

/* Giá trị toàn cục */
align-self: inherit;
align-self: initial;
align-self: revert;
align-self: revert-layer;
align-self: unset;
```

### Giá trị

- `auto`
  - : Tính toán theo giá trị {{cssxref("align-items")}} của phần tử cha.
- `normal`
  - : Hiệu ứng của từ khóa này phụ thuộc vào chế độ bố cục đang sử dụng:
    - Trong bố cục định vị tuyệt đối, từ khóa hoạt động như `start` trên các hộp định vị tuyệt đối _được thay thế_, và như `stretch` trên _tất cả các_ hộp định vị tuyệt đối còn lại.
    - Trong vị trí tĩnh của bố cục định vị tuyệt đối, từ khóa hoạt động như `stretch`.
    - Đối với các mục flex, từ khóa hoạt động như `stretch`.
    - Đối với các mục grid, từ khóa này dẫn đến hành vi tương tự như `stretch`, ngoại trừ các hộp có {{glossary("aspect ratio", "tỷ lệ khung hình")}} hoặc kích thước nội tại, nơi nó hoạt động như `start`.
    - Thuộc tính không áp dụng cho các hộp cấp khối và ô bảng.

- `self-start`
  - : Căn chỉnh các mục sát vào cạnh của container căn chỉnh tương ứng với phía bắt đầu của mục trên trục chéo.
- `self-end`
  - : Căn chỉnh các mục sát vào cạnh của container căn chỉnh tương ứng với phía kết thúc của mục trên trục chéo.
- `flex-start`
  - : Cạnh lề cross-start của flex item được đặt sát vào cạnh cross-start của dòng.
- `flex-end`
  - : Cạnh lề cross-end của flex item được đặt sát vào cạnh cross-end của dòng.
- `center`
  - : Hộp lề của flex item được căn giữa trong dòng trên trục chéo. Nếu kích thước chéo của mục lớn hơn flex container, mục đó sẽ tràn đều theo cả hai hướng.
- `baseline`, `first baseline`, `last baseline`
  - : Xác định sự tham gia vào căn chỉnh đường cơ sở đầu tiên hoặc cuối cùng: căn chỉnh đường cơ sở căn chỉnh của tập đường cơ sở đầu tiên hoặc cuối cùng của hộp với đường cơ sở tương ứng trong tập đường cơ sở đầu tiên hoặc cuối cùng được chia sẻ của tất cả các hộp trong nhóm chia sẻ đường cơ sở của nó.
    Căn chỉnh dự phòng cho `first baseline` là `start`, cho `last baseline` là `end`.
- `stretch`
  - : Nếu kích thước chéo của mục là `auto`, kích thước sử dụng được đặt thành chiều dài cần thiết để gần lấp đầy container nhất có thể, tuân theo giới hạn chiều rộng và chiều cao của mục. Nếu mục không có kích thước tự động, giá trị này dự phòng về `flex-start`, và về `self-start` hoặc `self-end` nếu {{cssxref("align-content")}} của container là `first baseline` (hoặc `baseline`) hoặc `last baseline`.
- `anchor-center`
  - : Trong trường hợp các phần tử [được định vị neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning), căn chỉnh mục vào trung tâm của phần tử neo liên kết theo hướng khối. Xem [Căn giữa trên neo sử dụng `anchor-center`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#centering_on_the_anchor_using_anchor-center).
- `safe`
  - : Nếu kích thước của mục tràn ra ngoài container căn chỉnh, mục đó thay vào đó sẽ được căn chỉnh như thể chế độ căn chỉnh là `start`.
- `unsafe`
  - : Bất kể kích thước tương đối của mục và container căn chỉnh, giá trị căn chỉnh đã cho vẫn được tuân theo.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### HTML

```html
<section>
  <div>Item #1</div>
  <div>Item #2</div>
  <div>Item #3</div>
</section>
```

### CSS

```css
section {
  display: flex;
  align-items: center;
  height: 120px;
  background: beige;
}

div {
  height: 60px;
  background: cyan;
  margin: 5px;
}

div:nth-child(3) {
  align-self: flex-end;
  background: pink;
}
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Các khái niệm cơ bản về flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts)
- [Căn chỉnh các mục trong flex container](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items)
- [Căn chỉnh hộp trong bố cục grid](/en-US/docs/Web/CSS/Guides/Box_alignment/In_grid_layout)
- [Căn chỉnh hộp CSS](/en-US/docs/Web/CSS/Guides/Box_alignment)
- {{cssxref("align-items")}}
- {{cssxref("justify-self")}}
- {{cssxref("place-self")}}
