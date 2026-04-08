---
title: CSS colors
short-title: Colors
slug: Web/CSS/Guides/Colors
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-color/
  - https://drafts.csswg.org/css-color-5/
sidebar: cssref
---

Mô-đun **CSS colors** định nghĩa màu sắc, các kiểu màu, pha trộn màu, độ trong suốt, và cách bạn có thể áp dụng những màu sắc và hiệu ứng này cho nội dung HTML.

Mặc dù mô-đun này chỉ có hai thuộc tính CSS là {{cssxref("color")}} và {{cssxref("opacity")}}, nhưng hơn 20 thuộc tính CSS và SVG, các CSS image, at-rule và @media rule đều phụ thuộc vào hai thuộc tính này.

## Màu sắc trong thực tế

Bộ chuyển đổi cú pháp màu bên dưới hiển thị các giá trị của màu đang được chọn theo định dạng [red-green-blue](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb) (RGB), [thập lục phân](/en-US/docs/Web/CSS/Reference/Values/hex-color) (HEX), [hue, saturation và lightness](/en-US/docs/Web/CSS/Reference/Values/color_value/hsl) (HSL), và [hue, whiteness và blackness](/en-US/docs/Web/CSS/Reference/Values/color_value/hwb) (HWB). Tất cả các giá trị màu RGB, HEX, HSL và HWB ở đây, dù được viết khác nhau, đều đại diện cho cùng một giá trị màu.

{{EmbedGHLiveSample("css-examples/modules/colors.html", '100%', 450)}}

Chọn màu qua [color picker](/en-US/docs/Web/HTML/Reference/Elements/input/color) và điều chỉnh độ trong suốt qua [slider](/en-US/docs/Web/HTML/Reference/Elements/input/range) sẽ cập nhật các giá trị RGB, HEX, HSL và HWB. Khi bạn chọn màu hoặc giá trị độ trong suốt mới, màu của nền và thanh trượt sẽ được cập nhật thông qua các thuộc tính CSS {{cssxref("background-color")}} và {{cssxref("accent-color")}}.

