---
title: saturate()
slug: Web/CSS/Reference/Values/filter-function/saturate
page-type: css-function
browser-compat: css.types.filter-function.saturate
sidebar: cssref
---

Hàm **`saturate()`** [CSS](/vi/docs/Web/CSS) [function](/vi/docs/Web/CSS/Reference/Values/Functions) tăng hoặc giảm độ bão hòa của hình ảnh đầu vào. Kết quả của nó là một {{cssxref("filter-function")}}.

> [!NOTE]
> `saturate()` được chỉ định dưới dạng phép toán ma trận trên màu RGB. Nó không thực sự chuyển đổi màu sang mô hình HSL, đây là một phép toán phi tuyến. Do đó, nó có thể không bảo toàn màu sắc hay độ sáng của màu gốc.

{{InteractiveExample("CSS Demo: saturate()")}}

```css interactive-example-choice
filter: saturate(1);
```

```css interactive-example-choice
filter: saturate(4);
```

```css interactive-example-choice
filter: saturate(50%);
```

```css interactive-example-choice
filter: saturate(0);
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
saturate(amount)
```

### Tham số

- `amount` {{Optional_Inline}}
  - : Mức độ chuyển đổi, được chỉ định dưới dạng {{cssxref("&lt;number&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Giá trị dưới `100%` làm giảm độ bão hòa của hình ảnh, trong khi giá trị trên `100%` tăng độ bão hòa. Giá trị `0%` hoàn toàn không bão hòa, trong khi giá trị `100%` giữ nguyên đầu vào. Giá trị ban đầu cho {{Glossary("interpolation")}} là `1`. Giá trị mặc định là `1`.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Các ví dụ về giá trị hợp lệ cho saturate()

```css
saturate(0)     /* Hoàn toàn không bão hòa */
saturate(.4)    /* Bão hòa 40% */
saturate()      /* Không có hiệu ứng */
saturate(100%)  /* Không có hiệu ứng */
saturate(200%)  /* Bão hòa gấp đôi */
```

### saturate() không bảo toàn màu sắc hay độ sáng

Sơ đồ dưới đây so sánh hai dải màu gradient với `hsl(0 50% 50%)` là điểm giữa: dải đầu tiên được tạo bằng `saturate()`, và dải thứ hai sử dụng các giá trị màu HSL thực tế. Lưu ý cách gradient `saturate()` hiển thị sự khác biệt về màu sắc và độ sáng ở hai đầu.

```html
<div>
  <p>Using <code>saturate()</code></p>
  <div id="saturate"></div>
</div>
<div>
  <p>Using <code>hsl()</code></p>
  <div id="hsl"></div>
</div>
```

```css hidden
#saturate,
#hsl {
  display: flex;
  margin: 1em 0;
}

#saturate div,
#hsl div {
  width: 2px;
  height: 100px;
}
```

```js
const saturate = document.getElementById("saturate");
const hsl = document.getElementById("hsl");

for (let i = 0; i <= 200; i++) {
  const div1 = document.createElement("div");
  div1.style.backgroundColor = `hsl(0 ${i / 2}% 50%)`;
  hsl.appendChild(div1);

  const div2 = document.createElement("div");
  div2.style.backgroundColor = "hsl(0 50% 50%)";
  div2.style.filter = `saturate(${i}%)`;
  saturate.appendChild(div2);
}
```

{{EmbedLiveSample('saturate_does_not_preserve_hue_or_lightness','100%','350')}}

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
- {{cssxref("filter-function/sepia", "sepia()")}}
