---
title: <display-listitem>
slug: Web/CSS/Reference/Values/display-listitem
page-type: css-type
browser-compat: css.properties.display.list-item
sidebar: cssref
---

Từ khóa `list-item` khiến phần tử tạo ra một phần tử giả `::marker` với nội dung được xác định bởi các thuộc tính {{CSSxRef("list-style")}} của nó (ví dụ như dấu chấm đầu dòng), cùng với một hộp chính của kiểu được chỉ định cho nội dung của chính nó.

## Cú pháp

Một giá trị đơn `list-item` sẽ khiến phần tử hoạt động như một mục danh sách. Có thể dùng kết hợp với {{CSSxRef("list-style-type")}} và {{CSSxRef("list-style-position")}}.

`list-item` cũng có thể kết hợp với bất kỳ từ khóa {{CSSxRef("&lt;display-outside&gt;")}} nào và các từ khóa `flow` hoặc `flow-root` thuộc {{CSSxRef("&lt;display-inside&gt;")}}.

> [!NOTE]
> Trong các trình duyệt hỗ trợ cú pháp hai giá trị, nếu không có giá trị bên trong nào được chỉ định, giá trị mặc định sẽ là `flow`. Nếu không có giá trị bên ngoài nào được chỉ định, hộp chính sẽ có kiểu hiển thị bên ngoài là `block`.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### HTML

```html
<div class="fake-list">I will display as a list item</div>
```

### CSS

```css
.fake-list {
  display: list-item;
  list-style-position: inside;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 150)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("display")}}
  - {{CSSxRef("&lt;display-outside&gt;")}}
  - {{CSSxRef("&lt;display-inside&gt;")}}
  - {{CSSxRef("&lt;display-internal&gt;")}}
  - {{CSSxRef("&lt;display-box&gt;")}}
  - {{CSSxRef("&lt;display-legacy&gt;")}}
