---
title: mask-mode
slug: Web/CSS/Reference/Properties/mask-mode
page-type: css-property
browser-compat: css.properties.mask-mode
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`mask-mode`** được đặt trên phần tử đang được che phủ. Nó thiết lập liệu tham chiếu mặt nạ được xác định bởi {{cssxref("mask-image")}} được xử lý như một mặt nạ luminance hay alpha.

## Cú pháp

```css
/* Giá trị từ khóa */
mask-mode: alpha;
mask-mode: luminance;
mask-mode: match-source;

/* Nhiều giá trị */
mask-mode: alpha, match-source;

/* Giá trị toàn cục */
mask-mode: inherit;
mask-mode: initial;
mask-mode: revert;
mask-mode: revert-layer;
mask-mode: unset;
```

### Giá trị

Thuộc tính `mask-mode` có thể nhận nhiều giá trị từ khóa `<masking-mode>` được phân tách bằng dấu phẩy, bao gồm:

- `alpha`
  - : Cho biết rằng các giá trị alpha (độ trong suốt) của hình ảnh mặt nạ sẽ được sử dụng.

- `luminance`
  - : Cho biết rằng các giá trị [luminance (độ sáng)](#understanding_luminance) của hình ảnh mặt nạ sẽ được sử dụng.

- `match-source`
  - : Cho biết rằng loại mặt nạ được xác định bởi nguồn. Đây là giá trị thuộc tính mặc định.
    - Nếu {{cssxref("mask-image")}} tham chiếu đến SVG {{svgelement("mask")}}, giá trị thuộc tính {{cssxref("mask-type")}} của nó được sử dụng, hoặc thuộc tính {{SVGAttr("mask-type")}} của nó, nếu có. Nếu không có gì được đặt rõ ràng, giá trị này mặc định thành `luminance`.
    - Nếu nguồn hình ảnh mặt nạ là {{cssxref("image")}} hoặc {{cssxref("gradient")}}, các giá trị `alpha` của hình ảnh mặt nạ được sử dụng.

## Mô tả

Mặt nạ truyền độ trong suốt của nó, và tùy thuộc vào loại mặt nạ, độ sáng của nó, đến phần tử đang được che phủ.
Nếu mặt nạ thuộc loại {{cssxref("image")}}, theo mặc định các giá trị alpha của hình ảnh mặt nạ xác định khả năng hiển thị của mỗi phần của phần tử được che: nơi mặt nạ không trong suốt, phần tương ứng của phần tử được che sẽ hiển thị; nơi mặt nạ trong suốt một phần, phần tử cũng vậy, với những vùng đó của phần tử bị ẩn. Đây là hành vi mặc định cho mặt nạ `<image>` khi thuộc tính `mask-mode` được đặt hoặc mặc định thành `match-source`, và luôn là trường hợp khi `mask-mode` được đặt rõ ràng thành `alpha`.

### Hiểu về luminance

Trong trường hợp mặt nạ `luminance`, khả năng hiển thị của phần tử được che phụ thuộc vào cả độ không trong suốt của mặt nạ và độ sáng của màu sắc trong các vùng không trong suốt. Các vùng trắng không trong suốt (100% luminance) (alpha = 1) sẽ được che phủ và hiển thị, và các vùng đen trong suốt (0% luminance) (alpha = 0) sẽ bị cắt. Các vùng có màu sắc giữa trắng và đen với độ không trong suốt một phần sẽ được che phủ một phần, phản ánh luminance và độ trong suốt alpha của mỗi màu tạo nên mặt nạ.

Độ không trong suốt của mặt nạ `luminance` được xác định bởi các giá trị `R`, `G`, `B`, và `A` của một màu `rgb()` sử dụng công thức:

`((0.2125 * R) + (0.7154 * G) + (0.0721 * B)) * A`

Ví dụ, màu `green` là `#008000` hoặc `rgb(0% 50% 0% / 1)`. Trong mặt nạ `luminance`, bất kỳ vùng nào được che bởi mặt nạ `green` đặc sẽ có độ không trong suốt `35.77%`. Nếu `mask-mode` cho mặt nạ này được đặt thành `alpha`, vì `green` là màu hoàn toàn không trong suốt, vùng được che sẽ có độ không trong suốt `100%`.

### Nhiều giá trị

Mỗi giá trị `mask-mode` là một danh sách giá trị được phân tách bằng dấu phẩy. Khi có nhiều giá trị, mỗi giá trị tương ứng với một lớp mặt nạ ở cùng vị trí trong thuộc tính {{cssxref("mask-image")}}. Các giá trị xác định liệu các hình ảnh mặt nạ liên quan được xử lý như mặt nạ `luminance` hay `alpha`.

### Hiểu về `match-source`

Trong trường hợp `match-source`, liệu `luminance` hay `alpha` được sử dụng phụ thuộc vào chế độ mặt nạ của nguồn mặt nạ. Nếu giá trị thuộc tính `mask-image` là tham chiếu đến phần tử SVG {{svgelement("mask")}}, giá trị thuộc tính {{cssxref("mask-type")}} của phần tử `<mask>` được sử dụng. Nếu không có thuộc tính CSS `mask-type` nào được đặt trên phần tử `<mask>`, giá trị của thuộc tính {{svgattr("mask-type")}} của phần tử `<mask>` được sử dụng, nếu có và được hỗ trợ. Nếu không có gì được đặt rõ ràng, giá trị này mặc định thành `luminance`; nhưng chỉ trong trường hợp phần tử `<mask>` là nguồn mặt nạ. Nếu không, như đã lưu ý trước đó, nếu nguồn hình ảnh mặt nạ là {{cssxref("image")}}, thay vì SVG `<mask>`, các giá trị `alpha` của hình ảnh lớp mặt nạ được sử dụng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cách dùng và giá trị

Ví dụ này minh họa cách dùng cơ bản và các giá trị khác nhau của thuộc tính `mask-mode`.

#### HTML

Chúng ta gồm ba phần tử `<div>` để có thể minh họa ba giá trị từ khóa `mask-mode` được liệt kê.

```html
<div class="alpha">ALPHA</div>
<div class="luminance">LUMINANCE</div>
<div class="matchSource">MATCH-SOURCE</div>
```

#### CSS

Mỗi `<div>` được cung cấp cùng một nền và hình ảnh che. Sự khác biệt duy nhất giữa mỗi `<div>` là giá trị của thuộc tính `mask-mode`:

```css
div {
  background: blue linear-gradient(red, blue);
  mask-image: url("https://mdn.github.io/shared-assets/images/examples/mdn.svg");
}

.alpha {
  mask-mode: alpha;
}

.luminance {
  mask-mode: luminance;
}

.matchSource {
  mask-mode: match-source;
}
```

```css hidden
div {
  width: 227px;
  height: 200px;
  float: left;
  text-align: center;
  line-height: 65px;
  color: white;
  text-shadow: 1px 1px 2px black;
  font-family: sans-serif;
}
```

#### Kết quả

{{EmbedLiveSample("Usage and values", "", "250px")}}

Vì nguồn mặt nạ là `<image>` chứ không phải SVG `<mask>`, giá trị `match-source` giải quyết thành `alpha`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("mask-type")}}
- {{cssxref("mask-image")}}
- {{cssxref("mask")}} viết tắt
- [Giới thiệu về mặt nạ CSS](/vi/docs/Web/CSS/Guides/Masking/Introduction)
- [Các thuộc tính `mask` CSS](/vi/docs/Web/CSS/Guides/Masking/Mask_properties)
- [Khai báo nhiều mặt nạ](/vi/docs/Web/CSS/Guides/Masking/Multiple_masks)
- Mô-đun [CSS masking](/vi/docs/Web/CSS/Guides/Masking)
