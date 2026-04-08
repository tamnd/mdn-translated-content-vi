---
title: Numeric data types
slug: Web/CSS/Guides/Values_and_units/Numeric_data_types
page-type: guide
spec-urls: https://drafts.csswg.org/css-values/
sidebar: cssref
---

Mỗi khai báo CSS bao gồm một cặp thuộc tính/giá trị. Giá trị có thể bao gồm các kiểu dữ liệu khác nhau tùy thuộc vào thuộc tính, chẳng hạn như một số đơn lẻ, từ khóa, hàm hoặc kết hợp của nhiều kiểu khác nhau; một số giá trị có đơn vị, trong khi các giá trị khác thì không. Các kiểu dữ liệu số bao gồm các giá trị {{cssxref("&lt;integer&gt;")}}, {{cssxref("&lt;number&gt;")}}, {{cssxref("&lt;dimension&gt;")}} và {{cssxref("&lt;percentage&gt;")}}. Hướng dẫn này là tổng quan về các kiểu dữ liệu số. Tham khảo trang cho từng kiểu giá trị để biết thêm thông tin chi tiết.

## Số nguyên (Integers)

Số nguyên là một hoặc nhiều chữ số thập phân, `0` đến `9`, chẳng hạn như `1024` hoặc `-55`. Số nguyên có thể được đứng trước bởi ký hiệu `+` hoặc `-`, không có khoảng trắng giữa ký hiệu và số nguyên.

## Số thực (Numbers)

Một {{cssxref("&lt;number&gt;")}} đại diện cho một số thực, có thể có hoặc không có dấu thập phân với phần thập phân, ví dụ `0.255`, `128` hoặc `-1.2`. Numbers cũng có thể được đứng trước bởi ký hiệu `+` hoặc `-`.

## Dimensions

Một {{cssxref("&lt;dimension&gt;")}} là một `<number>` có đơn vị gắn liền với nó, ví dụ `45deg`, `100ms` hoặc `10px`. Định danh đơn vị gắn kèm không phân biệt chữ hoa chữ thường. Không bao giờ có khoảng trắng hoặc bất kỳ ký tự nào khác giữa số và định danh đơn vị: tức là `1 cm` là không hợp lệ.

CSS sử dụng dimensions để chỉ định:

- {{cssxref("&lt;length&gt;")}} (Đơn vị khoảng cách)
- {{cssxref("angle")}}
- {{cssxref("&lt;time&gt;")}}
- {{cssxref("&lt;frequency&gt;")}}
- {{cssxref("&lt;flex&gt;")}}
- {{cssxref("resolution")}}

Tất cả những điều này được đề cập trong các mục con bên dưới.

### Đơn vị khoảng cách

Khi một đơn vị khoảng cách, còn được gọi là độ dài (length), được phép dùng làm giá trị cho một thuộc tính, điều này được mô tả là kiểu {{cssxref("&lt;length&gt;")}}. Có hai loại độ dài trong CSS: tương đối và tuyệt đối. Các đơn vị độ dài tương đối chỉ định độ dài trong mối quan hệ với một thứ khác.

