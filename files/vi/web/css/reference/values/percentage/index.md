---
title: <percentage>
slug: Web/CSS/Reference/Values/percentage
page-type: css-type
browser-compat: css.types.percentage
sidebar: cssref
---

Kiểu dữ liệu **`<percentage>`** trong [CSS](/vi/docs/Web/CSS) là một [kiểu dữ liệu](/vi/docs/Web/CSS/Reference/Values/Data_types) đại diện cho giá trị phần trăm. Nó thường được sử dụng để định nghĩa kích thước theo tỉ lệ với phần tử cha. Nhiều thuộc tính có thể sử dụng phần trăm, chẳng hạn như {{CSSxRef("width")}}, {{CSSxRef("height")}}, {{CSSxRef("margin")}}, {{CSSxRef("padding")}}, và {{CSSxRef("font-size")}}.

> [!NOTE]
> Chỉ các giá trị đã tính toán mới có thể được kế thừa. Do đó, ngay cả khi giá trị phần trăm được sử dụng trên thuộc tính cha, giá trị thực (chẳng hạn như chiều rộng theo pixel đối với giá trị {{CSSxRef("&lt;length&gt;")}}) sẽ có thể truy cập trên thuộc tính kế thừa, không phải giá trị phần trăm.

## Cú pháp

Kiểu dữ liệu `<percentage>` bao gồm một {{CSSxRef("&lt;number&gt;")}} theo sau là ký hiệu phần trăm (`%`). Tùy chọn, nó có thể được đặt trước bởi một dấu `+` hoặc `-`, mặc dù các giá trị âm không hợp lệ cho tất cả các thuộc tính. Như với tất cả các kích thước CSS, không có khoảng trắng giữa ký hiệu và số.

## Nội suy

Khi được hoạt ảnh, các giá trị của kiểu dữ liệu `<percentage>` được {{Glossary("interpolation", "nội suy")}} như các số thực dấu phẩy động. Tốc độ nội suy được xác định bởi [hàm easing](/vi/docs/Web/CSS/Reference/Values/easing-function) liên kết với hoạt ảnh.

## Ví dụ

### Width và margin-left

```html
<div class="container">
  <div class="box1">Width: 50%, Left margin: 20%</div>
  <div class="box2">Width: 30%, Left margin: 60%</div>
</div>
```

```css
.container {
  background-color: navy;
}

.box1 {
  width: 50%;
  margin-left: 20%;
  background-color: chartreuse;
}

.box2 {
  width: 30%;
  margin-left: 60%;
  background-color: pink;
}
```

{{EmbedLiveSample('Width_and_margin-left', '600', 140)}}

### Font-size

```html
<div class="container">
  <p>Full-size text (18px)</p>
  <p><span class="half">50% (9px)</span></p>
  <p><span class="double">200% (36px)</span></p>
</div>
```

```css
.container {
  font-size: 18px;
}

.half {
  font-size: 50%;
}

.double {
  font-size: 200%;
}
```

{{EmbedLiveSample('Font-size', 'auto', 160)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("&lt;length-percentage&gt;")}}
- Module [giá trị và đơn vị CSS](/vi/docs/Web/CSS/Guides/Values_and_units)
