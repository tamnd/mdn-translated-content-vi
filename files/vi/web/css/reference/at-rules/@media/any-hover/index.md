---
title: any-hover
slug: Web/CSS/Reference/At-rules/@media/any-hover
page-type: css-media-feature
browser-compat: css.at-rules.media.any-hover
sidebar: cssref
---

Tính năng media [CSS](/en-US/docs/Web/CSS) **`any-hover`** có thể được dùng để kiểm tra xem _bất kỳ_ cơ chế nhập liệu nào có sẵn có thể di chuột (hover) lên các phần tử hay không.

## Cú pháp

Tính năng `any-hover` được chỉ định dưới dạng giá trị từ khóa được chọn từ danh sách dưới đây.

- `none`
  - : Không có cơ chế nhập liệu nào có sẵn có thể hover một cách thuận tiện, hoặc không có cơ chế nhập liệu trỏ nào.
- `hover`
  - : Một hoặc nhiều cơ chế nhập liệu có sẵn có thể hover lên các phần tử một cách thuận tiện.

## Ví dụ

### Kiểm tra xem các phương thức nhập liệu có thể hover

#### HTML

```html
<a href="#">Hãy thử di chuột lên tôi!</a>
```

#### CSS

```css
@media (any-hover: hover) {
  a:hover {
    background: yellow;
  }
}
```

#### Kết quả

{{EmbedLiveSample("Testing_whether_input_methods_can_hover")}}

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [tính năng media `hover`](/en-US/docs/Web/CSS/Reference/At-rules/@media/hover)
