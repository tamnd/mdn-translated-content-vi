---
title: <display-outside>
slug: Web/CSS/Reference/Values/display-outside
page-type: css-type
browser-compat:
  - css.properties.display.block
  - css.properties.display.inline
sidebar: cssref
---

Các từ khóa `<display-outside>` xác định kiểu {{CSSxRef("display")}} bên ngoài của phần tử, về cơ bản là vai trò của nó trong bố cục luồng. Những từ khóa này được dùng làm giá trị của thuộc tính `display`, và có thể dùng cho mục đích kế thừa dưới dạng từ khóa đơn, hoặc như được định nghĩa trong đặc tả cấp 3 cùng với một giá trị từ các từ khóa {{CSSxRef("&lt;display-inside&gt;")}}.

## Cú pháp

Các giá trị `<display-outside>` hợp lệ:

- `block`
  - : Phần tử tạo ra một hộp phần tử khối, sinh ra các ngắt dòng cả trước và sau phần tử khi ở trong luồng bình thường.
- `inline`
  - : Phần tử tạo ra một hoặc nhiều hộp phần tử nội tuyến không tạo ra ngắt dòng trước hoặc sau chúng. Trong luồng bình thường, phần tử tiếp theo sẽ ở trên cùng dòng nếu còn chỗ.

> [!NOTE]
> Khi trình duyệt gặp thuộc tính `display` chỉ có giá trị **bên ngoài** (ví dụ: `display: block` hoặc `display: inline`), giá trị bên trong mặc định là `flow` (ví dụ: `display: block flow` và `display: inline flow`).
> Điều này tương thích ngược với cú pháp từ khóa đơn.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

Trong ví dụ sau, các phần tử span (thường hiển thị là phần tử nội tuyến) được đặt thành `display: block` và do đó xuống dòng mới và mở rộng để lấp đầy vùng chứa theo chiều nội tuyến.

### HTML

```html
<span>span 1</span> <span>span 2</span>
```

### CSS

```css
span {
  display: block;
  border: 1px solid rebeccapurple;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 300, 60)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("display")}}
  - {{CSSxRef("&lt;display-inside&gt;")}}
  - {{CSSxRef("&lt;display-listitem&gt;")}}
  - {{CSSxRef("&lt;display-internal&gt;")}}
  - {{CSSxRef("&lt;display-box&gt;")}}
  - {{CSSxRef("&lt;display-legacy&gt;")}}

- [Bố cục khối và nội tuyến trong luồng bình thường](/vi/docs/Web/CSS/Guides/Display/Block_and_inline_layout)
- [Giới thiệu về các ngữ cảnh định dạng](/vi/docs/Web/CSS/Guides/Display/Formatting_contexts)
