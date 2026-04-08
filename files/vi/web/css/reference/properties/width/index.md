---
title: width
slug: Web/CSS/Reference/Properties/width
page-type: css-property
browser-compat: css.properties.width
sidebar: cssref
---

Thuộc tính **`width`** của [CSS](/vi/docs/Web/CSS) đặt chiều rộng của một phần tử. Theo mặc định, nó đặt chiều rộng của [vùng nội dung](/vi/docs/Web/CSS/Guides/Box_model/Introduction#content_area), nhưng nếu {{cssxref("box-sizing")}} được đặt thành `border-box`, nó đặt chiều rộng của [vùng viền](/vi/docs/Web/CSS/Guides/Box_model/Introduction#border_area).

{{InteractiveExample("CSS Demo: width")}}

```css interactive-example-choice
width: 150px;
```

```css interactive-example-choice
width: 20em;
```

```css interactive-example-choice
width: 75%;
```

```css interactive-example-choice
width: auto;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="transition-all" id="example-element">
    This is a box where you can change the width.
  </div>
</section>
```

```css interactive-example
#example-element {
  display: flex;
  flex-direction: column;
  background-color: #5b6dcd;
  height: 80%;
  justify-content: center;
  color: white;
}
```

Giá trị được chỉ định của `width` áp dụng cho vùng nội dung miễn là giá trị của nó nằm trong phạm vi được xác định bởi {{cssxref("min-width")}} và {{cssxref("max-width")}}.

- Nếu giá trị `width` nhỏ hơn giá trị `min-width`, thì `min-width` ghi đè `width`.
- Nếu giá trị `width` lớn hơn giá trị `max-width`, thì `max-width` ghi đè `width`.

> [!NOTE]
> Là thuộc tính hình học, `width` cũng áp dụng cho các phần tử SVG {{SVGElement("svg")}}, {{SVGElement("rect")}}, {{SVGElement("image")}}, và {{SVGElement("foreignObject")}}, với `auto` giải thành `100%` cho `<svg>` và `0` cho các phần tử khác, và các giá trị phần trăm tương đối với chiều rộng khung nhìn SVG cho `<rect>`. Giá trị thuộc tính CSS `width` ghi đè bất kỳ giá trị thuộc tính SVG {{SVGAttr("width")}} nào được đặt trên phần tử SVG.

## Cú pháp

```css
/* Giá trị <length> */
width: 300px;
width: 25em;

/* Giá trị <percentage> */
width: 75%;

/* Giá trị từ khóa */
width: max-content;
width: min-content;
width: fit-content;
width: auto;
width: stretch;

/* Giá trị hàm */
width: fit-content(20em);
width: anchor-size(width);
width: anchor-size(--my-anchor inline, 120%);
width: calc-size(max-content, size / 2);

/* Giá trị toàn cục */
width: inherit;
width: initial;
width: revert;
width: revert-layer;
width: unset;
```

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Xác định chiều rộng bằng giá trị khoảng cách.
- {{cssxref("&lt;percentage&gt;")}}
  - : Xác định chiều rộng bằng phần trăm chiều rộng của [khối chứa](/vi/docs/Web/CSS/Guides/Display/Containing_block).
- `auto`
  - : Trình duyệt sẽ tính toán và chọn chiều rộng cho phần tử được chỉ định.
- {{cssxref("max-content")}}
  - : Chiều rộng ưa thích nội tại.
- {{cssxref("min-content")}}
  - : Chiều rộng tối thiểu nội tại.
- {{cssxref("fit-content")}}
  - : Sử dụng không gian có sẵn, nhưng không nhiều hơn [max-content](/vi/docs/Web/CSS/Reference/Values/max-content), tức là `min(max-content, max(min-content, stretch))`.
- {{cssxref("anchor-size()")}}
  - : Đặt chiều rộng tương đối với kích thước của phần tử neo. Khi xác định `width` của phần tử được định vị theo neo, tham số đầu tiên mặc định là chiều rộng của neo liên kết. Nếu áp dụng cho phần tử không được định vị theo neo, nó đặt chiều rộng thành giá trị dự phòng. Nếu không có giá trị dự phòng nào được xác định, khai báo bị bỏ qua.
- {{cssxref("calc-size()")}}
  - : Đặt chiều rộng thành kích thước nội tại đã được sửa đổi.
- [`fit-content(<length-percentage>)`](/vi/docs/Web/CSS/Reference/Values/fit-content_function)
  - : Sử dụng công thức fit-content với không gian có sẵn được thay thế bằng đối số được chỉ định, kẹp chiều rộng theo công thức `min(kích thước tối đa, max(kích thước tối thiểu, <length-percentage>))`.
- `stretch`
  - : Đặt chiều rộng của [hộp lề](/vi/docs/Learn_web_development/Core/Styling_basics/Box_model#parts_of_a_box) của phần tử bằng chiều rộng của [khối chứa](/vi/docs/Web/CSS/Guides/Display/Containing_block#identifying_the_containing_block). Nó cố gắng làm cho hộp lề lấp đầy không gian có sẵn trong khối chứa, do đó hoạt động tương tự như `100%` theo một cách nào đó, nhưng áp dụng kích thước kết quả cho hộp lề thay vì hộp được xác định bởi [box-sizing](/vi/docs/Web/CSS/Reference/Properties/box-sizing).

## Khả năng tiếp cận

Đảm bảo rằng các phần tử được đặt với `width` không bị cắt bớt và/hoặc không che khuất nội dung khác khi trang được phóng to để tăng kích thước chữ.

- [MDN Giải thích WCAG, Hướng dẫn 1.4](/vi/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.4_make_it_easier_for_users_to_see_and_hear_content_including_separating_foreground_from_background)
- [Hiểu Tiêu chí Thành công 1.4.4 | W3C Hiểu WCAG 2.0](https://www.w3.org/TR/UNDERSTANDING-WCAG20/visual-audio-contrast-scale.html)

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Chiều rộng mặc định

Ví dụ này minh họa cách dùng cơ bản và giá trị mặc định `auto`.

#### HTML

Chúng ta bao gồm hai đoạn văn; một đoạn có tên lớp.

```html
<p>Cộng đồng MDN viết tài liệu thực sự tuyệt vời.</p>
<p class="has-width">Cộng đồng MDN viết tài liệu thực sự tuyệt vời.</p>
```

#### CSS

Chúng ta đặt nền vàng cho tất cả các đoạn văn, đặt rõ ràng `width` của đoạn thứ hai thành `auto`.

```css
p {
  background: gold;
}
p.has-width {
  width: auto;
}
```

#### Kết quả

{{EmbedLiveSample("Default width", 600, 100)}}

Vì `width` mặc định là `auto`, cả hai đoạn có cùng chiều rộng.

### Sử dụng đơn vị độ dài

Ví dụ này minh họa các giá trị chiều rộng theo độ dài.

#### HTML

Chúng ta bao gồm hai phần tử {{htmlelement("div")}} với một số văn bản.

```html
<div class="px_length">Chiều rộng tính bằng px</div>
<div class="em_length">Chiều rộng tính bằng em</div>
```

#### CSS

Phần tử `px_length` được đặt thành `200px` trong khi phần tử `em_length` được đặt rộng `20em`. Cả hai phần tử cũng có các giá trị {{cssxref("background-color")}}, {{cssxref("color")}}, và {{cssxref("border")}} khác nhau để phân biệt chúng khi hiển thị.

```css
.px_length {
  width: 200px;

  background-color: red;
  color: white;
  border: 1px solid black;
}

.em_length {
  width: 20em;

  background-color: white;
  color: red;
  border: 1px solid black;
}
```

#### Kết quả

{{EmbedLiveSample("Using length units", 600, 60)}}

Phần tử `px_length` luôn rộng 200px. Chiều rộng hiển thị của phần tử `em_length` phụ thuộc vào kích thước phông chữ.

### Sử dụng phần trăm

Ví dụ này minh họa cách dùng các giá trị phần trăm.

#### HTML

Chúng ta bao gồm một phần tử {{htmlelement("div")}} với một số văn bản.

```html
<div class="percent">Chiều rộng theo phần trăm</div>
```

#### CSS

Chúng ta đặt `width` của phần tử thành `20%` chiều rộng của bộ chứa cha.

```css
.percent {
  width: 20%;

  background-color: silver;
  border: 1px solid red;
}
```

#### Kết quả

{{EmbedLiveSample("Using percentages", 600, 60)}}

### Sử dụng kích thước nội tại

Ví dụ này so sánh `max-content` và `min-content`, và giới thiệu `calc-size`.

#### HTML

Chúng ta bao gồm ba đoạn văn với cùng nội dung; chỉ khác tên lớp.

```html
<p class="max-green">Cộng đồng MDN viết tài liệu thực sự tuyệt vời.</p>
<p class="min-blue">Cộng đồng MDN viết tài liệu thực sự tuyệt vời.</p>
<p class="min-pink">Cộng đồng MDN viết tài liệu thực sự tuyệt vời.</p>
```

#### CSS

Chúng ta đặt `width` của một đoạn thành `max-content`, đoạn thứ hai thành `min-content`, và đoạn thứ ba gấp đôi kích thước `min-content` bằng hàm `calc-size()`. Mỗi đoạn được tô màu nền và kiểu viền khác nhau.

```css
p.max-green {
  width: max-content;

  background-color: lightgreen;
  border-style: dotted;
}

p.min-blue {
  width: min-content;

  background-color: lightblue;
  border-style: dashed;
}

p.min-pink {
  width: calc-size(min-content, size * 2);

  background-color: pink;
  border-style: solid;
}
```

```css hidden
@supports not (width: calc-size(min-content, size * 2)) {
  body::after {
    content: "Your browser doesn't support the calc-size() function yet.";
    background-color: wheat;
    display: block;
    text-align: center;
    padding: 1em;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Using intrinsic sizes", 600, 230)}}

Ví dụ `max-content` rộng bằng văn bản. Ví dụ `min-content` rộng bằng từ dài nhất. Ví dụ `calc-size()` được đặt gấp đôi chiều rộng `min-content`.

### Sử dụng từ khóa stretch

Ví dụ này minh họa giá trị `stretch` trong bộ chứa [flex](/vi/docs/Web/CSS/Guides/Flexible_box_layout).

#### HTML

Chúng ta bao gồm một bộ chứa cha với hai phần tử con.

```html
<div class="parent">
  <div class="child">text</div>
  <div class="child stretch">stretch</div>
</div>
```

#### CSS

Chúng ta dùng thuộc tính {{cssxref("display")}} để biến cha thành bộ chứa flex, và đặt `width` của phần tử con thứ hai thành `stretch`.

```css
.parent {
  border: solid;
  margin: 1rem;
  display: flex;
}

.child {
  background: #00999999;
  margin: 1rem;
}

.stretch {
  width: stretch;
}
```

```css hidden
@supports not (width: stretch) {
  body::after {
    content: "Your browser doesn't support the stretch value yet.";
    background-color: wheat;
    display: block;
    text-align: center;
    padding: 1em;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Using the stretch keyword", "auto", 100)}}

Theo mặc định, các phần tử flex rộng bằng nội dung của chúng. Giá trị `stretch` làm cho phần tử rộng bằng không gian có sẵn cho phép, với hộp lề của phần tử bị kẹp theo chiều rộng của khối chứa.

### Sử dụng hàm anchor-size()

Ví dụ này minh họa cách dùng hàm `anchor-size()` để xác định chiều rộng của phần tử được định vị theo neo; chúng ta xác định chiều rộng của nó như một bội số chiều cao của neo.

#### HTML

Chúng ta chỉ định hai phần tử {{htmlelement("div")}}: một phần tử `anchor` và một phần tử `infobox` mà chúng ta sẽ định vị tương đối với neo.

```html
<div class="anchor">⚓︎</div>

<div class="infobox">
  <p>Hộp thông tin.</p>
</div>
```

#### CSS

Chúng ta khai báo phần tử `anchor` `<div>` là phần tử neo bằng cách đặt cho nó {{cssxref("anchor-name")}}. Phần tử được định vị có thuộc tính {{cssxref("position")}} được đặt thành `absolute`, và được liên kết với phần tử neo qua thuộc tính {{cssxref("position-anchor")}}. Chúng ta cũng đặt kích thước {{cssxref("height")}} và `width` tuyệt đối trên neo và xác định chiều rộng của phần tử được định vị theo neo bằng chiều rộng của neo sử dụng hàm `anchor-size()` làm giá trị của thuộc tính `width`.

```css hidden
.anchor {
  anchor-name: --my-anchor;
  width: 120px;
  height: 60px;

  font-size: 2rem;
  background-color: lightpink;
  text-align: center;
  align-content: center;
  outline: 1px solid black;
}

.infobox {
  position-anchor: --my-anchor;
  position: absolute;
  position-area: right;
  width: anchor-size(width);

  left: calc( anchor-size(height) / 4 )

  align-content: center;
  color: darkblue;
  background-color: azure;
  outline: 1px solid #dddddd;
}
```

```css hidden
body {
  padding: 5em;
}
```

#### Kết quả

{{EmbedLiveSample("Using the anchor-size() function", "auto", 200)}}

Lưu ý cách chiều rộng của hộp thông tin luôn bằng chiều rộng của phần tử neo.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("height")}}
- {{cssxref("box-sizing")}}
- {{cssxref("min-width")}}, {{cssxref("max-width")}}
- {{cssxref("block-size")}}, {{cssxref("inline-size")}}
- Thuộc tính SVG {{SVGAttr("width")}}
- Hướng dẫn [Giới thiệu mô hình hộp CSS](/vi/docs/Web/CSS/Guides/Box_model/Introduction)
- Mô-đun [Mô hình hộp CSS](/vi/docs/Web/CSS/Guides/Box_model)
- Mô-đun [Định vị neo CSS](/vi/docs/Web/CSS/Guides/Anchor_positioning)
- Mô-đun [Giá trị và đơn vị CSS](/vi/docs/Web/CSS/Guides/Values_and_units)
