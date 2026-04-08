---
title: column-fill
slug: Web/CSS/Reference/Properties/column-fill
page-type: css-property
browser-compat: css.properties.column-fill
sidebar: cssref
---

Thuộc tính **`column-fill`** [CSS](/en-US/docs/Web/CSS) kiểm soát cách nội dung của phần tử được cân bằng khi chia thành các cột.

{{InteractiveExample("CSS Demo: column-fill")}}

```css interactive-example-choice
column-fill: auto;
```

```css interactive-example-choice
column-fill: balance;
```

```html interactive-example
<section id="default-example">
  <p id="example-element">
    London. Michaelmas term lately over, and the Lord Chancellor sitting in
    Lincoln's Inn Hall. Implacable November weather.
  </p>
</section>
```

```css interactive-example
#example-element {
  width: 100%;
  height: 90%;
  columns: 3;
  text-align: left;
}
```

## Cú pháp

```css
/* Giá trị từ khóa */
column-fill: auto;
column-fill: balance;

/* Giá trị toàn cục */
column-fill: inherit;
column-fill: initial;
column-fill: revert;
column-fill: revert-layer;
column-fill: unset;
```

Thuộc tính `column-fill` được xác định bằng một trong các giá trị từ khóa liệt kê bên dưới. Giá trị ban đầu là `balance` để nội dung được cân bằng đều giữa các cột.

### Giá trị

- `auto`
  - : Các cột được lấp đầy tuần tự. Nội dung chỉ chiếm không gian cần thiết, có thể dẫn đến một số cột còn trống.
- `balance`
  - : Nội dung được chia đều giữa các cột. Trong các ngữ cảnh bị phân mảnh, chẳng hạn như [phương tiện phân trang](/en-US/docs/Web/CSS/Guides/Paged_media), chỉ đoạn cuối cùng được cân bằng. Do đó trong phương tiện phân trang, chỉ trang cuối cùng được cân bằng.

Đặc tả định nghĩa giá trị `balance-all`, trong đó nội dung được chia đều giữa các cột trong các ngữ cảnh bị phân mảnh, chẳng hạn như [phương tiện phân trang](/en-US/docs/Web/CSS/Guides/Paged_media). Giá trị này chưa được hỗ trợ trên bất kỳ trình duyệt nào.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cân bằng nội dung cột

#### HTML

```html
<p class="fill-auto">
  This paragraph fills columns one at a time. Since all of the text can fit in
  the first column, the others are empty.
</p>

<p class="fill-balance">
  This paragraph attempts to balance the amount of content in each column.
</p>
```

#### CSS

```css
p {
  height: 7em;
  background: #ffff99;
  columns: 3;
  column-rule: 1px solid;
}

p.fill-auto {
  column-fill: auto;
}

p.fill-balance {
  column-fill: balance;
}
```

#### Kết quả

{{EmbedLiveSample('Balancing_column_content', 'auto', 320)}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

> [!WARNING]
> Có một số vấn đề về khả năng tương tác và lỗi với `column-fill` trên các trình duyệt, do các vấn đề chưa được giải quyết trong đặc tả.
>
> Cụ thể, khi sử dụng `column-fill: auto` để lấp đầy các cột tuần tự, Chrome chỉ tham khảo thuộc tính này nếu vùng chứa multicol có kích thước theo chiều khối (ví dụ: chiều cao trong chế độ viết ngang). Firefox luôn tham khảo thuộc tính này, do đó lấp đầy cột đầu tiên với tất cả nội dung trong các trường hợp không có kích thước.

## Xem thêm

- [Tìm hiểu: Bố cục nhiều cột](/en-US/docs/Learn_web_development/Core/CSS_layout/Multiple-column_Layout)
- {{CSSXref("column-count")}}
- {{CSSXref("column-width")}}
