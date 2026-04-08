---
title: sepia()
slug: Web/CSS/Reference/Values/filter-function/sepia
page-type: css-function
browser-compat: css.types.filter-function.sepia
sidebar: cssref
---

Hàm **`sepia()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) chuyển đổi hình ảnh đầu vào sang tông màu nâu vàng (sepia), mang lại vẻ ngoài ấm áp hơn, vàng/nâu hơn. Kết quả của nó là một {{cssxref("filter-function")}}.

{{InteractiveExample("CSS Demo: sepia()")}}

```css interactive-example-choice
filter: sepia(0);
```

```css interactive-example-choice
filter: sepia(0.2);
```

```css interactive-example-choice
filter: sepia(60%);
```

```css interactive-example-choice
filter: sepia(1);
```

```html interactive-example
<section id="default-example">
  <img
    class="transition-all"
    id="example-element"
    src="/shared-assets/images/examples/firefox-logo.svg"
    width="200" />
</section>
```

## Cú pháp

```css
sepia(amount)
```

### Tham số

- `amount` {{Optional_Inline}}
  - : Mức độ chuyển đổi, được chỉ định dưới dạng {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Giá trị `100%` là hoàn toàn sepia, trong khi giá trị `0%` giữ nguyên đầu vào. Các giá trị từ `0%` đến `100%` là hệ số nhân tuyến tính trên hiệu ứng. Giá trị ban đầu cho {{Glossary("interpolation")}} là `0`. Giá trị mặc định là `1`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Các ví dụ về giá trị hợp lệ cho sepia()

```css
sepia(0)     /* Không có hiệu ứng */
sepia(.65)   /* Sepia 65% */

sepia()      /* Hoàn toàn sepia */
sepia(100%)
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

Các hàm {{cssxref("filter-function")}} khác có thể được dùng trong các giá trị của thuộc tính {{cssxref("filter")}} và {{cssxref("backdrop-filter")}} bao gồm:

- {{cssxref("filter-function/blur", "blur()")}}
- {{cssxref("filter-function/brightness", "brightness()")}}
- {{cssxref("filter-function/contrast", "contrast()")}}
- {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
- {{cssxref("filter-function/grayscale", "grayscale()")}}
- {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}
- {{cssxref("filter-function/invert", "invert()")}}
- {{cssxref("filter-function/opacity", "opacity()")}}
- {{cssxref("filter-function/saturate", "saturate()")}}
