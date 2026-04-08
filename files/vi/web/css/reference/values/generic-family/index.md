---
title: <generic-family>
slug: Web/CSS/Reference/Values/generic-family
page-type: css-type
spec-urls: https://drafts.csswg.org/css-fonts/#generic-font-families
sidebar: cssref
---

Kiểu dữ liệu **`<generic-family>`** trong [CSS](/vi/docs/Web/CSS) đại diện cho các giá trị từ khóa cho các họ phông chữ chung được dùng trong thuộc tính viết tắt {{cssxref("font")}} và thuộc tính đầy đủ {{cssxref("font-family")}}. `<generic-family>` đại diện cho một hoặc nhiều phông chữ được cài đặt cục bộ thuộc danh mục phông chữ đó.

## Cú pháp

### Giá trị

Kiểu {{glossary("enumerated")}} `<generic-family>` được chỉ định bằng một trong các giá trị liệt kê bên dưới:

- `serif`
  - : Serif là một nét nhỏ hoặc nét gạch gắn vào cuối nét lớn hơn của một chữ cái. Trong phông chữ serif, các ký tự có nét hoàn thiện, đầu nét xòe ra hoặc thu nhỏ dần. Ví dụ bao gồm Lucida Bright, Lucida Fax, Palatino, Palatino Linotype, Palladio, và URW Palladio.

- `sans-serif`
  - : Phông chữ không có serif; các ký tự có đầu nét đơn giản, không trang trí. Ví dụ phông chữ sans-serif bao gồm Open Sans, Fira Sans, Lucida Sans, Lucida Sans Unicode, Trebuchet MS, Liberation Sans, và Nimbus Sans L.

- `monospace`
  - : Tất cả các ký tự có cùng chiều rộng cố định. Ví dụ phông chữ monospace bao gồm Fira Mono, DejaVu Sans Mono, Menlo, Consolas, Liberation Mono, Monaco, và Lucida Console.

- `cursive`
  - : Các ký tự trong phông chữ cursive thường sử dụng kiểu viết tay chữ nghiêng hoặc kiểu viết tay khác, và kết quả trông giống như chữ viết tay bằng bút mực hoặc bút vẽ hơn là chữ in. CSS dùng thuật ngữ "cursive" để áp dụng cho phông chữ cho bất kỳ chữ viết nào, kể cả những chữ không có nét nối. Ví dụ phông chữ cursive bao gồm Brush Script MT, Brush Script Std, Lucida Calligraphy, Lucida Handwriting, và Apple Chancery.

- `fantasy`
  - : Phông chữ fantasy chủ yếu là phông chữ trang trí chứa các biểu diễn vui tươi của các ký tự. Ví dụ phông chữ fantasy bao gồm Papyrus, Herculanum, Party LET, Curlz MT, Harrington, và Comic Sans MS.

- `system-ui`
  - : Các ký tự được lấy từ phông chữ giao diện người dùng mặc định trên nền tảng đã cho. Vì các truyền thống sắp chữ rất khác nhau trên thế giới, họ phông chữ chung này được cung cấp cho các kiểu chữ không ánh xạ rõ ràng vào các họ khác.
    > [!NOTE]
    > Như tên ngụ ý, `system-ui` được thiết kế để làm cho các phần tử UI trông giống như ứng dụng gốc, không dùng cho việc sắp chữ các đoạn văn bản dài. Nó có thể khiến kiểu chữ hiển thị không mong muốn với một số người dùng — ví dụ, phông chữ CJK mặc định của Windows có thể hiển thị kém các ký tự Latin, và thuộc tính `lang` có thể không ảnh hưởng đến phông chữ hiển thị. Một số hệ điều hành không cho phép tùy chỉnh `system-ui`, trong khi các trình duyệt thường cho phép tùy chỉnh họ phông chữ `sans-serif`. Đối với các đoạn văn bản dài, hãy dùng `sans-serif` hoặc họ phông chữ không phải UI khác thay thế.

- `ui-serif`
  - : Phông chữ serif giao diện người dùng mặc định. Xem định nghĩa `serif` ở trên.

- `ui-sans-serif`
  - : Phông chữ sans-serif giao diện người dùng mặc định. Xem định nghĩa `sans-serif` ở trên.

- `ui-monospace`
  - : Phông chữ monospace giao diện người dùng mặc định. Xem định nghĩa `monospace` ở trên.

- `ui-rounded`
  - : Phông chữ giao diện người dùng mặc định có các tính năng bo tròn.

- `math`
  - : Phông chữ để hiển thị các biểu thức toán học, ví dụ như chỉ số trên và chỉ số dưới, dấu ngoặc trải qua nhiều dòng, biểu thức lồng nhau, và các ký tự in đậm kép với ý nghĩa khác biệt.

- `fangsong`
  - : Một kiểu chữ Hán đặc biệt nằm giữa kiểu Song theo phong cách serif và kiểu Kai theo phong cách cursive. Kiểu này thường được dùng trong các văn bản chính phủ.

## Cú pháp chính thức

{{CSSSyntaxRaw(`<generic-family> = serif | sans-serif | monospace | cursive | fantasy | system-ui | ui-serif | ui-sans-serif | ui-monospace | ui-rounded | math | fangsong`)}}

## Ví dụ

Ví dụ này trình diễn một số giá trị liệt kê `<generic-family>` cho thuộc tính {{cssxref("font-family")}}.

### HTML

```html
<ul>
  <li class="serif">serif</li>
  <li class="sans-serif">sans-serif</li>
  <li class="monospace">monospace</li>
  <li class="cursive">cursive</li>
  <li class="fantasy">fantasy</li>
  <li class="system-ui">system-ui</li>
</ul>
```

### CSS

```css
ul {
  font-size: 1.5rem;
  line-height: 2;
}
.serif {
  font-family: serif;
}
.sans-serif {
  font-family: sans-serif;
}
.monospace {
  font-family: monospace;
}
.cursive {
  font-family: cursive;
}
.fantasy {
  font-family: fantasy;
}
.system-ui {
  font-family: system-ui;
}
```

### Kết quả

{{EmbedLiveSample("Examples", "500", "355")}}

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Các thuộc tính dùng kiểu dữ liệu này: {{cssxref("font-family")}} và {{cssxref("font")}}
- [Module CSS fonts](/vi/docs/Web/CSS/Guides/Fonts)
