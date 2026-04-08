---
title: CSS fonts
short-title: Fonts
slug: Web/CSS/Guides/Fonts
page-type: css-module
spec-urls: https://drafts.csswg.org/css-fonts/
sidebar: cssref
---

Module **CSS fonts** định nghĩa các thuộc tính liên quan đến font và cách tải tài nguyên font. Nó cho phép bạn định nghĩa kiểu của font, chẳng hạn như họ font, kích thước và độ đậm, cũng như các biến thể glyph cần sử dụng khi có nhiều biến thể cho một ký tự.

Font là tệp tài nguyên chứa biểu diễn trực quan của các ký tự, ánh xạ mã ký tự sang các glyph đại diện cho chữ cái, số, dấu câu và thậm chí cả emoji của một typeface. Font family là nhóm các font chia sẻ phong cách thiết kế chung và các thuộc tính font, với mỗi thành viên trong nhóm cung cấp các cách khác nhau để hiển thị các glyph, thay đổi theo độ đậm nét, độ nghiêng, hoặc chiều rộng tương đối, trong số các thuộc tính khác. Font thường đại diện cho một kiểu duy nhất của một typeface, chẳng hạn như Helvetica Bold và Italic. Font family là tập hợp đầy đủ của tất cả các kiểu. Việc bao gồm font như vậy trong tài liệu hoặc thiết kế được thực hiện bằng cách định nghĩa một khai báo `@font-face` riêng biệt cho mỗi tài nguyên font.

Các thuộc tính, at-rule, và descriptor của module CSS fonts cho phép tải xuống nhiều biến thể của font. Chúng cũng định nghĩa tệp font cần sử dụng cho một đặc điểm font cụ thể, cùng với hướng dẫn dự phòng trong trường hợp tài nguyên không tải được. Cơ chế lựa chọn font CSS mô tả quá trình khớp một tập hợp các thuộc tính font CSS với một font face duy nhất.

Module CSS fonts cũng hỗ trợ variable fonts. Không giống như các font thông thường, nơi mỗi kiểu được triển khai như một tệp font riêng biệt, variable fonts có thể chứa tất cả các kiểu trong một tệp duy nhất. Bằng cách sử dụng một khai báo `@font-face` duy nhất, bạn có thể nhập một variable font bao gồm tất cả các kiểu. Tùy thuộc vào font, điều này có thể bao gồm nhiều biến thể font. Variable fonts là một phần của đặc tả font OpenType.

## Tham chiếu

### Thuộc tính

- Viết tắt {{cssxref("font")}}
- {{cssxref("font-family")}}
- {{cssxref("font-feature-settings")}}
- {{cssxref("font-kerning")}}
- {{cssxref("font-language-override")}}
- {{cssxref("font-optical-sizing")}}
- {{cssxref("font-palette")}}
- {{cssxref("font-size")}}
- {{cssxref("font-size-adjust")}}
- {{cssxref("font-width")}} và alias cũ {{cssxref("font-stretch")}}
- {{cssxref("font-style")}}
- {{cssxref("font-weight")}}

- Viết tắt {{cssxref("font-synthesis")}}
- {{cssxref("font-synthesis-position")}}
- {{cssxref("font-synthesis-small-caps")}}
- {{cssxref("font-synthesis-style")}}
- {{cssxref("font-synthesis-weight")}}

- Viết tắt {{cssxref("font-variant")}}
- {{cssxref("font-variant-alternates")}}
- {{cssxref("font-variant-caps")}}
- {{cssxref("font-variant-east-asian")}}
- {{cssxref("font-variant-emoji")}}
- {{cssxref("font-variant-ligatures")}}
- {{cssxref("font-variant-numeric")}}
- {{cssxref("font-variant-position")}}
- {{cssxref("font-variation-settings")}}

### At-rule và descriptor

