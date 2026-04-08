---
title: grayscale()
slug: Web/CSS/Reference/Values/filter-function/grayscale
page-type: css-function
browser-compat: css.types.filter-function.grayscale
sidebar: cssref
---

Hàm **`grayscale()`** [CSS](/vi/docs/Web/CSS) chuyển đổi ảnh đầu vào sang thang màu xám. Kết quả của nó là một {{cssxref("filter-function")}}.

{{InteractiveExample("CSS Demo: grayscale()")}}

```css interactive-example-choice
filter: grayscale(0);
```

```css interactive-example-choice
filter: grayscale(0.2);
```

```css interactive-example-choice
filter: grayscale(60%);
```

```css interactive-example-choice
filter: grayscale(1);
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
grayscale(amount)
```

### Tham số

- `amount` {{Optional_Inline}}
  - : Mức độ chuyển đổi ảnh đầu vào sang thang màu xám. Được chỉ định là {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Giá trị `100%` chuyển hoàn toàn ảnh đầu vào sang thang màu xám, trong khi giá trị `0%` giữ nguyên ảnh đầu vào. Các giá trị từ `0%` đến `100%` có hệ số nhân tuyến tính cho hiệu ứng. Giá trị khởi tạo cho {{Glossary("interpolation")}} là `0`. Giá trị mặc định là `1`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Ví dụ về các giá trị đúng cho grayscale()

```css
grayscale(0)     /* Không có hiệu ứng */
grayscale(.7)    /* Thang màu xám 70% */

grayscale()      /* Hoàn toàn thang màu xám */
grayscale(1)
grayscale(100%)
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

Các hàm {{cssxref("filter-function")}} khác có thể dùng trong giá trị của các thuộc tính {{cssxref("filter")}} và {{cssxref("backdrop-filter")}}:

- {{cssxref("filter-function/blur", "blur()")}}
- {{cssxref("filter-function/brightness", "brightness()")}}
- {{cssxref("filter-function/contrast", "contrast()")}}
- {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
- {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}
- {{cssxref("filter-function/invert", "invert()")}}
- {{cssxref("filter-function/opacity", "opacity()")}}
- {{cssxref("filter-function/saturate", "saturate()")}}
- {{cssxref("filter-function/sepia", "sepia()")}}
