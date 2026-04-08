---
title: shape-outside
slug: Web/CSS/Reference/Properties/shape-outside
page-type: css-property
browser-compat: css.properties.shape-outside
sidebar: cssref
---

Thuộc tính **`shape-outside`** của [CSS](/vi/docs/Web/CSS) xác định một hình dạng — có thể không phải hình chữ nhật — mà nội dung nội tuyến liền kề sẽ bao quanh. Theo mặc định, nội dung nội tuyến bao quanh hộp lề của phần tử; `shape-outside` cung cấp một cách để tùy chỉnh việc bao quanh này, giúp có thể bao văn bản xung quanh các đối tượng phức tạp thay vì các hộp hình chữ nhật.

{{InteractiveExample("CSS Demo: shape-outside")}}

```css interactive-example-choice
shape-outside: circle(50%);
```

```css interactive-example-choice
shape-outside: ellipse(130px 140px at 20% 20%);
```

```css interactive-example-choice
shape-outside: url("/shared-assets/images/examples/round-balloon.png");
```

```css interactive-example-choice
shape-outside: polygon(50% 0, 100% 50%, 50% 100%, 0 50%);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <img
      class="transition-all"
      id="example-element"
      src="/shared-assets/images/examples/round-balloon.png"
      width="150" />
    We had agreed, my companion and I, that I should call for him at his house,
    after dinner, not later than eleven o'clock. This athletic young Frenchman
    belongs to a small set of Parisian sportsmen, who have taken up "ballooning"
    as a pastime. After having exhausted all the sensations that are to be found
    in ordinary sports, even those of "automobiling" at a breakneck speed, the
    members of the "Aéro Club" now seek in the air, where they indulge in all
    kinds of daring feats, the nerve-racking excitement that they have ceased to
    find on earth.
  </div>
</section>
```

```css interactive-example
.example-container {
  text-align: left;
  padding: 20px;
}

#example-element {
  float: left;
  width: 150px;
  margin: 20px;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
shape-outside: none;
shape-outside: margin-box;
shape-outside: content-box;
shape-outside: border-box;
shape-outside: padding-box;

/* Giá trị hàm */
shape-outside: circle();
shape-outside: ellipse();
shape-outside: inset(10px 10px 10px 10px);
shape-outside: polygon(10px 10px, 20px 20px, 30px 30px);

/* Hộp hình dạng kết hợp với hình dạng cơ bản */
shape-outside: circle() border-box;
shape-outside: margin-box ellipse();

/* Giá trị <url> */
shape-outside: url("image.png");

/* Giá trị <gradient> */
shape-outside: linear-gradient(45deg, white 150px, red 150px);

/* Giá trị toàn cục */
shape-outside: inherit;
shape-outside: initial;
shape-outside: revert;
shape-outside: revert-layer;
shape-outside: unset;
```

Thuộc tính `shape-outside` được chỉ định bằng các giá trị từ danh sách dưới đây, xác định _vùng float_ cho các _phần tử float_. Vùng float xác định hình dạng mà nội dung nội tuyến (phần tử float) bao quanh.

### Giá trị

- `none`
  - : Vùng float không bị ảnh hưởng. Nội dung nội tuyến bao quanh hộp lề của phần tử, như thông thường.
- `<shape-box>`
  - : Vùng float được tính toán theo hình dạng của các cạnh của phần tử float (như được xác định bởi [mô hình hộp CSS](/vi/docs/Web/CSS/Guides/Box_model/Introduction)). Có thể là `margin-box`, `border-box`, `padding-box`, hoặc `content-box`. Hình dạng bao gồm bất kỳ đường cong nào được tạo bởi thuộc tính {{cssxref("border-radius")}} (hành vi tương tự như {{cssxref("background-clip")}}).
    - `margin-box`
      - : Xác định hình dạng được bao bọc bởi cạnh lề ngoài. Bán kính góc của hình dạng này được xác định bởi các giá trị {{cssxref("border-radius")}} và {{cssxref("margin")}} tương ứng. Nếu tỷ lệ `border-radius / margin` là `1` hoặc lớn hơn, thì bán kính góc hộp lề là `border-radius + margin`. Nếu tỷ lệ nhỏ hơn `1`, thì bán kính góc hộp lề là `border-radius + (margin * (1 + (ratio - 1) ^ 3))`.
    - `border-box`
      - : Xác định hình dạng được bao bọc bởi cạnh viền ngoài. Hình dạng tuân theo các quy tắc tạo bán kính viền thông thường cho phía ngoài của viền.
    - `padding-box`
      - : Xác định hình dạng được bao bọc bởi cạnh đệm ngoài. Hình dạng tuân theo các quy tắc tạo bán kính viền thông thường cho phía trong của viền.
    - `content-box`
      - : Xác định hình dạng được bao bọc bởi cạnh nội dung ngoài. Mỗi bán kính góc của hộp này là giá trị lớn hơn trong `0` hoặc `border-radius - border-width - padding`.

- {{cssxref("basic-shape")}}
  - : Vùng float được tính toán dựa trên hình dạng được tạo bởi hàm {{cssxref("basic-shape/inset","inset()")}}, {{cssxref("basic-shape/circle","circle()")}}, {{cssxref("basic-shape/ellipse","ellipse()")}}, hoặc {{cssxref("basic-shape/polygon","polygon()")}}; các hàm `<basic-shape>` khác không hợp lệ. Nếu một `<shape-box>` cũng được cung cấp, nó xác định hộp tham chiếu cho hàm `<basic-shape>`. Nếu không, hộp tham chiếu mặc định là `margin-box`.
- {{cssxref("image")}}
  - : Vùng float được trích xuất và tính toán dựa trên kênh alpha của {{cssxref("image")}} được chỉ định như được xác định bởi {{cssxref("shape-image-threshold")}}.

> [!NOTE]
> Nếu hình ảnh không hợp lệ, hiệu ứng sẽ như thể từ khóa `none` đã được chỉ định. Ngoài ra, hình ảnh phải được phục vụ với tiêu đề {{Glossary("CORS")}} cho phép sử dụng nó.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Kênh hóa văn bản

#### HTML

```html
<div class="main">
  <div class="left"></div>
  <div class="right"></div>
  <p>
    Sometimes a web page's text content appears to be funneling your attention
    towards a spot on the page to drive you to follow a particular link.
    Sometimes you don't notice.
  </p>
</div>
```

#### CSS

```css
.main {
  width: 530px;
}

.left,
.right {
  background-color: lightgray;
  height: 12ex;
  width: 40%;
}

.left {
  clip-path: polygon(0 0, 100% 100%, 0 100%);
  float: left;
  shape-outside: polygon(0 0, 100% 100%, 0 100%);
}

.right {
  clip-path: polygon(100% 0, 100% 100%, 0 100%);
  float: right;
  shape-outside: polygon(100% 0, 100% 100%, 0 100%);
}

p {
  text-align: center;
}
```

#### Kết quả

{{EmbedLiveSample("funneling_text", "100%", 130)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS shapes](/vi/docs/Web/CSS/Guides/Shapes)
- [Tổng quan về hình dạng](/vi/docs/Web/CSS/Guides/Shapes/Overview)
- {{cssxref("basic-shape")}}
- {{cssxref("shape-margin")}}
- {{cssxref("shape-image-threshold")}}
