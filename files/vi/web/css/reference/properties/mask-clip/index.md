---
title: mask-clip
slug: Web/CSS/Reference/Properties/mask-clip
page-type: css-property
browser-compat: css.properties.mask-clip
sidebar: cssref
---

Thuộc tính [CSS](/vi/docs/Web/CSS) **`mask-clip`** xác định vùng bị ảnh hưởng bởi mặt nạ. Nội dung được vẽ của một phần tử phải bị giới hạn trong vùng này.

## Cú pháp

```css
/* Giá trị <coord-box> */
mask-clip: content-box;
mask-clip: padding-box;
mask-clip: border-box;
mask-clip: fill-box;
mask-clip: stroke-box;
mask-clip: view-box;

/* Giá trị từ khóa */
mask-clip: no-clip;

/* Nhiều giá trị */
mask-clip: padding-box, no-clip;
mask-clip: view-box, fill-box, border-box;

/* Giá trị toàn cục */
mask-clip: inherit;
mask-clip: initial;
mask-clip: revert;
mask-clip: revert-layer;
mask-clip: unset;
```

### Giá trị

Thuộc tính chấp nhận danh sách các giá trị từ khóa được phân tách bằng dấu phẩy. Mỗi giá trị là một `<coord-box>` hoặc `no-clip`:

- `content-box`
  - : Nội dung được vẽ bị cắt theo hộp nội dung.
- `padding-box`
  - : Nội dung được vẽ bị cắt theo hộp đệm.
- `border-box`
  - : Nội dung được vẽ bị cắt theo hộp viền.
- `fill-box`
  - : Nội dung được vẽ bị cắt theo hộp giới hạn đối tượng.
- `stroke-box`
  - : Nội dung được vẽ bị cắt theo hộp giới hạn nét vẽ.
- `view-box`
  - : Sử dụng khung nhìn SVG gần nhất làm hộp tham chiếu. Nếu một thuộc tính [`viewBox`](/vi/docs/Web/SVG/Reference/Attribute/viewBox) được chỉ định cho phần tử tạo ra khung nhìn SVG, hộp tham chiếu được định vị tại gốc của hệ tọa độ được thiết lập bởi thuộc tính `viewBox` và kích thước của hộp tham chiếu được đặt bằng các giá trị chiều rộng và chiều cao của thuộc tính `viewBox`.
- `no-clip`
  - : Nội dung được vẽ không bị cắt.
- `border`
  - : Từ khóa này hoạt động giống như `border-box`.
- `padding`
  - : Từ khóa này hoạt động giống như `padding-box`.
- `content`
  - : Từ khóa này hoạt động giống như `content-box`.
- `text`
  - : Từ khóa này cắt hình ảnh mặt nạ theo văn bản của phần tử.

## Mô tả

Thuộc tính `mask-clip` xác định vùng của phần tử bị ảnh hưởng bởi mặt nạ được áp dụng.

Đối với các hình ảnh lớp mặt nạ không tham chiếu đến phần tử SVG {{svgelement("mask")}}, thuộc tính `mask-clip` xác định vùng vẽ mặt nạ, hay vùng bị ảnh hưởng bởi mặt nạ. Nội dung được vẽ của phần tử sẽ bị giới hạn trong vùng này.

Thuộc tính `mask-clip` không có tác dụng đối với hình ảnh lớp mặt nạ tham chiếu đến phần tử `<mask>`. Các thuộc tính {{svgAttr("x")}}, {{svgAttr("y")}}, {{svgAttr("width")}}, {{svgAttr("height")}}, và {{svgAttr("maskUnits")}} của phần tử `<mask>` xác định vùng vẽ mặt nạ khi nguồn của {{cssxref("mask-image")}} là một `<mask>`.

Một phần tử có thể có nhiều lớp mặt nạ được áp dụng. Số lượng lớp được xác định bởi số lượng giá trị được phân tách bằng dấu phẩy trong giá trị thuộc tính `mask-image` (ngay cả khi một giá trị là `none`). Mỗi giá trị `mask-clip` trong danh sách giá trị được phân tách bằng dấu phẩy được khớp với các giá trị `mask-image` theo thứ tự. Nếu số lượng giá trị trong hai thuộc tính khác nhau, bất kỳ giá trị dư thừa nào của `mask-clip` sẽ không được sử dụng, hoặc nếu `mask-clip` có ít giá trị hơn `mask-image`, các giá trị `mask-clip` sẽ được lặp lại.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cắt mặt nạ theo hộp viền

Ví dụ này minh họa ba giá trị của `mask-clip`.

#### HTML

Chúng ta gồm ba phần tử, mỗi phần tử có một giá trị `<coord-box>` khác nhau làm tên lớp.

```html live-sample___mask-clip-example
<div class="border-box"></div>
<div class="padding-box"></div>
<div class="content-box"></div>
```

#### CSS

CSS xác định phần tử có nền, viền, đệm và lề, cùng với hình ảnh mặt nạ, với mỗi `<div>` có một `<coord-box>` khác nhau. Chúng ta đã tạo nội dung với tên của lớp, dịch chuyển văn bản đó lên 10px để tránh bị che khuất.

```css live-sample___mask-clip-example
div {
  width: 100px;
  height: 100px;
  background-color: #8cffa0;
  margin: 10px;
  border: 20px solid #8ca0ff;
  padding: 20px;
  mask-image: url("https://mdn.github.io/shared-assets/images/examples/mdn.svg");
  mask-size: 100% 100%;
}
.content-box {
  mask-clip: content-box;
}
.border-box {
  mask-clip: border-box;
}
.padding-box {
  mask-clip: padding-box;
}
div::before {
  content: attr(class);
  position: relative;
  top: -10px;
}
```

```css hidden live-sample___mask-clip-example
body {
  display: flex;
  flex-flow: row wrap;
}
```

#### Kết quả

{{EmbedLiveSample("mask-clip-example", "", "250px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("mask")}} viết tắt
- {{cssxref("mask-image")}}
- {{cssxref("mask-origin")}}
- {{cssxref("mask-position")}}
- {{cssxref("mask-repeat")}}
- {{cssxref("mask-size")}}
- {{cssxref("mask-border")}}
- {{cssxref("clip-path")}}
- {{cssxref("background-clip")}}
- [Giới thiệu về cắt xén CSS](/vi/docs/Web/CSS/Guides/Masking/Clipping)
- [Giới thiệu về mặt nạ CSS](/vi/docs/Web/CSS/Guides/Masking/Introduction)
- [Các thuộc tính `mask` CSS](/vi/docs/Web/CSS/Guides/Masking/Mask_properties)
- [Khai báo nhiều mặt nạ](/vi/docs/Web/CSS/Guides/Masking/Multiple_masks)
- Mô-đun [CSS masking](/vi/docs/Web/CSS/Guides/Masking)
