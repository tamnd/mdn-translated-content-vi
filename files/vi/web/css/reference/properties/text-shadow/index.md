---
title: text-shadow
slug: Web/CSS/Reference/Properties/text-shadow
page-type: css-property
browser-compat: css.properties.text-shadow
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-shadow`** thêm đổ bóng cho văn bản. Nó chấp nhận một danh sách các đổ bóng được phân cách bằng dấu phẩy để áp dụng cho văn bản và bất kỳ {{cssxref("text-decoration")}} nào của nó. Mỗi đổ bóng được mô tả bằng một số kết hợp giữa độ lệch X và Y so với phần tử, bán kính làm mờ và màu sắc.

{{InteractiveExample("CSS Demo: text-shadow")}}

```css interactive-example-choice
text-shadow: 1px 1px 2px pink;
```

```css interactive-example-choice
text-shadow: #ffcc00 1px 0 10px;
```

```css interactive-example-choice
text-shadow: 5px 5px #558abb;
```

```css interactive-example-choice
text-shadow: red 2px 5px;
```

```css interactive-example-choice
text-shadow: 5px 10px;
```

```css interactive-example-choice
text-shadow:
  1px 1px 2px red,
  0 0 1em blue,
  0 0 0.2em blue;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    Far out in the uncharted backwaters of the unfashionable end of the western
    spiral arm of the Galaxy...
  </p>
</section>
```

```css interactive-example
p {
  font:
    1.5em "Georgia",
    serif;
}
```

## Cú pháp

```css
/* offset-x | offset-y | blur-radius | color */
text-shadow: 1px 1px 2px black;

/* color | offset-x | offset-y | blur-radius */
text-shadow: #ffcc00 1px 0 10px;

/* offset-x | offset-y | color */
text-shadow: 5px 5px #558abb;

/* color | offset-x | offset-y */
text-shadow: white 2px 5px;

/* offset-x | offset-y
/* Use defaults for color and blur-radius */
text-shadow: 5px 10px;

/* Global values */
text-shadow: inherit;
text-shadow: initial;
text-shadow: revert;
text-shadow: revert-layer;
text-shadow: unset;
```

Thuộc tính này được chỉ định là một danh sách các đổ bóng được phân cách bằng dấu phẩy.

Mỗi đổ bóng được chỉ định bằng hai hoặc ba giá trị `<length>`, theo sau tùy chọn là giá trị `<color>`. Hai giá trị `<length>` đầu tiên là các giá trị `<offset-x>` và `<offset-y>`. Giá trị `<length>` thứ ba, tùy chọn, là `<blur-radius>`. Giá trị `<color>` là màu của đổ bóng.

Khi có nhiều hơn một đổ bóng, các đổ bóng được áp dụng từ trước ra sau, với đổ bóng được chỉ định đầu tiên ở trên cùng.

Thuộc tính này áp dụng cho cả [pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) {{cssxref("::first-line")}} và {{cssxref("::first-letter")}}.

### Giá trị

- {{cssxref("&lt;color&gt;")}}
  - : Tùy chọn. Màu của đổ bóng. Nó có thể được chỉ định trước hoặc sau các giá trị offset. Nếu không được chỉ định, giá trị màu sẽ do user agent quyết định, vì vậy khi cần tính nhất quán trên các trình duyệt, bạn nên định nghĩa nó rõ ràng.
- `<offset-x> <offset-y>`
  - : Bắt buộc. Các giá trị {{cssxref("&lt;length&gt;")}} này chỉ định khoảng cách của đổ bóng so với văn bản. `<offset-x>` chỉ định khoảng cách ngang; giá trị âm đặt đổ bóng ở bên trái văn bản. `<offset-y>` chỉ định khoảng cách dọc; giá trị âm đặt đổ bóng ở trên văn bản. Nếu cả hai giá trị đều là `0`, đổ bóng được đặt ngay phía sau văn bản, mặc dù nó có thể hiển thị một phần do hiệu ứng của `<blur-radius>`.
- `<blur-radius>`
  - : Tùy chọn. Đây là giá trị {{cssxref("&lt;length&gt;")}}. Giá trị càng cao, độ mờ càng lớn; đổ bóng trở nên rộng hơn và nhạt hơn. Nếu không được chỉ định, mặc định là `0`.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đổ bóng cơ bản

```css
.red-text-shadow {
  text-shadow: red 0 -2px;
}
```

```html
<p class="red-text-shadow">
  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium
  doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.
</p>
```

{{EmbedLiveSample('Basic_shadow', '660px', '90px')}}

### Nhiều đổ bóng

```css
.white-text-with-blue-shadow {
  text-shadow:
    1px 1px 2px black,
    0 0 1em blue,
    0 0 0.2em blue;
  color: white;
  font:
    1.5em "Georgia",
    serif;
}
```

```html
<p class="white-text-with-blue-shadow">
  Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium
  doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore.
</p>
```

{{EmbedLiveSample('Multiple_shadows', '660px', '170px')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Giới thiệu về đổ bóng văn bản](/en-US/docs/Web/CSS/Guides/Text_decoration/Text_shadows)
- {{cssxref("&lt;color&gt;")}}
- {{cssxref("box-shadow")}}
- {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
- Module [CSS text decoration](/en-US/docs/Web/CSS/Guides/Text_decoration)
