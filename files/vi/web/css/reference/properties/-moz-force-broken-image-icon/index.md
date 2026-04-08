---
title: -moz-force-broken-image-icon
slug: Web/CSS/Reference/Properties/-moz-force-broken-image-icon
page-type: css-property
status:
  - deprecated
  - non-standard
browser-compat: css.properties.-moz-force-broken-image-icon
sidebar: cssref
---

{{Non-standard_header}}{{Deprecated_Header}}

Thuộc tính CSS mở rộng **`-moz-force-broken-image-icon`** có thể được dùng để buộc biểu tượng ảnh bị hỏng hiển thị ngay cả khi ảnh bị hỏng có thuộc tính `alt`.

## Cú pháp

```css
-moz-force-broken-image-icon: 1;
-moz-force-broken-image-icon: 0;

/* Global values */
-moz-force-broken-image-icon: inherit;
-moz-force-broken-image-icon: initial;
-moz-force-broken-image-icon: revert;
-moz-force-broken-image-icon: revert-layer;
-moz-force-broken-image-icon: unset;
```

### Giá trị

- {{cssxref("&lt;integer&gt;")}}
  - : Giá trị `1` nghĩa là biểu tượng ảnh bị hỏng được hiển thị ngay cả khi ảnh có thuộc tính [`alt`](/en-US/docs/Web/HTML/Reference/Elements/img#alt). Khi dùng giá trị `0`, ảnh sẽ hoạt động bình thường và chỉ hiển thị thuộc tính `alt`.

> [!NOTE]
> Ngay cả khi giá trị được đặt thành `1`, thuộc tính `alt` vẫn sẽ được hiển thị, cùng với biểu tượng ảnh bị hỏng.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{CSSSyntaxRaw(`-moz-force-broken-image-icon = <integer>`)}}

## Ví dụ

### HTML

```html
<img src="/broken/image/link.png" alt="Broken image link" />
```

### CSS

```css
img {
  -moz-force-broken-image-icon: 1;
  height: 100px;
  width: 100px;
}
```

### Kết quả

{{EmbedLiveSample('Examples','125','125')}}

> [!NOTE]
> Văn bản alt có thể không hiển thị nếu `-moz-force-broken-image-icon` được đặt thành `1` và ảnh không có (hoặc có quá nhỏ) `height` hay `width`.

## Ghi chú

- Thuộc tính này chỉ hoạt động trên các trình duyệt dựa trên Gecko.
- Không khuyến nghị sử dụng thuộc tính này. Thay vào đó nên dùng thuộc tính `alt` phù hợp.

## Thông số kỹ thuật

Không thuộc về bất kỳ tiêu chuẩn nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Firefox bug 58646](https://bugzil.la/58646)
