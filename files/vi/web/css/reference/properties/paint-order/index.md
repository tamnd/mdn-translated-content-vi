---
title: paint-order
slug: Web/CSS/Reference/Properties/paint-order
page-type: css-property
browser-compat: css.properties.paint-order
sidebar: cssref
---

Thuộc tính **`paint-order`** [CSS](/en-US/docs/Web/CSS) cho phép bạn kiểm soát thứ tự vẽ phần tô màu và nét vẽ (cùng với các marker) của nội dung văn bản và hình dạng.

## Cú pháp

```css
/* Bình thường */
paint-order: normal;

/* Giá trị đơn */
paint-order: stroke; /* vẽ nét trước, sau đó tô màu và marker */
paint-order: markers; /* vẽ marker trước, sau đó tô màu và nét */

/* Nhiều giá trị */
paint-order: stroke fill; /* vẽ nét trước, rồi tô màu, rồi marker */
paint-order: markers stroke fill; /* vẽ marker, rồi nét, rồi tô màu */

/* Giá trị toàn cục */
paint-order: inherit;
paint-order: initial;
paint-order: revert;
paint-order: revert-layer;
paint-order: unset;
```

Nếu không chỉ định giá trị nào, thứ tự vẽ mặc định là `fill`, `stroke`, `markers`.

Khi chỉ định một giá trị, giá trị đó được vẽ trước, tiếp theo là hai giá trị còn lại theo thứ tự mặc định tương đối. Khi chỉ định hai giá trị, chúng sẽ được vẽ theo thứ tự chỉ định, tiếp theo là giá trị chưa được chỉ định.

> [!NOTE]
> Trong trường hợp thuộc tính này, các marker chỉ phù hợp khi vẽ các hình dạng SVG liên quan đến việc sử dụng các thuộc tính `marker-*` (ví dụ: [`marker-start`](/en-US/docs/Web/SVG/Reference/Attribute/marker-start)) và phần tử [`<marker>`](/en-US/docs/Web/SVG/Reference/Element/marker). Chúng không áp dụng cho văn bản HTML, vì vậy trong trường hợp đó, bạn chỉ có thể xác định thứ tự của `stroke` và `fill`.

### Giá trị

- `normal`
  - : Vẽ các mục khác nhau theo thứ tự vẽ bình thường.
- `stroke`,
  `fill`,
  `markers`
  - : Chỉ định một số hoặc tất cả các giá trị này theo thứ tự bạn muốn chúng được vẽ.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đảo ngược thứ tự vẽ nét và tô màu

#### SVG

```html
<svg xmlns="http://www.w3.org/2000/svg" width="400" height="200">
  <text x="10" y="75">stroke in front</text>
  <text x="10" y="150" class="stroke-behind">stroke behind</text>
</svg>
```

#### CSS

```css
text {
  font-family: sans-serif;
  font-size: 50px;
  font-weight: bold;
  fill: black;
  stroke: red;
  stroke-width: 4px;
}

.stroke-behind {
  paint-order: stroke fill;
}
```

#### Kết quả

{{EmbedLiveSample("Reversing_the_paint_order_of_stroke_and_fill", "100%", 165)}}

### Đảo ngược thứ tự vẽ nét và tô màu bằng HTML

Để kiểm soát thứ tự tô màu và nét trong HTML, bạn có thể sử dụng các thuộc tính CSS {{cssxref("-webkit-text-stroke-color")}} và {{cssxref("-webkit-text-stroke-width")}}.

#### HTML

```html
<div>stroke in front</div>
<div class="stroke-behind">stroke behind</div>
```

#### CSS

```css
div {
  font-family: sans-serif;
  font-size: 50px;
  font-weight: bold;
  fill: black;
  padding-top: 10px;
  padding-bottom: 10px;
  -webkit-text-stroke-color: red;
  -webkit-text-stroke-width: 4px;
}

.stroke-behind {
  paint-order: stroke fill;
}
```

#### Kết quả

{{EmbedLiveSample("Reversing_the_paint_order_of_stroke_and_fill_using_HTML", "100%", 165)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Tricks: paint-order](https://css-tricks.com/almanac/properties/p/paint-order/)
