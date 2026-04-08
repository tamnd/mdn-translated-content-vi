---
title: accent-color
slug: Web/CSS/Reference/Properties/accent-color
page-type: css-property
browser-compat: css.properties.accent-color
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`accent-color`** đặt màu {{Glossary("accent")}} cho các điều khiển giao diện người dùng được tạo ra bởi một số phần tử.

{{InteractiveExample("CSS Demo: accent-color")}}

```css interactive-example-choice
accent-color: red;
```

```css interactive-example-choice
accent-color: #74992e;
```

```css interactive-example-choice
accent-color: rgb(255 255 128);
```

```css interactive-example-choice
accent-color: hsl(250 100% 34%);
```

```html interactive-example
<section class="default-example container" id="default-example">
  <div>
    <input checked id="example-element" type="checkbox" />
    <label for="example-element" id="example-label">Example Label</label>
  </div>
</section>
```

```css interactive-example
.container > div {
  display: flex;
  align-items: center;
}

#example-element {
  width: 40px;
  height: 40px;
}

#example-label {
  margin-left: 10px;
  font-size: x-large;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
accent-color: auto;

/* Giá trị <color> */
accent-color: darkred;
accent-color: #5729e9;
accent-color: rgb(0 200 0);
accent-color: hsl(228 4% 24%);

/* Giá trị toàn cục */
accent-color: inherit;
accent-color: initial;
accent-color: revert;
accent-color: revert-layer;
accent-color: unset;
```

### Giá trị

- `auto`
  - : Đại diện cho một màu được chọn bởi tác nhân người dùng (UA), nên khớp với màu nhấn của nền tảng, nếu có.
- {{cssxref("&lt;color&gt;")}}
  - : Xác định màu sẽ được dùng làm màu nhấn.

## Mô tả

Các trình duyệt hỗ trợ `accent-color` hiện tại áp dụng nó cho các phần tử HTML sau:

- [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox)
- [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio)
- [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range)
- [`<progress>`](/en-US/docs/Web/HTML/Reference/Elements/progress)

Mỗi tác nhân người dùng có một màu nhấn, với các biến thể để đảm bảo khả năng đọc và độ tương phản. Màu nhấn đó không được dùng cho mọi điều khiển giao diện người dùng hay trong mọi trạng thái của điều khiển. `accent-color` chỉ được áp dụng cho các điều khiển giao diện người dùng sử dụng màu nhấn trong các trạng thái mà nó có thể áp dụng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt màu nhấn tùy chỉnh

#### HTML

```html
<input type="checkbox" checked />
<input type="checkbox" class="custom" checked />
```

#### CSS

```css
input {
  accent-color: auto;
  display: block;
  width: 30px;
  height: 30px;
}

input.custom {
  accent-color: rebeccapurple;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_a_custom_accent_color', 500, 200)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("background-color")}}, {{cssxref("border-color")}}, {{cssxref("caret-color")}}, {{cssxref("color")}}, {{cssxref("column-rule-color")}}, {{cssxref("outline-color")}}, {{cssxref("text-decoration-color")}}, {{cssxref("text-emphasis-color")}}, {{cssxref("text-shadow")}}: Các thuộc tính liên quan đến màu sắc khác
- {{cssxref("&lt;color&gt;")}}: Kiểu dữ liệu liên quan
- {{HTMLElement("input")}}: Phần tử HTML liên quan
