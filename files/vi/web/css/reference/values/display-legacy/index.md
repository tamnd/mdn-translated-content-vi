---
title: <display-legacy>
slug: Web/CSS/Reference/Values/display-legacy
page-type: css-type
browser-compat:
  - css.properties.display.inline-block
  - css.properties.display.inline-table
  - css.properties.display.inline-flex
  - css.properties.display.inline-grid
spec-urls: https://drafts.csswg.org/css-display/#typedef-display-legacy
sidebar: cssref
---

CSS 2 sử dụng cú pháp từ khóa đơn cho thuộc tính `display`, yêu cầu các từ khóa riêng biệt cho các biến thể cấp khối và cấp nội tuyến của cùng một chế độ bố cục. Trang này trình bày chi tiết những giá trị đó.

## Cú pháp

Các giá trị `<display-legacy>` hợp lệ:

- `inline-block`
  - : Phần tử tạo ra một hộp phần tử khối sẽ được bố trí cùng với nội dung xung quanh như thể nó là một hộp nội tuyến đơn (hoạt động tương tự như một phần tử thay thế).

    Tương đương với `inline flow-root`.

- `inline-table`
  - : Giá trị `inline-table` không có ánh xạ trực tiếp trong HTML. Nó hoạt động như một phần tử HTML {{HTMLElement("table")}}, nhưng là một hộp nội tuyến, thay vì một hộp cấp khối. Bên trong hộp bảng là một ngữ cảnh cấp khối.

    Tương đương với `inline table`.

- `inline-flex`
  - : Phần tử hoạt động như một phần tử nội tuyến và bố cục nội dung của nó theo mô hình flexbox.

    Tương đương với `inline flex`.

- `inline-grid`
  - : Phần tử hoạt động như một phần tử nội tuyến và bố cục nội dung của nó theo mô hình grid.

    Tương đương với `inline grid`.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

Trong ví dụ dưới đây, chúng ta đang tạo một flex container nội tuyến với từ khóa kế thừa inline-flex.

### HTML

```html
<div class="container">
  <div>Flex Item</div>
  <div>Flex Item</div>
</div>

Not a flex item
```

### CSS

```css
.container {
  display: inline-flex;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 300, 150)}}

Trong cú pháp mới, flex container nội tuyến sẽ được tạo bằng hai giá trị, `inline` cho kiểu hiển thị bên ngoài và `flex` cho kiểu hiển thị bên trong.

```css
.container {
  display: inline flex;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("display")}}
  - {{CSSxRef("&lt;display-outside&gt;")}}
  - {{CSSxRef("&lt;display-inside&gt;")}}
  - {{CSSxRef("&lt;display-listitem&gt;")}}
  - {{CSSxRef("&lt;display-internal&gt;")}}
  - {{CSSxRef("&lt;display-box&gt;")}}
