---
title: font-synthesis-style
slug: Web/CSS/Reference/Properties/font-synthesis-style
page-type: css-property
browser-compat: css.properties.font-synthesis-style
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`font-synthesis-style`** cho phép bạn chỉ định liệu trình duyệt có được phép tổng hợp kiểu chữ oblique khi kiểu chữ đó không có sẵn trong bộ phông chữ hay không.

Thông thường, thuận tiện hơn khi sử dụng thuộc tính viết tắt {{cssxref("font-synthesis")}} để kiểm soát tất cả các giá trị tổng hợp kiểu chữ.

## Cú pháp

```css
/* Giá trị từ khóa */
font-synthesis-style: auto;
font-synthesis-style: none;
font-synthesis-style: oblique-only;

/* Giá trị toàn cục */
font-synthesis-style: inherit;
font-synthesis-style: initial;
font-synthesis-style: revert;
font-synthesis-style: revert-layer;
font-synthesis-style: unset;
```

### Giá trị

- `auto`
  - : Cho biết rằng trình duyệt có thể tổng hợp kiểu chữ oblique còn thiếu nếu cần.
- `none`
  - : Cho biết rằng việc tổng hợp kiểu chữ oblique còn thiếu bởi trình duyệt _không_ được phép.
- `oblique-only`
  - : Giống như `auto`, nhưng không có tổng hợp phông chữ xảy ra nếu `font-style: italic` được đặt.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tắt tổng hợp kiểu chữ oblique

Ví dụ này cho thấy cách tắt tổng hợp kiểu chữ oblique bởi trình duyệt trong phông chữ `Montserrat`.

#### HTML

```html
<p class="english">
  This is the default <em>oblique typeface</em> and
  <strong>bold typeface</strong>.
</p>

<p class="english no-syn">
  The <em>oblique typeface</em> is turned off here but not the
  <strong>bold typeface</strong>.
</p>
```

#### CSS

```css
@import "https://fonts.googleapis.com/css2?family=Montserrat&display=swap";

.english {
  font-family: "Montserrat", sans-serif;
}

.no-syn {
  font-synthesis-style: none;
}
```

#### Kết quả

{{EmbedLiveSample('Disabling synthesis of bold typeface', '', '100')}}

### So sánh các giá trị font-synthesis-style

Ví dụ này so sánh tất cả các giá trị `font-synthesis-style` sử dụng văn bản được định dạng italic và oblique.

#### HTML

```html
<div class="fss-none">
  <h2>font-synthesis-style: none</h2>
  <p class="oblique">This text is set to <code>oblique</code></p>
  <p class="italic">This text is set to <code>italic</code></p>
</div>

<div class="fss-auto">
  <h2>font-synthesis-style: auto</h2>
  <p class="oblique">This text is set to <code>oblique</code></p>
  <p class="italic">This text is set to <code>italic</code></p>
</div>

<div class="fss-oblique-only">
  <h2>font-synthesis-style: oblique-only</h2>
  <p class="oblique">This text is set to <code>oblique</code></p>
  <p class="italic">This text is set to <code>italic</code></p>
</div>
```

#### CSS

```css hidden
@import "https://fonts.googleapis.com/css2?family=Montserrat&display=swap";

p {
  font-family: "Montserrat", sans-serif;
  font-size: 1.2rem;
}

@supports not (font-synthesis-style: oblique-only) {
  body::before {
    content: "Your browser doesn't support the 'oblique-only' value.";
    background-color: #ffcd33;
    display: block;
    width: 100%;
    text-align: center;
  }
}
```

```css
/* Chỉ định kiểu tổng hợp phông chữ */
.fss-none {
  font-synthesis-style: none;
}

.fss-auto {
  font-synthesis-style: auto;
}

.fss-oblique-only {
  font-synthesis-style: oblique-only;
}

/* Đặt kiểu phông chữ */
.oblique {
  font-style: oblique;
}

.italic {
  font-style: italic;
}

/* Kiểu cho phần minh họa */
.oblique::after {
  content: " (font-style: oblique)";
  font-size: 0.8rem;
  vertical-align: sub;
}

.italic::after {
  content: " (font-style: italic)";
  font-size: 0.8rem;
  vertical-align: sub;
}
```

#### Kết quả

{{EmbedLiveSample('Comparison of font-synthesis-style values', '', '560')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [font-synthesis](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis) shorthand, [font-synthesis-small-caps](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-small-caps), [font-synthesis-weight](/en-US/docs/Web/CSS/Reference/Properties/font-synthesis-weight)
- {{cssxref("font-style")}}, {{cssxref("font-variant")}}, {{cssxref("font-weight")}}
