---
title: mask
slug: Web/CSS/Reference/Properties/mask
page-type: css-shorthand-property
browser-compat: css.properties.mask
sidebar: cssref
---

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`mask`** trong [CSS](/en-US/docs/Web/CSS) ẩn một phần tử (một phần hoặc toàn bộ) bằng cách che hoặc cắt một vùng xác định của hình ảnh. Đây là thuộc tính viết tắt cho tất cả các thuộc tính [`mask-*`](#constituent_properties). Thuộc tính này chấp nhận một hoặc nhiều giá trị phân tách bằng dấu phẩy, trong đó mỗi giá trị tương ứng với một [`<mask-layer>`](#mask-layer).

## Các thuộc tính thành phần

Thuộc tính này là dạng viết tắt của các thuộc tính CSS sau:

- {{cssxref("mask-clip")}}
- {{cssxref("mask-composite")}}
- {{cssxref("mask-image")}}
- {{cssxref("mask-mode")}}
- {{cssxref("mask-origin")}}
- {{cssxref("mask-position")}}
- {{cssxref("mask-repeat")}}
- {{cssxref("mask-size")}}

## Cú pháp

```css
/* Giá trị từ khóa */
mask: none;

/* Giá trị hình ảnh */
mask: url("mask.png"); /* Hình ảnh raster dùng làm mặt nạ */
mask: url("masks.svg#star"); /* SVG dùng làm mặt nạ */

/* Giá trị kết hợp */
mask: url("masks.svg#star") luminance; /* Mặt nạ độ sáng */
mask: url("masks.svg#star") 40px 20px; /* Mặt nạ đặt cách trên 40px và trái 20px */
mask: url("masks.svg#star") 0 0/50px 50px; /* Mặt nạ có chiều rộng và chiều cao 50px */
mask: url("masks.svg#star") repeat-x; /* Mặt nạ lặp theo chiều ngang */
mask: url("masks.svg#star") stroke-box; /* Mặt nạ kéo dài đến cạnh trong của hộp nét vẽ */
mask: url("masks.svg#star") exclude; /* Mặt nạ kết hợp với nền bằng các phần không chồng lấp */

/* Nhiều mặt nạ */
mask:
  url("masks.svg#star") left / 16px repeat-y,
  /* Mặt nạ rộng 16px ở bên trái */ url("masks.svg#circle") right / 16px
    repeat-y; /* Mặt nạ rộng 16px ở bên phải */

/* Giá trị toàn cục */
mask: inherit;
mask: initial;
mask: revert;
mask: revert-layer;
mask: unset;
```

### Giá trị

- `<mask-layer>`
  - : Một hoặc nhiều lớp mặt nạ phân tách bằng dấu phẩy, bao gồm các thành phần sau:
    - `<mask-reference>`
      - : Đặt nguồn hình ảnh mặt nạ. Xem {{cssxref("mask-image")}}.
    - `<masking-mode>`
      - : Đặt chế độ che của hình ảnh mặt nạ. Xem {{cssxref("mask-mode")}}.
    - `<position>`
      - : Đặt vị trí của hình ảnh mặt nạ. Xem {{cssxref("mask-position")}}.
    - `<bg-size>`
      - : Đặt kích thước của hình ảnh mặt nạ. Xem {{cssxref("mask-size")}}.
    - `<repeat-style>`
      - : Đặt cách lặp lại của hình ảnh mặt nạ. Xem {{cssxref("mask-repeat")}}.
    - `<geometry-box>`
      - : Nếu chỉ có một giá trị `<geometry-box>` được cung cấp, nó đặt cả giá trị thuộc tính {{cssxref("mask-origin")}} lẫn {{cssxref("mask-clip")}}. Nếu có hai giá trị `<geometry-box>`, giá trị đầu tiên định nghĩa `mask-origin` và giá trị thứ hai định nghĩa `mask-clip`.
    - `<geometry-box> | no-clip`
      - : Đặt vùng bị ảnh hưởng bởi hình ảnh mặt nạ. Xem {{cssxref("mask-clip")}}.
    - `<compositing-operator>`
      - : Đặt thao tác tổng hợp được sử dụng trên lớp mặt nạ hiện tại. Xem {{cssxref("mask-composite")}}.

## Mô tả

Thuộc tính viết tắt `mask` ẩn một phần hoặc toàn bộ phần tử mà nó được áp dụng. Các phần của phần tử bị ẩn, hiển thị, hoặc hiển thị một phần phụ thuộc vào độ trong suốt (kênh alpha của mặt nạ) hoặc độ sáng (luminance) của mặt nạ. Trong chế độ che alpha, các vùng không trong suốt của mặt nạ hiển thị phần tử, còn các vùng trong suốt ẩn nó. Trong chế độ che luminance, các vùng sáng không trong suốt của mặt nạ hiển thị phần tử, còn các vùng tối hoặc trong suốt ẩn nó.

Mặc dù không cần phải khai báo tất cả các thuộc tính thành phần, bất kỳ giá trị nào bị bỏ qua đều mặc định về giá trị khởi tạo của chúng:

```css
mask-image: none;
mask-mode: match-source;
mask-position: 0% 0%;
mask-size: auto;
mask-repeat: repeat;
mask-origin: border-box;
mask-clip: border-box;
mask-composite: add;
```

Trong mỗi `<mask-layer>`, thành phần `mask-size` phải đứng sau giá trị `mask-position`, với dấu gạch chéo (`/`) ngăn cách hai thành phần.

Nếu có hai giá trị `<geometry-box>`, giá trị đầu tiên là giá trị `mask-origin`, còn giá trị thứ hai là giá trị `mask-clip`. Nếu có một giá trị `<geometry-box>` và từ khóa `no-clip`, thì `<geometry-box>` là giá trị của thuộc tính `mask-origin`, vì `no-clip` chỉ hợp lệ cho thuộc tính `mask-clip`. Trong trường hợp này, thứ tự của hai giá trị không quan trọng. Nếu chỉ có một giá trị `<geometry-box>` (không có từ khóa `no-clip`), giá trị này được dùng cho cả thuộc tính `mask-origin` lẫn `mask-clip`.

Vì thuộc tính viết tắt `mask` đặt lại tất cả thuộc tính `mask-border-*` về giá trị `initial`, bạn nên khai báo các thuộc tính này, hoặc thuộc tính viết tắt {{cssxref("mask-border")}}, sau bất kỳ khai báo `mask` nào. Khi đặt `mask` trong khối khai báo của bạn, bạn cũng ngầm đặt các giá trị sau:

```css
mask-border-source: none;
mask-border-mode: alpha;
mask-border-outset: 0;
mask-border-repeat: stretch;
mask-border-slice: 0;
mask-border-width: auto;
```

Vì lý do này, đặc tả khuyến nghị sử dụng thuộc tính viết tắt `mask` thay vì các thuộc tính thành phần riêng lẻ để ghi đè bất kỳ mặt nạ nào được đặt trước đó trong tầng. Điều này đảm bảo rằng `mask-border` cũng đã được đặt lại.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Che hình ảnh

Trong ví dụ này, một hình ảnh được che bằng một gradient hình nón lặp lại được tạo bằng CSS làm nguồn mặt nạ. Chúng tôi cũng hiển thị gradient dưới dạng hình nền để so sánh.

#### HTML

Chúng tôi thêm một phần tử {{htmlelement("img")}} và một phần tử {{htmlelement("div")}} rỗng.

```html
<img
  src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
  alt="Pride flag" />
<div></div>
```

#### CSS

Chúng tôi đặt cùng {{cssxref("border")}}, {{cssxref("padding")}} và kích thước cho cả `<img>` lẫn `<div>`.

```css
img,
div {
  border: 20px dashed rebeccapurple;
  box-sizing: content-box;
  padding: 20px;
  height: 220px;
  width: 220px;
}
```

Sau đó chúng tôi áp dụng mặt nạ cho `<img>`. `mask-image` được tạo bằng hàm {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}. Chúng tôi định nghĩa nó là gradient `100px` nhân `100px`, lặp bắt đầu từ góc trên và trái của `content-box` của hình ảnh. Chúng tôi thêm hai giá trị `<geometry-box>`; giá trị đầu tiên đặt `mask-origin` và giá trị thứ hai định nghĩa giá trị thuộc tính `mask-clip`. Gradient chuyển từ trong suốt sang `lightgreen` đặc. Chúng tôi dùng `lightgreen` để minh họa rằng màu sắc của mặt nạ không quan trọng, mà quan trọng là độ trong suốt của nó.

```css
img {
  mask: repeating-radial-gradient(
      circle,
      transparent 0 5px,
      lightgreen 15px 20px
    )
    content-box border-box 0% 0% / 100px 100px repeat;
}
```

Cuối cùng, chúng tôi dùng cùng giá trị cho thuộc tính viết tắt {{cssxref("background")}} của `<div>` như đã dùng cho `mask`.

```css
div {
  background: repeating-radial-gradient(
      circle,
      transparent 0 5px,
      lightgreen 15px 20px
    )
    content-box border-box 0% 0% / 100px 100px repeat;
}
```

#### Kết quả

{{EmbedLiveSample("Che hình ảnh", "", "630")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("clip-path")}}
- {{CSSxRef("filter")}}
- [Giới thiệu về CSS masking](/en-US/docs/Web/CSS/Guides/Masking/Introduction)
- [Các thuộc tính CSS `mask`](/en-US/docs/Web/CSS/Guides/Masking/Mask_properties)
- [Khai báo nhiều mặt nạ](/en-US/docs/Web/CSS/Guides/Masking/Multiple_masks)
- [CSS masking](/en-US/docs/Web/CSS/Guides/Masking) module
- Thuộc tính SVG {{SVGAttr("mask")}}
- [Áp dụng hiệu ứng SVG lên nội dung HTML](/en-US/docs/Web/SVG/Guides/Applying_SVG_effects_to_HTML_content)
