---
title: box-orient
slug: Web/CSS/Reference/Properties/box-orient
page-type: css-property
status:
  - deprecated
  - non-standard
browser-compat: css.properties.box-orient
sidebar: cssref
---

{{Non-standard_header}}{{Deprecated_Header}}

> [!WARNING]
> Đây là thuộc tính thuộc bản thảo đặc tả gốc của CSS Flexible Box Layout Module, và đã được thay thế bởi một tiêu chuẩn mới hơn. Xem [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout/Basic_concepts) để biết thông tin về tiêu chuẩn hiện hành.

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`box-orient`** đặt liệu một phần tử bố trí nội dung của nó theo chiều ngang hay chiều dọc.

## Cú pháp

```css
/* Keyword values */
box-orient: horizontal;
box-orient: vertical;
box-orient: inline-axis;
box-orient: block-axis;

/* Global values */
box-orient: inherit;
box-orient: initial;
box-orient: unset;
```

Thuộc tính `box-orient` được chỉ định là một trong các giá trị từ khóa được liệt kê bên dưới.

### Giá trị

- `horizontal`
  - : Hộp bố trí nội dung của nó theo chiều ngang.
- `vertical`
  - : Hộp bố trí nội dung của nó theo chiều dọc.
- `inline-axis` (HTML)
  - : Hộp hiển thị các phần tử con của nó dọc theo trục nội tuyến.
- `block-axis` (HTML)
  - : Hộp hiển thị các phần tử con của nó dọc theo trục khối.

Các trục nội tuyến và khối là các từ khóa phụ thuộc vào chế độ viết, trong tiếng Anh tương ứng với `horizontal` và `vertical`.

## Mô tả

Các phần tử HTML DOM mặc định bố trí nội dung của chúng dọc theo trục nội tuyến. Thuộc tính CSS này chỉ áp dụng cho các phần tử HTML có giá trị {{CSSxRef("display")}} CSS là `box` hoặc `inline-box`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{CSSSyntaxRaw(`box-orient = horizontal | vertical | inline-axis | block-axis`)}}

## Ví dụ

### Đặt hướng hộp ngang

Ở đây, thuộc tính `box-orient` sẽ khiến hai phần `{{HTMLElement("p")}}` trong ví dụ hiển thị trên cùng một dòng.

#### HTML

```html
<div class="example">
  <p>I will be to the left of my sibling.</p>
  <p>I will be to the right of my sibling.</p>
</div>
```

#### CSS

```css
div.example {
  display: -moz-box; /* Mozilla */
  display: -webkit-box; /* WebKit */
  display: box; /* As specified */

  /* Children should be oriented vertically */
  -moz-box-orient: horizontal; /* Mozilla */
  -webkit-box-orient: horizontal; /* WebKit */
  box-orient: horizontal; /* As specified */
}
```

#### Kết quả

{{ EmbedLiveSample('Setting horizontal box orientation', '', 100) }}

## Đặc tả

Không thuộc bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{CSSxRef("box-direction")}}
- {{CSSxRef("box-pack")}}
- {{CSSxRef("box-align")}}
- {{CSSxRef("flex-direction")}}
