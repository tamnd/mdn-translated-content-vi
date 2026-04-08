---
title: mask-image
slug: Web/CSS/Reference/Properties/mask-image
page-type: css-property
browser-compat: css.properties.mask-image
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`mask-image`** thiết lập hình ảnh được sử dụng làm lớp mặt nạ cho một phần tử, ẩn các phần của phần tử dựa trên kênh alpha của hình ảnh mặt nạ và, tùy thuộc vào giá trị thuộc tính {{cssxref("mask-mode")}}, độ sáng của màu sắc trong hình ảnh mặt nạ.

## Cú pháp

```css
/* Giá trị từ khóa */
mask-image: none;

/* Giá trị <mask-source> */
mask-image: url("masks.svg#mask1");

/* Giá trị <image> */
mask-image: linear-gradient(black, transparent);
mask-image: image(url("mask.png"), skyblue);

/* Nhiều giá trị */
mask-image: url("mask.png"), linear-gradient(black 25%, transparent 35%);

/* Giá trị toàn cục */
mask-image: inherit;
mask-image: initial;
mask-image: revert;
mask-image: revert-layer;
mask-image: unset;
```

### Giá trị

- `none`
  - : Từ khóa này được hiểu là một lớp hình ảnh đen trong suốt.

- `<mask-source>`
  - : Tham chiếu {{cssxref("url_value", "&lt;url&gt;")}} đến một {{SVGElement("mask")}} hoặc đến một hình ảnh CSS.

- {{cssxref("image")}}
  - : Giá trị hình ảnh được sử dụng làm lớp hình ảnh mặt nạ.

## Mô tả

Thuộc tính `mask-image` cung cấp một mặt nạ che giấu một phần của phần tử được áp dụng. Giá trị là danh sách tham chiếu mặt nạ được phân tách bằng dấu phẩy. Mỗi tham chiếu mặt nạ là một `<image>`, một `<mask-source>`, hoặc từ khóa `none`.

Một `<image>` có thể là bất kỳ loại hình ảnh nào, bao gồm cả hình ảnh được tạo ra như [CSS gradient](/vi/docs/Web/CSS/Reference/Values/gradient).

Nếu chỉ có một giá trị được chỉ định trong giá trị thuộc tính `mask-image`, và giá trị đó là `none`, sẽ không có hiệu ứng che phủ nào. Nếu nhiều giá trị được chỉ định, một giá trị `none` được bao gồm trong danh sách có thể không có tác dụng trực tiếp, tuy nhiên, các giá trị `mask-*` khác ở cùng vị trí danh sách sẽ áp dụng cho lớp mặt nạ đen trong suốt và không có hiệu ứng trực quan.