- At-rule: {{cssxref("@font-face")}}
  - : Descriptor:
    - {{cssxref("@font-face/ascent-override", "ascent-override")}}
    - {{cssxref("@font-face/descent-override", "descent-override")}}
    - {{cssxref("@font-face/font-display", "font-display")}}
    - {{cssxref("@font-face/font-family", "font-family")}}
    - {{cssxref("@font-face/font-feature-settings", "font-feature-settings")}}
    - {{cssxref("@font-face/font-width", "font-width")}} và alias cũ {{cssxref("@font-face/font-stretch", "font-stretch")}}
    - {{cssxref("@font-face/font-style", "font-style")}}
    - {{cssxref("@font-face/font-variation-settings", "font-variation-settings")}}
    - {{cssxref("@font-face/font-weight", "font-weight")}}
    - {{cssxref("@font-face/line-gap-override", "line-gap-override")}}
    - {{cssxref("@font-face/size-adjust", "size-adjust")}}
    - {{cssxref("@font-face/src", "src")}}
    - {{cssxref("@font-face/unicode-range", "unicode-range")}}

Module CSS fonts cũng định nghĩa các descriptor `font-language-override`, `font-named-instance`, `font-size`, `subscript-position-override`, `subscript-size-override`, `superscript-position-override`, và `superscript-size-override`. Hiện tại, không có trình duyệt nào hỗ trợ các tính năng này.

- At-rule: {{cssxref("@font-feature-values")}}

Module CSS fonts cũng định nghĩa descriptor {{cssxref("@font-feature-values/font-display", "font-display")}}. Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

- At-rule: {{cssxref("@font-palette-values")}}
  - : Descriptor:
    - {{cssxref("@font-palette-values/base-palette", "base-palette")}}
    - {{cssxref("@font-palette-values/font-family", "font-family")}}
    - {{cssxref("@font-palette-values/override-colors", "override-colors")}}

### Hàm

Module CSS fonts định nghĩa hàm `generic()`. Hiện tại, không có trình duyệt nào hỗ trợ tính năng này.

### Kiểu dữ liệu

Kiểu `font-size`:

- {{cssxref("absolute-size")}}
- {{cssxref("relative-size")}}

Kiểu `font-family`:

- {{cssxref("generic-family")}}

Kiểu `font-feature-settings`:

