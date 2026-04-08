---
title: suffix
slug: Web/CSS/Reference/At-rules/@counter-style/suffix
page-type: css-at-rule-descriptor
browser-compat: css.at-rules.counter-style.suffix
sidebar: cssref
---

Descriptor **`suffix`** của quy tắc {{cssxref("@counter-style")}} chỉ định nội dung sẽ được thêm vào cuối biểu diễn marker.

## Cú pháp

```css
/* Giá trị <symbol>: chuỗi, ảnh, hoặc định danh  */
suffix: "";
suffix: ") ";
suffix: url("bullet.png");
```

### Giá trị

Descriptor **`suffix`** nhận một `<symbol>` duy nhất làm giá trị:

- `<symbol>`
  - : Chỉ định một `<symbol>` được thêm vào sau biểu diễn marker. Nó có thể là {{cssxref("&lt;string&gt;")}}, {{cssxref("image")}}, hoặc {{cssxref("&lt;custom-ident&gt;")}}.

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Đặt hậu tố cho bộ đếm

#### HTML

```html
<ul class="choices">
  <li>One</li>
  <li>Two</li>
  <li>Three</li>
  <li>None of the above</li>
</ul>
```

#### CSS

```css
@counter-style options {
  system: fixed;
  symbols: A B C D;
  suffix: ") ";
}

.choices {
  list-style: options;
}
```

#### Kết quả

{{ EmbedLiveSample('Setting_a_suffix_for_a_counter')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các descriptor khác của {{cssxref("@counter-style")}}: {{cssxref("@counter-style/system","system")}}, {{cssxref("@counter-style/symbols", "symbols")}}, {{cssxref("@counter-style/additive-symbols", "additive-symbols")}}, {{cssxref("@counter-style/negative", "negative")}}, {{cssxref("@counter-style/prefix", "prefix")}}, {{cssxref("@counter-style/range", "range")}}, {{cssxref("@counter-style/pad", "pad")}}, {{cssxref("@counter-style/speak-as", "speak-as")}}, và {{cssxref("@counter-style/fallback", "fallback")}}
- {{Cssxref("list-style")}}, {{Cssxref("list-style-image")}}, {{Cssxref("list-style-position")}}
- {{cssxref("symbols()")}}: ký hiệu hàm để tạo kiểu bộ đếm ẩn danh
- Module [CSS counter styles](/en-US/docs/Web/CSS/Guides/Counter_styles)
- Module [CSS lists and counters](/en-US/docs/Web/CSS/Guides/Lists)
