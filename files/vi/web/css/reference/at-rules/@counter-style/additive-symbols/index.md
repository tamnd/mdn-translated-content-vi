---
title: additive-symbols
slug: Web/CSS/Reference/At-rules/@counter-style/additive-symbols
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.counter-style.additive-symbols
sidebar: cssref
---

Mô tả **`additive-symbols`** của quy tắc at {{cssxref("@counter-style")}} được dùng để chỉ định các ký hiệu counter khi giá trị mô tả {{cssxref('@counter-style/system', 'system')}} của `@counter-style` được đặt thành `additive`. Hệ thống cộng được dùng để xây dựng các hệ thống [ký số theo giá trị dấu](https://en.wikipedia.org/wiki/Sign-value_notation) như chữ số La Mã.

## Cú pháp

```css
/* Bộ đôi đơn */
additive-symbols: 3 "*";

/* Danh sách bộ đôi phân tách bằng dấu phẩy */
additive-symbols:
  3 "0",
  2 "\2E\20",
  1 url("symbol.png");

/* Counter nhị phân */
additive-symbols:
  2 "1",
  1 "0";

/* Counter Etruscan (một nền văn minh ở Italy cổ đại) */
additive-symbols:
  100 "𐌟",
  50 "𐌣",
  10 "𐌢",
  5 "𐌡",
  1 "𐌠";
```

### Giá trị

Mô tả chấp nhận danh sách các _bộ đôi cộng_ phân tách bằng dấu phẩy, mỗi bộ đôi gồm hai giá trị sau đây cách nhau bằng khoảng trắng:

- {{cssxref("integer")}}
  - : Giá trị số nguyên không âm chỉ định trọng số số nguyên của giá trị ký hiệu liên quan của bộ đôi.

- [`<symbol>`](/en-US/docs/Web/CSS/Reference/At-rules/@counter-style/symbols#symbol)
  - : Chỉ định ký hiệu counter được dùng cho giá trị trọng số được định nghĩa bởi giá trị trọng số `<integer>` liên quan của bộ đôi.

> [!NOTE]
> Các bộ đôi cộng phải được chỉ định theo thứ tự trọng số giảm dần; nếu không, khai báo mô tả không hợp lệ và sẽ bị bỏ qua.

## Mô tả

Mô tả `additive-symbols` định nghĩa danh sách các _bộ đôi cộng_ phân tách bằng dấu phẩy. Mỗi _bộ đôi cộng_ chứa một số nguyên không âm phân tách bằng khoảng trắng và ký hiệu counter. Để hợp lệ, danh sách phải theo thứ tự giảm dần của số nguyên. Số nguyên và ký hiệu được nối lại để tạo thành ký hiệu counter.

Khi giá trị mô tả `system` là `cyclic`, `numeric`, `alphabetic`, `symbolic` hoặc `fixed`, dùng mô tả {{cssxref('symbols')}} thay vì `additive-symbols`.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Chỉ định ký hiệu cộng

#### HTML

Trong ví dụ này, {{cssxref("@counter-style/system","system: additive")}} cùng với các giá trị mô tả `additive-symbols` chỉ định cách biểu diễn số như chữ số La Mã. Giá trị của mỗi phần tử {{HTMLElement("li")}} trong danh sách được chuyển đổi thành chữ số La Mã theo các quy tắc định nghĩa trong {{cssxref("@counter-style")}}.

```html
<ul>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
  <li>Five</li>
  <li value="109">109</li>
  <li>110</li>
</ul>
```

#### CSS

```css
@counter-style uppercase-roman {
  system: additive;
  additive-symbols:
    1000 M,
    900 CM,
    500 D,
    400 CD,
    100 C,
    90 XC,
    50 L,
    40 XL,
    10 X,
    9 IX,
    5 V,
    4 IV,
    1 I;
}

ul {
  list-style: uppercase-roman;
  padding-left: 5em;
}
```

#### Kết quả

{{ EmbedLiveSample('Specifying_additive_symbols') }}

Đối với mục danh sách có giá trị `109`, chữ số `C` biểu thị `100` và `IX` biểu thị `9`. Điều này tạo ra counter `CIX` cho mục danh sách `109`. Mục danh sách tiếp theo tự động nhận giá trị `110`. Chữ số La Mã `CX` được dẫn xuất từ `C` là `100` và `X` là `10`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các mô tả {{cssxref("@counter-style")}}: {{cssxref("@counter-style/system","system")}}, {{cssxref("@counter-style/symbols", "symbols")}}, {{cssxref("@counter-style/negative", "negative")}}, {{cssxref("@counter-style/prefix", "prefix")}}, {{cssxref("@counter-style/suffix", "suffix")}}, {{cssxref("@counter-style/range", "range")}}, {{cssxref("@counter-style/pad", "pad")}}, {{cssxref("@counter-style/speak-as", "speak-as")}}, {{cssxref("@counter-style/fallback", "fallback")}}
- Thuộc tính kiểu danh sách: {{Cssxref("list-style")}}, {{Cssxref("list-style-image")}}, {{Cssxref("list-style-position")}}
- Hàm {{cssxref("symbols()")}} để tạo kiểu counter ẩn danh
- [Mô-đun kiểu counter CSS](/en-US/docs/Web/CSS/Guides/Counter_styles)
