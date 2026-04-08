---
title: <line-style>
slug: Web/CSS/Reference/Values/line-style
page-type: css-type
browser-compat: css.types.line-style
spec-urls: https://drafts.csswg.org/css-backgrounds/#typedef-line-style
sidebar: cssref
---

Kiểu giá trị {{glossary("enumerated")}} **`<line-style>`** đại diện cho các giá trị từ khóa xác định kiểu của một đường, hoặc sự vắng mặt của một đường. Các giá trị từ khóa `<line-style>` được dùng trong các thuộc tính [border](/vi/docs/Web/CSS/Guides/Backgrounds_and_borders) và [column](/vi/docs/Web/CSS/Guides/Multicol_layout) dạng viết đầy đủ và viết tắt sau:

- {{cssxref("border")}}, {{cssxref("border-style")}}
- {{cssxref("border-block")}}, {{cssxref("border-block-style")}}
- {{cssxref("border-block-end")}}, {{cssxref("border-block-end-style")}}
- {{cssxref("border-block-start")}}, {{cssxref("border-block-start-style")}}
- {{cssxref("border-bottom")}}, {{cssxref("border-bottom-style")}}
- {{cssxref("border-inline")}}, {{cssxref("border-inline-style")}}
- {{cssxref("border-inline-end")}}, {{cssxref("border-inline-end-style")}}
- {{cssxref("border-inline-start")}}, {{cssxref("border-inline-start-style")}}
- {{cssxref("border-left")}}, {{cssxref("border-left-style")}}
- {{cssxref("border-right")}}, {{cssxref("border-right-style")}}
- {{cssxref("border-top")}}, {{cssxref("border-top-style")}}
- {{cssxref("column-rule")}}, {{cssxref("column-rule-style")}}

## Cú pháp

### Giá trị

Kiểu liệt kê `<line-style>` được chỉ định bằng một trong các giá trị được liệt kê bên dưới:

- `none`
  - : Không hiển thị đường nào. Giá trị tính toán của độ rộng đường là `0` ngay cả khi một giá trị độ rộng được chỉ định. Trong trường hợp ô bảng và thu gọn đường viền, giá trị `none` có _độ ưu tiên thấp nhất_. Nếu có bất kỳ đường viền xung đột nào khác được đặt, nó sẽ được hiển thị. Giá trị `none` tương tự `hidden`.
- `hidden`
  - : Không hiển thị đường nào. Độ rộng tính toán của đường là `0` ngay cả khi một giá trị độ rộng được chỉ định. Trong trường hợp ô bảng và thu gọn đường viền, giá trị `hidden` có _độ ưu tiên cao nhất_. Nếu có bất kỳ đường viền xung đột nào khác được đặt, nó sẽ không được hiển thị. Giá trị `hidden` tương tự `none`, nhưng `hidden` không phải là giá trị hợp lệ cho kiểu đường viền ngoài.
- `dotted`
  - : Hiển thị một chuỗi các chấm tròn. Bán kính của các chấm là một nửa giá trị tính toán của độ rộng đường. Khoảng cách giữa các chấm không được xác định bởi đặc tả và phụ thuộc vào triển khai.
- `dashed`
  - : Hiển thị một chuỗi các gạch ngang ngắn hoặc đoạn đường có đầu vuông. Kích thước và chiều dài chính xác của các đoạn không được xác định bởi đặc tả và phụ thuộc vào triển khai.
- `solid`
  - : Hiển thị một đường liền mạch, thẳng duy nhất.
- `double`
  - : Hiển thị hai đường thẳng với một khoảng trống ở giữa. Chiều dài của các đường cộng lại bằng kích thước pixel được xác định bởi độ rộng đường.
- `groove`
  - : Hiển thị đường viền có vẻ ngoài như được khắc. Giá trị này là đối lập của `ridge`.
- `ridge`
  - : Hiển thị đường viền có vẻ ngoài như được đùn ra. Giá trị này là đối lập của `groove`.
- `inset`
  - : Hiển thị đường viền làm cho phần tử trông như được nhúng vào. Giá trị này là đối lập của `outset`. Khi áp dụng cho đường viền ô bảng và {{cssxref("border-collapse")}} được đặt thành `collapsed`, giá trị này hoạt động như `groove`.
- `outset`
  - : Hiển thị đường viền làm cho phần tử trông như được nổi lên. Giá trị này là đối lập của `inset`. Khi áp dụng cho ô bảng với {{cssxref("border-collapse")}} được đặt thành `collapsed`, giá trị này hoạt động như `ridge`.

> [!NOTE]
> Khi `<outline-style>` được dùng làm kiểu giá trị cho các thuộc tính {{cssxref("outline")}} và {{cssxref("outline-style")}}, nó tương tự `<line-style>`, nhưng không hỗ trợ `hidden` và bao gồm giá trị `auto`. Khi `auto` được đặt, giá trị `<line-style>` do tác nhân người dùng xác định sẽ được sử dụng.

## Cú pháp hình thức

{{CSSSyntaxRaw(`<line-style> = none | hidden | dotted | dashed | solid | double | groove | ridge | inset | outset`)}}

## Ví dụ

Ví dụ đầu tiên minh họa tất cả các giá trị từ khóa `<line-style>`. Ví dụ thứ hai minh họa cách một số màu kiểu đường có thể hiển thị theo cách không mong đợi.

### Định nghĩa các kiểu đường

Ví dụ này hiển thị tất cả các giá trị `<line-style>` như là giá trị cho các thuộc tính CSS {{cssxref("border-style")}} và {{cssxref("column-rule-style")}}.