Để xem mã nguồn của bộ chuyển đổi cú pháp màu này, [xem nguồn trên GitHub](https://github.com/mdn/css-examples/blob/main/modules/colors.html).

## Tham chiếu

### Thuộc tính

- {{cssxref("color")}}
- {{cssxref("opacity")}}

### At-rule và descriptor

Mô-đun CSS colors cũng giới thiệu at-rule {{cssxref("@color-profile")}}, cùng với các descriptor `components`, `rendering-intent` và `src`. Hiện tại, chưa có trình duyệt nào hỗ trợ các tính năng này.

### Hàm

- Hàm màu:
  - [`rgb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb)
  - [`hsl()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hsl)
  - [`hwb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hwb)
  - [`lab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lab)
  - [`lch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lch)
  - [`oklab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/oklab)
  - [`oklch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/oklch)
  - [`color()`](/en-US/docs/Web/CSS/Reference/Values/color_value/color)
- [`color-mix()`](/en-US/docs/Web/CSS/Reference/Values/color_value/color-mix)
- [`contrast-color()`](/en-US/docs/Web/CSS/Reference/Values/color_value/contrast-color)
- {{CSSXref("color_value/light-dark", "light-dark()")}}

Mô-đun CSS colors cũng giới thiệu hàm {{CSSXref("color_value/device-cmyk", "device-cmyk()")}}. Hiện tại, chưa có trình duyệt nào hỗ trợ tính năng này.

### Kiểu dữ liệu

- {{cssxref("&lt;color&gt;")}}
- [`<color-function>`](#hàm)
- {{cssxref("hex-color")}}
- {{cssxref("named-color")}}
- {{cssxref("alpha-value")}}
- {{cssxref("hue")}}
- {{cssxref("system-color")}}
- [`<colorspace-params>`](/en-US/docs/Web/CSS/Reference/Values/color_value/color#using_predefined_color_spaces_with_color)

### Thuật ngữ và từ khóa

- {{glossary("Color space")}}
- [`currentColor`](/en-US/docs/Web/CSS/Reference/Values/color_value#currentcolor_keyword)
- {{glossary("Interpolation")}}
- {{glossary("RGB")}}
- [`transparent`](/en-US/docs/Web/CSS/Reference/Values/named-color#transparent)

### Interface

Mô-đun CSS color cũng giới thiệu interface `CSSColorProfileRule`. Hiện tại, chưa có trình duyệt nào hỗ trợ tính năng này.

## Hướng dẫn

- [Áp dụng màu sắc cho các phần tử HTML bằng CSS](/en-US/docs/Web/CSS/Guides/Colors/Applying_color)
  - : Hướng dẫn sử dụng CSS để áp dụng màu sắc cho nhiều loại nội dung khác nhau, bao gồm tất cả các thuộc tính CSS chấp nhận `<color>` làm giá trị.
- [Giá trị màu CSS](/en-US/docs/Web/CSS/Guides/Colors/Color_values)
  - : Tổng quan về các color space và các ký hiệu hàm `<color>` khác nhau có sẵn trong CSS.
- [Sử dụng màu sắc một cách khôn ngoan](/en-US/docs/Web/CSS/Guides/Colors/Using_color_wisely)
  - : Lý thuyết màu sắc và các tài nguyên, bao gồm tìm màu phù hợp để tạo bảng màu có thể truy cập, độ tương phản và in màu.
- [Sử dụng relative colors](/en-US/docs/Web/CSS/Guides/Colors/Using_relative_colors)
  - : Bài viết này giải thích cú pháp relative color trong CSS, trình bày các tùy chọn và đưa ra một số ví dụ minh họa.
- [Hiểu về màu sắc và luminance](/en-US/docs/Web/Accessibility/Guides/Colors_and_Luminance)
  - : Nhận thức về màu sắc và sử dụng màu sắc với người dùng mù màu, người dùng thị lực kém và người dùng có rối loạn tiền đình hoặc rối loạn thần kinh khác.
- [WCAG 1.4.1: Độ tương phản màu sắc](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable/Color_contrast)
  - : Giải thích yêu cầu về độ tương phản giữa nội dung nền và tiền cảnh để đảm bảo khả năng đọc.
- [Tuần tự hóa giá trị CSS](/en-US/docs/Web/API/CSS_Object_Model/CSS_value_serialization)
  - : Cách [CSSOM API](/en-US/docs/Web/API/CSS_Object_Model) tuần tự hóa màu sắc và các giá trị khác thành biểu diễn chuỗi chuẩn hóa.

## Khái niệm liên quan

- Các thuộc tính CSS là một phần của các đặc tả khác:
  - {{cssxref("accent-color")}}
  - {{cssxref("background-color")}}
  - {{cssxref("background-image")}}
  - {{cssxref("border-color")}}
  - {{cssxref("box-shadow")}}
  - {{cssxref("caret-color")}}
  - {{cssxref("color")}}
  - {{cssxref("color-scheme")}}
  - {{cssxref("column-rule-color")}}
  - {{cssxref("dynamic-range-limit")}}
  - {{cssxref("outline-color")}}
  - {{cssxref("scrollbar-color")}}
  - {{cssxref("text-decoration-color")}}
  - {{cssxref("text-emphasis-color")}}
  - {{cssxref("text-shadow")}}
  - {{cssxref("-webkit-tap-highlight-color")}}
- Hàm {{cssxref("dynamic-range-limit-mix()")}}
- Các thuộc tính màu SVG thuộc các đặc tả khác:
  - [`fill`](/en-US/docs/Web/SVG/Reference/Attribute/fill)
  - [`flood-color`](/en-US/docs/Web/SVG/Reference/Attribute/flood-color)
  - [`lighting-color`](/en-US/docs/Web/SVG/Reference/Attribute/lighting-color)
  - [`stop-color`](/en-US/docs/Web/SVG/Reference/Attribute/stop-color)
  - [`stroke`](/en-US/docs/Web/SVG/Reference/Attribute/stroke)
- Thuộc tính SVG [`color`](/en-US/docs/Web/SVG/Reference/Attribute/color)
- Thuật ngữ {{glossary("Color wheel")}}
- Thuật ngữ {{glossary("Interpolation")}}
- Descriptor [`override-colors`](/en-US/docs/Web/CSS/Reference/At-rules/@font-palette-values/override-colors) của at-rule {{cssxref("@font-palette-values")}}
- At-rule {{cssxref("@color-profile")}}
- Tính năng @media [`color-gamut`](/en-US/docs/Web/CSS/Reference/At-rules/@media/color-gamut)
- Tính năng @media [`forced-colors`](/en-US/docs/Web/CSS/Reference/At-rules/@media/forced-colors)

## Đặc tả

{{Specifications}}

## Xem thêm

- Mô-đun [CSS color adjustment](/en-US/docs/Web/CSS/Guides/Color_adjustment) và {{cssxref("print-color-adjust")}}
- {{cssxref("gradient")}} được định nghĩa trong mô-đun [CSS images](/en-US/docs/Web/CSS/Guides/Images)
- Interface [`VideoColorSpace`](/en-US/docs/Web/API/VideoColorSpace)
- Phần tử SVG [`<feColorMatrix>`](/en-US/docs/Web/SVG/Reference/Element/feColorMatrix)
- [Canvas API: áp dụng style và màu sắc](/en-US/docs/Web/API/Canvas_API/Tutorial/Applying_styles_and_colors#colors)
- Công cụ:
  - [Bộ chuyển đổi định dạng màu](/en-US/docs/Web/CSS/Guides/Colors/Color_format_converter)
  - [Bộ pha trộn màu](/en-US/docs/Web/CSS/Guides/Colors/Color_mixer)
