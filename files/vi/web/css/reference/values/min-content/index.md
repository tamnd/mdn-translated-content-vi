---
title: min-content
slug: Web/CSS/Reference/Values/min-content
page-type: css-keyword
browser-compat: css.properties.width.min-content
sidebar: cssref
---

Từ khóa định kích thước `min-content` biểu thị [kích thước nội tại tối thiểu](/vi/docs/Glossary/Intrinsic_Size#minimum_intrinsic_size) của một phần tử.
Từ khóa này thu nhỏ phần tử xuống kích thước nhỏ nhất có thể mà không gây ra tràn nội dung có thể tránh được.
Đối với nội dung văn bản, từ khóa này khiến nội dung xuống dòng ở mọi cơ hội (chẳng hạn như khoảng trắng giữa các từ), và phần tử sẽ chỉ rộng bằng từ dài nhất.

Thuộc tính {{cssxref("interpolate-size")}} và hàm {{cssxref("calc-size()")}} có thể được dùng để bật hoạt ảnh đến và từ `min-content`.

## Cú pháp

```css
/* Dùng làm giá trị độ dài */
width: min-content;
inline-size: min-content;
height: min-content;
block-size: min-content;

/* Dùng trong các track của lưới */
grid-template-columns: 200px 1fr min-content;
```

## Ví dụ

### Định kích thước hộp với min-content

#### HTML

```html
<div class="item">Item</div>
<div class="item">Item with more text in it.</div>
```

#### CSS

```css
.item {
  width: min-content;
  background-color: #8ca0ff;
  padding: 5px;
  margin-bottom: 1em;
}
```

#### Kết quả

{{EmbedLiveSample("Using_min-content_for_box_sizing", "100%", 200)}}

### Định kích thước cột lưới với min-content

#### HTML

```html
<div id="container">
  <div>Item</div>
  <div>Item with more text in it.</div>
  <div>Flexible item</div>
</div>
```

#### CSS

```css
#container {
  display: grid;
  grid-template-columns: min-content min-content 1fr;
  grid-gap: 5px;
  box-sizing: border-box;
  height: 200px;
  width: 100%;
  background-color: #8cffa0;
  padding: 10px;
}

#container > div {
  background-color: #8ca0ff;
  padding: 5px;
}
```

#### Kết quả

{{EmbedLiveSample("Sizing_grid_columns_with_min-content", "100%", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các từ khóa định kích thước liên quan: {{cssxref("max-content")}}, {{cssxref("fit-content")}}
- Mô-đun [CSS box sizing](/vi/docs/Web/CSS/Guides/Box_sizing)
