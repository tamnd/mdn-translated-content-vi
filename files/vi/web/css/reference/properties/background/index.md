---
title: background
slug: Web/CSS/Reference/Properties/background
page-type: css-shorthand-property
browser-compat: css.properties.background
sidebar: cssref
---

Thuộc tính **`background`** [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) [CSS](/en-US/docs/Web/CSS) thiết lập tất cả các thuộc tính kiểu nền cùng một lúc, như màu sắc, hình ảnh, gốc, kích thước và phương thức lặp lại.

{{InteractiveExample("CSS Demo: background")}}

```css interactive-example-choice
background: green;
```

```css interactive-example-choice
background: content-box radial-gradient(crimson, skyblue);
```

```css interactive-example-choice
background: no-repeat url("/shared-assets/images/examples/lizard.png");
```

```css interactive-example-choice
background: left 5% / 15% 60% repeat-x
  url("/shared-assets/images/examples/star.png");
```

```css interactive-example-choice
background:
  center / contain no-repeat
    url("/shared-assets/images/examples/firefox-logo.svg"),
  #eeeeee 35% url("/shared-assets/images/examples/lizard.png");
```

```html interactive-example
<section id="default-example">
  <div id="example-element"></div>
</section>
```

```css interactive-example
#example-element {
  min-width: 100%;
  min-height: 100%;
  padding: 10%;
}
```

## Thuộc tính thành phần

Thuộc tính này là viết tắt của các thuộc tính CSS sau:

- {{cssxref("background-attachment")}}
- {{cssxref("background-clip")}}
- {{cssxref("background-color")}}
- {{cssxref("background-image")}}
- {{cssxref("background-origin")}}
- {{cssxref("background-position")}}
- {{cssxref("background-repeat")}}
- {{cssxref("background-size")}}

## Cú pháp

```css
/* Sử dụng <background-color> */
background: green;

/* Sử dụng <bg-image> và <repeat-style> */
background: url("test.jpg") repeat-y;

/* Sử dụng <visual-box> và <'background-color'> */
background: border-box red;

/* Hình ảnh đơn, căn giữa và co giãn */
background: no-repeat center/80% url("../img/image.png");

/* Giá trị toàn cục */
background: inherit;
background: initial;
background: revert;
background: revert-layer;
background: unset;
```

### Giá trị

- `<attachment>`
  - : Xem {{cssxref("background-attachment")}}. Mặc định: `scroll`.
- `<visual-box>`
  - : Xem {{cssxref("background-clip")}} và {{cssxref("background-origin")}}. Mặc định: lần lượt là `border-box` và `padding-box`.
- `<'background-color'>`
  - : Xem {{cssxref("background-color")}}. Mặc định: `transparent`.
- `<bg-image>`
  - : Xem {{Cssxref("background-image")}}. Mặc định: `none`.
- `<bg-position>`
  - : Xem {{cssxref("background-position")}}. Mặc định: `0% 0%`.
- `<repeat-style>`
  - : Xem {{cssxref("background-repeat")}}. Mặc định: `repeat`.
- `<bg-size>`
  - : Xem {{cssxref("background-size")}}. Mặc định: `auto`.

## Mô tả

Thuộc tính viết tắt `background` cho phép bạn khai báo tất cả các thuộc tính nền CSS trong một khai báo duy nhất. Nền nằm bên dưới nội dung của phần tử. Khi bạn có nhiều giá trị nền phân tách bằng dấu phẩy, mỗi giá trị là một lớp nền được vẽ lên trên các lớp trước đó.

Thuộc tính `background` được chỉ định là một hoặc nhiều lớp nền, phân tách bằng dấu phẩy. Mỗi lớp có thể bao gồm không, một hoặc hai thành phần `<visual-box>` và không hoặc một `<attachment>`, `<bg-image>`, `<bg-position>`, `<bg-size>` và `<repeat-style>`. Nếu hai thành phần `<bg-position>`, `<bg-size>` hoặc `<repeat-style>` được chỉ định, giá trị đầu tiên là giá trị ngang và giá trị thứ hai là giá trị dọc. Nếu chỉ có một giá trị được đặt, giá trị đó được áp dụng cho cả hai chiều.

Thành phần `<'background-color'>` chỉ có thể được đưa vào lớp nền cuối cùng được chỉ định.

Các thuộc tính thành phần không được thiết lập trong khai báo giá trị thuộc tính viết tắt `background` được thiết lập về giá trị mặc định của chúng.

### Thứ tự thuộc tính thành phần

Vì một số thuộc tính thành phần có chung loại giá trị, thứ tự của các thuộc tính thành phần đó trong viết tắt là quan trọng.

