---
title: Introduction to CSS masking
short-title: Introduction
slug: Web/CSS/Guides/Masking/Introduction
page-type: guide
sidebar: cssref
---

CSS masking cho phép bạn hiện hoặc ẩn các phần của một phần tử một cách có chọn lọc bằng cách áp dụng một hoặc nhiều mask image lên nó. Những mask image này có thể là gradient, hình ảnh hoặc SVG source. Không giống như [CSS clipping](/en-US/docs/Web/CSS/Guides/Masking/Clipping), vốn hiển thị hoặc ẩn hoàn toàn các vùng của phần tử dựa trên hình dạng của một path duy nhất, masking cho phép tạo ra các hiệu ứng transparency và blending tinh tế dựa trên alpha transparency và, tùy chọn, luminance của mask image.

Hướng dẫn này giới thiệu khái niệm masking, các kiểu mask image khác nhau, và cách luminance cùng alpha-transparency của mask ảnh hưởng đến các phần của phần tử được che (hiển thị), so với các phần bị cắt (hay bị ẩn).

## Masking trong CSS là gì?

Trong CSS, mask có thể được dùng để định nghĩa các vùng của một phần tử hiển thị và các vùng khác bị ẩn. Các mask layer, được định nghĩa bởi một hoặc nhiều nguồn {{cssxref("mask-image")}}, xác định các vùng của phần tử cần hiển thị và ở mức opacity nào.

> [!NOTE]
> Nhiều giá trị thuộc tính CSS masking có thể được đặt bằng thuộc tính shorthand {{cssxref("mask")}}.

Với `alpha` mask, opacity của phần tử được mask khớp với opacity của mask được áp dụng. Trong CSS, masking ngược lại với mặt nạ masquerade, nơi khuôn mặt bị ẩn ở chỗ mặt nạ opaque. Trong CSS, các vùng của phần tử mà mask của nó hoàn toàn opaque sẽ hoàn toàn opaque và hiển thị. Ở chỗ mask hoàn toàn transparent, phần tử sẽ bị ẩn hoàn toàn. Các vùng của phần tử được mask bởi các vùng mask phần nào opaque sẽ phần nào opaque, khớp với opacity của mask.

