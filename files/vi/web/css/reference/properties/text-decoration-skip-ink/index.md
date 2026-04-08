---
title: text-decoration-skip-ink
slug: Web/CSS/Reference/Properties/text-decoration-skip-ink
page-type: css-property
browser-compat: css.properties.text-decoration-skip-ink
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-decoration-skip-ink`** xác định cách vẽ các đường gạch trên và gạch chân khi chúng đi qua phần nhô lên và xuống của ký tự (ascender và descender).

{{InteractiveExample("CSS Demo: text-decoration-skip-ink")}}

```css interactive-example-choice
text-decoration-skip-ink: auto;
```

```css interactive-example-choice
text-decoration-skip-ink: none;
```

```html interactive-example
<section id="default-example">
  <p>
    <span class="transition-all" id="example-element">parapsychologists</span>
  </p>
</section>
```

```css interactive-example
p {
  font:
    1.9em "Georgia",
    serif;
  text-decoration: underline;
}
```

`text-decoration-skip-ink` không phải là một phần của thuộc tính viết tắt {{cssxref("text-decoration")}}.

## Cú pháp

```css
/* Từ khóa đơn */
text-decoration-skip-ink: none;
text-decoration-skip-ink: auto;
text-decoration-skip-ink: all;

/* Từ khóa toàn cục */
text-decoration-skip-ink: inherit;
text-decoration-skip-ink: initial;
text-decoration-skip-ink: revert;
text-decoration-skip-ink: revert-layer;
text-decoration-skip-ink: unset;
```

### Giá trị

- `none`
  - : Các đường gạch chân và gạch trên được vẽ trên toàn bộ chiều dài của nội dung văn bản, kể cả các phần giao với phần nhô lên và xuống của ký tự.
- `auto`
  - : Mặc định — trình duyệt _có thể_ ngắt các đường gạch chân và gạch trên để chúng không chạm vào hay tiếp cận quá gần một ký tự. Tức là, chúng bị ngắt tại nơi chúng sẽ đi qua một ký tự.
- `all`
  - : Trình duyệt _phải_ ngắt các đường gạch chân và gạch trên để chúng không chạm vào hay tiếp cận quá gần một ký tự. Điều này có thể hữu ích với một số phông chữ tiếng Trung, Nhật hoặc Hàn (CJK), khi hành vi `auto` có thể không tạo ra các khoảng ngắt.

    ![Một ví dụ về "text-decoration-skip-ink".](decoration-skip-ink.png)

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### HTML

```html
<p>You should go on a quest for a cup of coffee.</p>
<p class="no-skip-ink">Or maybe you'd prefer some tea?</p>
<p>この文は、 text-decoration-skip-ink: auto の使用例を示しています。</p>
<p class="skip-ink-all">
  この文は、 text-decoration-skip-ink: all の使用例を示しています。
</p>
```

### CSS

```css
p {
  font-size: 1.5em;
  text-decoration: underline blue;
  text-decoration-skip-ink: auto; /* this is the default anyway */
}

.no-skip-ink {
  text-decoration-skip-ink: none;
}

.skip-ink-all {
  text-decoration-skip-ink: all;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 250)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref('text-decoration')}}
- {{cssxref('text-decoration-skip')}}
