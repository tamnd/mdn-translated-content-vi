---
title: opacity()
slug: Web/CSS/Reference/Values/filter-function/opacity
page-type: css-function
browser-compat: css.types.filter-function.opacity
sidebar: cssref
---

Hàm **`opacity()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) áp dụng độ trong suốt lên các mẫu trong hình ảnh đầu vào. Kết quả của nó là một {{cssxref("filter-function")}}.

{{InteractiveExample("CSS Demo: opacity()")}}

```css interactive-example-choice
filter: opacity(1);
```

```css interactive-example-choice
filter: opacity(80%);
```

```css interactive-example-choice
filter: opacity(50%);
```

```css interactive-example-choice
filter: opacity(0.2);
```

```css interactive-example-choice
filter: opacity(0);
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

> [!NOTE]
> Hàm này tương tự với thuộc tính {{Cssxref("opacity")}} đã được thiết lập từ lâu. Sự khác biệt là với bộ lọc, một số trình duyệt cung cấp tăng tốc phần cứng để hiệu suất tốt hơn.

## Cú pháp

```css
opacity(amount)
```

### Tham số

- `amount` {{Optional_Inline}}
  - : Mức độ chuyển đổi, được chỉ định dưới dạng {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Giá trị `0%` là hoàn toàn trong suốt, trong khi giá trị `100%` giữ nguyên đầu vào. Các giá trị từ `0%` đến `100%` là hệ số nhân tuyến tính trên hiệu ứng. Giá trị ban đầu cho {{Glossary("interpolation")}} là `1`. Giá trị mặc định là `1`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Các ví dụ về giá trị hợp lệ cho opacity()

```css
opacity(0%)   /* Hoàn toàn trong suốt */
opacity(50%)  /* Trong suốt 50% */

opacity()     /* Không có hiệu ứng */
opacity(1)
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các hàm {{cssxref("filter-function")}} khác có thể được dùng trong các giá trị của thuộc tính {{cssxref("filter")}} và {{cssxref("backdrop-filter")}} bao gồm:
  - {{cssxref("filter-function/blur", "blur()")}}
  - {{cssxref("filter-function/brightness", "brightness()")}}
  - {{cssxref("filter-function/contrast", "contrast()")}}
  - {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
  - {{cssxref("filter-function/grayscale", "grayscale()")}}
  - {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}
  - {{cssxref("filter-function/invert", "invert()")}}
  - {{cssxref("filter-function/saturate", "saturate()")}}
  - {{cssxref("filter-function/sepia", "sepia()")}}
- Thuộc tính CSS {{cssxref("opacity")}}
