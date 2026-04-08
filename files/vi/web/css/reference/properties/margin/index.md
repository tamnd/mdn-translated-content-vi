---
title: margin
slug: Web/CSS/Reference/Properties/margin
page-type: css-shorthand-property
browser-compat: css.properties.margin
sidebar: cssref
---

Thuộc tính CSS rút gọn **`margin`** đặt [vùng lề](/en-US/docs/Web/CSS/Guides/Box_model/Introduction#margin_area) cho cả bốn phía của một phần tử.

{{InteractiveExample("CSS Demo: margin")}}

```css interactive-example-choice
margin: 1em;
```

```css interactive-example-choice
margin: 5% 0;
```

```css interactive-example-choice
margin: 10px 50px 20px;
```

```css interactive-example-choice
margin: 10px 50px 20px 0;
```

```css interactive-example-choice
margin: 0;
```

```html interactive-example
<section id="default-example">
  <div id="container">
    <div class="row"></div>
    <div class="row transition-all" id="example-element"></div>
    <div class="row"></div>
  </div>
</section>
```

```css interactive-example
#container {
  width: 300px;
  height: 200px;
  display: flex;
  align-content: flex-start;
  flex-direction: column;
  justify-content: flex-start;
}

.row {
  height: 33.33%;
  display: inline-block;
  border: solid #ce7777 10px;
  background-color: #2b3a55;
  flex-shrink: 0;
}

#example-element {
  border: solid 10px #ffbf00;
  background-color: #2b3a55;
}
```

## Các thuộc tính thành phần

Thuộc tính này là dạng rút gọn cho các thuộc tính CSS sau:

- {{cssxref("margin-top")}}
- {{cssxref("margin-right")}}
- {{cssxref("margin-bottom")}}
- {{cssxref("margin-left")}}

## Cú pháp

```css
/* áp dụng cho cả bốn phía */
margin: 1em;
margin: -3px;

/* trên và dưới | trái và phải */
margin: 5% auto;

/* trên | trái và phải | dưới */
margin: 1em auto 2em;

/* trên | phải | dưới | trái */
margin: 2px 1em 0 auto;

/* Giá trị anchor-size() */
margin: 5% anchor-size(width);
margin: calc(anchor-size(width) / 4) 1em 0
  anchor-size(--my-anchor self-inline, 50px);

/* Giá trị từ khóa */
margin: auto;

/* Giá trị toàn cục */
margin: inherit;
margin: initial;
margin: revert;
margin: revert-layer;
margin: unset;
```

Thuộc tính `margin` có thể được chỉ định bằng một, hai, ba hoặc bốn giá trị. Mỗi giá trị là {{cssxref("&lt;length&gt;")}}, {{cssxref("&lt;percentage&gt;")}}, hoặc từ khóa `auto`. Giá trị âm kéo phần tử lại gần các phần tử lân cận hơn so với mặc định.

- Khi chỉ định **một** giá trị, nó áp dụng cùng lề cho **cả bốn phía**.
- Khi chỉ định **hai** giá trị, lề đầu tiên áp dụng cho **trên và dưới**, lề thứ hai cho **trái và phải**.
- Khi chỉ định **ba** giá trị, lề đầu tiên áp dụng cho **trên**, lề thứ hai cho **phải và trái**, lề thứ ba cho **dưới**.
- Khi chỉ định **bốn** giá trị, các lề áp dụng cho **trên**, **phải**, **dưới** và **trái** theo thứ tự đó (theo chiều kim đồng hồ).

### Giá trị

- {{cssxref("length")}}
  - : Kích thước lề dưới dạng giá trị cố định.
    - Đối với các _phần tử định vị theo neo_, hàm {{cssxref("anchor-size()")}} phân giải thành giá trị {{cssxref("&lt;length&gt;")}} tương đối với chiều rộng hoặc chiều cao của _phần tử neo_ liên kết (xem [Đặt lề phần tử dựa trên kích thước neo](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#setting_element_margin_based_on_anchor_size)).

- {{cssxref("percentage")}}
  - : Kích thước lề dưới dạng phần trăm, tương đối với kích thước inline (_chiều rộng_ trong ngôn ngữ ngang, được xác định bởi {{cssxref("writing-mode")}}) của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block).
- `auto`
  - : Trình duyệt chọn một lề phù hợp để sử dụng. Ví dụ, trong một số trường hợp giá trị này có thể được dùng để căn giữa một phần tử.

## Mô tả

Thuộc tính này có thể được dùng để đặt lề cho cả bốn phía của một phần tử. Lề tạo ra khoảng trống thêm _xung quanh_ phần tử, không giống như {{cssxref("padding")}}, vốn tạo ra khoảng trống thêm _bên trong_ phần tử.

Lề trên và dưới không có tác dụng đối với các phần tử inline _không phải [thay thế](/en-US/docs/Glossary/Replaced_elements)_, chẳng hạn như {{HTMLElement("span")}} hoặc {{HTMLElement("code")}}.

### Căn giữa theo chiều ngang

Bạn có thể căn giữa theo chiều ngang một phần tử trong phần tử cha của nó bằng cách đặt `margin: 0 auto;`.

Một phương pháp phổ biến hơn để căn giữa phần tử theo chiều ngang là đặt `display: flex;` và [`justify-content: center;`](/en-US/docs/Web/CSS/Reference/Properties/justify-content) trên container, vốn [căn giữa các flex item](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Aligning_items) con.

### Gộp lề

Lề trên và dưới của các phần tử đôi khi được gộp thành một lề duy nhất bằng giá trị lớn hơn trong hai lề. Xem [Làm chủ gộp lề](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing) để biết thêm thông tin.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<div class="center">This element is centered.</div>

<div class="outside">This element is positioned outside of its container.</div>
```

#### CSS

```css
.center {
  margin: auto;
  background: lime;
  width: 66%;
}

.outside {
  margin: 3rem 0 0 -3rem;
  background: cyan;
  width: 66%;
}
```

{{ EmbedLiveSample('Basic_example','100%',120) }}

### Các ví dụ khác

```css
margin: 5%; /* Tất cả các phía: lề 5% */

margin: 10px; /* Tất cả các phía: lề 10px */

margin: 1.6em 20px; /* trên và dưới: lề 1.6em */
/* trái và phải: lề 20px */

margin: 10px 3% -1em; /* trên:            lề 10px */
/* trái và phải: lề 3%   */
/* dưới:         lề -1em */

margin: 10px 3px 30px 5px; /* trên:    lề 10px */
/* phải:  lề 3px  */
/* dưới:  lề 30px */
/* trái:  lề 5px  */

margin: 2em auto; /* trên và dưới: lề 2em     */
/* Hộp được căn giữa theo chiều ngang */

margin: auto; /* trên và dưới: lề 0       */
/* Hộp được căn giữa theo chiều ngang */
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("margin-top")}}, {{cssxref("margin-right")}}, {{cssxref("margin-bottom")}}, và {{cssxref("margin-left")}}
- {{cssxref("margin-block-start")}}, {{cssxref("margin-block-end")}}, {{cssxref("margin-inline-start")}}, và {{cssxref("margin-inline-end")}}
- Các thuộc tính rút gọn {{cssxref("margin-block")}} và {{cssxref("margin-inline")}}
- [Làm chủ gộp lề](/en-US/docs/Web/CSS/Guides/Box_model/Margin_collapsing)
- Hướng dẫn [Giới thiệu về mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- Mô-đun [CSS box model](/en-US/docs/Web/CSS/Guides/Box_model)
