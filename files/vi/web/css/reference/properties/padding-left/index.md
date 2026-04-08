---
title: padding-left
slug: Web/CSS/Reference/Properties/padding-left
page-type: css-property
browser-compat: css.properties.padding-left
sidebar: cssref
---

Thuộc tính **`padding-left`** [CSS](/en-US/docs/Web/CSS) đặt độ rộng của [vùng padding](/en-US/docs/Web/CSS/Guides/Box_model/Introduction#padding_area) ở bên trái của một phần tử.

{{InteractiveExample("CSS Demo: padding-left")}}

```css interactive-example-choice
padding-left: 1.5em;
```

```css interactive-example-choice
padding-left: 10%;
```

```css interactive-example-choice
padding-left: 20px;
```

```css interactive-example-choice
padding-left: 1ch;
```

```css interactive-example-choice
padding-left: 0;
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

Vùng padding của một phần tử là khoảng cách giữa nội dung của nó và đường viền.

> [!NOTE]
> Thuộc tính {{cssxref("padding")}} có thể được dùng để đặt padding cho cả bốn phía của một phần tử chỉ với một khai báo.

## Cú pháp

```css
/* Giá trị <length> */
padding-left: 0.5em;
padding-left: 0;
padding-left: 2cm;

/* Giá trị <percentage> */
padding-left: 10%;

/* Giá trị toàn cục */
padding-left: inherit;
padding-left: initial;
padding-left: revert;
padding-left: revert-layer;
padding-left: unset;
```

Thuộc tính `padding-left` được chỉ định là một giá trị đơn chọn từ danh sách bên dưới. Không giống như margin, các giá trị âm không được phép dùng cho padding.

### Giá trị

- {{cssxref("&lt;length&gt;")}}
  - : Kích thước padding dưới dạng giá trị cố định. Phải không âm.
- {{cssxref("&lt;percentage&gt;")}}
  - : Kích thước padding dưới dạng phần trăm, tương đối với kích thước nội tuyến (_width_ trong ngôn ngữ chiều ngang, được xác định bởi {{cssxref("writing-mode")}}) của [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block). Phải không âm.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Đặt padding trái bằng pixel và phần trăm

```css
.content {
  padding-left: 5%;
}
.side-box {
  padding-left: 10px;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("padding-top")}}, {{cssxref("padding-right")}}, và {{cssxref("padding-bottom")}}
- {{cssxref("padding")}} viết tắt
- {{cssxref("padding-block-start")}}, {{cssxref("padding-block-end")}}, {{cssxref("padding-inline-start")}}, và {{cssxref("padding-inline-end")}}
- {{cssxref("padding-block")}} và {{cssxref("padding-inline")}} viết tắt
- [Giới thiệu về mô hình hộp CSS cơ bản](/en-US/docs/Web/CSS/Guides/Box_model/Introduction)
- Mô-đun [mô hình hộp CSS](/en-US/docs/Web/CSS/Guides/Box_model)
