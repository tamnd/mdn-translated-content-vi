---
title: clear
slug: Web/CSS/Reference/Properties/clear
page-type: css-property
browser-compat: css.properties.clear
sidebar: cssref
---

Thuộc tính **`clear`** trong [CSS](/en-US/docs/Web/CSS) xác định xem phần tử có phải được di chuyển xuống dưới (xóa) các phần tử [float](/en-US/docs/Web/CSS/Reference/Properties/float) đứng trước nó hay không. Thuộc tính `clear` áp dụng cho cả phần tử float lẫn phần tử không float.

{{InteractiveExample("CSS Demo: clear")}}

```css interactive-example-choice
clear: none;
```

```css interactive-example-choice
clear: left;
```

```css interactive-example-choice
clear: right;
```

```css interactive-example-choice
clear: both;
```

```html interactive-example
<section class="default-example" id="default-example">
  <div class="example-container">
    <div class="floated-left">Left</div>
    <div class="floated-right">Right</div>
    <div class="transition-all" id="example-element">
      As much mud in the streets as if the waters had but newly retired from the
      face of the earth, and it would not be wonderful to meet a Megalosaurus,
      forty feet long or so, waddling like an elephantine lizard up Holborn
      Hill.
    </div>
  </div>
</section>
```

```css interactive-example
.example-container {
  border: 1px solid #c5c5c5;
  padding: 0.75em;
  text-align: left;
  line-height: normal;
}

.floated-left {
  border: solid 10px #ffc129;
  background-color: rgb(81 81 81 / 0.6);
  padding: 1em;
  float: left;
}

.floated-right {
  border: solid 10px #ffc129;
  background-color: rgb(81 81 81 / 0.6);
  padding: 1em;
  float: right;
  height: 150px;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
clear: none;
clear: left;
clear: right;
clear: both;
clear: inline-start;
clear: inline-end;

/* Giá trị toàn cục */
clear: inherit;
clear: initial;
clear: revert;
clear: revert-layer;
clear: unset;
```

### Giá trị

- `none`
  - : Từ khóa cho biết phần tử _không_ bị di chuyển xuống để xóa các phần tử float đứng trước.
- `left`
  - : Từ khóa cho biết phần tử được di chuyển xuống để xóa các float _bên trái_.
- `right`
  - : Từ khóa cho biết phần tử được di chuyển xuống để xóa các float _bên phải_.
- `both`
  - : Từ khóa cho biết phần tử được di chuyển xuống để xóa _cả_ float bên trái lẫn bên phải.
- `inline-start`
  - : Từ khóa cho biết phần tử được di chuyển xuống để xóa các float ở _phía đầu của khối chứa_, tức là float _bên trái_ đối với văn bản ltr và float _bên phải_ đối với văn bản rtl.
- `inline-end`
  - : Từ khóa cho biết phần tử được di chuyển xuống để xóa các float ở _phía cuối của khối chứa_, tức là float _bên phải_ đối với văn bản ltr và float _bên trái_ đối với văn bản rtl.

## Mô tả

Khi áp dụng cho các khối không float, nó di chuyển [cạnh border](/en-US/docs/Web/CSS/Guides/Box_model/Introduction#border_area) của phần tử xuống dưới cho đến khi nó nằm dưới [cạnh margin](/en-US/docs/Web/CSS/Guides/Box_model/Introduction#margin_area) của tất cả các float liên quan. Margin trên của khối không float sẽ bị thu nhỏ.

Ngược lại, các margin dọc giữa hai phần tử float sẽ không bị thu nhỏ. Khi áp dụng cho các phần tử float, cạnh margin của phần tử dưới được di chuyển xuống dưới cạnh margin của tất cả các float liên quan. Điều này ảnh hưởng đến vị trí của các float sau, vì các float sau không thể được đặt cao hơn các float trước.

Các float liên quan cần được xóa là những float trước đó trong cùng [ngữ cảnh định dạng khối](/en-US/docs/Web/CSS/Guides/Display/Block_formatting_context).

> [!NOTE]
> Nếu phần tử chỉ chứa các phần tử float, chiều cao của nó sẽ thu nhỏ về không. Nếu bạn muốn nó luôn có thể thay đổi kích thước để chứa các phần tử float bên trong, hãy đặt giá trị của thuộc tính {{cssxref("display")}} của phần tử thành [`flow-root`](/en-US/docs/Web/CSS/Reference/Properties/display#flow-root).
>
> ```css
> #container {
>   display: flow-root;
> }
> ```

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### clear: left

#### HTML

```html
<div class="wrapper">
  <p class="black">
    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus sit amet
    diam. Duis mattis varius dui. Suspendisse eget dolor.
  </p>
  <p class="red">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
  <p class="left">This paragraph clears left.</p>
</div>
```

#### CSS

```css
.wrapper {
  border: 1px solid black;
  padding: 10px;
}
.left {
  border: 1px solid black;
  clear: left;
}
.black {
  float: left;
  margin: 0;
  background-color: black;
  color: white;
  width: 20%;
}
.red {
  float: left;
  margin: 0;
  background-color: pink;
  width: 20%;
}
p {
  width: 50%;
}
```

{{ EmbedLiveSample('clear_left','100%','250') }}

### clear: right

#### HTML

```html
<div class="wrapper">
  <p class="black">
    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus sit amet
    diam. Duis mattis varius dui. Suspendisse eget dolor.
  </p>
  <p class="red">Lorem ipsum dolor sit amet, consectetuer adipiscing elit.</p>
  <p class="right">This paragraph clears right.</p>
</div>
```

#### CSS

```css
.wrapper {
  border: 1px solid black;
  padding: 10px;
}
.right {
  border: 1px solid black;
  clear: right;
}
.black {
  float: right;
  margin: 0;
  background-color: black;
  color: white;
  width: 20%;
}
.red {
  float: right;
  margin: 0;
  background-color: pink;
  width: 20%;
}
p {
  width: 50%;
}
```

{{ EmbedLiveSample('clear_right','100%','250') }}

### clear: both

#### HTML

```html
<div class="wrapper">
  <p class="black">
    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus sit amet
    diam. Duis mattis varius dui. Suspendisse eget dolor. Fusce pulvinar lacus
    ac dui.
  </p>
  <p class="red">
    Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Phasellus sit amet
    diam. Duis mattis varius dui. Suspendisse eget dolor.
  </p>
  <p class="both">This paragraph clears both.</p>
</div>
```

#### CSS

```css
.wrapper {
  border: 1px solid black;
  padding: 10px;
}
.both {
  border: 1px solid black;
  clear: both;
}
.black {
  float: left;
  margin: 0;
  background-color: black;
  color: white;
  width: 20%;
}
.red {
  float: right;
  margin: 0;
  background-color: pink;
  width: 20%;
}
p {
  width: 45%;
}
```

{{ EmbedLiveSample('clear_both','100%','300') }}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Mô hình hộp CSS cơ bản](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
