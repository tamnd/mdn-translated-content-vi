---
title: prefix
slug: Web/CSS/Reference/At-rules/@counter-style/prefix
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.counter-style.prefix
sidebar: cssref
---

Descriptor **`prefix`** của quy tắc {{cssxref('@counter-style')}} chỉ định nội dung sẽ được thêm vào đầu biểu diễn marker của bộ đếm.

Khi giá trị bộ đếm là âm, `prefix` đứng trước dấu âm và bất kỳ `<symbol>` nào khác được thêm bởi descriptor {{cssxref("@counter-style/negative", "negative")}}.

## Cú pháp

```css
/* Giá trị <symbol>: chuỗi, ảnh, hoặc định danh */
prefix: "»";
prefix: "Page ";
prefix: url("bullet.png");
```

### Giá trị

Descriptor **`prefix`** nhận một `<symbol>` duy nhất làm giá trị:

- `<symbol>`
  - : Chỉ định một `<symbol>` — {{cssxref("&lt;string&gt;")}}, {{cssxref("image")}}, hoặc {{cssxref("&lt;custom-ident&gt;")}} — được thêm vào trước biểu diễn marker.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Thêm tiền tố vào bộ đếm

Trong ví dụ này, mỗi số bộ đếm được thêm tiền tố "Book " (với khoảng trắng) và theo sau là dấu hai chấm (`:`). Dấu hai chấm được thêm bằng descriptor {{cssxref("@counter-style/suffix", "suffix")}}.

#### HTML

```html
<ol class="books">
  <li>Flamer, by Mike Curato</li>
  <li>Gender Queer: A Memoir, by Maia Kobabe</li>
  <li>Tricks, by Ellen Hopkins</li>
  <li>The Handmaid's Tale: The Graphic Novel, by Margaret Atwood</li>
  <li>Crank, by Ellen Hopkins</li>
</ol>
```

#### CSS

```css
@counter-style books {
  system: numeric;
  symbols: "0" "1" "2" "3" "4" "5" "6" "7" "8" "9";
  prefix: "Book ";
  suffix: ": ";
}

.books {
  list-style: books;
  padding-left: 15ch;
}
```

#### Kết quả

{{ EmbedLiveSample('Adding_a_prefix_to_a_counter') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các descriptor khác của {{cssxref("@counter-style")}}: {{cssxref("@counter-style/system","system")}}, {{cssxref("@counter-style/symbols", "symbols")}}, {{cssxref("@counter-style/additive-symbols", "additive-symbols")}}, {{cssxref("@counter-style/negative", "negative")}}, {{cssxref("@counter-style/suffix", "suffix")}}, {{cssxref("@counter-style/range", "range")}}, {{cssxref("@counter-style/pad", "pad")}}, {{cssxref("@counter-style/speak-as", "speak-as")}}, và {{cssxref("@counter-style/fallback", "fallback")}}
- {{Cssxref("list-style")}}, {{Cssxref("list-style-image")}}, {{Cssxref("list-style-position")}}
- {{cssxref("symbols()")}}: ký hiệu hàm để tạo kiểu bộ đếm ẩn danh
- Module [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
- Module [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
