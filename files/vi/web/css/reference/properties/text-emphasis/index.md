---
title: text-emphasis
slug: Web/CSS/Reference/Properties/text-emphasis
page-type: css-shorthand-property
browser-compat: css.properties.text-emphasis
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-emphasis`** áp dụng các dấu nhấn mạnh lên văn bản (trừ khoảng trắng và ký tự điều khiển). Đây là thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) của {{cssxref("text-emphasis-style")}} và {{cssxref("text-emphasis-color")}}.

{{InteractiveExample("CSS Demo: text-emphasis")}}

```css interactive-example-choice
text-emphasis: none;
```

```css interactive-example-choice
text-emphasis: filled red;
```

```css interactive-example-choice
text-emphasis: "x";
```

```css interactive-example-choice
text-emphasis: filled double-circle #ffb703;
```

```html interactive-example
<section id="default-example">
  <p>
    I'd far rather be
    <span class="transition-all" id="example-element">happy than right</span>
    any day.
  </p>
</section>
```

```css interactive-example
p {
  font: 1.5em sans-serif;
}
```

Thuộc tính `text-emphasis` khá khác biệt so với {{cssxref("text-decoration")}}. Thuộc tính `text-decoration` không được kế thừa, và trang trí được chỉ định được áp dụng trên toàn bộ phần tử. Tuy nhiên, `text-emphasis` được kế thừa, có nghĩa là có thể thay đổi dấu nhấn mạnh cho các phần tử con.

Kích thước của ký hiệu nhấn mạnh, giống như ký hiệu ruby, khoảng 50% kích thước phông chữ, và `text-emphasis` có thể ảnh hưởng đến chiều cao dòng khi khoảng cách dòng hiện tại không đủ cho các dấu nhấn mạnh.

> [!NOTE]
> `text-emphasis` không đặt lại giá trị của {{cssxref("text-emphasis-position")}}. Điều này là vì nếu kiểu và màu sắc của dấu nhấn mạnh có thể thay đổi trong một văn bản, thì gần như không thể vị trí của chúng thay đổi. Trong những trường hợp rất hiếm khi cần thiết, hãy sử dụng thuộc tính {{cssxref("text-emphasis-position")}}.

## Thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("text-emphasis-color")}}
- {{cssxref("text-emphasis-style")}}

## Cú pháp

```css
/* Giá trị ban đầu */
text-emphasis: none; /* Không có dấu nhấn mạnh */

/* Giá trị <string> */
text-emphasis: "x";
text-emphasis: "点";
text-emphasis: "\25B2";
text-emphasis: "*" #555555;
text-emphasis: "foo"; /* Không nên dùng. Có thể được tính toán hoặc hiển thị chỉ là 'f' */

/* Giá trị từ khóa */
text-emphasis: filled;
text-emphasis: open;
text-emphasis: filled sesame;
text-emphasis: open sesame;

/* Giá trị từ khóa kết hợp với màu sắc */
text-emphasis: filled sesame #555555;

/* Giá trị toàn cục */
text-emphasis: inherit;
text-emphasis: initial;
text-emphasis: revert;
text-emphasis: revert-layer;
text-emphasis: unset;
```

### Giá trị

- `none`
  - : Không có dấu nhấn mạnh.
- `filled`
  - : Hình dạng được tô đầy bằng màu đặc. Nếu không có `filled` hay `open`, đây là giá trị mặc định.
- `open`
  - : Hình dạng rỗng.
- `dot`
  - : Hiển thị các chấm tròn nhỏ làm dấu nhấn mạnh. Chấm đầy là `'•'` (`U+2022`), và chấm rỗng là `'◦'` (`U+25E6`).
- `circle`
  - : Hiển thị các vòng tròn lớn làm dấu nhấn mạnh. Vòng tròn đầy là `'●'` (`U+25CF`), và vòng tròn rỗng là `'○'` (`U+25CB`). Đây là hình dạng mặc định trong chế độ viết ngang khi không có hình dạng nào khác được chỉ định.
- `double-circle`
  - : Hiển thị các vòng tròn đôi làm dấu nhấn mạnh. Vòng tròn đôi đầy là `'◉'` (`U+25C9`), và vòng tròn đôi rỗng là `'◎'` (`U+25CE`).
- `triangle`
  - : Hiển thị các tam giác làm dấu nhấn mạnh. Tam giác đầy là `'▲'` (`U+25B2`), và tam giác rỗng là `'△'` (`U+25B3`).
- `sesame`
  - : Hiển thị các dấu vừng làm dấu nhấn mạnh. Dấu vừng đầy là `'﹅'` (`U+FE45`), và dấu vừng rỗng là `'﹆'` (`U+FE46`). Đây là hình dạng mặc định trong chế độ viết dọc khi không có hình dạng nào khác được chỉ định.
- `<string>`
  - : Hiển thị chuỗi đã cho làm dấu nhấn mạnh. Các tác giả không nên chỉ định nhiều hơn một _ký tự_ trong `<string>`. UA có thể cắt bớt hoặc bỏ qua các chuỗi bao gồm nhiều hơn một cụm grapheme.
- `<color>`
  - : Xác định màu của dấu nhấn mạnh. Nếu không có màu nào được chỉ định, mặc định là `currentColor`.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tiêu đề với hình dạng và màu nhấn mạnh

Ví dụ này vẽ một tiêu đề với các tam giác được dùng để nhấn mạnh từng ký tự.

#### CSS

```css
h2 {
  text-emphasis: triangle #dd5555;
}
```

#### HTML

```html
<h2>This is important!</h2>
```

#### Kết quả

{{EmbedLiveSample("A_heading_with_emphasis_shape_and_color", 500, 90)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính dài hạn {{cssxref('text-emphasis-style')}}, {{cssxref('text-emphasis-color')}}.
- Thuộc tính {{cssxref('text-emphasis-position')}} cho phép xác định vị trí của các dấu nhấn mạnh.
