---
title: border-style
slug: Web/CSS/Reference/Properties/border-style
page-type: css-shorthand-property
browser-compat: css.properties.border-style
sidebar: cssref
---

Thuộc tính [viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) **`border-style`** trong [CSS](/en-US/docs/Web/CSS) đặt kiểu đường kẻ cho tất cả bốn cạnh đường viền của một phần tử.

{{InteractiveExample("CSS Demo: border-style")}}

```css interactive-example-choice
border-style: none;
```

```css interactive-example-choice
border-style: dotted;
```

```css interactive-example-choice
border-style: inset;
```

```css interactive-example-choice
border-style: dashed solid;
```

```css interactive-example-choice
border-style: dashed double none;
```

```css interactive-example-choice
border-style: dashed groove none dotted;
```

```html interactive-example
<section id="default-example">
  <div class="transition-all" id="example-element">
    This is a box with a border around it.
  </div>
</section>
```

```css interactive-example
#example-element {
  background-color: #eeeeee;
  color: black;
  border: 0.75em solid;
  padding: 0.75em;
  width: 80%;
  height: 100px;
}

body {
  background-color: white;
}
```

## Thuộc tính thành phần

Thuộc tính này là dạng viết tắt cho các thuộc tính CSS sau:

- {{cssxref("border-bottom-style")}}
- {{cssxref("border-left-style")}}
- {{cssxref("border-right-style")}}
- {{cssxref("border-top-style")}}

## Cú pháp

```css
/* Giá trị từ khóa */
border-style: none;
border-style: hidden;
border-style: dotted;
border-style: dashed;
border-style: solid;
border-style: double;
border-style: groove;
border-style: ridge;
border-style: inset;
border-style: outset;

/* trên và dưới | trái và phải */
border-style: dotted solid;

/* trên | trái và phải | dưới */
border-style: hidden double dashed;

/* trên | phải | dưới | trái */
border-style: none solid dotted dashed;

/* Giá trị toàn cục */
border-style: inherit;
border-style: initial;
border-style: revert;
border-style: revert-layer;
border-style: unset;
```

Thuộc tính `border-style` có thể được chỉ định với một, hai, ba hoặc bốn giá trị.

- Khi chỉ định **một** giá trị, kiểu đó áp dụng cho **tất cả bốn cạnh**.
- Khi chỉ định **hai** giá trị, kiểu đầu tiên áp dụng cho **trên và dưới**, kiểu thứ hai áp dụng cho **trái và phải**.
- Khi chỉ định **ba** giá trị, kiểu đầu tiên áp dụng cho **trên**, kiểu thứ hai áp dụng cho **trái và phải**, kiểu thứ ba áp dụng cho **dưới**.
- Khi chỉ định **bốn** giá trị, các kiểu áp dụng cho **trên**, **phải**, **dưới**, và **trái** theo thứ tự đó (theo chiều kim đồng hồ).

Mỗi giá trị là một từ khóa được chọn từ danh sách bên dưới.

### Giá trị

- `<line-style>`
  - : Mô tả kiểu của đường viền. Nó có thể có các giá trị sau:
    - `none`
      - : Giống như từ khóa `hidden`, không hiển thị đường viền. Trừ khi có {{cssxref("background-image")}} được đặt, giá trị tính toán của {{cssxref("border-width")}} cùng phía sẽ là `0`, ngay cả khi giá trị được chỉ định là khác. Trong trường hợp ô bảng và thu gọn đường viền, giá trị `none` có _ưu tiên thấp nhất_: nếu có bất kỳ đường viền xung đột nào khác được đặt, nó sẽ được hiển thị.
    - `hidden`
      - : Giống như từ khóa `none`, không hiển thị đường viền. Trừ khi có {{cssxref("background-image")}} được đặt, giá trị tính toán của {{cssxref("border-width")}} cùng phía sẽ là `0`, ngay cả khi giá trị được chỉ định là khác. Trong trường hợp ô bảng và thu gọn đường viền, giá trị `hidden` có _ưu tiên cao nhất_: nếu có bất kỳ đường viền xung đột nào khác được đặt, nó sẽ không được hiển thị.
    - `dotted`
      - : Hiển thị một dãy các chấm tròn. Khoảng cách giữa các chấm không được xác định bởi thông số kỹ thuật và phụ thuộc vào từng trình triển khai. Bán kính của các chấm bằng một nửa giá trị tính toán của {{cssxref("border-width")}} cùng phía.
    - `dashed`
      - : Hiển thị một dãy các đoạn gạch ngang ngắn có đầu vuông. Kích thước và độ dài chính xác của các đoạn không được xác định bởi thông số kỹ thuật và phụ thuộc vào từng trình triển khai.
    - `solid`
      - : Hiển thị một đường thẳng liền mạch, đơn.
    - `double`
      - : Hiển thị hai đường thẳng có tổng kích thước pixel được xác định bởi {{cssxref("border-width")}}.
    - `groove`
      - : Hiển thị đường viền với vẻ ngoài được khắc vào. Nó là nghịch đảo của `ridge`.
    - `ridge`
      - : Hiển thị đường viền với vẻ ngoài nổi lên. Nó là nghịch đảo của `groove`.
    - `inset`
      - : Hiển thị đường viền khiến phần tử trông như được nhúng vào. Nó là nghịch đảo của `outset`. Khi áp dụng cho ô bảng với {{cssxref("border-collapse")}} được đặt là `collapsed`, giá trị này hoạt động như `ridge`.
    - `outset`
      - : Hiển thị đường viền khiến phần tử trông như được nổi lên. Nó là nghịch đảo của `inset`. Khi áp dụng cho ô bảng với {{cssxref("border-collapse")}} được đặt là `collapsed`, giá trị này hoạt động như `groove`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Tất cả các giá trị thuộc tính

Đây là ví dụ về tất cả các giá trị thuộc tính.

#### HTML

```html
<pre class="b1">none</pre>
<pre class="b2">hidden</pre>
<pre class="b3">dotted</pre>
<pre class="b4">dashed</pre>
<pre class="b5">solid</pre>
<pre class="b6">double</pre>
<pre class="b7">groove</pre>
<pre class="b8">ridge</pre>
<pre class="b9">inset</pre>
<pre class="b10">outset</pre>
```

#### CSS

```css
pre {
  height: 80px;
  width: 120px;
  margin: 20px;
  padding: 20px;
  display: inline-block;
  background-color: palegreen;
  border-width: 5px;
  box-sizing: border-box;
}

/* border-style example classes */
.b1 {
  border-style: none;
}

.b2 {
  border-style: hidden;
}

.b3 {
  border-style: dotted;
}

.b4 {
  border-style: dashed;
}

.b5 {
  border-style: solid;
}

.b6 {
  border-style: double;
}

.b7 {
  border-style: groove;
}

.b8 {
  border-style: ridge;
}

.b9 {
  border-style: inset;
}

.b10 {
  border-style: outset;
}
```

#### Kết quả

{{EmbedLiveSample('All_property_values', "1200", 450)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính viết tắt CSS liên quan đến đường viền: {{Cssxref("border")}}, {{Cssxref("border-width")}}, {{Cssxref("border-color")}}, {{Cssxref("border-radius")}}
