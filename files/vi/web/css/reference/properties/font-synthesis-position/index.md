---
title: font-synthesis-position
slug: Web/CSS/Reference/Properties/font-synthesis-position
page-type: css-property
status:
  - experimental
browser-compat: css.properties.font-synthesis-position
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính **`font-synthesis-position`** [CSS](/en-US/docs/Web/CSS) cho phép bạn chỉ định liệu trình duyệt có thể tổng hợp các kiểu chữ chỉ số dưới và trên "position" khi chúng bị thiếu trong họ phông chữ, trong khi sử dụng {{cssxref("font-variant-position")}} để thiết lập vị trí hay không.

Thuộc tính **`font-synthesis-position`** không có hiệu ứng khi sử dụng các phần tử {{htmlelement("sup")}} và {{htmlelement("sub")}}.

Thường tiện lợi khi sử dụng thuộc tính viết tắt {{cssxref("font-synthesis")}} để kiểm soát tất cả các giá trị tổng hợp kiểu chữ.

## Cú pháp

```css
/* Giá trị từ khóa */
font-synthesis-position: auto;
font-synthesis-position: none;

/* Giá trị toàn cục */
font-synthesis-position: inherit;
font-synthesis-position: initial;
font-synthesis-position: revert;
font-synthesis-position: revert-layer;
font-synthesis-position: unset;
```

### Giá trị

- `auto`
  - : Biểu thị rằng kiểu chữ position còn thiếu có thể được trình duyệt tổng hợp nếu cần.
- `none`
  - : Biểu thị rằng việc tổng hợp kiểu chữ position còn thiếu bởi trình duyệt không được phép.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Vô hiệu hóa tổng hợp kiểu chữ position

Ví dụ này cho thấy việc tắt tổng hợp kiểu chữ chỉ số trên và dưới bởi trình duyệt trong phông chữ `Montserrat`.

#### HTML

```html
<p>
  These are the default position <span class="super">superscript</span>,
  position <span class="sub">subscript</span>, <strong>bold</strong> and
  <em>oblique</em> typefaces.
</p>

<p class="no-syn">
  The positions <span class="super">superscript</span> and
  <span class="sub">subscript</span> typeface is turned off here but not the
  <strong>bold</strong> and <em>oblique</em> typefaces (on browsers that support
  <code>font-synthesis-position</code>).
</p>
```

#### CSS

```css
@import "https://fonts.googleapis.com/css2?family=Montserrat&display=swap";

* {
  font-family: "Montserrat", sans-serif;
}
.super {
  font-variant-position: super;
}
.sub {
  font-variant-position: sub;
}
.no-syn {
  font-synthesis-position: none;
}
```

#### Kết quả

{{EmbedLiveSample('Disabling synthesis of position typeface', '', '100')}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-synthesis")}} viết tắt, {{cssxref("font-synthesis-style")}}, {{cssxref("font-synthesis-weight")}}
- {{cssxref("font-style")}}, {{cssxref("font-variant")}}, {{cssxref("font-variant-position")}}, {{cssxref("font-weight")}}
