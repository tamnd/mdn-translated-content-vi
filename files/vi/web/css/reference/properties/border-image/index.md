---
title: border-image
slug: Web/CSS/Reference/Properties/border-image
page-type: css-shorthand-property
browser-compat: css.properties.border-image
sidebar: cssref
---

Thuộc tính **`border-image`** trong [CSS](/en-US/docs/Web/CSS) vẽ một hình ảnh xung quanh một phần tử. Nó thay thế [đường viền](/en-US/docs/Web/CSS/Reference/Properties/border) thông thường của phần tử.

> [!NOTE]
> Bạn nên chỉ định một {{cssxref("border-style")}} riêng biệt phòng trường hợp hình ảnh đường viền không tải được. Mặc dù đặc tả không yêu cầu nghiêm ngặt, một số trình duyệt không hiển thị hình ảnh đường viền nếu {{cssxref("border-style")}} là `none` hoặc {{cssxref("border-width")}} là `0`.

{{InteractiveExample("CSS Demo: border-image")}}

```css interactive-example-choice
border-image: url("/shared-assets/images/examples/border-diamonds.png") 30;
```

```css interactive-example-choice
border-image: url("/shared-assets/images/examples/border-diamonds.png") 30 /
  19px round;
```

```css interactive-example-choice
border-image: url("/shared-assets/images/examples/border-diamonds.png") 30
  fill / 30px / 30px space;
```

```css interactive-example-choice
border-image: linear-gradient(#f6b73c, #4d9f0c) 30;
```

```css interactive-example-choice
border-image: repeating-linear-gradient(30deg, #4d9f0c, #9198e5, #4d9f0c 20px)
  60;
```

```html interactive-example
<section id="default-example">
  <div id="example-element">This is a box with a border around it.</div>
</section>
```

```css interactive-example
#example-element {
  width: 80%;
  height: 80%;
  display: flex;
  align-items: center;
  justify-content: center;
  padding: 50px;
  background: #fff3d4;
  color: black;
  border: 30px solid;
  border-image: url("/shared-assets/images/examples/border-diamonds.png") 30
    round;
  font-size: 1.2em;
}
```

## Thuộc tính thành phần

Thuộc tính này là dạng viết tắt của các thuộc tính CSS sau:

- {{cssxref("border-image-outset")}}
- {{cssxref("border-image-repeat")}}
- {{cssxref("border-image-slice")}}
- {{cssxref("border-image-source")}}
- {{cssxref("border-image-width")}}

## Cú pháp

```css
/* source | slice */
border-image: linear-gradient(red, blue) 27;

/* source | slice | repeat */
border-image: url("/images/border.png") 27 space;

/* source | slice | width */
border-image: linear-gradient(red, blue) 27 / 35px;

/* source | slice | width | outset | repeat */
border-image: url("/images/border.png") 27 23 / 50px 30px / 1rem round space;

/* Giá trị toàn cục */
border-image: inherit;
border-image: initial;
border-image: revert;
border-image: revert-layer;
border-image: unset;
```

Thuộc tính `border-image` có thể được chỉ định với một đến năm giá trị trong danh sách bên dưới.