Có hai loại độ dài tương đối: độ dài tương đối theo font và độ dài theo phần trăm viewport. Cả hai đều có hai kiểu con. Các đơn vị độ dài tương đối theo font có thể là tương đối theo font cục bộ hoặc tương đối theo font gốc. Độ dài theo phần trăm viewport có thể tương đối theo chiều cao hoặc chiều rộng của viewport, hoặc như được định nghĩa trong [CSS Containment module](/en-US/docs/Web/CSS/Guides/Containment), tương đối theo một [container](/en-US/docs/Web/CSS/Guides/Containment/Container_queries#container_query_length_units).

#### Độ dài tương đối theo font cục bộ

Các đơn vị độ dài tương đối theo font cục bộ là tương đối theo kích thước font hoặc chiều cao dòng "cục bộ", chỉ định độ dài trong mối quan hệ với kích thước được tính toán của một đặc trưng của chính [phần tử](/en-US/docs/Web/HTML/Reference/Elements) đó, hoặc tương đối với giá trị kế thừa của phần tử trong trường hợp tham chiếu vòng tròn, chẳng hạn như giá trị `em` cho thuộc tính {{cssxref("font-size")}} hoặc giá trị `lh` cho thuộc tính {{cssxref("line-height")}}.
Ví dụ, `em` tương đối với kích thước font của phần tử và `ex` tương đối với chiều cao x của font phần tử.

| Đơn vị | Tương đối với                                                                                                                 |
| ------ | ----------------------------------------------------------------------------------------------------------------------------- |
| `cap`  | Chiều cao chữ hoa (chiều cao danh nghĩa của các chữ in hoa) của font phần tử.                                                 |
| `ch`   | Advance trung bình của một glyph hẹp trong font phần tử, được đại diện bởi glyph "0" (ZERO, U+0030).                          |
| `em`   | Kích thước font của font phần tử.                                                                                             |
| `ex`   | Chiều cao x của font phần tử.                                                                                                 |
| `ic`   | Advance trung bình của một glyph chiều đầy đủ trong font phần tử, được đại diện bởi glyph "水" (CJK water ideograph, U+6C34). |
| `lh`   | Chiều cao dòng của phần tử.                                                                                                   |

#### Độ dài tương đối theo font gốc

Các đơn vị độ dài tương đối theo font gốc chỉ định độ dài trong mối quan hệ với [phần tử gốc](/en-US/docs/Web/CSS/Reference/Selectors/:root) của phần tử, chẳng hạn như {{HTMLElement("HTML")}} hoặc {{SVGElement("SVG")}}.
Ví dụ, `rem` tương đối với kích thước font trên phần tử gốc và `rex` là chiều cao x của font phần tử gốc.

| Đơn vị | Tương đối với                                                                                                                     |
| ------ | --------------------------------------------------------------------------------------------------------------------------------- |
| `rcap` | Chiều cao chữ hoa (chiều cao danh nghĩa của các chữ in hoa) của font phần tử gốc.                                                 |
| `rch`  | Advance trung bình của một glyph hẹp trong font phần tử gốc, được đại diện bởi glyph "0" (ZERO, U+0030).                          |
| `rem`  | Kích thước font của font phần tử gốc.                                                                                             |
| `rex`  | Chiều cao x của font phần tử gốc.                                                                                                 |
| `ric`  | Advance trung bình của một glyph chiều đầy đủ trong font phần tử gốc, được đại diện bởi glyph "水" (CJK water ideograph, U+6C34). |
| `rlh`  | Chiều cao dòng của phần tử gốc.                                                                                                   |

#### Đơn vị viewport

Các đơn vị độ dài viewport chỉ định độ dài tương đối với kích thước của [viewport](/en-US/docs/Glossary/Viewport).
Ví dụ, `vw` tương đối với chiều rộng của viewport và `vh` tương đối với chiều cao của viewport.

| Đơn vị | Tương đối với                                                                                          |
| ------ | ------------------------------------------------------------------------------------------------------ |
| `dvh`  | 1% chiều cao của viewport [động](/en-US/docs/Web/CSS/Reference/Values/length#dynamic_viewport_units).  |
| `dvw`  | 1% chiều rộng của viewport [động](/en-US/docs/Web/CSS/Reference/Values/length#dynamic_viewport_units). |
| `lvh`  | 1% chiều cao của viewport [lớn](/en-US/docs/Web/CSS/Reference/Values/length#large_viewport_units).     |
| `lvw`  | 1% chiều rộng của viewport [lớn](/en-US/docs/Web/CSS/Reference/Values/length#large_viewport_units).    |
| `svh`  | 1% chiều cao của viewport [nhỏ](/en-US/docs/Web/CSS/Reference/Values/length#small_viewport_units).     |
| `svw`  | 1% chiều rộng của viewport [nhỏ](/en-US/docs/Web/CSS/Reference/Values/length#small_viewport_units).    |
| `vb`   | 1% kích thước viewport theo [trục block](/en-US/docs/Glossary/Flow_relative_values) của phần tử gốc.   |
| `vh`   | 1% chiều cao viewport.                                                                                 |
| `vi`   | 1% kích thước viewport theo [trục inline](/en-US/docs/Glossary/Flow_relative_values) của phần tử gốc.  |
| `vmax` | 1% kích thước lớn hơn của viewport.                                                                    |
| `vmin` | 1% kích thước nhỏ hơn của viewport.                                                                    |
| `vw`   | 1% chiều rộng viewport.                                                                                |

#### Đơn vị container

Các đơn vị độ dài container query chỉ định độ dài tương đối với kích thước của một [query container](/en-US/docs/Web/CSS/Guides/Containment/Container_queries).
Ví dụ, `cqw` tương đối với chiều rộng của query container và `cqh` tương đối với chiều cao của query container.

| Đơn vị  | Tương đối với                                |
| ------- | -------------------------------------------- |
| `cqb`   | 1% kích thước block của một query container  |
| `cqh`   | 1% chiều cao của một query container         |
| `cqi`   | 1% kích thước inline của một query container |
| `cqmax` | Giá trị lớn hơn giữa `cqi` hoặc `cqb`        |
| `cqmin` | Giá trị nhỏ hơn giữa `cqi` hoặc `cqb`        |
| `cqw`   | 1% chiều rộng của một query container        |

### Đơn vị độ dài tuyệt đối

Các đơn vị độ dài tuyệt đối được cố định theo một độ dài vật lý: inch hoặc centimeter. Vì vậy, nhiều đơn vị trong số này hữu ích hơn khi đầu ra là phương tiện kích thước cố định, chẳng hạn như in ấn. Ví dụ, `mm` là một mili-mét vật lý, 1/10 của một centimeter.

| Đơn vị | Tên                 | Tương đương         |
| ------ | ------------------- | ------------------- |
| `cm`   | Centimeters         | 1cm = 96px/2.54     |
| `in`   | Inches              | 1in = 2.54cm = 96px |
| `mm`   | Millimeters         | 1mm = 1/10 của 1cm  |
| `pc`   | Picas               | 1pc = 1/6 của 1in   |
| `pt`   | Points              | 1pt = 1/72 của 1in  |
| `px`   | Pixels              | 1px = 1/96 của 1in  |
| `Q`    | Quarter-millimeters | 1Q = 1/40 của 1cm   |

Khi bao gồm giá trị độ dài, nếu độ dài là `0`, không cần định danh đơn vị. Nếu khác 0, định danh đơn vị là bắt buộc, không phân biệt chữ hoa chữ thường, và phải đặt ngay sau phần số của giá trị, không có khoảng trắng ở giữa.

#### Đơn vị góc

Các giá trị góc được đại diện bởi kiểu {{cssxref("angle")}} và chấp nhận các giá trị sau:

| Đơn vị | Tên      | Mô tả                                      |
| ------ | -------- | ------------------------------------------ |
| `deg`  | Degrees  | Có 360 độ trong một vòng tròn đầy đủ.      |
| `grad` | Gradians | Có 400 gradian trong một vòng tròn đầy đủ. |
| `rad`  | Radians  | Có 2π radian trong một vòng tròn đầy đủ.   |
| `turn` | Turns    | Có 1 vòng trong một vòng tròn đầy đủ.      |

#### Đơn vị thời gian

Các giá trị thời gian được đại diện bởi kiểu {{cssxref("&lt;time&gt;")}}. Khi bao gồm giá trị thời gian, định danh đơn vị — `s` hoặc `ms` — là bắt buộc. Nó chấp nhận các giá trị sau.

| Đơn vị | Tên          | Mô tả                              |
| ------ | ------------ | ---------------------------------- |
| `ms`   | Milliseconds | Có 1.000 mili-giây trong một giây. |
| `s`    | Seconds      |                                    |

#### Đơn vị tần số

Các giá trị tần số được đại diện bởi kiểu {{cssxref("&lt;frequency&gt;")}}. Nó chấp nhận các giá trị sau.

| Đơn vị | Tên       | Mô tả                                      |
| ------ | --------- | ------------------------------------------ |
| `Hz`   | Hertz     | Đại diện cho số lần xảy ra trong một giây. |
| `kHz`  | KiloHertz | Một kiloHertz là 1000 Hertz.               |

`1Hz`, cũng có thể được viết là `1hz` hoặc `1HZ`, là một chu kỳ mỗi giây.

#### Flex units

Flex units được đại diện bởi kiểu {{cssxref("&lt;flex&gt;")}}. Nó chấp nhận giá trị sau.

| Đơn vị | Tên  | Mô tả                                                  |
| ------ | ---- | ------------------------------------------------------ |
| `fr`   | Flex | Đại diện cho độ dài linh hoạt trong một grid container |

#### Đơn vị độ phân giải

Các đơn vị độ phân giải được đại diện bởi kiểu {{cssxref("resolution")}}. Chúng đại diện cho kích thước của một dấu chấm đơn trong một biểu diễn đồ họa, chẳng hạn như màn hình, bằng cách chỉ ra có bao nhiêu dấu chấm như vậy vừa khít trong một CSS inch, centimeter hoặc pixel. Nó chấp nhận các giá trị sau:

| Đơn vị      | Mô tả                |
| ----------- | -------------------- |
| `dpcm`      | Dots per centimeter. |
| `dpi`       | Dots per inch.       |
| `dppx`, `x` | Dots per px unit.    |

### Phần trăm (Percentages)

Một {{cssxref("&lt;percentage&gt;")}} là một kiểu đại diện cho một phần của một giá trị khác.

Các giá trị phần trăm luôn tương đối với một số lượng khác, ví dụ như độ dài. Mỗi thuộc tính cho phép phần trăm cũng định nghĩa số lượng mà phần trăm đề cập đến. Số lượng này có thể là giá trị của một thuộc tính khác của cùng một phần tử, giá trị của một thuộc tính của phần tử cha, phép đo của một containing block, hoặc điều gì đó khác.

Ví dụ, nếu bạn chỉ định {{cssxref("width")}} của một hộp dưới dạng phần trăm, nó đề cập đến phần trăm của chiều rộng được tính toán của cha của hộp:

```css
.box {
  width: 50%;
}
```

## Kết hợp phần trăm và dimensions

Một số thuộc tính chấp nhận một dimension có thể là một trong hai kiểu, ví dụ `<length>` **hoặc** `<percentage>`. Trong trường hợp này, giá trị được phép được chi tiết trong đặc tả như là một đơn vị kết hợp, ví dụ {{cssxref("&lt;length-percentage&gt;")}}. Các kết hợp khả thi khác như sau:

- {{cssxref("&lt;frequency-percentage&gt;")}}
- {{cssxref("&lt;angle-percentage&gt;")}}
- {{cssxref("&lt;time-percentage&gt;")}}

## Kiểu dữ liệu đặc biệt (được định nghĩa trong các đặc tả khác)

- {{cssxref("&lt;color&gt;")}}
- {{cssxref("image")}}
- {{cssxref("&lt;position&gt;")}}

### Màu sắc

Giá trị {{cssxref("&lt;color&gt;")}} chỉ định màu của một đặc trưng phần tử (ví dụ, màu nền của nó), và được định nghĩa trong [CSS Color Module](https://drafts.csswg.org/css-color-3/).

### Hình ảnh

Giá trị {{cssxref("image")}} chỉ định tất cả các loại hình ảnh khác nhau có thể được sử dụng trong CSS, và được định nghĩa trong [CSS Image Values and Replaced Content Module](https://drafts.csswg.org/css-images-4/).

### Vị trí

Kiểu {{cssxref("&lt;position&gt;")}} định nghĩa vị trí 2D của một đối tượng bên trong một vùng định vị, ví dụ như hình ảnh nền bên trong một container. Kiểu này được hiểu là một {{cssxref("background-position")}} và do đó được chỉ định trong [CSS Backgrounds and Borders specification](https://drafts.csswg.org/css-backgrounds/).

## Ký hiệu hàm (Functional notation)

- {{cssxref("calc()")}}
- {{cssxref("min()")}}
- {{cssxref("max()")}}
- {{cssxref("minmax()")}}
- {{cssxref("clamp()")}}
- {{cssxref("attr()")}}

[Functional notation](/en-US/docs/Web/CSS/Reference/Values/Functions) là một loại giá trị có thể đại diện cho các kiểu phức tạp hơn hoặc gọi xử lý đặc biệt bởi CSS. Cú pháp bắt đầu bằng tên hàm ngay sau đó là dấu ngoặc trái `(` theo sau là (các) đối số của ký hiệu, rồi đến dấu ngoặc phải `)`. Các hàm có thể nhận nhiều đối số, được định dạng tương tự như giá trị thuộc tính CSS.

Khoảng trắng được phép, nhưng tùy chọn bên trong dấu ngoặc. (Nhưng xem ghi chú về khoảng trắng trong các trang cho hàm `min()`, `max()`, `minmax()` và `clamp()`.)

Một số ký hiệu hàm cũ, chẳng hạn như cú pháp cũ cho `rgb()`, `rgba()`, `hsl()` và `hsla()`, sử dụng dấu phẩy, nhưng dấu phẩy thường chỉ được dùng để phân tách các mục trong danh sách. Nếu dấu phẩy được dùng để phân tách các đối số, khoảng trắng là tùy chọn trước và sau dấu phẩy.

Đặc tả cũng định nghĩa hàm `toggle()`. Nó chưa được triển khai ở bất kỳ đâu.

## Đặc tả kỹ thuật

{{Specifications}}

## Xem thêm

- [Kiểu dữ liệu văn bản](/en-US/docs/Web/CSS/Guides/Values_and_units/Textual_data_types)
- [Kiểu dữ liệu CSS](/en-US/docs/Web/CSS/Reference/Values/Data_types)
- Module [CSS values and units](/en-US/docs/Web/CSS/Guides/Values_and_units)
- [Học: Values and units](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
