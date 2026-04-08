---
title: border
slug: Web/CSS/Reference/Properties/border
page-type: css-shorthand-property
browser-compat: css.properties.border
sidebar: cssref
---

Thuộc tính **`border`** [CSS](/en-US/docs/Web/CSS) [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) đặt đường viền của một phần tử. Nó đặt các giá trị của {{Cssxref("border-width")}}, {{Cssxref("border-style")}}, và {{Cssxref("border-color")}}.

{{InteractiveExample("CSS Demo: border")}}

```css interactive-example-choice
border: solid;
```

```css interactive-example-choice
border: dashed red;
```

```css interactive-example-choice
border: 1rem solid;
```

```css interactive-example-choice
border: thick double #32a1ce;
```

```css interactive-example-choice
border: 4mm ridge rgb(211 220 50 / 0.6);
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box with a border around it.
  </div>
</section>
```

```css interactive-example
#example-element {
  background-color: #eeeeee;
  color: darkmagenta;
  padding: 0.75em;
  width: 80%;
  height: 100px;
}
```

## Các thuộc tính thành phần

Thuộc tính này là dạng viết tắt cho các thuộc tính CSS sau:

- {{cssxref("border-width")}}
- {{cssxref("border-style")}}
- {{cssxref("border-color")}}

## Cú pháp

```css
/* style */
border: solid;

/* width | style */
border: 2px dotted;

/* style | color */
border: outset #ff3333;

/* width | style | color */
border: medium dashed green;

/* Giá trị toàn cục */
border: inherit;
border: initial;
border: revert;
border: revert-layer;
border: unset;
```

Thuộc tính `border` có thể được chỉ định bằng một, hai hoặc ba trong số các giá trị được liệt kê bên dưới. Thứ tự các giá trị không quan trọng.

> [!NOTE]
> Đường viền sẽ vô hình nếu kiểu của nó không được xác định. Điều này là do kiểu mặc định là `none`.

### Giá trị

- `<line-width>`
  - : Đặt độ dày của đường viền. Mặc định là `medium` nếu không có. Xem {{Cssxref("border-width")}}.
- {{cssxref("&lt;line-style&gt;")}}
  - : Đặt kiểu đường viền. Mặc định là `none` nếu không có. Xem {{Cssxref("border-style")}}.
- {{cssxref("&lt;color&gt;")}}
  - : Đặt màu đường viền. Mặc định là `currentColor` nếu không có. Xem {{Cssxref("border-color")}}.

## Mô tả

Như với tất cả thuộc tính viết tắt, bất kỳ giá trị con nào bị bỏ qua sẽ được đặt về [giá trị ban đầu](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#initial_value). Quan trọng là, `border` không thể được dùng để chỉ định giá trị tùy chỉnh cho {{cssxref("border-image")}}, mà thay vào đó sẽ đặt nó về giá trị ban đầu, tức là `none`.

Thuộc tính viết tắt `border` đặc biệt hữu ích khi bạn muốn tất cả bốn đường viền đều giống nhau. Để làm chúng khác nhau, tuy nhiên, bạn có thể dùng các thuộc tính dạng dài {{Cssxref("border-width")}}, {{Cssxref("border-style")}}, và {{Cssxref("border-color")}}, chấp nhận các giá trị khác nhau cho mỗi cạnh. Ngoài ra, bạn có thể nhắm vào một đường viền tại một thời điểm với các thuộc tính vật lý (ví dụ: {{Cssxref("border-top")}}) và logic (ví dụ: {{Cssxref("border-block-start")}}).

### Đường viền và outline

Đường viền và [outline](/en-US/docs/Web/CSS/Reference/Properties/outline) rất giống nhau. Tuy nhiên, outline khác với đường viền theo các cách sau:

- Outline không chiếm không gian vì chúng được vẽ bên ngoài nội dung của phần tử.
- Theo thông số kỹ thuật, outline không nhất thiết phải là hình chữ nhật, mặc dù chúng thường là.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt đường viền outset màu hồng

#### HTML

```html
<div>I have a border, an outline, and a box shadow! Amazing, isn't it?</div>
```

#### CSS

```css
div {
  border: 0.5rem outset pink;
  outline: 0.5rem solid khaki;
  box-shadow: 0 0 0 2rem skyblue;
  border-radius: 12px;
  font: bold 1rem sans-serif;
  margin: 2rem;
  padding: 1rem;
  outline-offset: 0.5rem;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_a_pink_outset_border')}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("border-width")}}
- {{Cssxref("border-style")}}
- {{Cssxref("border-color")}}
- {{Cssxref("outline")}}
- [Backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders)
- [Learn CSS: Backgrounds and borders](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders)
