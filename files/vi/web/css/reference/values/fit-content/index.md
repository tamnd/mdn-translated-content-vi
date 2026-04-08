---
title: fit-content
slug: Web/CSS/Reference/Values/fit-content
page-type: css-keyword
browser-compat: css.properties.width.fit-content
sidebar: cssref
---

Từ khóa kích thước `fit-content` đại diện cho kích thước phần tử thích ứng với nội dung của nó trong khi vẫn nằm trong giới hạn của container chứa nó.
Từ khóa đảm bảo rằng phần tử không bao giờ nhỏ hơn kích thước nội tại tối thiểu ({{cssxref("min-content")}}) hoặc lớn hơn kích thước nội tại tối đa ({{cssxref("max-content")}}).

> [!NOTE]
> Từ khóa này khác với hàm {{cssxref("fit-content()")}}. Hàm được dùng để xác định kích thước track của lưới (ví dụ trong {{cssxref("grid-template-columns")}} và {{cssxref("grid-auto-rows")}}) và để xác định kích thước hộp đã bố cục cho các thuộc tính như {{cssxref("width")}}, {{cssxref("height")}}, {{cssxref("min-width")}}, và {{cssxref("max-height")}}.

## Cú pháp

```css
/* Dùng trong các thuộc tính kích thước */
width: fit-content;
height: fit-content;
inline-size: fit-content;
block-size: fit-content;
```

## Mô tả

Từ khóa này được dùng với các thuộc tính kích thước như {{cssxref("width")}}, {{cssxref("height")}}, {{cssxref("block-size")}}, {{cssxref("inline-size")}}, {{cssxref("min-width")}}, và {{cssxref("max-width")}}. Khi dùng trên những thuộc tính này, kích thước tính toán tham chiếu đến [content box](/vi/docs/Web/CSS/Reference/Values/box-edge#content-box) của phần tử.

Khi `fit-content` được đặt, phần tử sẽ lớn lên hoặc co lại để vừa với nội dung của nó, nhưng ngừng mở rộng sau khi chiều liên quan đạt đến giới hạn kích thước của container chứa nó.

Kích thước `fit-content` được tính theo công thức sau:

```plain
min(max-content, max(min-content, stretch))
```

trong đó, [`stretch`](/vi/docs/Web/CSS/Reference/Properties/width#stretch) khớp với [margin box](/vi/docs/Web/CSS/Reference/Values/box-edge#margin-box) của phần tử theo chiều rộng của [containing block](/vi/docs/Web/CSS/Guides/Display/Containing_block#identifying_the_containing_block). Từ khóa này về cơ bản tương đương với `fit-content(stretch)`.

Bạn có thể bật hoạt ảnh đến và từ `fit-content` bằng thuộc tính {{cssxref("interpolate-size")}} và hàm {{cssxref("calc-size()")}}.

## Ví dụ

### Đặt kích thước hộp bằng fit-content

#### HTML

```html
<div class="container">
  <div class="item">Item</div>
  <div class="item">Item with more text in it.</div>
  <div class="item">
    Item with more text in it, hopefully we have added enough text so the text
    will start to wrap.
  </div>
</div>
```

#### CSS

```css
.container {
  border: 2px solid #cccccc;
  padding: 10px;
  width: 20em;
}

.item {
  width: fit-content;
  background-color: #8ca0ff;
  padding: 5px;
  margin-bottom: 1em;
}
```

#### Kết quả

{{EmbedLiveSample("Using_fit-content_for_box_sizing", "100%", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các từ khóa kích thước liên quan: {{cssxref("min-content")}}, {{cssxref("max-content")}}
- Module [CSS box sizing](/vi/docs/Web/CSS/Guides/Box_sizing)
