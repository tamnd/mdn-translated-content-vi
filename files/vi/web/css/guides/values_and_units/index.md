---
title: CSS values and units
short-title: Values and units
slug: Web/CSS/Guides/Values_and_units
page-type: css-module
spec-urls:
  - https://drafts.csswg.org/css-values-3/
  - https://drafts.csswg.org/css-values-4/
  - https://drafts.csswg.org/css-values-5/
sidebar: cssref
---

Mỗi khai báo CSS bao gồm một cặp thuộc tính/giá trị. Giá trị có thể có nhiều dạng khác nhau tùy thuộc vào thuộc tính, chẳng hạn như một số nguyên đơn lẻ, từ khóa, hàm hoặc kết hợp của các mục khác nhau; một số giá trị có đơn vị, trong khi các giá trị khác thì không. Mỗi thuộc tính cũng chấp nhận các giá trị toàn CSS (CSS-wide values). Module CSS values and units định nghĩa các kiểu dữ liệu — giá trị và đơn vị — mà các thuộc tính CSS chấp nhận. Module này cũng định nghĩa cú pháp định nghĩa giá trị CSS, hay ngữ pháp hình thức, được dùng để định nghĩa tập hợp các giá trị hợp lệ cho mọi thuộc tính và hàm CSS.

> [!NOTE]
> Trang này giới thiệu một module CSS. Để tìm danh sách đầy đủ tất cả các giá trị, kiểu và hàm được định nghĩa bởi các đặc tả CSS, xem trang tham khảo [values](/en-US/docs/Web/CSS/Reference/Values).

## Tham khảo

### Thuộc tính

- {{cssxref("interpolate-size")}}

### Hàm

- {{cssxref("abs()")}}
- {{cssxref("acos()")}}
- {{cssxref("asin()")}}
- {{cssxref("atan()")}}
- {{cssxref("atan2()")}}
- {{cssxref("attr()")}}
- {{cssxref("calc()")}}
- {{cssxref("calc-size()")}}
- {{cssxref("clamp()")}}
- {{cssxref("cos()")}}
- {{cssxref("exp()")}}
- {{cssxref("hypot()")}}
- {{cssxref("ident()")}}
- {{cssxref("if()")}}
- {{cssxref("inherit()")}}
- {{cssxref("log()")}}
- {{cssxref("max()")}}
- {{cssxref("min()")}}
- {{cssxref("mod()")}}
- {{cssxref("pow()")}}
- {{cssxref("progress()")}}
- {{cssxref("random()")}}
- {{cssxref("rem()")}}
- {{cssxref("round()")}}
- {{cssxref("sibling-count()")}}
- {{cssxref("sibling-index()")}}
- {{cssxref("sign()")}}
- {{cssxref("sin()")}}
- {{cssxref("sqrt()")}}
- {{cssxref("tan()")}}
- {{cssxref("url_function", "url()")}}

Module CSS values and units cũng giới thiệu các hàm `calc-mix()`, `first-valid()`, `integrity()`, `random-item()`, `src()`, `type()` và `toggle()`. Hiện tại, chưa có trình duyệt nào hỗ trợ các tính năng này.

### Kiểu dữ liệu