Chỉ các nguồn hình ảnh được phục vụ qua giao thức HTTP và HTTPS mới được chấp nhận làm giá trị `<image>` do chính sách [CORS](/vi/docs/Glossary/CORS). Hình ảnh được phục vụ cục bộ, bao gồm các giao thức `file://` tương đối hoặc tuyệt đối, không được chấp nhận và sẽ hiển thị là đen trong suốt. Để kiểm tra nguồn hình ảnh URL cục bộ, hãy [thiết lập máy chủ cục bộ](/vi/docs/Web/Progressive_web_apps/Tutorials/CycleTracker/Secure_connection#localhost).

Mặt nạ sẽ được tính là lớp hình ảnh đen trong suốt, không tiết lộ gì, trong các trường hợp sau:

- Hình ảnh mặt nạ rỗng (chiều rộng hoặc chiều cao bằng không).
- Hình ảnh mặt nạ không tải xuống được.
- Trình duyệt không hỗ trợ định dạng hình ảnh mặt nạ.
- Hình ảnh mặt nạ không tồn tại.
- Giá trị mặt nạ không trỏ đến một hình ảnh mặt nạ.

Giá trị mặc định của thuộc tính {{cssxref("mask-mode")}} là `match-source`, nghĩa là chế độ được xác định bởi chế độ của chính hình ảnh mặt nạ. Chế độ của hình ảnh mặt nạ thường là `alpha` ngoại trừ khi nguồn mặt nạ là phần tử SVG {{svgelement("mask")}}, trong trường hợp đó chế độ là `luminance` trừ khi chế độ được đổi thành `alpha` qua thuộc tính CSS {{cssxref("mask-type")}} hoặc thuộc tính SVG {{svgattr("mask-type")}}.

Giá trị `mask-mode` rất quan trọng, vì nó xác định liệu hiệu ứng che phủ có phụ thuộc vào giá trị kênh alpha của nguồn hình ảnh hay sự kết hợp của chúng và độ sáng của mặt nạ (độ sáng/tối của các màu tạo nên `mask-image`):

- Trong mọi trường hợp, độ trong suốt alpha của mặt nạ đều quan trọng; các vùng phần tử được che bởi các phần không trong suốt của `mask-image` sẽ được hiển thị, trong khi các vùng được che bởi các phần hình ảnh trong suốt sẽ bị ẩn.
- Khi giá trị `mask-mode` được đặt hoặc giải quyết thành `alpha`, chỉ kênh alpha của các màu quan trọng; tông màu, độ sáng, v.v., không quan trọng.
- Nếu thuộc tính `mask-mode` được đặt hoặc mặc định thành `luminance`, giá trị che phủ là giá trị luminance của mỗi màu nhân với giá trị alpha của nó. `mask-mode` sẽ giải quyết thành `luminance` nếu được đặt rõ ràng thành giá trị đó, hoặc nếu thuộc tính được đặt thành `match-source` và nguồn `mask-image` là SVG {{svgelement("mask")}} không có thuộc tính CSS {{cssxref("mask-type")}} hoặc thuộc tính {{svgattr("mask-type")}} được đặt rõ ràng thành `alpha`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Gradient làm hình ảnh mặt nạ

Trong ví dụ này, chúng ta sử dụng giá trị `<image>` làm mặt nạ, xác định một [radial gradient](/vi/docs/Web/CSS/Reference/Values/gradient/radial-gradient) CSS làm hình ảnh mặt nạ để tạo ra hình ảnh tròn với cạnh mềm mại.

#### HTML

Chúng ta gồm một phần tử HTML {{htmlelement("img")}}, cũng sẽ được sử dụng trong tất cả các ví dụ khác.

```html live-sample___example-image live-sample___first-example
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
```

{{EmbedLiveSample("example-image", "100%", 250)}}

#### CSS

Chúng ta sử dụng hàm CSS {{CSSxRef("gradient/radial-gradient")}} để tạo ra mặt nạ có hình tròn màu đen với bán kính bằng một nửa chiều rộng của mặt nạ, trước khi chuyển sang trong suốt trong 10%.

```css live-sample___first-example
img {
  mask-image: radial-gradient(black 50%, transparent 60%);
}
```

#### Kết quả

{{EmbedLiveSample("first-example", "100%", 250)}}

Phần của phần tử gốc được che bởi hình tròn đen là hoàn toàn không trong suốt, dần mờ dần khi mặt nạ mờ dần đến trong suốt.

### Tài nguyên hình ảnh làm hình ảnh mặt nạ

Trong ví dụ này, `<mask-source>` được sử dụng làm hình ảnh mặt nạ là một SVG bên ngoài.

#### HTML

Chúng ta gồm cùng hình ảnh như ví dụ trước. Chúng ta cũng đã gồm hình ảnh sẽ được sử dụng làm mặt nạ; một ngôi sao có {{cssxref("fill-opacity")}} là `0.5`, hay 50% không trong suốt.

```html
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />

<img
  src="https://mdn.github.io/shared-assets/images/examples/mask-star.svg"
  alt="A star" />
```

#### CSS

Chúng ta sử dụng `mask-star.svg` làm hình ảnh mặt nạ trên hình ảnh đầu tiên của chúng ta:

```css
img:first-of-type {
  mask-image: url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg");
}
```

#### Kết quả

{{EmbedLiveSample("Image resource as a mask image", "100%", 250)}}

Mặt nạ nửa trong suốt, đó là lý do tại sao màu sắc không rực rỡ như ví dụ trước. Phần hình ảnh hiển thị là 50% không trong suốt; độ không trong suốt của mặt nạ được áp dụng.
Mặt nạ nhỏ hơn hình ảnh nên mặc định lặp lại. Chúng ta có thể sử dụng {{cssxref("mask-repeat")}} để kiểm soát việc lặp lại hoặc {{cssxref("mask-size")}} để thay đổi kích thước của mặt nạ, điều chúng ta làm trong ví dụ tiếp theo.

### Nhiều mặt nạ

Ví dụ này minh họa việc áp dụng nhiều mặt nạ.

```html hidden
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
```

#### CSS

Chúng ta áp dụng hai mặt nạ — SVG nửa trong suốt như ví dụ trước, và một {{CSSxRef("gradient/repeating-radial-gradient")}}. Chúng ta kiểm soát kích thước của các mặt nạ bằng thuộc tính {{cssxref("mask-size")}}. Vì mặt nạ đầu tiên không được định cỡ ở 100%, chúng ta đảm bảo các mặt nạ được căn giữa và không lặp lại với các thuộc tính {{cssxref("mask-position")}} và {{cssxref("mask-repeat")}} tương ứng.

```css
img {
  mask-size: 95%, 100%;
  mask-position: center;
  mask-repeat: no-repeat;
  mask-image:
    url("https://mdn.github.io/shared-assets/images/examples/mask-star.svg"),
    repeating-radial-gradient(transparent 0 5px, black 5px 10px);
}
```

#### Kết quả

{{EmbedLiveSample("multiple masks", "100%", 250)}}

### Che phủ bằng phần tử SVG `<mask>`

Ví dụ này minh họa việc sử dụng các phần tử SVG {{svgelement("mask")}} làm mặt nạ. Trong trường hợp này, màu sắc của mặt nạ quan trọng vì giá trị {{cssxref("mask-type")}} cho mặt nạ SVG mặc định là `luminance`, nghĩa là các vùng trắng đặc (100% luminance) sẽ được che phủ và hiển thị, các vùng trong suốt và đen (0% luminance) sẽ bị cắt, và bất kỳ thứ gì ở giữa sẽ được che phủ một phần.

#### HTML

Chúng ta đã thêm một `id` cho mỗi hình ảnh trong bốn hình ảnh, và một SVG chứa số lượng phần tử `<mask>` bằng nhau.

```html
<img
  id="green"
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<img
  id="stroke"
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<img
  id="both"
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<img
  id="alphaMode"
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />

<svg height="0" width="0">
  <mask id="greenMask">
    <path
      d="M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
      fill="green" />
  </mask>
  <mask id="strokeMask">
    <path
      d="M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
      fill="none"
      stroke="white"
      stroke-width="20" />
  </mask>
  <mask id="bothMask">
    <path
      d="M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
      fill="green"
      stroke="white"
      stroke-width="20" />
  </mask>
  <mask id="black">
    <path
      d="M20,70 A40,40,0,0,1,100,70 A40,40,0,0,1,180,70 Q180,130,100,190 Q20,130,20,70 Z"
      fill="black" />
  </mask>
</svg>
```

```html hidden
<p>
  <label>
    <input type="checkbox" />
    Set the <code>mask-mode</code> to <code>alpha</code>.
  </label>
</p>
```

#### CSS

Chúng ta áp dụng một `<mask>` khác nhau cho mỗi `<img>`. Không có phần nào của hình ảnh cuối cùng với nền `black` sẽ hiển thị theo mặc định. Trong trường hợp này, mặc dù tất cả các màu được sử dụng trong ví dụ này đều hoàn toàn không trong suốt, `mask-mode` mặc định là `match-type`, giải quyết thành `luminance` trong trường hợp này.

```css
#green {
  mask-image: url("#greenMask");
}
#stroke {
  mask-image: url("#strokeMask");
}
#both {
  mask-image: url("#bothMask");
}
#alphaMode {
  mask-image: url("#black");
}

body:has(:checked) img {
  mask-mode: alpha;
}
```

Giá trị luminance của `black`, `white`, và `green` lần lượt là `0`, `100`, và [`46.228`](https://www.colorhexa.com/008000). Điều này có nghĩa là các vùng mặt nạ trắng sẽ hiển thị, trong khi các vùng mặt nạ đen hoặc hoàn toàn trong suốt sẽ bị cắt (không hiển thị). Các vùng mặt nạ xanh lá cây sẽ hiển thị nhưng sáng hơn, tương đương với mặt nạ trắng có độ không trong suốt 46.228%.

#### Kết quả

{{EmbedLiveSample("SVG elements as masks", "100%", 540)}}

Bật tắt hộp kiểm để chuyển đổi giá trị `mask-mode` giữa `alpha` (đã chọn) và giá trị ban đầu, giải quyết thành `luminance` (không chọn). Khi `alpha` được sử dụng, màu sắc của mặt nạ không quan trọng; tất cả những gì quan trọng là độ trong suốt alpha. Khi giá trị giải quyết thành `luminance`, các vùng `white` hiển thị, vùng `black` không hiển thị, và các vùng `green` hiển thị nhưng với độ không trong suốt khớp với luminance của màu `green`. Khi `mask-mode` được đặt thành `alpha`, các màu tương đương vì tất cả đều hoàn toàn không trong suốt.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("mask")}} viết tắt
- {{cssxref("mask-origin")}}
- {{cssxref("mask-position")}}
- {{cssxref("mask-repeat")}}
- {{cssxref("mask-size")}}
- {{cssxref("mask-border")}}
- {{cssxref("clip-path")}}
- {{cssxref("background-image")}}
- [Giới thiệu về mặt nạ CSS](/vi/docs/Web/CSS/Guides/Masking/Introduction)
- [Các thuộc tính `mask` CSS](/vi/docs/Web/CSS/Guides/Masking/Mask_properties)
- [Khai báo nhiều mặt nạ](/vi/docs/Web/CSS/Guides/Masking/Multiple_masks)
- Mô-đun [CSS masking](/vi/docs/Web/CSS/Guides/Masking)
