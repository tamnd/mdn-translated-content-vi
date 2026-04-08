---
title: font-synthesis-small-caps
slug: Web/CSS/Reference/Properties/font-synthesis-small-caps
page-type: css-property
browser-compat: css.properties.font-synthesis-small-caps
sidebar: cssref
---

Thuộc tính **`font-synthesis-small-caps`** [CSS](/en-US/docs/Web/CSS) cho phép bạn chỉ định liệu trình duyệt có thể tổng hợp kiểu chữ hoa nhỏ khi nó bị thiếu trong họ phông chữ hay không. Các glyph chữ hoa nhỏ thường sử dụng dạng của chữ hoa nhưng được thu nhỏ xuống kích thước của chữ thường.

Thường tiện lợi khi sử dụng thuộc tính viết tắt {{cssxref("font-synthesis")}} để kiểm soát tất cả các giá trị tổng hợp kiểu chữ.

## Cú pháp

```css
/* Giá trị từ khóa */
font-synthesis-small-caps: auto;
font-synthesis-small-caps: none;

/* Giá trị toàn cục */
font-synthesis-small-caps: inherit;
font-synthesis-small-caps: initial;
font-synthesis-small-caps: revert;
font-synthesis-small-caps: revert-layer;
font-synthesis-small-caps: unset;
```

### Giá trị

- `auto`
  - : Biểu thị rằng kiểu chữ hoa nhỏ còn thiếu có thể được trình duyệt tổng hợp nếu cần.
- `none`
  - : Biểu thị rằng việc tổng hợp kiểu chữ hoa nhỏ còn thiếu bởi trình duyệt không được phép.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Vô hiệu hóa tổng hợp kiểu chữ hoa nhỏ

Ví dụ này cho thấy việc tắt tổng hợp kiểu chữ hoa nhỏ bởi trình duyệt trong phông chữ `Montserrat`.

#### HTML

```html
<p class="english">
  These are the default <span class="small-caps">small-caps</span>,
  <strong>bold</strong>, and <em>oblique</em> typefaces.
</p>

<p class="english no-syn">
  The <span class="small-caps">small-caps</span> typeface is turned off here but
  not the <strong>bold</strong> and <em>oblique</em> typefaces.
</p>
```

#### CSS

```css
@import "https://fonts.googleapis.com/css2?family=Montserrat&display=swap";

.english {
  font-family: "Montserrat", sans-serif;
}
.small-caps {
  font-variant: small-caps;
}
.no-syn {
  font-synthesis-small-caps: none;
}
```

#### Kết quả

{{EmbedLiveSample('Disabling synthesis of small-caps typeface', '', '100')}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [font-synthesis](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis) viết tắt, [font-synthesis-style](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-style), [font-synthesis-weight](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-weight)
- {{cssxref("font-style")}}, {{cssxref("font-variant")}}, {{cssxref("font-variant-caps")}}, {{cssxref("font-weight")}}
- [CanvasRenderingContext2D: fontVariantCaps property](/en-US/docs/Web/API/CanvasRenderingContext2D/fontVariantCaps)