- {{cssxref("angle-percentage")}}
- {{cssxref("angle")}}
- [`<attr-name>`](/en-US/docs/Web/CSS/Reference/Values/attr#attr-name)
- [`<attr-type>`](/en-US/docs/Web/CSS/Reference/Values/attr#attr-type)
- {{CSSxRef("&lt;calc-keyword&gt;")}} (`e`, `pi`, `infinity`, {{glossary("NaN")}})
- [`<calc-size-basis>`](/en-US/docs/Web/CSS/Reference/Values/calc-size#calc-size-basis)
- {{cssxref("calc-sum")}}
- {{cssxref("custom-ident")}}
- {{cssxref("dashed-ident")}}
- {{cssxref("dimension")}}
- {{cssxref("easing-function")}}
- {{cssxref("ident")}}
- {{cssxref("integer")}}
- {{cssxref("length-percentage")}}
- {{cssxref("length")}}
- {{cssxref("number")}}
- {{cssxref("percentage")}}
- {{cssxref("&lt;position&gt;")}}
- {{cssxref("ratio")}}
- {{cssxref("resolution")}}
- [`<rounding-strategy>`](/en-US/docs/Web/CSS/Reference/Values/round#rounding-strategy) (`down`, `up`, `to-zero`)
- {{cssxref("string")}}
- [`<syntax>`](/en-US/docs/Web/CSS/Guides/Syntax/Introduction)
- {{cssxref("time-percentage")}}
- {{cssxref("time")}}
- {{cssxref("url_value", "&lt;url&gt;")}}
- [`<url-modifier>`](/en-US/docs/Web/CSS/Reference/Values/url_function#url-modifier)

Module CSS values and units cũng giới thiệu các kiểu dữ liệu {{cssxref("frequency")}} và {{cssxref("frequency-percentage")}}. Hiện tại, chưa có trình duyệt nào hỗ trợ các tính năng này.

#### Đơn vị

- [`%` (percentage)](/en-US/docs/Web/CSS/Reference/Values/percentage)
- [`cap`](/en-US/docs/Web/CSS/Reference/Values/length#cap)
- [`ch`](/en-US/docs/Web/CSS/Reference/Values/length#ch)
- [`cm`](/en-US/docs/Web/CSS/Reference/Values/length#cm)
- [`deg`](/en-US/docs/Web/CSS/Reference/Values/angle#deg)
- [`dpcm`](/en-US/docs/Web/CSS/Reference/Values/resolution#dpcm)
- [`dpi`](/en-US/docs/Web/CSS/Reference/Values/resolution#dpi)
- [`dppx`](/en-US/docs/Web/CSS/Reference/Values/resolution#dppx)
- [`dvb`](/en-US/docs/Web/CSS/Reference/Values/length#vb)
- [`dvh`](/en-US/docs/Web/CSS/Reference/Values/length#vh)
- [`dvi`](/en-US/docs/Web/CSS/Reference/Values/length#vi)
- [`dvmax`](/en-US/docs/Web/CSS/Reference/Values/length#vmax)
- [`dvmin`](/en-US/docs/Web/CSS/Reference/Values/length#vmin)
- [`dvw`](/en-US/docs/Web/CSS/Reference/Values/length#vw)
- [`em`](/en-US/docs/Web/CSS/Reference/Values/length#em)
- [`ex`](/en-US/docs/Web/CSS/Reference/Values/length#ex)
- [`grad`](/en-US/docs/Web/CSS/Reference/Values/angle#grad)
- [`Hz`](/en-US/docs/Web/CSS/Reference/Values/frequency#hz)
- [`ic`](/en-US/docs/Web/CSS/Reference/Values/length#ic)
- [`in`](/en-US/docs/Web/CSS/Reference/Values/length#in)
- [`kHz`](/en-US/docs/Web/CSS/Reference/Values/frequency#khz)
- [`lh`](/en-US/docs/Web/CSS/Reference/Values/length#lh)
- [`lvb`](/en-US/docs/Web/CSS/Reference/Values/length#vb)
- [`lvh`](/en-US/docs/Web/CSS/Reference/Values/length#vh)
- [`lvi`](/en-US/docs/Web/CSS/Reference/Values/length#vi)
- [`lvmax`](/en-US/docs/Web/CSS/Reference/Values/length#vmax)
- [`lvmin`](/en-US/docs/Web/CSS/Reference/Values/length#vmin)
- [`lvw`](/en-US/docs/Web/CSS/Reference/Values/length#vw)
- [`mm`](/en-US/docs/Web/CSS/Reference/Values/length#mm)
- [`ms`](/en-US/docs/Web/CSS/Reference/Values/time#ms)
- [`pc`](/en-US/docs/Web/CSS/Reference/Values/length#pc)
- [`pt`](/en-US/docs/Web/CSS/Reference/Values/length#pt)
- [`px`](/en-US/docs/Web/CSS/Reference/Values/length#px)
- [`Q`](/en-US/docs/Web/CSS/Reference/Values/length#q)
- [`rad`](/en-US/docs/Web/CSS/Reference/Values/angle#rad)
- [`rcap`](/en-US/docs/Web/CSS/Reference/Values/length#rcap)
- [`rch`](/en-US/docs/Web/CSS/Reference/Values/length#rch)
- [`rem`](/en-US/docs/Web/CSS/Reference/Values/length#rem)
- [`rex`](/en-US/docs/Web/CSS/Reference/Values/length#rex)
- [`ric`](/en-US/docs/Web/CSS/Reference/Values/length#ric)
- [`rlh`](/en-US/docs/Web/CSS/Reference/Values/length#rlh)
- [`s`](/en-US/docs/Web/CSS/Reference/Values/time#s)
- [`svb`](/en-US/docs/Web/CSS/Reference/Values/length#vb)
- [`svh`](/en-US/docs/Web/CSS/Reference/Values/length#vh)
- [`svi`](/en-US/docs/Web/CSS/Reference/Values/length#vi)
- [`svmax`](/en-US/docs/Web/CSS/Reference/Values/length#vmax)
- [`svmin`](/en-US/docs/Web/CSS/Reference/Values/length#vmin)
- [`svw`](/en-US/docs/Web/CSS/Reference/Values/length#vw)
- [`turn`](/en-US/docs/Web/CSS/Reference/Values/angle#turn)
- [`vb`](/en-US/docs/Web/CSS/Reference/Values/length#vb)
- [`vh`](/en-US/docs/Web/CSS/Reference/Values/length#vh)
- [`vi`](/en-US/docs/Web/CSS/Reference/Values/length#vi)
- [`vmax`](/en-US/docs/Web/CSS/Reference/Values/length#vmax)
- [`vmin`](/en-US/docs/Web/CSS/Reference/Values/length#vmin)
- [`vw`](/en-US/docs/Web/CSS/Reference/Values/length#vw)
- [`x`](/en-US/docs/Web/CSS/Reference/Values/resolution#x)

[Flex units](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#flex_units) (`fr`) và [container units](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#container_units) (`cqb`, `cqh`, `cqi`, `cqmax`, `cqmin`, `cqw`) được định nghĩa trong các module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout) và [CSS conditional rules](/en-US/docs/Web/CSS/Guides/Conditional_rules) tương ứng.

#### Phân loại đơn vị

- [Đơn vị độ dài tuyệt đối](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#absolute_length_units) (`cm`, `in`, `mm`, `pc`, `pt`, `px`, `Q`)
- [Đơn vị góc](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#angle_units) (`deg`, `grad`, `rad`, `turn`)
- [Đơn vị viewport mặc định](/en-US/docs/Web/CSS/Reference/Values/length#default_viewport_units) (`vb`, `vh`, `vi`, `vmax`, `vmin`, `vw`)
- [Đơn vị viewport động](/en-US/docs/Web/CSS/Reference/Values/length#dynamic_viewport_units) (`dvb`, `dvh`, `dvi`, `dvmax`, `dvmin`, `dvw`)
- [Đơn vị tần số](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#frequency_units) (`Hz`, `kHz`)
- [Đơn vị viewport lớn](/en-US/docs/Web/CSS/Reference/Values/length#large_viewport_units) (`lvb`, `lvh`, `lvi`, `lvmax`, `lvmin`, `lvw`)
- [Đơn vị độ dài tương đối theo font cục bộ](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#local_font-relative_lengths) (`cap`, `ch`, `em`, `ex`, `ic`, `lh`)
- [Đơn vị vật lý](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#absolute_length_units) (`cm`, `in`, `mm`, `pc`, `pt`, `Q`)
- [Đơn vị độ dài tương đối](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types) (`cap`, `ch`, `em`, `ex`, `ic`, `lh`, `rem`, `rlh`, `vb`, `vh`, `vi`, `vmax`, `vmin`, `vw`)
- [Đơn vị độ phân giải](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#resolution_units) (`dpcm`, `dpi`, `dppx`, `x`)
- [Đơn vị độ dài tương đối theo font gốc](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#root_font-relative_lengths) (`rcap`, `rch`, `rem`, `rex`, `ric`, `rlh`)
- [Đơn vị viewport nhỏ](/en-US/docs/Web/CSS/Reference/Values/length#small_viewport_units) (`svb`, `svh`, `svi`, `svmax`, `svmin`, `svw`)
- [Đơn vị thời gian](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#time_units) (`ms`, `s`)
- [Đơn vị viewport](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#viewport_units) (`dvh`, `dvw`, `lvh`, `lvw`, `svh`, `svw`, `vb`, `vh`, `vi`, `vmax`, `vmin`, `vw`)
- [Đơn vị góc nhìn](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#absolute_length_units) (`px`)

### Khái niệm chính

- {{glossary("Advance measure")}}
- [Ký hiệu phạm vi dấu ngoặc vuông](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax#bracketed_range_notation_minmax)
- [Tổ hợp giá trị thành phần](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax#component_value_combinators)
- [Từ khóa toàn CSS](/en-US/docs/Web/CSS/Reference/Values/Data_types#css-wide_keywords)
- {{glossary("Device pixel")}}
- [Ký hiệu hàm](/en-US/docs/Web/CSS/Reference/Values/Functions)
- {{glossary("Identifier")}}
- {{glossary("Interpolation")}}
- {{glossary("Keyword")}}
- [Hàm toán học](/en-US/docs/Web/CSS/Guides/Values_and_units/Using_math_functions)
- [Kiểu dữ liệu số](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types)
- {{glossary("Origin")}}
- {{glossary("Pixel")}}
- [Kiểu dữ liệu văn bản](/en-US/docs/Web/CSS/Guides/Values_and_units/Textual_data_types)
- {{glossary("URL")}}
- [Cú pháp định nghĩa giá trị](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)

## Hướng dẫn

- [Kiểu dữ liệu CSS](/en-US/docs/Web/CSS/Reference/Values/Data_types)
  - : Giới thiệu các kiểu dữ liệu CSS định nghĩa các giá trị điển hình được chấp nhận bởi các thuộc tính và hàm CSS.

- [Kiểu dữ liệu số](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types)
  - : Tổng quan về các kiểu dữ liệu số, bao gồm integers, numbers, percentages và dimensions, cùng với các dimensions tương đối và tuyệt đối, đơn vị góc và đơn vị thời gian.

- [Kiểu dữ liệu văn bản](/en-US/docs/Web/CSS/Guides/Values_and_units/Textual_data_types)
  - : Tổng quan về các kiểu dữ liệu văn bản, bao gồm các giá trị từ khóa được định nghĩa sẵn, các giá trị từ khóa CSS toàn cầu và URL.

- [Hàm giá trị CSS](/en-US/docs/Web/CSS/Reference/Values/Functions)
  - : Tổng quan về các câu lệnh CSS gọi xử lý dữ liệu hoặc tính toán đặc biệt để trả về giá trị CSS cho một thuộc tính CSS.

- [Sử dụng hàm toán học CSS](/en-US/docs/Web/CSS/Guides/Values_and_units/Using_math_functions)
  - : Các hàm toán học CSS cho phép viết giá trị thuộc tính dưới dạng biểu thức toán học.

- [Cú pháp định nghĩa giá trị](/en-US/docs/Web/CSS/Guides/Values_and_units/Value_definition_syntax)
  - : Ngữ pháp hình thức được dùng để định nghĩa tập hợp các giá trị hợp lệ cho các thuộc tính và hàm CSS.

- [Sử dụng phép tính kiểu đánh máy CSS](/en-US/docs/Web/CSS/Guides/Values_and_units/Using_typed_arithmetic)
  - : Giải thích hành vi phép tính kiểu đánh máy CSS và các trường hợp sử dụng được kích hoạt bởi nó.

- [Học: Values and units](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
  - : Tìm hiểu một số kiểu giá trị được sử dụng thường xuyên nhất, chúng là gì và cách hoạt động.

- [Tuần tự hóa giá trị CSS](/en-US/docs/Web/API/CSS_Object_Model/CSS_value_serialization)
  - : Cách [CSSOM APIs](/en-US/docs/Web/API/CSS_Object_Model) tuần tự hóa màu sắc và các giá trị khác thành các biểu diễn chuỗi chuẩn hóa.

## Liên quan

- Module [CSS cascading and inheritance](/en-US/docs/Web/CSS/Guides/Cascade)
  - {{cssxref("initial")}}
  - {{cssxref("inherit")}}
  - {{cssxref("revert")}}
  - {{cssxref("revert-layer")}}
  - {{cssxref("unset")}}
  - {{cssxref("all")}}

- Module [CSS grid layout](/en-US/docs/Web/CSS/Guides/Grid_layout)
  - {{cssxref("&lt;flex&gt;")}}
  - [Flex units](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#flex_units) (`fr`)

- Module [CSS conditional rules](/en-US/docs/Web/CSS/Guides/Conditional_rules)
  - [Container units](/en-US/docs/Web/CSS/Guides/Values_and_units/Numeric_data_types#container_units) (`cqb`, `cqh`, `cqi`, `cqmax`, `cqmin`, `cqw`)

- Module [CSS colors](/en-US/docs/Web/CSS/Guides/Colors)
  - {{cssxref("&lt;color&gt;")}}
  - {{cssxref("system-color")}}
  - [`color-mix()`](/en-US/docs/Web/CSS/Reference/Values/color_value/color-mix)

- Module [CSS images](/en-US/docs/Web/CSS/Guides/Images)
  - {{cssxref("image")}}
  - {{cssxref("gradient")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- Module [CSS syntax](/en-US/docs/Web/CSS/Guides/Syntax)
- Module [CSS selectors](/en-US/docs/Web/CSS/Guides/Selectors)
