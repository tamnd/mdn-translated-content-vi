---
title: tab-size
slug: Web/CSS/Reference/Properties/tab-size
page-type: css-property
browser-compat: css.properties.tab-size
sidebar: cssref
---

Thuộc tính **`tab-size`** của [CSS](/vi/docs/Web/CSS) được dùng để tùy chỉnh độ rộng của ký tự tab (U+0009).

{{InteractiveExample("CSS Demo: tab-size")}}

```css interactive-example-choice
tab-size: 10px;
```

```css interactive-example-choice
tab-size: 16px;
```

```css interactive-example-choice
tab-size: 24px;
```

```css interactive-example-choice
tab-size: 4;
```

```html interactive-example
<section id="default-example">
  <pre id="example-element">&#9;123</pre>
</section>
```

```css interactive-example
#example-element {
  border: 1px solid;
}
```

## Cú pháp

```css
/* Giá trị <number> */
tab-size: 4;
tab-size: 0;

/* Giá trị <length> */
tab-size: 10px;
tab-size: 2em;

/* Giá trị toàn cục */
tab-size: inherit;
tab-size: initial;
tab-size: revert;
tab-size: revert-layer;
tab-size: unset;
```

### Giá trị

- {{CSSxRef("&lt;number&gt;")}}
  - : Bội số của độ rộng tiến của ký tự khoảng trắng (U+0020) dùng làm độ rộng của tab. Phải không âm. Độ rộng tiến là khoảng cách con trỏ hoặc đầu in di chuyển trước khi in ký tự tiếp theo.
- {{CSSxRef("&lt;length&gt;")}}
  - : Độ rộng của tab. Phải không âm.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Mở rộng theo số lượng ký tự

```css
pre {
  tab-size: 4; /* Đặt kích thước tab bằng 4 ký tự */
}
```

### Thu nhỏ tab

```css
pre {
  tab-size: 0; /* Xóa thụt đầu dòng */
}
```

### Kích thước tab mặc định so với kích thước tùy chỉnh

Ví dụ này so sánh kích thước tab mặc định với kích thước tab tùy chỉnh. Lưu ý rằng {{cssxref("white-space")}} được đặt thành `pre` để ngăn các tab bị thu nhỏ.

#### HTML

```html
<p>no tab</p>
<p>&#0009;default tab size of 8 characters wide</p>
<p class="custom-number">&#0009;custom tab size of 3 characters wide</p>
<p>&nbsp;&nbsp;&nbsp;3 spaces, equivalent to the custom tab size</p>
<p class="custom-length">&#0009;custom tab size of 50px wide</p>
```

#### CSS

```css hidden
body {
  border: 1px solid red;
  margin: 1rem;
}
```

```css
p {
  white-space: pre;
}

.custom-number {
  tab-size: 3;
}

.custom-length {
  tab-size: 50px;
}
```

#### Kết quả

{{EmbedLiveSample("Comparing_to_the_default_size", "100%", "250")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref('white-space')}}