Giá trị `<bg-size>` chỉ có thể được bao gồm ngay sau `<bg-position>`, phân tách với ký tự `/`. Ví dụ: `10px 10px / 80% 80%` có nghĩa là hình ảnh nền cao và rộng bằng `80%` so với phần tử, và sẽ được đặt `10px` từ trên cùng và `10px` từ bên trái của góc trên trái của phần tử. Trong `<bg-position>`, nếu cả hai giá trị đều là độ dài, hoặc một là độ dài và giá trị kia là `center`, giá trị đầu tiên tham chiếu đến vị trí ngang và giá trị thứ hai tham chiếu đến vị trí dọc.

Mỗi lớp nền có thể bao gồm không, một hoặc hai giá trị [`<visual-box>`](/en-US/docs/Web/CSS/Reference/Values/box-edge#visual-box). Nếu chỉ có một giá trị được bao gồm, nó thiết lập cả {{cssxref("background-origin")}} và {{cssxref("background-clip")}}. Nếu có hai giá trị, giá trị đầu chỉ định `background-origin` và giá trị thứ hai chỉ định giá trị `background-clip`. Nếu không có giá trị `<visual-box>` nào, `background-origin` mặc định là `border-box` và `background-clip` mặc định là `padding-box`.

Mặc dù không có yêu cầu thứ tự cho các thuộc tính nền khác, thứ tự sau được khuyến nghị để nhất quán và dễ đọc; hãy nhớ rằng không có giá trị nào là bắt buộc:

`<bg-image> <bg-position> / <bg-size> <repeat-style> <attachment> <bg-clip> <bg-origin> <'background-color'>`

Khai báo `background` sau đây đặt rõ ràng tất cả các giá trị mặc định theo thứ tự này:

```css
background: none 0% 0% / auto auto repeat scroll border-box padding-box
  transparent;
```

Ba dòng CSS sau tương đương với trên, dù thứ tự khác:

```css
background: none;
background: transparent;
background: repeat scroll 0% 0% / auto padding-box border-box none transparent;
```

### Thứ tự vẽ hình ảnh

Nếu nhiều nền phân tách bằng dấu phẩy được bao gồm, chúng tạo ra nhiều lớp nền chồng lên nhau. Nền đầu tiên trong danh sách tạo lớp trên cùng. Nếu lớp trên cùng không chứa vùng trong suốt, đây là lớp duy nhất sẽ hiển thị.

Lớp cuối cùng là lớp dưới cùng. Màu nền luôn được bao gồm trong lớp này.

### Nền body áp dụng cho toàn bộ tài liệu

Nếu giá trị `background-image` được tính toán của phần tử {{htmlelement("html")}} `:root` là `none` và `background-color` là `transparent`, trình duyệt sẽ chuyển các kiểu `background` được đặt trên phần tử {{htmlelement("body")}} lên `:root` và xử lý `<body>` như thể `background: initial` được đặt. Nói cách khác, phần tử `<html>` nhận tất cả các kiểu `background` được đặt trên phần tử `<body>`, và các thuộc tính nền của phần tử `<body>` được đặt về giá trị ban đầu.

Do hành vi này, các tác giả đặc tả khuyến nghị thiết lập kiểu nền của tài liệu trong khối kiểu `body` thay vì khối `html`. Tuy nhiên, điều quan trọng cần lưu ý là sử dụng containment sẽ vô hiệu hóa hành vi này. Khi thuộc tính {{cssxref("contain")}} được đặt thành bất kỳ giá trị nào khác `none` trên phần tử `<html>` hoặc `<body>`, thuộc tính `background` và bất kỳ thành phần longhand nào sẽ không lan truyền từ phần tử `<body>` sang phần tử `<html>` gốc.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Trợ năng

Trình duyệt không cung cấp bất kỳ thông tin đặc biệt nào về hình ảnh nền cho công nghệ hỗ trợ. Điều này đặc biệt quan trọng với trình đọc màn hình, vì trình đọc màn hình sẽ không thông báo sự hiện diện của nó và do đó không truyền đạt gì cho người dùng. Nếu hình ảnh chứa thông tin quan trọng để hiểu mục đích chung của trang, tốt hơn là mô tả nó theo nghĩa ngữ nghĩa trong tài liệu.

- [MDN Understanding WCAG, Guideline 1.1 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.1_—_providing_text_alternatives_for_non-text_content)
- [Understanding Success Criterion 1.1.1 | W3C Understanding WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/text-equiv-all.html)

## Ví dụ

### Thiết lập nền với từ khóa màu và hình ảnh

#### HTML

```html
<p class="top-banner">
  Starry sky<br />
  Twinkle twinkle<br />
  Starry sky
</p>
<p class="warning">Here is a paragraph</p>
<p></p>
```

#### CSS

```css
.warning {
  background: pink;
}

.top-banner {
  background: url("star-solid.gif") #9999ff repeat-y fixed;
}
```

#### Kết quả

{{EmbedLiveSample("Setting_backgrounds_with_color_keywords_and_images")}}

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("box-decoration-break")}}
- [Using gradients](/en-US/docs/Web/CSS/Guides/Images/Using_gradients)
- [Using multiple backgrounds](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders/Using_multiple_backgrounds)