#### HTML

Ví dụ này sử dụng nhiều phần tử {{HTMLElement( "div" )}}, mỗi phần tử có một lớp đại diện cho giá trị `<line-style>` đang được minh họa.

```html
<div class="{line-style}">
  <p>{line-style}</p>
  <p>a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
</div>
```

```html hidden
<div class="none">
  <p>none</p>
  <p>a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
</div>
<div class="hidden">
  <p>hidden</p>
  <p>a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
</div>
<div class="dotted">
  <p>dotted</p>
  <p>a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
</div>
<div class="dashed">
  <p>dashed</p>
  <p>a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
</div>
<div class="solid">
  <p>solid</p>
  <p>a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
</div>
<div class="double">
  <p>double</p>
  <p>a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
</div>
<div class="groove">
  <p>groove</p>
  <p>a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
</div>
<div class="ridge">
  <p>ridge</p>
  <p>a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
</div>
<div class="inset">
  <p>inset</p>
  <p>a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
</div>
<div class="outset">
  <p>outset</p>
  <p>a b c d e f g h i j k l m n o p q r s t u v w x y z</p>
</div>
```

#### CSS

Trong CSS cho ví dụ này, đường viền và quy tắc cột cho tất cả các phần tử `<p>` được định nghĩa có độ rộng `7px` và giá trị kiểu `double`. Đối với mỗi đoạn văn, giá trị `double` sau đó được ghi đè bằng cách chỉ định một giá trị `<line-style>` khác cho các thuộc tính `border-style` và `column-rule-style`.

```css hidden
div {
  display: flex;
  gap: 1em;
  list-style: none;
  align-items: center;
}
div:first-of-type {
  display: none;
}

p:first-of-type {
  text-align: center;
  line-height: 5em;
}
p {
  width: 10em;
  height: 5em;
  background-color: palegoldenrod;
}
```

```css
p {
  padding: 5px;
  border: double 7px #bada55;
}
p + p {
  columns: 3;
  column-gap: 20px;
  column-rule: double 7px;
  border-color: black;
}
.none p {
  border-style: none;
  column-rule-style: none;
}
.hidden p {
  border-style: hidden;
  column-rule-style: hidden;
}
.dotted p {
  border-style: dotted;
  column-rule-style: dotted;
}
.dashed p {
  border-style: dashed;
  column-rule-style: dashed;
}
.solid p {
  border-style: solid;
  column-rule-style: solid;
}
.double p {
  border-style: double;
  column-rule-style: double;
}
.groove p {
  border-style: groove;
  column-rule-style: groove;
}
.ridge p {
  border-style: ridge;
  column-rule-style: ridge;
}
.inset p {
  border-style: inset;
  column-rule-style: inset;
}
.outset p {
  border-style: outset;
  column-rule-style: outset;
}
```

#### Kết quả

{{EmbedLiveSample("Defining_line_styles", "500", "800")}}

Lưu ý rằng đường viền màu đen không phải lúc nào cũng là màu đen.

### Định nghĩa kiểu đường và màu sắc

Ví dụ này minh họa việc chọn kiểu đường và màu sắc. Với một số giá trị từ khóa `<line-style>`, màu của đường có thể không như bạn mong đợi. Để tạo hiệu ứng "3D" cần thiết của các kiểu `groove`, `ridge`, `inset` và `outset` khi hiển thị các giá trị này trong màu đen hoặc trắng, các tác nhân người dùng sử dụng các tính toán màu khác với bất kỳ tổ hợp màu đường nào khác.

#### CSS

Bốn cạnh của mỗi `<div>` có một giá trị `<line-style>` khác nhau, và mỗi mục trong danh sách có một giá trị {{cssxref("color_value", "&lt;color>")}} khác nhau. Chúng ta dùng [nội dung được tạo ra](/vi/docs/Web/CSS/Reference/Properties/content) để hiển thị CSS được khai báo nội tuyến.

```css hidden live-sample___line_style_colors
body {
  display: flex;
  flex-wrap: wrap;
  gap: 1em;
  text-transform: uppercase;
  font-family: monospace;
}
```

```css live-sample___line_style_colors
div {
  border-width: 10px;
  border-style: inset groove ridge outset;
  padding: 5px;
}
```

#### JavaScript

JavaScript tự động tạo các phần tử {{HTMLElement( "div" )}}, mỗi phần tử có `border-color` khác nhau được đặt.

```js live-sample___line_style_colors
// prettier-ignore
const colors = [
  "#000000", "#000001", "#ffffff",
  "#ff00ff", "#ffff00", "#00ffff",
  "#cc33cc", "#cccc33", "#33cccc",
  "#ff0000", "#00ff00", "#0000ff",
  "#cc3333", "#33cc33", "#3333cc",
  "#993333", "#339933", "#333399",
];

for (const c of colors) {
  const div = document.createElement("div");
  div.style.borderColor = c;
  div.textContent = c;
  document.body.appendChild(div);
}
```

#### Kết quả

{{EmbedLiveSample("line_style_colors", "500", "200")}}

Lưu ý rằng màu gần đen `#000001` có thể khác với màu đen thực sự, và sự tương phản giữa các cạnh tối và sáng rõ ràng hơn khi dùng màu sáng hơn.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Mô-đun CSS backgrounds and borders](/vi/docs/Web/CSS/Guides/Backgrounds_and_borders)
- [Mô-đun CSS basic user interface](/vi/docs/Web/CSS/Guides/Basic_user_interface)
- [Mô-đun CSS multi-column layout](/vi/docs/Web/CSS/Guides/Multicol_layout)
