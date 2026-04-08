---
title: font-synthesis-weight
slug: Web/CSS/Reference/Properties/font-synthesis-weight
page-type: css-property
browser-compat: css.properties.font-synthesis-weight
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`font-synthesis-weight`** cho phép bạn chỉ định liệu trình duyệt có được phép tổng hợp kiểu chữ đậm khi kiểu chữ đó không có sẵn trong bộ phông chữ hay không.

Thông thường, thuận tiện hơn khi sử dụng thuộc tính viết tắt {{cssxref("font-synthesis")}} để kiểm soát tất cả các giá trị tổng hợp kiểu chữ.

## Cú pháp

```css
/* Giá trị từ khóa */
font-synthesis-weight: auto;
font-synthesis-weight: none;

/* Giá trị toàn cục */
font-synthesis-weight: inherit;
font-synthesis-weight: initial;
font-synthesis-weight: revert;
font-synthesis-weight: revert-layer;
font-synthesis-weight: unset;
```

### Giá trị

- `auto`
  - : Cho biết rằng trình duyệt có thể tổng hợp kiểu chữ đậm còn thiếu nếu cần.
- `none`
  - : Cho biết rằng việc tổng hợp kiểu chữ đậm còn thiếu bởi trình duyệt không được phép.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tắt tổng hợp kiểu chữ đậm

Ví dụ này cho thấy cách tắt tổng hợp kiểu chữ đậm bởi trình duyệt trong phông chữ `Montserrat`.

#### HTML

```html
<p class="english">
  This is the default <strong>bold typeface</strong> and
  <em>oblique typeface</em>.
</p>

<p class="english no-syn">
  The <strong>bold typeface</strong> is turned off here but not the
  <em>oblique typeface</em>.
</p>
```

#### CSS

```css
@import "https://fonts.googleapis.com/css2?family=Montserrat&display=swap";

.english {
  font-family: "Montserrat", sans-serif;
}
.no-syn {
  font-synthesis-weight: none;
}
```

#### Kết quả

{{EmbedLiveSample('Disabling synthesis of bold typeface', '', '100')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [font-synthesis](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis) shorthand, [font-synthesis-small-caps](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-small-caps), [font-synthesis-style](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-style)
- {{cssxref("font-style")}}, {{cssxref("font-variant")}}, {{cssxref("font-weight")}}
