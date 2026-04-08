---
title: <display-internal>
slug: Web/CSS/Reference/Values/display-internal
page-type: css-type
browser-compat:
  - css.properties.display.table-row-group
  - css.properties.display.table-header-group
  - css.properties.display.table-footer-group
  - css.properties.display.table-row
  - css.properties.display.table-cell
  - css.properties.display.table-column-group
  - css.properties.display.table-column
  - css.properties.display.table-caption
  - css.properties.display.ruby-base
  - css.properties.display.ruby-text
  - css.properties.display.ruby-base-container
  - css.properties.display.ruby-text-container
sidebar: cssref
---

Một số mô hình bố cục như `table` và `ruby` có cấu trúc nội tại phức tạp, với nhiều vai trò khác nhau mà các phần tử con và hậu duệ có thể đảm nhiệm. Trang này định nghĩa những giá trị hiển thị "nội tại" đó, vốn chỉ có ý nghĩa trong chế độ bố cục cụ thể đó.

## Cú pháp

Các giá trị `<display-internal>` hợp lệ:

- `table-row-group`
  - : Các phần tử này hoạt động như phần tử HTML {{HTMLElement("tbody")}}.
- `table-header-group`
  - : Các phần tử này hoạt động như phần tử HTML {{HTMLElement("thead")}}.
- `table-footer-group`
  - : Các phần tử này hoạt động như phần tử HTML {{HTMLElement("tfoot")}}.
- `table-row`
  - : Các phần tử này hoạt động như phần tử HTML {{HTMLElement("tr")}}.
- `table-cell`
  - : Các phần tử này hoạt động như phần tử HTML {{HTMLElement("td")}}.
- `table-column-group`
  - : Các phần tử này hoạt động như phần tử HTML {{HTMLElement("colgroup")}}.
- `table-column`
  - : Các phần tử này hoạt động như phần tử HTML {{HTMLElement("col")}}.
- `table-caption`
  - : Các phần tử này hoạt động như phần tử HTML {{HTMLElement("caption")}}.
- `ruby-base`
  - : Các phần tử này hoạt động như phần tử HTML {{HTMLElement("rb")}}.
- `ruby-text`
  - : Các phần tử này hoạt động như phần tử HTML {{HTMLElement("rt")}}.
- `ruby-base-container`
  - : Các phần tử này được tạo ra dưới dạng hộp ẩn danh.
- `ruby-text-container`
  - : Các phần tử này hoạt động như phần tử HTML {{HTMLElement("rtc")}}.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ về bảng CSS

Ví dụ sau đây minh họa cách bố cục một biểu mẫu bằng bố cục bảng CSS.

#### HTML

```html
<main>
  <div>
    <label for="name">Name</label>
    <input type="text" id="name" name="name" />
  </div>
  <div>
    <label for="age">Age</label>
    <input type="text" id="age" name="age" />
  </div>
</main>
```

#### CSS

```css
main {
  display: table;
}

div {
  display: table-row;
}

label,
input {
  display: table-cell;
  margin: 5px;
}
```

#### Kết quả

{{EmbedLiveSample('CSS_tables_example', '100%', 100)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("display")}}
  - {{CSSxRef("&lt;display-outside&gt;")}}
  - {{CSSxRef("&lt;display-inside&gt;")}}
  - {{CSSxRef("&lt;display-listitem&gt;")}}
  - {{CSSxRef("&lt;display-box&gt;")}}
  - {{CSSxRef("&lt;display-legacy&gt;")}}
