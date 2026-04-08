---
title: image-rendering
slug: Web/CSS/Reference/Properties/image-rendering
page-type: css-property
browser-compat: css.properties.image-rendering
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`image-rendering`** đặt thuật toán thu phóng hình ảnh. Thuộc tính này áp dụng cho bản thân phần tử, cho bất kỳ hình ảnh nào được đặt trong các thuộc tính khác của nó, và cho các phần tử con của nó.

{{InteractiveExample("CSS Demo: image-rendering")}}

```css interactive-example-choice
image-rendering: auto;
```

```css interactive-example-choice
image-rendering: smooth;
```

```css interactive-example-choice
image-rendering: crisp-edges;
```

```css interactive-example-choice
image-rendering: pixelated;
```

```html interactive-example
<section id="default-example">
  <img
    class="transition-all"
    id="example-element"
    src="/shared-assets/images/examples/lizard.png" />
</section>
```

```css interactive-example
#example-element {
  height: 480px;
  object-fit: cover;
}
```

{{Glossary("user agent", "Tác nhân người dùng")}} sẽ thu phóng hình ảnh khi tác giả trang chỉ định các kích thước khác với kích thước tự nhiên của nó. Việc thu phóng cũng có thể xảy ra do tương tác người dùng (phóng to). Ví dụ, nếu kích thước tự nhiên của hình ảnh là `100×100px` nhưng kích thước thực tế của nó là `200×200px` (hoặc `50×50px`), thì hình ảnh sẽ được phóng to (hoặc thu nhỏ) bằng thuật toán được chỉ định bởi `image-rendering`. Thuộc tính này không có hiệu lực đối với các hình ảnh không được thu phóng.

## Cú pháp

```css
/* Giá trị từ khóa */
image-rendering: auto;
image-rendering: smooth;
image-rendering: crisp-edges;
image-rendering: pixelated;

/* Giá trị toàn cục */
image-rendering: inherit;
image-rendering: initial;
image-rendering: revert;
image-rendering: revert-layer;
image-rendering: unset;
```

### Giá trị

- `auto`
  - : Thuật toán thu phóng phụ thuộc vào UA. Kể từ phiên bản 1.9 (Firefox 3.0), Gecko sử dụng lấy mẫu lại _bilinear_ (chất lượng cao).
- `smooth`
  - : Hình ảnh nên được thu phóng bằng một thuật toán tối đa hóa vẻ ngoài của hình ảnh. Cụ thể, các thuật toán thu phóng "làm mịn" màu sắc là chấp nhận được, chẳng hạn như nội suy bilinear. Điều này dành cho các hình ảnh như ảnh chụp.
- `crisp-edges`
  - : Hình ảnh được thu phóng bằng một thuật toán như "nearest neighbor" để bảo tồn độ tương phản và các cạnh trong hình ảnh. Thường dành cho các hình ảnh như pixel art hoặc bản vẽ đường thẳng, không xảy ra làm mờ hoặc làm mịn màu sắc.
- `pixelated`
  - : Hình ảnh được thu phóng bằng thuật toán "nearest neighbor" hoặc tương tự đến bội số nguyên gần nhất của kích thước hình ảnh gốc, sau đó dùng nội suy mịn để đưa hình ảnh đến kích thước cuối cùng mong muốn. Điều này nhằm bảo tồn giao diện "pixel hóa" mà không gây ra các hiện vật thu phóng khi độ phân giải phóng to không phải là bội số nguyên của bản gốc.

> [!NOTE]
> Các giá trị `optimizeQuality` và `optimizeSpeed` có trong một bản nháp đầu (và đến từ đối tác SVG {{SVGAttr("image-rendering")}}) được định nghĩa là từ đồng nghĩa tương ứng với các giá trị `smooth` và `pixelated`.

> [!NOTE]
> Mô-đun [hình ảnh CSS](/en-US/docs/Web/CSS/Guides/Images) định nghĩa một giá trị `high-quality` cho thuộc tính `image-rendering` để ưu tiên thu phóng chất lượng cao hơn, tuy nhiên điều này chưa được hỗ trợ trong bất kỳ trình duyệt nào.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt thuật toán thu phóng hình ảnh

Trong ví dụ này, một hình ảnh được lặp lại ba lần, mỗi lần áp dụng một giá trị `image-rendering` khác nhau.

```html hidden
<div>
  <img
    class="auto"
    alt="A small photo of some white and yellow flower against a leafy green background. The image is about 33% smaller than the size it is being displayed at. This upscaling causes the image to appear blurry, with notable soft edges between objects."
    src="blumen.jpg" />
  <img
    class="smooth"
    alt="The same photo as the previous image, which is also being upscaled the same amount. Browsers that support the smooth value for the image-rendering property display the image with the maximize appearance."
    src="blumen.jpg" />
  <img
    class="pixelated"
    alt="The same photo as the previous image, which is also being upscaled the same amount. Browsers that support the pixelated value for the image-rendering property display the image as very pixelated. Individual pixels are clearly visible and edges appear much sharper."
    src="blumen.jpg" />
  <img
    class="crisp-edges"
    alt="The same photo as the previous images, which is also being upscaled the same amount. Browsers that support the crisp-edges value for the image-rendering property display the image as very pixelated. In these examples, there is virtually no perceivable difference between the pixelated and crisp-edges versions."
    src="blumen.jpg" />
</div>
```

```css hidden
img {
  height: 200px;
}
```

#### CSS

```css
.auto {
  image-rendering: auto;
}

.smooth {
  image-rendering: smooth;
}

.pixelated {
  image-rendering: pixelated;
}

.crisp-edges {
  image-rendering: crisp-edges;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_image_scaling_algorithms', 260, 260)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("object-fit")}}
- {{cssxref("object-position")}}
- {{cssxref("image-orientation")}}
- {{cssxref("image-resolution")}}
- Mô-đun [hình ảnh CSS](/en-US/docs/Web/CSS/Guides/Images)
- Thuộc tính SVG {{SVGAttr("image-rendering")}}