- [`<feature-tag-value>`](/en-US/docs/Web/CSS/Reference/Properties/font-feature-settings#values)

Kiểu `font-format`:

- [`<font-format>`](/en-US/docs/Web/CSS/Reference/At-rules/@supports#font-format)

Kiểu `font-stretch`:

- [`<font-stretch-css3>`](/en-US/docs/Web/CSS/Reference/Properties/font-stretch#values)

Kiểu `font-tech`:

- [`<color-font-tech>`](/en-US/docs/Web/CSS/Reference/At-rules/@supports#font-tech)
- [`<font-features-tech>`](/en-US/docs/Web/CSS/Reference/At-rules/@supports#font-tech)
- [`<font-tech>`](/en-US/docs/Web/CSS/Reference/At-rules/@supports#font-tech)

Kiểu `font-variant`:

- [`<font-variant-css2>`](/en-US/docs/Web/CSS/Reference/Properties/font-variant)
- [`<east-asian-variant-values>`](/en-US/docs/Web/CSS/Reference/Properties/font-variant#values)
- [`<east-asian-width-values>`](/en-US/docs/Web/CSS/Reference/Properties/font-variant#values)

Kiểu `font-variant-ligatures`:

- [`<common-lig-values>`](/en-US/docs/Web/CSS/Reference/Properties/font-variant-ligatures#values)
- [`<contextual-alt-values>`](/en-US/docs/Web/CSS/Reference/Properties/font-variant-ligatures#values)
- [`<discretionary-lig-values>`](/en-US/docs/Web/CSS/Reference/Properties/font-variant-ligatures#values)
- [`<historical-lig-values>`](/en-US/docs/Web/CSS/Reference/Properties/font-variant-ligatures#values)

Kiểu `font-variant-numeric`:

- [`<numeric-figure-values>`](/en-US/docs/Web/CSS/Reference/Properties/font-variant-numeric#values)
- [`<numeric-fraction-values>`](/en-US/docs/Web/CSS/Reference/Properties/font-variant-numeric#values)
- [`<numeric-spacing-values>`](/en-US/docs/Web/CSS/Reference/Properties/font-variant-numeric#values)

Kiểu `font-weight`:

- [`<font-weight-absolute>`](/en-US/docs/Web/CSS/Reference/Properties/font-weight#values)

### Interfaces

- {{domxref("CSSFontFaceRule")}}
- {{domxref("CSSFontFeatureValuesRule")}}
- {{domxref("CSSFontPaletteValuesRule")}}

## Hướng dẫn

- [Học: Căn bản về tạo kiểu văn bản và font](/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals)
  - : Bài học dành cho người mới bắt đầu này bao gồm các nguyên tắc cơ bản về tạo kiểu văn bản và font. Nó bao gồm cách đặt độ đậm font, họ font và kiểu bằng cách sử dụng viết tắt {{cssxref("font")}} và cách căn chỉnh văn bản và quản lý khoảng cách dòng và chữ cái.

- [Học: Web fonts](/en-US/docs/Learn_web_development/Core/Text_styling/Web_fonts)
  - : Bài học dành cho người mới bắt đầu này giải thích cách sử dụng các font tùy chỉnh trên trang web của bạn để cho phép tạo kiểu văn bản đa dạng và tùy chỉnh hơn.

- [Tính năng font OpenType](/en-US/docs/Web/CSS/Guides/Fonts/OpenType_fonts)
  - : Các tính năng hoặc biến thể font đề cập đến các glyph hoặc kiểu ký tự khác nhau có trong font OpenType. Những thứ này bao gồm ligature (glyph đặc biệt kết hợp các ký tự như 'fi' hoặc 'ffl'), kerning (điều chỉnh khoảng cách giữa các cặp chữ cái cụ thể), phân số, kiểu số, và một số thứ khác. Tất cả những điều này được gọi là các tính năng OpenType, và được cung cấp để sử dụng trên web thông qua các thuộc tính cụ thể và thuộc tính điều khiển cấp thấp — {{cssxref("font-feature-settings")}}. Bài viết này cung cấp cho bạn tất cả những gì bạn cần biết về việc sử dụng các tính năng font OpenType trong CSS.

- [Web Open Font Format (WOFF)](/en-US/docs/Web/CSS/Guides/Fonts/WOFF)
  - : WOFF sử dụng phiên bản nén của cùng cấu trúc `sfnt` dựa trên bảng được sử dụng bởi TrueType, OpenType, và Open Font Format, nhưng thêm metadata và cấu trúc dữ liệu sử dụng riêng, bao gồm các trường được xác định trước cho phép các nhà sản xuất và nhà cung cấp cung cấp thông tin giấy phép nếu muốn.

- [Variable fonts](/en-US/docs/Web/CSS/Guides/Fonts/Variable_fonts)
  - : Bài viết này sẽ giúp bạn bắt đầu sử dụng variable fonts.

- [Cải thiện hiệu suất font](/en-US/docs/Learn_web_development/Extensions/Performance/CSS#improving_font_performance)
  - : Bài viết này, một phần của hướng dẫn hiệu suất CSS, thảo luận về tải font, chỉ tải các glyph cần thiết, và định nghĩa hành vi hiển thị font với descriptor `font-display`.

## Khái niệm liên quan

- Thuộc tính CSS {{cssxref("letter-spacing")}}
- Thuộc tính CSS {{cssxref("line-height")}}
- Thuộc tính CSS {{cssxref("text-transform")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- Module [CSS font loading](/en-US/docs/Web/CSS/Guides/Font_loading)
- [CSS font loading API](/en-US/docs/Web/API/CSS_Font_Loading_API)
- Module [CSS text](/en-US/docs/Web/CSS/Guides/Text)
- Module [CSS writing modes](/en-US/docs/Web/CSS/Guides/Writing_modes)
