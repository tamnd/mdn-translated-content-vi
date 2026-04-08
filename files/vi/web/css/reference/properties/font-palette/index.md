---
title: font-palette
slug: Web/CSS/Reference/Properties/font-palette
page-type: css-property
browser-compat: css.properties.font-palette
sidebar: cssref
---

Thuộc tính **`font-palette`** [CSS](/en-US/docs/Web/CSS) cho phép chỉ định một trong nhiều bảng màu có trong [font màu](https://www.colorfonts.wtf/) mà trình duyệt có thể dùng cho font. Người dùng cũng có thể ghi đè các giá trị trong bảng màu hoặc tạo bảng màu mới bằng cách dùng quy tắc at {{cssxref("@font-palette-values")}}.

> [!NOTE]
> Bảng màu `font-palette` được ưu tiên khi tô màu font. Thuộc tính {{cssxref("color")}} sẽ không ghi đè bảng màu font, ngay cả khi được chỉ định với {{cssxref("important", "!important")}}.

## Cú pháp

```css
/* Dùng bảng màu được định nghĩa trong font */
font-palette: normal;

/* Dùng bảng màu do người dùng định nghĩa */
font-palette: --one;

/* Tạo bảng màu mới bằng cách pha trộn hai bảng màu khác */
font-palette: palette-mix(in lch, --blue, --yellow);
```

### Các giá trị

- `normal`
  - : Chỉ định bảng màu mặc định hoặc tô màu glyph mặc định (được đặt bởi nhà tạo font) để dùng cho font. Với cài đặt này, bảng màu trong font ở chỉ số 0 được hiển thị.
- `light`
  - : Chỉ định bảng màu đầu tiên trong font khớp với 'light' để dùng cho font. Một số font chứa siêu dữ liệu xác định bảng màu áp dụng cho nền sáng (gần màu trắng). Nếu font không có siêu dữ liệu này, giá trị `light` hoạt động như `normal`.
- `dark`
  - : Chỉ định bảng màu đầu tiên trong font khớp với 'dark' để dùng cho font. Một số font chứa siêu dữ liệu xác định bảng màu áp dụng cho nền tối (gần màu đen). Nếu font không có siêu dữ liệu này, giá trị hoạt động như `normal`.
- `<palette-identifier>`
  - : Cho phép bạn chỉ định các giá trị riêng cho bảng màu font bằng cách dùng quy tắc at [@font-palette-values](/en-US/docs/Web/CSS/Reference/At-rules/@font-palette-values). Giá trị này được chỉ định bằng định dạng [&lt;dashed-ident&gt;](/en-US/docs/Web/CSS/Reference/Values/dashed-ident).
- {{cssxref("font-palette/palette-mix", "palette-mix()")}}
  - : Tạo giá trị `font-palette` mới bằng cách pha trộn hai giá trị `font-palette` theo tỷ lệ phần trăm và phương pháp nội suy màu được chỉ định.

## Định nghĩa hình thức

{{CSSInfo}}

## Cú pháp hình thức

{{CSSSyntax}}

## Ví dụ

### Chỉ định bảng màu tối

Ví dụ này cho phép dùng bảng màu đầu tiên được đánh dấu là _dark_ (hoạt động tốt nhất trên nền gần đen) bởi nhà tạo font.

```css
@media (prefers-color-scheme: dark) {
  .banner {
    font-palette: dark;
  }
}
```

### Hoạt ảnh giữa hai bảng màu

Ví dụ này minh họa cách tạo hoạt ảnh thay đổi giá trị `font-palette` để tạo hoạt ảnh font mượt mà.

#### HTML

HTML chứa một đoạn văn bản duy nhất để tạo hoạt ảnh:

```html
<p>color-palette<br />animation</p>
```

#### CSS

Trong CSS, chúng ta nhập một [font màu](https://www.colorfonts.wtf/) có tên [Nabla](https://nabla.typearture.com/) từ [Google Fonts](https://fonts.google.com/?coloronly=true), và định nghĩa hai giá trị `font-palette` tùy chỉnh bằng quy tắc at {{cssxref("@font-palette-values")}}. Sau đó chúng ta tạo {{cssxref("@keyframes")}} tạo hoạt ảnh giữa hai bảng màu này, và áp dụng hoạt ảnh này cho đoạn văn.

```css
@import "https://fonts.googleapis.com/css2?family=Nabla&display=swap";

@font-palette-values --blue-nabla {
  font-family: "Nabla";
  base-palette: 2; /* đây là bảng màu xanh của Nabla */
}

@font-palette-values --grey-nabla {
  font-family: "Nabla";
  base-palette: 3; /* đây là bảng màu xám của Nabla */
}

@keyframes animate-palette {
  from {
    font-palette: --grey-nabla;
  }

  to {
    font-palette: --blue-nabla;
  }
}

p {
  font-family: "Nabla", fantasy;
  font-size: 5rem;
  margin: 0;
  text-align: center;
  animation: animate-palette 4s infinite alternate linear;
}
```

#### Kết quả

Kết quả trông như thế này:

{{EmbedLiveSample("Animating between two palettes", "100%", 300)}}

> [!NOTE]
> Các trình duyệt vẫn triển khai hoạt ảnh `font-palette` kiểu `discrete` sẽ chuyển đổi đột ngột giữa hai bảng màu thay vì tạo hoạt ảnh mượt mà.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("font-palette/palette-mix","palette-mix()")}}
- {{cssxref("@font-palette-values", "@font-palette-values")}}
- Bộ mô tả {{cssxref("@font-palette-values/base-palette", "base-palette")}}
- Bộ mô tả {{cssxref("@font-palette-values/font-family", "font-family")}}
- Bộ mô tả {{cssxref("@font-palette-values/override-colors", "override-colors")}}
