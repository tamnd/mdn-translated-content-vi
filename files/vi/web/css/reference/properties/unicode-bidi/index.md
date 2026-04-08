---
title: unicode-bidi
slug: Web/CSS/Reference/Properties/unicode-bidi
page-type: css-property
browser-compat: css.properties.unicode-bidi
sidebar: cssref
---

Thuộc tính **`unicode-bidi`** của [CSS](/vi/docs/Web/CSS), cùng với thuộc tính {{cssxref("direction")}}, xác định cách xử lý văn bản hai chiều trong tài liệu. Ví dụ: nếu một khối nội dung chứa cả văn bản từ trái sang phải và từ phải sang trái, tác nhân người dùng sử dụng thuật toán Unicode phức tạp để quyết định cách hiển thị văn bản. Thuộc tính `unicode-bidi` ghi đè thuật toán này và cho phép nhà phát triển kiểm soát việc nhúng văn bản.

{{InteractiveExample("CSS Demo: unicode-bidi")}}

```css interactive-example-choice
unicode-bidi: normal;
```

```css interactive-example-choice
unicode-bidi: bidi-override;
```

```css interactive-example-choice
unicode-bidi: plaintext;
```

```css interactive-example-choice
unicode-bidi: isolate-override;
```

```html interactive-example
<section class="default-example" id="default-example">
  <p class="transition-all" id="example-element">
    בְּרֵאשִׁ֖ית בָּרָ֣א אֱלֹהִ֑ים אֵ֥ת הַשָּׁמַ֖יִם וְאֵ֥ת הָאָֽרֶץ.
  </p>
</section>
```

Thuộc tính `unicode-bidi` và {{cssxref("direction")}} là những thuộc tính duy nhất không bị ảnh hưởng bởi viết tắt {{cssxref("all")}}.

> [!WARNING]
> Thuộc tính này được dành cho các nhà thiết kế Định nghĩa Loại Tài liệu (DTD). Các nhà thiết kế web và các tác giả tương tự **không nên** ghi đè nó.

## Cú pháp

```css
/* Giá trị từ khóa */
unicode-bidi: normal;
unicode-bidi: embed;
unicode-bidi: isolate;
unicode-bidi: bidi-override;
unicode-bidi: isolate-override;
unicode-bidi: plaintext;

/* Giá trị toàn cục */
unicode-bidi: inherit;
unicode-bidi: initial;
unicode-bidi: revert;
unicode-bidi: revert-layer;
unicode-bidi: unset;
```

### Giá trị

- `normal`
  - : Phần tử không cung cấp thêm mức nhúng nào đối với thuật toán hai chiều. Đối với các phần tử nội tuyến, việc sắp xếp lại ngầm định hoạt động qua ranh giới phần tử.
- `embed`
  - : Nếu phần tử là nội tuyến, giá trị này mở thêm một mức nhúng đối với thuật toán hai chiều. Hướng của mức nhúng này được cho bởi thuộc tính {{Cssxref("direction")}}.
- `bidi-override`
  - : Đối với các phần tử nội tuyến, điều này tạo ra một ghi đè. Đối với các phần tử container khối, điều này tạo ra một ghi đè cho các phần tử cấp nội tuyến không nằm trong phần tử container khối khác. Điều này có nghĩa là bên trong phần tử, việc sắp xếp lại hoàn toàn theo thứ tự dựa theo thuộc tính {{Cssxref("direction")}}; phần ngầm định của thuật toán hai chiều bị bỏ qua.
- `isolate`
  - : Từ khóa này chỉ ra rằng hướng của container phần tử nên được tính mà không xem xét nội dung của phần tử này. Phần tử vì thế được _cô lập_ khỏi các phần tử anh em của nó. Khi áp dụng thuật toán giải quyết hai chiều của nó, phần tử container coi phần tử này như một hoặc nhiều ký tự `U+FFFC Object Replacement Character`, tức là như một hình ảnh.
- `isolate-override`
  - : Từ khóa này áp dụng hành vi cô lập của từ khóa `isolate` cho nội dung xung quanh và hành vi ghi đè của từ khóa `bidi-override` cho nội dung bên trong.
- `plaintext`
  - : Từ khóa này làm cho hướng của các phần tử được tính mà không xem xét trạng thái hai chiều của cha nó hoặc giá trị của thuộc tính {{cssxref("direction")}}. Hướng được tính bằng các quy tắc P2 và P3 của Thuật toán Hai chiều Unicode.
    Giá trị này cho phép hiển thị dữ liệu đã được định dạng bằng công cụ tuân theo Thuật toán Hai chiều Unicode.

## Định nghĩa chính thức

{{CSSInfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### CSS

```css
.bible-quote {
  direction: rtl;
  unicode-bidi: embed;
}
```

### HTML

```html
<div class="bible-quote">Một dòng văn bản</div>
<div>Một dòng văn bản khác</div>
```

### Kết quả

{{EmbedLiveSample('Examples')}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("direction")}}
- Thuộc tính SVG {{SVGAttr("unicode-bidi")}}
- [Xử lý các hướng văn bản khác nhau](/vi/docs/Learn_web_development/Core/Styling_basics/Handling_different_text_directions)
