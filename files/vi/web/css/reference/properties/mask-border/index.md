---
title: mask-border
slug: Web/CSS/Reference/Properties/mask-border
page-type: css-shorthand-property
browser-compat: css.properties.mask-border
sidebar: cssref
---

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`mask-border`** trong [CSS](/en-US/docs/Web/CSS) cho phép bạn tạo mặt nạ dọc theo cạnh viền của một phần tử.

## Các thuộc tính thành phần

Thuộc tính này là dạng viết tắt của các thuộc tính CSS sau:

- {{cssxref("mask-border-mode")}}
- {{cssxref("mask-border-outset")}}
- {{cssxref("mask-border-repeat")}}
- {{cssxref("mask-border-slice")}}
- {{cssxref("mask-border-source")}}
- {{cssxref("mask-border-width")}}

## Cú pháp

```css
/* source | slice */
mask-border: url("border-mask.png") 25;

/* source | slice | repeat */
mask-border: url("border-mask.png") 25 space;

/* source | slice | width */
mask-border: url("border-mask.png") 25 / 35px;

/* source | slice | width | outset | repeat | mode */
mask-border: url("border-mask.png") 25 / 35px / 12px space alpha;

/* Giá trị toàn cục */
mask-border: inherit;
mask-border: initial;
mask-border: revert;
mask-border: revert-layer;
mask-border: unset;
```

### Giá trị

- `<'mask-border-source'>`
  - : Hình ảnh nguồn. Xem {{cssxref("mask-border-source")}}.
- `<'mask-border-slice'>`
  - : Kích thước để cắt hình ảnh nguồn thành các vùng. Có thể chỉ định tối đa bốn giá trị. Xem {{cssxref("mask-border-slice")}}.
- `<'mask-border-width'>`
  - : Chiều rộng của mặt nạ viền. Có thể chỉ định tối đa bốn giá trị. Xem {{cssxref("mask-border-width")}}.
- `<'mask-border-outset'>`
  - : Khoảng cách của mặt nạ viền từ cạnh ngoài của phần tử. Có thể chỉ định tối đa bốn giá trị. Xem {{cssxref("mask-border-outset")}}.
- `<'mask-border-repeat'>`
  - : Xác định cách các vùng cạnh của hình ảnh nguồn được điều chỉnh để khớp với kích thước của mặt nạ viền. Có thể chỉ định tối đa hai giá trị. Xem {{cssxref("mask-border-repeat")}}.
- `<'mask-border-mode'>`
  - : Xác định liệu hình ảnh nguồn được xử lý như mặt nạ luminance hay mặt nạ alpha. Xem {{cssxref("mask-border-mode")}}.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt mặt nạ viền dạng bitmap

Trong ví dụ này, chúng tôi sẽ che viền của một phần tử bằng một mẫu hình thoi. Nguồn của mặt nạ là một tệp ".png" 90 nhân 90 pixel, với ba hình thoi xếp theo chiều dọc và chiều ngang:

<img src="https://mdn.github.io/shared-assets/images/examples/mask-border-diamonds.png" alt="The image used for the mask examples on this page. The mask is a transparent square with three rows of three diamonds each. The diamonds are a very light, almost white, shade of grey. The middle part between the diamonds is also solid grey. The parts between the outside of the diamonds and the edge of the image are transparent." loading="lazy" style="background-color: black;">

Để khớp với kích thước của một hình thoi, chúng tôi sẽ dùng giá trị 90 chia cho 3, tức là `30`, để cắt hình ảnh thành các vùng góc và cạnh. Giá trị lặp `round` sẽ làm cho các lát mặt nạ khớp đều, tức là không bị cắt xén hoặc có khoảng trống.

```html live-sample___mask-border-example
<div class="masked">
  This element is surrounded by a bitmap-based mask border! Pretty neat, isn't
  it?
</div>
```

```css-nolint live-sample___mask-border-example
.masked {
  width: 200px;
  background-color: lavender;
  border: 18px solid salmon;
  padding: 10px;

  -webkit-mask-box-image: url("https://mdn.github.io/shared-assets/images/examples/mask-border-diamonds.png")
    30 fill /          /* slice */
    20px /             /* width */
    1px                /* outset */
    round;             /* repeat */

  mask-border:
    url("https://mdn.github.io/shared-assets/images/examples/mask-border-diamonds.png")
    30 fill /        /* slice */
    20px /           /* width */
    1px              /* outset */
    round;           /* repeat */
}
```

{{EmbedLiveSample("mask-border-example", "", "170px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("mask-border-mode")}}
- {{cssxref("mask-border-outset")}}
- {{cssxref("mask-border-repeat")}}
- {{cssxref("mask-border-source")}}
- {{cssxref("mask-border-width")}}
