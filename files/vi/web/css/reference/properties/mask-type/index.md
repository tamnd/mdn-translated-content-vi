---
title: mask-type
slug: Web/CSS/Reference/Properties/mask-type
page-type: css-property
browser-compat: css.properties.mask-type
sidebar: cssref
---

Thuộc tính **`mask-type`** trong [CSS](/en-US/docs/Web/CSS) được áp dụng cho phần tử SVG {{svgElement("mask")}}. Nó xác định liệu có sử dụng nội dung _luminance_ (độ sáng) hay _alpha_ (độ trong suốt) của mặt nạ. Thuộc tính này có thể bị ghi đè bởi thuộc tính {{cssxref("mask-mode")}}. Thuộc tính `mask-type` không có hiệu lực đối với các mặt nạ ảnh hoặc gradient.

## Cú pháp

```css
/* Giá trị từ khóa */
mask-type: luminance;
mask-type: alpha;

/* Giá trị toàn cục */
mask-type: inherit;
mask-type: initial;
mask-type: revert;
mask-type: revert-layer;
mask-type: unset;
```

### Giá trị

- `alpha`
  - : Chỉ ra rằng các giá trị alpha (độ trong suốt) của `<mask>` nên được sử dụng.
- `luminance`
  - : Chỉ ra rằng [các giá trị luminance (độ sáng)](#understanding_luminance) của `<mask>` nên được sử dụng.

## Mô tả

Thuộc tính `mask-type` chỉ có liên quan đến phần tử SVG `<mask>`. Nếu bạn đặt `mask-type: luminance`, mặt nạ sẽ sử dụng độ sáng của mỗi phần của mặt nạ; nếu bạn đặt `mask-type: alpha`, nó sẽ sử dụng mức độ trong suốt hoặc mờ của mỗi phần của mặt nạ.

### Hành vi mặc định

Theo mặc định, phần tử SVG `<mask>` sử dụng `mask-type: luminance`. Điều này có nghĩa là cả màu sắc lẫn độ trong suốt của nội dung mặt nạ đều ảnh hưởng đến việc tạo mặt nạ. Việc mặt nạ có mờ đục hay không phụ thuộc một phần vào độ sáng của màu sắc trong các vùng mờ đục:

- Các vùng trắng hoàn toàn mờ đục (100% luminance) sẽ được tạo mặt nạ và hiển thị.
- Các vùng đen (0% luminance) hoặc hoàn toàn trong suốt sẽ bị cắt và ẩn đi.
- Các vùng có giá trị luminance trung gian sẽ được tạo mặt nạ một phần, phản ánh cả độ sáng, hoặc độ sáng của màu mặt nạ, và độ trong suốt alpha của mỗi vùng của mặt nạ.

### Hiểu về luminance

Độ mờ đục của mặt nạ `luminance` được xác định bởi các giá trị `R`, `G`, `B` và `A` của màu `rgb()` sử dụng công thức sau:

`((0.2125 * R) + (0.7154 * G) + (0.0721 * B)) * A`

Ví dụ, màu `green` (`#008000` hoặc `rgb(0% 50% 0% / 1)`) có giá trị luminance là `35.77%`. Bất kỳ vùng nào được tạo mặt nạ bởi một mặt nạ luminance `green` đặc sẽ hiển thị `35.77%`. Nếu `mask-type` được đặt thành `alpha`, cùng màu `green` hoàn toàn mờ đục sẽ làm vùng được tạo mặt nạ hiển thị `100%`.

Nếu phần tử SVG `<mask>` có `fill="rgb(0 0 0 / 0.5)"`, là màu đen trong suốt 50%, hình dạng tương ứng trên phần tử được tạo mặt nạ sẽ hiển thị ở độ mờ 50% khi `mask-type` được đặt thành `alpha` vì giá trị alpha là `0.5` (độ mờ 50%). Nhưng nếu `mask-type` mặc định hoặc được đặt thành `luminance`, vùng được tạo mặt nạ sẽ hoàn toàn bị cắt và vô hình vì luminance của nó là `0`.

### Hiệu lực của `mask-mode` đối với `mask-type`

Trong khi thuộc tính `mask-type` được đặt trên phần tử SVG `<mask>`, thuộc tính {{cssxref("mask-mode")}} được đặt trên phần tử đang được tạo mặt nạ (phần tử bạn đang áp dụng mặt nạ).
Nếu nguồn ảnh mặt nạ không phải là SVG `<mask>`, thuộc tính này không có hiệu lực.

Giá trị mặc định của `mask-mode` là `match-source`, có nghĩa là trình duyệt sử dụng giá trị `mask-type` từ phần tử `<mask>` để xác định cách diễn giải nó. Nếu `mask-mode` được đặt thành giá trị khác ngoài `match-source`, giá trị đó có ưu tiên cao hơn và ghi đè giá trị `mask-type` của mặt nạ được áp dụng.

Nếu `<mask>` được xác định là nguồn ảnh mặt nạ, và `mask-mode` được đặt thành hoặc mặc định là `match-source`, `mask-mode` sẽ được giải quyết thành giá trị `mask-type` của phần tử `<mask>`: `luminance` hoặc `alpha`. Nếu không được đặt rõ ràng, giá trị mặc định là `luminance`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng thuộc tính `mask-type`

Ví dụ này minh họa cách sử dụng thuộc tính `mask-type` và hiệu lực của các giá trị khác nhau của nó.

#### HTML

Chúng ta đã bao gồm hai ảnh sẽ được tạo mặt nạ. Ngoài tên lớp, hai ảnh là giống nhau.
Chúng ta cũng đã bao gồm một SVG với hai phần tử `<mask>`. Ngoài các giá trị `id`, hai mặt nạ cũng giống nhau: mỗi mặt nạ có hình trái tim màu xanh và trắng và một hình tròn được tô màu trắng và đen bán trong suốt.

```html
<img
  class="alphaMaskType"
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<img
  class="luminanceMaskType"
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />

<svg height="0" width="0">
  <mask id="alphaMask">
    <path
      d="M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
      fill="green"
      stroke="white"
      stroke-width="20" />
    <circle
      cx="170"
      cy="170"
      r="40"
      fill="rgb(0 0 0 / 0.5)"
      stroke="rgb(255 255 255 / 0.5)"
      stroke-width="20" />
  </mask>
  <mask id="luminanceMask">
    <path
      d="M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
      fill="green"
      stroke="white"
      stroke-width="20" />
    <circle
      cx="170"
      cy="170"
      r="40"
      fill="rgb(0 0 0 / 0.5)"
      stroke="rgb(255 255 255 / 0.5)"
      stroke-width="20" />
  </mask>
</svg>
```

#### CSS

Chúng ta áp dụng thuộc tính `mask-type` cho các phần tử `<mask>`, sau đó áp dụng các phần tử `<mask>` và nguồn mặt nạ cho các ảnh.

```css
mask#alphaMask {
  mask-type: alpha;
}

mask#luminanceMask {
  mask-type: luminance;
}

img.alphaMaskType {
  mask-image: url("#alphaMask");
}

img.luminanceMaskType {
  mask-image: url("#luminanceMask");
}
```

#### Kết quả

{{EmbedLiveSample("Examples", "", "250")}}

Vì giá trị mặc định của thuộc tính `mask-mode` là `match-source`, mặt nạ đầu tiên chỉ sử dụng các kênh alpha để xác định mặt nạ: màu trắng và xanh là hoàn toàn mờ đục, và màu trắng và đen 50% là mờ đục 50% vì chỉ có giá trị alpha của màu sắc mới quan trọng. Ví dụ thứ hai sử dụng luminance của màu sắc để xác định độ mờ của mặt nạ, với màu trắng sáng hơn màu xanh, và màu trắng bán trong suốt sáng hơn màu đen bán trong suốt.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("mask")}}
- {{cssxref("mask-mode")}}
- [Introduction to CSS masking](/en-US/docs/Web/CSS/Guides/Masking/Introduction)
- [CSS masking](/en-US/docs/Web/CSS/Guides/Masking) module
- SVG {{svgattr("mask-type")}} attribute