Với alpha mask, màu sắc của mask không quan trọng. Chỉ có opacity của mask mới có ý nghĩa. Với [luminance mask](#alpha_transparency_versus_luminance), độ sáng của màu sắc mask được tính đến khi xác định opacity của phần tử được mask. Màu càng sáng và càng opaque thì phần tử càng opaque. Màu càng tối và càng transparent thì mask càng ít opaque.

Mask có thể được định nghĩa bằng CSS gradient, raster image (chẳng hạn như PNG) và phần tử SVG {{svgelement("mask")}}. Trong hướng dẫn này, chúng ta giới thiệu các kiểu mask image khác nhau khi thảo luận về [opaqueness và transparency](#opaqueness_versus_transparency), [luminance](#alpha_transparency_versus_luminance) và [masking so với CSS clipping](#svg_mask_as_mask_source).

Mỗi mask layer bao gồm một {{cssxref("mask-image")}}, được [định vị](/en-US/docs/Web/CSS/Reference/Properties/mask-position) tương đối so với origin box. Các mask image có thể được [đặt kích thước](/en-US/docs/Web/CSS/Reference/Properties/mask-size), [lặp lại](/en-US/docs/Web/CSS/Reference/Properties/mask-repeat) và [clip](/en-US/docs/Web/CSS/Reference/Properties/mask-clip). Trong trường hợp nhiều mask image được khai báo, cách [các mask layer được composite](/en-US/docs/Web/CSS/Reference/Properties/mask-composite), hay kết hợp lại, có thể được đặt. Những điều này được thảo luận trong [hướng dẫn về masking properties](/en-US/docs/Web/CSS/Guides/Masking/Mask_properties).

> [!NOTE]
> Tất cả các ví dụ sẽ sử dụng hình ảnh sau làm phần tử nền mà mask sẽ được áp dụng:
>
> <img src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg" alt="Pride flag" />

## Opaqueness và transparency

```html hidden live-sample___gradient1 live-sample___gradient2 live-sample___image1   live-sample___luminance1 live-sample___luminance2 live-sample___luminance3
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag"
  class="applied-mask" />
<div class="mask-source"></div>
```

```css hidden live-sample___gradient1 live-sample___gradient2 live-sample___image1   live-sample___luminance1 live-sample___luminance2 live-sample___luminance3 live-sample___svg1
body {
  display: flex;
  gap: 20px;
  padding: 15px;
  background-image:
    linear-gradient(to right, transparent 50%, rgb(0 0 0 / 0.05) 50%),
    linear-gradient(to bottom, transparent 50%, rgb(0 0 0 / 0.05) 50%);
  background-size: 20px 20px;
}
div,
svg,
img {
  width: 220px;
  aspect-ratio: 1;
}
```

Với alpha mask, các vùng hiển thị của một phần tử được xác định bởi alpha-transparency của mask được áp dụng lên nó. Ở chỗ mask hoàn toàn opaque, phần tử sẽ hiển thị. Ở mỗi pixel mà mask hoàn toàn transparent, phần tử cũng sẽ bị ẩn hoàn toàn. Các vùng của phần tử được mask bởi một phần opaque của mask sẽ phần nào opaque, khớp với opacity của mask được áp dụng lên nó.

### Với gradient

Để minh họa điều này, hãy xem một ví dụ sử dụng {{cssxref("conic-gradient")}} làm `mask-image`. CSS gradient, bao gồm conic gradient, có thể được dùng để tạo ra các chuyển tiếp mượt mà giữa các vùng hiển thị và ẩn.

Trong trường hợp này, góc trên-phải của mask hoàn toàn opaque, góc phần tư trên-trái hoàn toàn transparent, và nửa dưới có chuyển tiếp mượt mà giữa opaque và transparent.

```css live-sample___gradient1
.applied-mask {
  mask-image: conic-gradient(black 90deg, transparent 270deg);
}
.mask-source {
  background: conic-gradient(black 90deg, transparent 270deg);
}
```

Lưu ý cách phần tử được áp mask có góc trên-phải hoàn toàn hiển thị, góc phần tư trên-trái bị ẩn, và nửa dưới chuyển tiếp mượt mà từ hiển thị sang transparent, phản ánh khả năng hiển thị của mask image được áp dụng.

{{EmbedLiveSample("gradient1", "", "250px")}}

Với alpha mask, màu sắc của mask không quan trọng, chỉ có transparency mới quan trọng. Trong ví dụ này, chúng ta có một striped gradient với các dải hoàn toàn opaque màu đỏ, semi-opaque màu đỏ và hoàn toàn transparent.

```css live-sample___gradient2
.applied-mask {
  mask-image: repeating-linear-gradient(
    to bottom right,
    red 0 20px,
    #ff000055 20px 40px,
    transparent 40px 60px
  );
}
.mask-source {
  background: repeating-linear-gradient(
    to bottom right,
    red 0 20px,
    #ff000055 20px 40px,
    transparent 40px 60px
  );
}
```

Lưu ý cách các vùng mask hoàn toàn opaque hiển thị các pixel phần tử hoàn toàn opaque, các vùng mask semi-transparent tạo ra các vùng semi-transparent, và các vùng mask hoàn toàn transparent ẩn hoàn toàn các vùng liên quan.

{{EmbedLiveSample("gradient2", "", "250px")}}

### Với hình ảnh được nhập

Hai ví dụ trước dùng gradient làm mask và background image. Mask image không nhất thiết phải là CSS image. Nó có thể là hình ảnh bên ngoài hoặc SVG.

Trong trường hợp này chúng ta dùng một PNG bên ngoài. Hình ảnh chứa một trái tim đầy màu sắc với nền transparent.

```css live-sample___image1 live-sample___luminance1
.applied-mask {
  mask-image: url("https://mdn.github.io/shared-assets/images/examples/colorful-heart.png");
  mask-size: 220px 220px;
}
.mask-source {
  background: url("https://mdn.github.io/shared-assets/images/examples/colorful-heart.png");
  background-size: 220px 220px;
}
```

Lưu ý cách các vùng mask transparent cắt bỏ phần tử; chỉ những phần của phần tử ở chỗ mask opaque mới hiển thị. Màu sắc của mask không quan trọng.

{{EmbedLiveSample("image1", "", "250px")}}

## Alpha transparency so với luminance

Giá trị mặc định của thuộc tính `mask-mode` — `match-source` — đặt chế độ thành `alpha` hoặc `luminance`, tùy thuộc vào giá trị. Giá trị `match-source` được resolve thành `alpha` cho tất cả mask source trừ phần tử SVG {{svgelement("mask")}}. Nếu mask source là phần tử `<mask>`, `match-source` sẽ resolve thành giá trị thuộc tính CSS {{cssxref("mask-type")}} của `<mask>`, nếu được đặt. Nếu không, nó resolve thành giá trị của thuộc tính SVG {{svgattr("mask-type")}} được đặt trên phần tử `<mask>`. Nếu điều đó cũng không được đặt rõ ràng, `match-source` sẽ resolve thành `luminance`.

Nếu `mask-mode` resolve thành `luminance`, hoặc chúng ta đặt rõ ràng thành `luminance`, màu sắc của mask sẽ ảnh hưởng đến opacity của mask. Trong demo trước, `mask-mode` không được đặt, nên giá trị mặc định là `match-source`. Vì hình ảnh trái tim màu sắc là PNG transparent, `match-source` resolve thành `alpha`. Bằng cách đặt rõ ràng thuộc tính này, chúng ta có thể kiểm soát chế độ. Trong demo này, chúng ta thay đổi `mask-mode` thành `luminance`.

```css live-sample___luminance1
.applied-mask {
  mask-mode: luminance;
}
```

Khi áp dụng `mask-mode: luminance` cho cùng mask như ví dụ trước, các vùng của phần tử mà mask **sáng nhất** sẽ opaque hơn, trong khi các vùng **tối hơn** sẽ ít opaque hơn.

{{EmbedLiveSample("luminance1", "", "250px")}}

Opacity của luminance mask được xác định bởi các giá trị `R`, `G`, `B` và `A` của màu {{glossary("RGB")}} theo công thức:

`((0.2125 * R) + (0.7154 * G) + (0.0721 * B)) * A`

Ví dụ, {{cssxref("named-color")}} mới nhất là `rebeccapurple`, tức là `#663399`. Mặc dù người ta có thể nghĩ rằng độ sáng có thể tương đương với L của hàm màu `hsl()`, nhưng thực ra không đơn giản như vậy. Giá trị `#663399` tương đương với `rgb(40% 20% 60% / 1)` và `hsl(270 50% 40% / 1)`, nhưng giá trị brightness là `27.134%`, không phải `40%`.

`((0.2125 * 0.4) + (0.7154 * 0.2) + (0.0721 * 0.6)) * 1 = 0.27134`

Màu trắng có giá trị brightness là `100%`.

`((0.2125 * 1) + (0.7154 * 1) + (0.0721 * 1)) * 1 = 1`

Độ sáng của màu đen là `0%`.

`((0.2125 * 0) + (0.7154 * 0) + (0.0721 * 0)) * 1 = 0`

Chúng ta sẽ minh họa điều này bằng cách thêm màu trắng (`rgb(100% 100% 100%)`) với độ sáng `100%` ở opacity `27.234%` vào linear gradient màu `rebeccapurple`, `white` và `black`, rồi dùng nó để mask hình ảnh của chúng ta. Màu trắng này resolve thành cùng giá trị opacity:

`((0.2125 * 1) + (0.7154 * 1) + (0.0721 * 1)) * 0.27134 = 0.27134`

```css live-sample___luminance2
.applied-mask {
  mask-image: repeating-linear-gradient(
    to bottom left,
    rebeccapurple 0 20px,
    rgb(100% 100% 100% / 0.27134) 20px 40px,
    black 40px 45px,
    white 45px 50px
  );
  mask-mode: luminance;
}
.mask-source {
  background: repeating-linear-gradient(
    to bottom left,
    rebeccapurple 0 20px,
    rgb(100% 100% 100% / 0.27134) 20px 40px,
    black 40px 45px,
    white 45px 50px
  );
}
```

```css hidden live-sample___luminance2 live-sample___luminance3
:has(:checked) .applied-mask {
  mask-mode: alpha;
}
```

```html hidden live-sample___luminance2   live-sample___luminance3
<label><input type="checkbox" /><code>mask-mode: alpha;</code></label>
```

Các vùng có mask `white` hoàn toàn opaque. Các vùng có mask `black` hoàn toàn transparent. Các vùng có mask `rebeccapurple` và các vùng có mask `white` opaque `27.1234%` đều opaque `27.1234%`.

{{EmbedLiveSample("luminance2", "", "250px")}}

Nếu bạn chuyển đổi `mask-mode` thành `alpha`, màu sắc của gradient không còn quan trọng nữa. Toàn bộ phần tử sẽ opaque ngoại trừ các vùng bị bao phủ bởi màu trắng semi-opaque.

Thuộc tính `mask-mode` cho phép dùng raster image không có alpha transparency, chẳng hạn như JPEG, làm mask image. JPEG được cấu thành từ các pixel opaque. Dùng JPEG làm mask với chế độ mask `alpha` mặc định sẽ ẩn toàn bộ phần tử. Ngược lại, giá trị `luminance` của `mask-mode` cắt phần tử ở chỗ mask màu đen (không có độ sáng), hoàn toàn opaque ở chỗ mask là trắng opaque (100% độ sáng), với các vùng khác semi-transparent dựa trên độ sáng của vùng mask che phủ nó.

Trong ví dụ này, chúng ta có mặt trăng màu trắng trên bầu trời đêm đen.

```css live-sample___luminance3
.applied-mask {
  mask-image: url("https://mdn.github.io/shared-assets/images/examples/moon.jpg");
  mask-mode: luminance;
  mask-size: 220px;
}
.mask-source {
  background: url("https://mdn.github.io/shared-assets/images/examples/moon.jpg");
  background-size: 220px;
}
```

Phần tử bị cắt và không hiển thị ở chỗ bầu trời màu đen. Hình ảnh hiển thị rõ nhất ở chỗ mặt trăng sáng nhất.

{{EmbedLiveSample("luminance3", "", "250px")}}

Trong trường hợp này, nếu bạn chuyển đổi `mask-mode` thành `alpha`, toàn bộ phần tử sẽ hiển thị vì toàn bộ mask đều opaque.

## SVG `<mask>` là mask source

Mask có thể là bất kỳ kiểu {{cssxref("image")}} CSS nào hoặc một `<mask-source>`. `<mask-source>` là tham chiếu {{cssxref("url_value", "&lt;url&gt;")}} đến phần tử SVG {{SVGElement("mask")}}. Điều này tương tự như clipping với thuộc tính CSS {{cssxref("clip-path")}}, trong đó "mask" là phần tử SVG {{SVGElement("clipPath")}} thay thế (với `clip-path`, luminance của path không quan trọng).

Trong ví dụ này, chúng ta định nghĩa một SVG với phần tử `<mask>`, một phần tử {{SVGElement("clipPath")}} giống hệt và một phần tử {{SVGElement("path")}} giống hệt để bạn có thể xem mask và clip path source.

```html live-sample___svg1
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag"
  class="applied-mask" />
<svg class="mask-source">
  <mask id="mask-heart">
    <path
      d="M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
      fill="rgb(255 0 0 / 0.5)"
      stroke="rgb(255 255 255 / 1)"
      stroke-width="20" />
  </mask>
  <clippath id="clip-heart">
    <path
      d="M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
      fill="rgb(255 0 0 / 0.5)"
      stroke="rgb(255 255 255 / 1)"
      stroke-width="20" />
  </clippath>
  <path
    d="M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
    fill="rgb(255 0 0 / 0.5)"
    stroke="rgb(255 255 255 / 1)"
    stroke-width="20" />
</svg>
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag"
  class="applied-clip" />
```

```css live-sample___svg1
.applied-mask {
  mask-image: url("#mask-heart");
}
.applied-clip {
  clip-path: url("#clip-heart");
}
```

```css hidden live-sample___svg1
:has(:checked) .applied-mask {
  mask-mode: alpha;
}
body {
  flex-flow: row wrap;
}
```

```html hidden live-sample___svg1
<label><input type="checkbox" /><code>mask-mode: alpha;</code></label>
```

Vì nguồn hình ảnh là `<mask>`, và mask không có thuộc tính CSS `mask-type` cũng như thuộc tính SVG `mask-type` được đặt, `mask-type` mặc định là `alpha`, nên giá trị mặc định `mask-mode: match-source` resolve thành `luminance`. Điều này là vì, đối với mask source là phần tử SVG {{svgelement("mask")}}, `mask-type` mặc định là `luminance` trừ khi thuộc tính {{svgattr("mask-type")}} được đặt rõ ràng thành `alpha`.

{{EmbedLiveSample("svg1", "", "300px")}}

Vì chúng ta không đặt thuộc tính `mask-type` hoặc thuộc tính CSS trên mask của mình, giá trị mặc định `mask-mode: match-source` resolve thành `luminance`. Toggle checkbox để đặt giá trị `mask-mode` thành `alpha` hoặc để nó mặc định thành `match-source`.

Ví dụ này cũng minh họa sự khác biệt giữa masking và clipping trong CSS. Bạn sẽ nhận thấy rằng luminance và alpha-transparency liên quan đến masking nhưng không liên quan đến clipping. Masking có thể được dùng để kiểm soát opacity của một phần tử, trong khi clipping hiển thị mọi thứ bên trong clipping path và ẩn hoàn toàn các phần của phần tử bên ngoài clip path. Các vùng bị clip hoàn toàn vô hình, trong khi các vùng bị mask có thể hiển thị một phần hoặc toàn bộ.

Nếu tất cả những gì bạn cần là hình dạng, clipping có thể đủ. Nhưng nếu bạn cần fading, opacity biến đổi hoặc thậm chí kiểm soát vị trí và kích thước (điều mà chúng ta sẽ thảo luận trong một hướng dẫn riêng), masking phù hợp hơn.

## Xem thêm

- [Giới thiệu về CSS clipping](/en-US/docs/Web/CSS/Guides/Masking/Clipping)
- [Các thuộc tính CSS `mask`](/en-US/docs/Web/CSS/Guides/Masking/Mask_properties)
- [Khai báo nhiều mask](/en-US/docs/Web/CSS/Guides/Masking/Multiple_masks)
- Module [CSS masking](/en-US/docs/Web/CSS/Guides/Masking)
