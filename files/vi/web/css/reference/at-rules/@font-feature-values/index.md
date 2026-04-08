---
title: "@font-feature-values"
slug: Web/CSS/Reference/At-rules/@font-feature-values
page-type: css-at-rule
browser-compat: css.at-rules.font-feature-values
sidebar: cssref
---

At-rule [CSS](/en-US/docs/Web/CSS) [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) **`@font-feature-values`** cho phép bạn sử dụng một tên chung trong thuộc tính {{cssxref("font-variant-alternates")}} cho các tính năng được kích hoạt theo cách khác nhau trong OpenType. Điều này có thể giúp đơn giản hóa CSS khi sử dụng nhiều font.

At-rule `@font-feature-values` có thể được dùng ở cấp cao nhất của CSS hoặc bên trong bất kỳ at-rule nhóm điều kiện CSS nào.

## Cú pháp

```css
@font-feature-values Font Name {
  font-display: swap;
  @styleset {
    nice-style: 12;
  }
  @swash {
    fancy: 2;
  }
}
```

Mỗi khối `@font-feature-values` có thể chứa danh sách các khối giá trị tính năng (liệt kê bên dưới), cũng như descriptor {{cssxref("@font-feature-values/font-display", "font-display")}}.

### Các khối giá trị tính năng

- `@swash`
  - : Chỉ định tên tính năng sẽ hoạt động với ký hiệu hàm {{cssxref("font-variant-alternates", "swash()", "#swash")}} của {{cssxref("font-variant-alternates")}}. Định nghĩa giá trị tính năng swash chỉ cho phép một giá trị: `ident1: 2` hợp lệ, nhưng `ident2: 2 4` thì không.
- `@annotation`
  - : Chỉ định tên tính năng sẽ hoạt động với ký hiệu hàm {{cssxref("font-variant-alternates", "annotation()", "#annotation")}} của {{cssxref("font-variant-alternates")}}. Định nghĩa giá trị tính năng annotation chỉ cho phép một giá trị: `ident1: 2` hợp lệ, nhưng `ident2: 2 4` thì không.
- `@ornaments`
  - : Chỉ định tên tính năng sẽ hoạt động với ký hiệu hàm {{cssxref("font-variant-alternates", "ornaments()", "#ornaments")}} của {{cssxref("font-variant-alternates")}}. Định nghĩa giá trị tính năng ornaments chỉ cho phép một giá trị: `ident1: 2` hợp lệ, nhưng `ident2: 2 4` thì không.
- `@stylistic`
  - : Chỉ định tên tính năng sẽ hoạt động với ký hiệu hàm {{cssxref("font-variant-alternates", "stylistic()", "#stylistic")}} của {{cssxref("font-variant-alternates")}}. Định nghĩa giá trị tính năng stylistic chỉ cho phép một giá trị: `ident1: 2` hợp lệ, nhưng `ident2: 2 4` thì không.
- `@styleset`
  - : Chỉ định tên tính năng sẽ hoạt động với ký hiệu hàm {{cssxref("font-variant-alternates", "styleset()", "#styleset")}} của {{cssxref("font-variant-alternates")}}. Định nghĩa giá trị tính năng styleset cho phép số lượng giá trị không giới hạn: `ident1: 2 4 12 1` ánh xạ tới các giá trị OpenType `ss02`, `ss04`, `ss12` và `ss01`. Lưu ý rằng các giá trị lớn hơn `99` hợp lệ nhưng không ánh xạ tới bất kỳ giá trị OpenType nào và bị bỏ qua.
- `@character-variant`
  - : Chỉ định tên tính năng sẽ hoạt động với ký hiệu hàm {{cssxref("font-variant-alternates", "character-variant()", "#character-variant")}} của {{cssxref("font-variant-alternates")}}. Định nghĩa giá trị tính năng character-variant cho phép một hoặc hai giá trị: `ident1: 3` ánh xạ tới `cv03=1`, và `ident2: 2 4` ánh xạ tới `cv02=4`, nhưng `ident2: 2 4 5` không hợp lệ.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Sử dụng @styleset trong một quy tắc @font-feature-values

```css
/* At-rule cho "nice-style" trong Font One */
@font-feature-values Font One {
  @styleset {
    nice-style: 12;
  }
}

/* At-rule cho "nice-style" trong Font Two */
@font-feature-values Font Two {
  @styleset {
    nice-style: 4;
  }
}

/* Áp dụng các at-rule với một khai báo duy nhất */
.nice-look {
  font-variant-alternates: styleset(nice-style);
}
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{cssxref("font-variant-alternates")}} sử dụng các giá trị mà at-rule này định nghĩa.
