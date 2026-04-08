---
title: padding
slug: Web/CSS/Reference/Properties/padding
page-type: css-shorthand-property
browser-compat: css.properties.padding
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`padding`** là [thuộc tính viết tắt](/en-US/docs/Web/CSS/Guides/Cascade/Shorthand_properties) dùng để thiết lập [vùng padding](/en-US/docs/Web/CSS/Guides/Box_model/Introduction#padding_area) cho cả bốn cạnh của một phần tử cùng một lúc.

{{InteractiveExample("CSS Demo: padding")}}

```css interactive-example-choice
padding: 1em;
```

```css interactive-example-choice
padding: 10% 0;
```

```css interactive-example-choice
padding: 10px 50px 20px;
```

```css interactive-example-choice
padding: 10px 50px 30px 0;
```

```css interactive-example-choice
padding: 0;
```

```html interactive-example
<section id="default-example">
  <div class="transition-all" id="example-element">
    <div class="box">
      Far out in the uncharted backwaters of the unfashionable end of the
      western spiral arm of the Galaxy lies a small unregarded yellow sun.
    </div>
  </div>
</section>
```

```css interactive-example
#example-element {
  border: 10px solid #ffc129;
  overflow: hidden;
  text-align: left;
}

.box {
  border: dashed 1px;
}
```

Vùng padding của một phần tử là khoảng trống giữa nội dung và đường viền (border) của nó.

> [!NOTE]
> Padding tạo thêm khoảng trống bên _trong_ phần tử. Ngược lại, {{cssxref("margin")}} tạo thêm khoảng trống bên _ngoài_ phần tử.

## Các thuộc tính thành phần

Thuộc tính này là cách viết tắt cho các thuộc tính CSS sau:

- {{cssxref("padding-top")}}
- {{cssxref("padding-right")}}
- {{cssxref("padding-bottom")}}
- {{cssxref("padding-left")}}

## Cú pháp

```css
/* Áp dụng cho cả bốn cạnh */
padding: 1em;

/* trên và dưới | trái và phải */
padding: 5% 10%;

/* trên | trái và phải | dưới */
padding: 1em 2em 2em;

/* trên | phải | dưới | trái */
padding: 5px 1em 0 2em;

/* Giá trị toàn cục */
padding: inherit;
padding: initial;
padding: revert;
padding: revert-layer;
padding: unset;
```

Thuộc tính `padding` có thể được chỉ định bằng một, hai, ba hoặc bốn giá trị. Mỗi giá trị là {{cssxref("&lt;length&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Giá trị âm không hợp lệ.

- Khi chỉ định **một** giá trị, padding đó áp dụng cho **cả bốn cạnh**.
- Khi chỉ định **hai** giá trị, padding đầu tiên áp dụng cho **trên và dưới**, giá trị thứ hai cho **trái và phải**.
- Khi chỉ định **ba** giá trị, padding đầu tiên áp dụng cho **trên**, giá trị thứ hai cho **phải và trái**, giá trị thứ ba cho **dưới**.
- Khi chỉ định **bốn** giá trị, các padding áp dụng lần lượt cho **trên**, **phải**, **dưới** và **trái** (theo chiều kim đồng hồ).

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Kích thước của padding dưới dạng giá trị cố định.
- {{cssxref("&lt;percentage&gt;")}}
  - : Kích thước của padding dưới dạng phần trăm, tương đối so với kích thước inline (_width_ trong ngôn ngữ nằm ngang, được xác định bởi {{cssxref("writing-mode")}}) của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập padding bằng pixel

#### HTML

```html
<h4>Phần tử này có padding vừa phải.</h4>
<h3>Padding của phần tử này rất lớn!</h3>
```

#### CSS

```css
h4 {
  background-color: lime;
  padding: 20px 50px;
}

h3 {
  background-color: cyan;
  padding: 110px 50px 50px 110px;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_padding_with_pixels', '100%', 300)}}

### Thiết lập padding bằng pixel và phần trăm

```css
padding: 5%; /* Tất cả các cạnh: padding 5% */

padding: 10px; /* Tất cả các cạnh: padding 10px */

padding: 10px 20px; /* trên và dưới: padding 10px */
/* trái và phải: padding 20px */

padding: 10px 3% 20px; /* trên:           padding 10px */
/* trái và phải: padding 3%   */
/* dưới:         padding 20px */

padding: 1em 3px 30px 5px; /* trên:   padding 1em  */
/* phải:  padding 3px  */
/* dưới:  padding 30px */
/* trái:  padding 5px  */
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("padding-top")}}, {{cssxref("padding-right")}}, {{cssxref("padding-bottom")}} và {{cssxref("padding-left")}}
- {{cssxref("padding-block-start")}}, {{cssxref("padding-block-end")}}, {{cssxref("padding-inline-start")}} và {{cssxref("padding-inline-end")}}
- Các thuộc tính viết tắt {{cssxref("padding-block")}} và {{cssxref("padding-inline")}}
- Hướng dẫn [Giới thiệu về mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- Mô-đun [Mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model)
