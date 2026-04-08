---
title: CSS text decoration
short-title: Text decoration
slug: Web/CSS/Guides/Text_decoration
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-text-decor/
  - https://drafts.csswg.org/css-text-decor-4/
sidebar: cssref
---

Module **CSS text decoration** định nghĩa các tính năng liên quan đến trang trí văn bản, như gạch chân, text shadow và emphasis mark. Các tính năng trang trí văn bản có thể cung cấp các gợi ý thị giác cho lỗi chính tả, vấn đề ngữ pháp và các liên kết. Những tính năng này có thể giúp cải thiện tính khả dụng, khả năng truy cập, chức năng và tính thẩm mỹ của văn bản của bạn.

Bằng cách thay đổi màu sắc, kiểu dáng và độ dày của trang trí văn bản bằng pseudo-class và pseudo-element, bạn có thể nhấn mạnh văn bản theo những cách không chỉ dựa vào màu sắc.

Một số tính năng có thể giúp cải thiện khả năng đọc của văn bản:

- {{cssxref("text-decoration-skip-ink")}} có thể tăng tính dễ đọc bằng cách bỏ qua các descender.
- {{cssxref("text-underline-offset")}} cho phép bạn tinh chỉnh vị trí gạch chân để phù hợp hơn với font metric hoặc thiết kế thẩm mỹ, điều này đặc biệt hữu ích cho các [typeface](/en-US/docs/Web/CSS/Guides/Fonts) độc đáo.
- Màu {{cssxref("text-shadow")}} tương phản với {{cssxref("color")}} văn bản có thể làm cho văn bản nổi bật thị giác khi đặt trên nền có độ tương phản không đủ.

Tất cả những tính năng này giúp cải thiện khả năng đọc, và do đó, khả năng truy cập. Giảm nhiễu thị giác và cải thiện độ rõ nét của văn bản đặc biệt hữu ích cho người dùng bị [chứng khó đọc](https://en.wikipedia.org/wiki/Dyslexia) hoặc thị lực kém.

Trong các hệ thống chữ viết của một số ngôn ngữ, [overline](/en-US/docs/Web/CSS/Reference/Properties/text-decoration-line#overline) và [underline](/en-US/docs/Web/CSS/Reference/Properties/text-decoration-line#underline) mang ý nghĩa ngữ nghĩa. CSS cho phép bạn điều chỉnh styling theo các chuẩn mực văn hóa. Các tính năng trang trí văn bản đặc biệt hữu ích cho các ngôn ngữ không sử dụng script dựa trên Latin và thay vào đó theo các vị trí gạch chân khác nhau, chẳng hạn như tiếng Nhật và tiếng Hàn.

Các tính năng trang trí văn bản cũng cho phép bạn tuân theo các tiêu chuẩn biên tập và bản địa hóa từ phương tiện in ấn. Ví dụ, với gạch ngang (line-through), bạn có thể chỉ ra trạng thái của nội dung. Sử dụng nó để thông báo cho người dùng rằng nội dung đã bị xóa hoặc giá cả đã giảm một nửa. Tính năng này cho phép bạn trình bày cả nội dung gốc và nội dung đã cập nhật. Overline hoặc double underline thường được sử dụng cho chú thích học thuật và biên tập.

## Text decoration trong thực tế

```css hidden
p {
  margin: 1em 0;
}
.under {
  text-decoration: underline red;
}

.over {
  text-decoration: wavy overline lime;
}

.line {
  text-decoration: line-through;
}

.underover {
  text-decoration: dashed underline overline;
}

.thick {
  text-decoration: solid underline purple 4px;
  text-underline-offset: -5px;
}
.shadow {
  text-shadow: red 4px 4px 0;
}
.emphasis {
  text-emphasis: triangle red;
}
```

```html hidden
<p class="under">A red underline</p>
<p class="over">A wavy lime overlines</p>
<p class="line">This has a line-through it</p>
<p class="underover">This has a dashed underline and overline</p>
<p class="thick">An offset solid purple underline</p>
<p class="shadow">This has a red shadow</p>
<p class="emphasis">Emphasized with red triangles</p>
```

{{EmbedLiveSample('Text decoration in action','auto','320')}}

## Tham chiếu

### Thuộc tính

- {{cssxref("text-decoration")}}
- {{cssxref("text-decoration-color")}}
- {{cssxref("text-decoration-inset")}}
- {{cssxref("text-decoration-line")}}
- {{cssxref("text-decoration-skip")}}
- {{cssxref("text-decoration-skip-ink")}}
- {{cssxref("text-decoration-style")}}
- {{cssxref("text-decoration-thickness")}}
- {{cssxref("text-emphasis")}}
- {{cssxref("text-emphasis-color")}}
- {{cssxref("text-emphasis-position")}}
- {{cssxref("text-emphasis-style")}}
- {{cssxref("text-shadow")}}
- {{cssxref("text-underline-offset")}}
- {{cssxref("text-underline-position")}}

Đặc tả cũng định nghĩa các thuộc tính `text-decoration-skip-box`, `text-decoration-skip-self`, `text-decoration-skip-spaces`, và `text-emphasis-skip`, hiện chưa được bất kỳ trình duyệt nào hỗ trợ.

## Hướng dẫn

- [Introduction to text shadows](/en-US/docs/Web/CSS/Guides/Text_decoration/Text_shadows)
  - : Tổng quan về các thành phần của thuộc tính {{cssxref("text-shadow")}} và cách tạo nhiều text shadow

## Khái niệm liên quan

- {{cssxref("::spelling-error")}}
- {{cssxref("::grammar-error")}}
- {{cssxref("::first-letter")}}
- {{cssxref("::first-line")}}
- {{cssxref("box-shadow")}}
- {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
- {{cssxref("box-decoration-break")}}
- {{cssxref("line-style")}}
- {{cssxref("letter-spacing")}}
- {{cssxref("word-spacing")}}
- {{cssxref("font-size")}}
- {{cssxref("font-variant-position")}}
- {{cssxref("font-kerning")}}
- {{cssxref("ruby-overhang")}}
- {{HTMLElement("ruby")}}
- {{HTMLElement("rt")}}
- {{HTMLElement("rp")}}
- {{HTMLElement("sup")}}
- {{HTMLElement("sub")}}
- [Inline formatting context](/en-US/docs/Web/CSS/Guides/Inline_layout/Inline_formatting_context)
- [Introduction to formatting contexts](/en-US/docs/Web/CSS/Guides/Display/Formatting_contexts#inline_formatting_contexts)

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS fonts](/en-US/docs/Web/CSS/Guides/Fonts)
- Module [CSS ruby layout](/en-US/docs/Web/CSS/Guides/Ruby_layout)
- Module [CSS text](/en-US/docs/Web/CSS/Guides/Text)
- Module [CSS writing modes](/en-US/docs/Web/CSS/Guides/Writing_modes)
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- Module [CSS fonts](/en-US/docs/Web/CSS/Guides/Fonts)
