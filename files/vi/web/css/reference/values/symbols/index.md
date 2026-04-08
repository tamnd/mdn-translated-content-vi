---
title: symbols()
slug: Web/CSS/Reference/Values/symbols
page-type: css-function
browser-compat: css.properties.list-style-type.symbols
sidebar: cssref
---

Hàm **`symbols()`** trong [CSS](/vi/docs/Web/CSS) cho phép định nghĩa kiểu bộ đếm nội tuyến trực tiếp như một giá trị của các thuộc tính chẳng hạn như {{cssxref("list-style")}}, cung cấp một giải pháp thay thế đơn giản hơn nhưng ít mạnh mẽ hơn so với phương pháp {{cssxref("@counter-style")}} khi định nghĩa kiểu bộ đếm.

Không giống như {{cssxref("@counter-style")}}, định nghĩa kiểu bộ đếm có thể tái sử dụng, `symbols()` là _ẩn danh_ (tức là chỉ có thể dùng một lần). Hàm này chấp nhận chuỗi và hình ảnh làm giá trị. Trong khi đó, bộ mô tả [`symbols`](/vi/docs/Web/CSS/Reference/At-rules/@counter-style/symbols) của {{cssxref("@counter-style")}} cũng chấp nhận các định danh.

## Cú pháp

```css
symbols() = symbols( <symbols-type>? [ <string> | <image> ]+ );
```

`<symbols-type>` có thể là một trong các giá trị sau:

- `cyclic`: Hệ thống lặp qua các giá trị đã cho theo thứ tự định nghĩa, và quay lại đầu khi đến cuối.
- `numeric`: Hệ thống diễn giải các giá trị đã cho như các đơn vị liên tiếp của hệ thống đánh số theo vị trí.
- `alphabetic`: Hệ thống diễn giải các giá trị đã cho như các chữ số của hệ thống đánh số chữ cái, giống hệ thống đánh số theo vị trí nhưng không có `0`.
- `symbolic`: Hệ thống lặp qua các giá trị, in thêm chúng mỗi vòng (một lần cho vòng đầu tiên, hai lần cho vòng thứ hai, v.v.).
- `fixed`: Hệ thống lặp qua các giá trị đã cho một lần, sau đó quay về số Ả Rập.

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### HTML

```html
<ol>
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>Four</li>
  <li>Five</li>
</ol>
```

### CSS

```css
ol {
  list-style: symbols(cyclic "*" "†" "‡");
}
```

### Kết quả

{{EmbedLiveSample('Examples','100%',200)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Bộ mô tả {{cssxref("@counter-style")}}: {{cssxref("@counter-style/system","system")}}, {{cssxref("@counter-style/symbols", "symbols")}}, {{cssxref("@counter-style/additive-symbols", "additive-symbols")}}, {{cssxref("@counter-style/prefix", "prefix")}}, {{cssxref("@counter-style/suffix", "suffix")}}, {{cssxref("@counter-style/range", "range")}}, {{cssxref("@counter-style/pad", "pad")}}, {{cssxref("@counter-style/speak-as", "speak-as")}}, {{cssxref("@counter-style/fallback", "fallback")}}
- Thuộc tính kiểu danh sách: {{cssxref("list-style")}}, {{cssxref("list-style-type")}}
- Mô-đun [CSS counter styles](/vi/docs/Web/CSS/Guides/Counter_styles)
- Mô-đun [CSS lists and counters](/vi/docs/Web/CSS/Guides/Lists)
