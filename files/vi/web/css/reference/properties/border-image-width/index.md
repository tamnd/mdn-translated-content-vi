---
title: border-image-width
slug: Web/CSS/Reference/Properties/border-image-width
page-type: css-property
browser-compat: css.properties.border-image-width
sidebar: cssref
---

Thuộc tính **`border-image-width`** [CSS](/en-US/docs/Web/CSS) đặt chiều rộng của [hình ảnh đường viền](/en-US/docs/Web/CSS/Reference/Properties/border-image) của phần tử.

Nếu giá trị của thuộc tính này lớn hơn {{cssxref("border-width")}} của phần tử, hình ảnh đường viền sẽ mở rộng ra ngoài cạnh padding (và/hoặc nội dung).

{{InteractiveExample("CSS Demo: border-image-width")}}

```css interactive-example-choice
border-image-width: 30px;
```

```css interactive-example-choice
border-image-width: 15px 40px;
```

```css interactive-example-choice
border-image-width: 2.6rem;
```

```css interactive-example-choice
border-image-width: 20% 8%;
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

## Cú pháp

```css
/* Giá trị từ khóa */
border-image-width: auto;

/* Giá trị <length> */
border-image-width: 1rem;

/* Giá trị <percentage> */
border-image-width: 25%;

/* Giá trị <number> */
border-image-width: 3;

/* trên và dưới | trái và phải */
border-image-width: 2em 3em;

/* trên | trái và phải | dưới */
border-image-width: 5% 15% 10%;

/* trên | phải | dưới | trái */
border-image-width: 5% 2em 10% auto;

/* Giá trị toàn cục */
border-image-width: inherit;
border-image-width: initial;
border-image-width: revert;
border-image-width: revert-layer;
border-image-width: unset;
```

Thuộc tính `border-image-width` có thể được chỉ định bằng một, hai, ba hoặc bốn giá trị được chọn từ danh sách các giá trị bên dưới.

- Khi chỉ định **một** giá trị, nó áp dụng cùng chiều rộng cho **cả bốn cạnh**.
- Khi chỉ định **hai** giá trị, chiều rộng đầu tiên áp dụng cho **trên và dưới**, chiều rộng thứ hai cho **trái và phải**.
- Khi chỉ định **ba** giá trị, chiều rộng đầu tiên áp dụng cho **trên**, chiều rộng thứ hai cho **trái và phải**, chiều rộng thứ ba cho **dưới**.
- Khi chỉ định **bốn** giá trị, các chiều rộng áp dụng cho **trên**, **phải**, **dưới**, và **trái** theo thứ tự đó (theo chiều kim đồng hồ).

### Giá trị

- `<length-percentage>`
  - : Chiều rộng của đường viền, được chỉ định là {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Phần trăm tương đối với _chiều rộng_ của vùng hình ảnh đường viền cho các độ lệch ngang và _chiều cao_ của vùng hình ảnh đường viền cho các độ lệch dọc. Không được âm.
- `<number>`
  - : Chiều rộng của đường viền, được chỉ định là bội số của {{cssxref("border-width")}} tương ứng. Không được âm.
- `auto`
  - : Chiều rộng của đường viền được đặt bằng chiều rộng hoặc chiều cao nội tại (tùy theo cái nào áp dụng) của {{cssxref("border-image-slice")}} tương ứng. Nếu hình ảnh không có kích thước nội tại cần thiết, `border-width` tương ứng sẽ được sử dụng thay thế.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Xếp ô hình ảnh đường viền

Ví dụ này tạo một hình ảnh đường viền sử dụng tệp ".png" sau, có kích thước 90 x 90 pixel:

![Hình ảnh vuông chứa tám hình tròn. Các hình tròn ở các góc có màu tím nhạt. Bốn hình tròn ở các cạnh có màu xanh lam. Vùng ở giữa, nơi một hình tròn thứ chín có thể vừa vặn, trống.](border.png)

Do đó, mỗi hình tròn trong hình ảnh nguồn có kích thước 30 x 30 pixel.

#### HTML

```html
<p>
  Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy
  eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam
  voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita
  kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.
</p>
```

#### CSS

```css
p {
  border: 20px solid;
  border-image: url("border.png") 30 round;
  border-image-width: 16px;
  padding: 40px;
}
```

#### Kết quả

{{EmbedLiveSample('Tiling_a_border_image', 200, 240)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Nền và đường viền](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)
- [Học CSS: Nền và đường viền](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders)
- [Border images in CSS: A key focus area for Interop 2023](/en-US/blog/border-images-interop-2023/) trên blog MDN (2023)
