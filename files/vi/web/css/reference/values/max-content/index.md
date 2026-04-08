---
title: max-content
slug: Web/CSS/Reference/Values/max-content
page-type: css-keyword
browser-compat: css.properties.width.max-content
sidebar: cssref
---

Từ khóa định kích thước `max-content` biểu diễn [kích thước nội tại tối đa](/vi/docs/Glossary/Intrinsic_Size#maximum_intrinsic_size) của một phần tử.
Từ khóa mở rộng phần tử đến kích thước lớn nhất cần thiết để hiển thị nội dung của nó mà không có bất kỳ ngắt dòng mềm nào.
Đối với nội dung văn bản, từ khóa này không ngắt dòng nội dung, ngay cả khi nó gây ra tràn nội dung.

Thuộc tính {{cssxref("interpolate-size")}} và hàm {{cssxref("calc-size()")}} có thể được dùng để kích hoạt hoạt ảnh đến và từ `max-content`.

## Cú pháp

```css
/* Used as a length value */
width: max-content;
inline-size: max-content;
height: max-content;
block-size: max-content;

/* Used in grid tracks */
grid-template-columns: 200px 1fr max-content;
```

## Ví dụ

### Đặt kích thước hộp với max-content

#### HTML

```html
<div id="container">
  <div class="item">Item</div>
  <div class="item">
    Item with more text in it which will overflow the fixed width box.
  </div>
</div>
```

#### CSS

```css
#container {
  background-color: #8cffa0;
  padding: 10px;
  width: 200px;
}

.item {
  width: max-content;
  background-color: #8ca0ff;
  padding: 5px;
  margin-bottom: 1em;
}
```

#### Kết quả

{{EmbedLiveSample("Using_max-content_for_box_sizing", "100%", 200)}}

### Đặt kích thước cột grid với max-content

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
  grid-template-columns: max-content max-content 1fr;
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

{{EmbedLiveSample("Sizing_grid_columns_with_max-content", "100%", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các từ khóa định kích thước liên quan: {{cssxref("min-content")}}, {{cssxref("fit-content")}}
- [Mô-đun CSS box sizing](/vi/docs/Web/CSS/Guides/Box_sizing)
