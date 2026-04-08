---
title: padding-bottom
slug: Web/CSS/Reference/Properties/padding-bottom
page-type: css-property
browser-compat: css.properties.padding-bottom
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`padding-bottom`** thiết lập chiều cao của [vùng padding](/en-US/docs/Web/CSS/Guides/Box_model/Introduction#padding_area) ở phía dưới của một phần tử.

{{InteractiveExample("CSS Demo: padding-bottom")}}

```css interactive-example-choice
padding-bottom: 1em;
```

```css interactive-example-choice
padding-bottom: 10%;
```

```css interactive-example-choice
padding-bottom: 20px;
```

```css interactive-example-choice
padding-bottom: 1ch;
```

```css interactive-example-choice
padding-bottom: 0;
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

![Hiệu ứng của thuộc tính CSS padding-bottom trên hộp phần tử](padding-bottom.svg)

> [!NOTE]
> Thuộc tính {{cssxref("padding")}} có thể dùng để thiết lập padding cho cả bốn cạnh của một phần tử chỉ bằng một khai báo.

## Cú pháp

```css
/* Giá trị <length> */
padding-bottom: 0.5em;
padding-bottom: 0;
padding-bottom: 2cm;

/* Giá trị <percentage> */
padding-bottom: 10%;

/* Giá trị toàn cục */
padding-bottom: inherit;
padding-bottom: initial;
padding-bottom: revert;
padding-bottom: revert-layer;
padding-bottom: unset;
```

Thuộc tính `padding-bottom` được chỉ định bằng một giá trị duy nhất từ danh sách dưới đây. Khác với margin, giá trị âm không được phép đối với padding.

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Kích thước của padding dưới dạng giá trị cố định. Phải không âm.
- {{cssxref("&lt;percentage&gt;")}}
  - : Kích thước của padding dưới dạng phần trăm, tương đối so với kích thước inline (_width_ trong ngôn ngữ nằm ngang, được xác định bởi {{cssxref("writing-mode")}}) của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block). Phải không âm.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Thiết lập padding dưới bằng pixel và phần trăm

```css
.content {
  padding-bottom: 5%;
}
.side-box {
  padding-bottom: 10px;
}
```

## Đặc tả

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("padding-top")}}, {{cssxref("padding-right")}} và {{cssxref("padding-left")}}
- Thuộc tính viết tắt {{cssxref("padding")}}
- {{cssxref("padding-block-start")}}, {{cssxref("padding-block-end")}}, {{cssxref("padding-inline-start")}} và {{cssxref("padding-inline-end")}}
- Các thuộc tính viết tắt {{cssxref("padding-block")}} và {{cssxref("padding-inline")}}
- Hướng dẫn [Giới thiệu về mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- Mô-đun [Mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model)