> [!NOTE]
> Nếu [giá trị đã tính toán](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#computed_value) của {{cssxref("border-image-source")}} là `none`, hoặc nếu hình ảnh không thể hiển thị, thì {{cssxref("border-style")}} sẽ được hiển thị thay thế.

### Giá trị

- `<'border-image-source'>`
  - : Hình ảnh nguồn. Xem {{cssxref("border-image-source")}}.
- `<'border-image-slice'>`
  - : Kích thước để cắt hình ảnh nguồn thành các vùng. Có thể chỉ định tối đa bốn giá trị. Xem {{cssxref("border-image-slice")}}.
- `<'border-image-width'>`
  - : Độ rộng của hình ảnh đường viền. Có thể chỉ định tối đa bốn giá trị. Xem {{cssxref("border-image-width")}}.
- `<'border-image-outset'>`
  - : Khoảng cách của hình ảnh đường viền từ cạnh ngoài của phần tử. Có thể chỉ định tối đa bốn giá trị. Xem {{cssxref("border-image-outset")}}.
- `<'border-image-repeat'>`
  - : Xác định cách các vùng cạnh của hình ảnh nguồn được điều chỉnh để phù hợp với kích thước hình ảnh đường viền. Có thể chỉ định tối đa hai giá trị. Xem {{cssxref("border-image-repeat")}}.

## Khả năng tiếp cận

Công nghệ hỗ trợ không thể phân tích cú pháp hình ảnh đường viền. Nếu hình ảnh chứa thông tin quan trọng để hiểu mục đích tổng thể của trang, tốt hơn là mô tả nó theo nghĩa ngữ nghĩa trong tài liệu.

- [MDN Hiểu WCAG, Giải thích Hướng dẫn 1.1](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.1_—_providing_text_alternatives_for_non-text_content)
- [Hiểu Tiêu chí Thành công 1.1.1 | Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv-all.html)

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Bitmap

Trong ví dụ này, chúng ta sẽ áp dụng họa tiết kim cương cho đường viền của một phần tử. Nguồn cho hình ảnh đường viền là tệp ".png" có kích thước 81 x 81 pixel, với ba viên kim cương theo chiều dọc và chiều ngang:

![Tám viên kim cương: bốn kim cương đỏ, mỗi góc một viên, và bốn kim cương cam, mỗi cạnh một viên. Phần giữa trống.](border.png)

#### HTML

```html
<div id="bitmap">
  This element is surrounded by a bitmap-based border image!
</div>
```

#### CSS

Để khớp với kích thước của một viên kim cương đơn, chúng ta sẽ dùng giá trị 81 chia 3, tức là `27`, để cắt hình ảnh thành các vùng góc và cạnh. Để căn giữa hình ảnh đường viền trên cạnh của nền phần tử, chúng ta sẽ đặt các giá trị outset bằng một nửa giá trị width. Cuối cùng, giá trị repeat là `round` sẽ làm cho các mảnh đường viền vừa khít, tức là không bị cắt xén hoặc có khoảng trống.

```css
#bitmap {
  width: 200px;
  background-color: #ffffaa;
  border: 36px solid orange;
  margin: 30px;
  padding: 10px;

  border-image: url("border.png") 27 / 36px 28px 18px 8px / 18px 14px 9px 4px
    round;
}
```

#### Kết quả

{{EmbedLiveSample('Bitmap', '100%', 200)}}

### Gradient

#### HTML

```html
<div id="gradient">
  This element is surrounded by a gradient-based border image!
</div>
```

#### CSS

```css
#gradient {
  width: 200px;
  border: 30px solid;
  border-image: repeating-linear-gradient(45deg, #ff3333, #33bbff, #ff3333 30px)
    60;
  padding: 20px;
}
```

#### Kết quả

{{EmbedLiveSample('Gradient')}}

### Đường viền bo tròn

{{cssxref("border-radius")}} không có tác dụng lên hình ảnh đường viền. Điều này là vì {{cssxref("border-image-outset")}} có thể đặt hình ảnh bên ngoài hộp đường viền, nên việc cắt hình ảnh đường viền theo vùng đường viền không có ý nghĩa. Để tạo đường viền bo tròn khi dùng hình ảnh đường viền, bạn nên tạo hình ảnh với các góc bo tròn, hoặc trong trường hợp gradient, vẽ nó như nền thay thế. Dưới đây là một cách tiếp cận sử dụng hai {{cssxref("background-image")}}: một mở rộng hộp đường viền và một cho hộp đệm.

#### HTML

```html
<div id="rounded">
  This element is surrounded by a border image with rounded corners!
</div>
```

#### CSS

```css
#rounded {
  width: 200px;
  /* Use transparent so the background image is visible */
  border: 10px solid transparent;
  padding: 20px;
  border-radius: 20px;
  background-image:
    linear-gradient(white, white), linear-gradient(to right, cyan, lime);
  background-origin: border-box;
  background-clip: padding-box, border-box;
}
```

#### Kết quả

{{EmbedLiveSample('rounded_borders')}}

> [!NOTE]
> Có một giá trị `{{cssxref("background-clip")}}: border-area` mới [đang được đề xuất](https://github.com/w3c/csswg-drafts/issues/9456) để giải quyết trường hợp sử dụng này.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("border")}}
- {{cssxref("outline")}}
- {{cssxref("box-shadow")}}
- {{cssxref("background-image")}}
- Kiểu {{cssxref("url_value", "&lt;url&gt;")}}
- Các hàm gradient: {{CSSxRef("gradient/conic-gradient", "conic-gradient()")}}, {{CSSxRef("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}, {{CSSxRef("gradient/linear-gradient", "linear-gradient()")}}, {{CSSxRef("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}, {{CSSxRef("gradient/radial-gradient", "radial-gradient()")}}, {{CSSxRef("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}
- [Hình ảnh đường viền trong CSS: Trọng tâm chính cho Interop 2023](/en-US/blog/border-images-interop-2023/) trên MDN blog (2023)
