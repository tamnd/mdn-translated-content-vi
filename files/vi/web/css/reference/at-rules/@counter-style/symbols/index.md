---
title: symbols
slug: Web/CSS/Reference/At-rules/@counter-style/symbols
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.counter-style.symbols
sidebar: cssref
---

Descriptor **`symbols`** [CSS](/en-US/docs/Web/CSS) của at-rule {{cssxref("@counter-style")}} được dùng để chỉ định các ký hiệu tạo biểu diễn bộ đếm trong hệ thống bộ đếm được chỉ định. Việc chỉ định descriptor này là bắt buộc khi giá trị của descriptor {{cssxref('@counter-style/system', 'system')}} là `cyclic`, `numeric`, `alphabetic`, `symbolic` hoặc `fixed`.

## Cú pháp

```css
symbols: A B C D E;
symbols: "\24B6" "\24B7" "\24B8" D E;
symbols: "0" "1" "2" "4" "5" "6" "7" "8" "9";
symbols: url("one.svg") url("two.svg") url("three.svg");
symbols: indic-numbers;
```

### Giá trị

Descriptor `symbols` được chỉ định dưới dạng danh sách một hoặc nhiều giá trị `<symbol>` được phân tách bằng khoảng trắng.

- `<symbol>`
  - : Chỉ định ký hiệu sử dụng trong hệ thống bộ đếm. Mỗi ký hiệu trong danh sách có thể là {{cssxref("&lt;string&gt;")}}, {{cssxref("image")}}, hoặc {{cssxref("&lt;custom-ident&gt;")}}. Giá trị `<image>` có thể được chỉ định là {{cssxref("url_value", "&lt;url&gt;")}} hoặc {{cssxref("gradient")}}.

> [!NOTE]
> Khi sử dụng {{glossary("identifier")}} cho một ký hiệu, lưu ý rằng các ký tự không phải chữ cái {{glossary("ASCII")}} như `*`, `"` và `\` không được xem là định danh. Chúng phải được đặt trong dấu ngoặc kép như một chuỗi hoặc được escape.

## Mô tả

Một ký hiệu có thể là chuỗi, ảnh hoặc định danh. Nó được dùng trong [at-rule](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) {{cssxref("@counter-style")}}.

Khi giá trị của descriptor {{cssxref('@counter-style/system', 'system')}} là `cyclic`, `numeric`, `alphabetic`, `symbolic` hoặc `fixed`, descriptor `symbols` phải được chỉ định. Đối với hệ thống `additive`, hãy dùng descriptor {{cssxref('@counter-style/additive-symbols', 'additive-symbols')}} thay thế để chỉ định các ký hiệu.

Mặc dù khoảng trắng giữa các ký hiệu được đặt trong dấu ngoặc kép là không bắt buộc, nhưng nó làm cho CSS dễ đọc hơn. Để dùng dấu ngoặc kép làm ký hiệu, hãy escape ký tự dấu ngoặc kép hoặc đặt ký tự trong các dấu ngoặc kép khác, chẳng hạn như `"'"`.

Khi định nghĩa các ký hiệu bằng định danh thay vì chuỗi, hãy đảm bảo sử dụng các quy tắc cú pháp định danh. Ví dụ: như đã lưu ý ở trên, các ký tự không phải chữ cái ASCII như `*` không phải là định danh và phải được đặt trong dấu ngoặc kép hoặc được escape. Các ký tự escape hex được theo sau bởi một khoảng trắng. Khoảng trắng này có thể trông giống như khoảng trắng phân tách hai định danh, nhưng nó cho phép các chữ số theo sau các ký tự được escape bằng hex. Điều này có nghĩa là phải bao gồm hai khoảng trắng sau một định danh được escape bằng hex để tách nó khỏi định danh tiếp theo. Ví dụ: tốt hơn là nên dùng chuỗi `"\2A 1"` thay vì `\2A  1` với hai khoảng trắng, vì các công cụ mã của bạn có thể xóa khoảng trắng kép. Nhìn chung, việc đặt trong dấu ngoặc kép các định danh cần được escape hoặc sử dụng chuỗi là an toàn hơn.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt ký hiệu bộ đếm

Trong ví dụ này, danh sách giá trị cho descriptor `symbols` bao gồm các chữ cái (`A`, `D`, `E`), một số trong dấu ngoặc kép (`"1"`), và một định danh escape hex trong dấu ngoặc kép (`"\24B7"`) cho ký tự `Ⓑ`.

#### HTML

```html
<ul class="list">
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
  <li>Five</li>
</ul>
```

#### CSS

```css
@counter-style symbols-example {
  system: fixed;
  symbols: A "1" "\24B7" D E;
}

.list {
  list-style: symbols-example;
}
```

#### Kết quả

{{EmbedLiveSample('Setting_counter_symbols')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các descriptor của {{cssxref("@counter-style")}}: {{cssxref("@counter-style/system","system")}}, {{cssxref("@counter-style/additive-symbols", "additive-symbols")}}, {{cssxref("@counter-style/negative", "negative")}}, {{cssxref("@counter-style/prefix", "prefix")}}, {{cssxref("@counter-style/suffix", "suffix")}}, {{cssxref("@counter-style/range", "range")}}, {{cssxref("@counter-style/pad", "pad")}}, {{cssxref("@counter-style/speak-as", "speak-as")}}, {{cssxref("@counter-style/fallback", "fallback")}}
- Các thuộc tính kiểu danh sách: {{cssxref("list-style")}}, {{cssxref("list-style-image")}}, {{cssxref("list-style-position")}}
- Hàm {{cssxref("symbols()")}}
- Kiểu {{cssxref("url_value", "&lt;url&gt;")}}
- Module [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
