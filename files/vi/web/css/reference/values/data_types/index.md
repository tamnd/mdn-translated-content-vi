---
title: Các kiểu dữ liệu CSS
short-title: Kiểu dữ liệu
slug: Web/CSS/Reference/Values/Data_types
page-type: landing-page
spec-urls: https://drafts.csswg.org/css-values/
sidebar: cssref
---

**Các kiểu dữ liệu CSS** định nghĩa các giá trị điển hình (bao gồm từ khóa và đơn vị) được chấp nhận bởi các thuộc tính và hàm CSS. Chúng là một loại đặc biệt của [kiểu giá trị thành phần](https://drafts.csswg.org/css-values/#component-types).

Các kiểu được dùng phổ biến nhất được định nghĩa trong module [CSS Values and Units](/vi/docs/Web/CSS/Guides/Values_and_units). Module này cũng định nghĩa [ký hiệu hàm](/vi/docs/Web/CSS/Reference/Values/Functions), cho phép các kiểu hoặc phép xử lý phức tạp hơn. Các kiểu khác được định nghĩa trong các thông số kỹ thuật mà chúng áp dụng.

Dưới đây là tài liệu tham khảo về các kiểu bạn có khả năng gặp nhất, nhưng đây không phải là tài liệu tham khảo toàn diện cho tất cả các kiểu được định nghĩa trong mọi thông số kỹ thuật CSS.

## Cú pháp

Trong cú pháp CSS chính thức, các kiểu dữ liệu được biểu thị bằng một từ khóa đặt giữa dấu ngoặc nhọn `<` và `>`. Chúng không tương ứng với bất kỳ thực thể mã CSS nào có thể chạm vào được.

## Kiểu dữ liệu văn bản

Các kiểu này bao gồm từ khóa và định danh cũng như chuỗi và URL.

- Từ khóa định nghĩa sẵn
  - : Các từ khóa có nghĩa được định nghĩa trước, ví dụ như giá trị `collapse` cho thuộc tính {{cssxref("border-collapse")}}.
- Từ khóa CSS toàn cục
  - : Tất cả các thuộc tính, bao gồm thuộc tính tùy chỉnh, đều chấp nhận các từ khóa CSS toàn cục:
    - {{CSSXref("initial")}}
      - : Giá trị được chỉ định là giá trị ban đầu của thuộc tính.
    - {{CSSXref("inherit")}}
      - : Giá trị tính toán của thuộc tính trên phần tử cha.
    - {{CSSXref("revert")}}
      - : Khôi phục tầng xếp về giá trị của nguồn gốc trước đó.
    - {{CSSXref("revert-layer")}}
      - : Khôi phục tầng xếp về giá trị của [tầng xếp](/vi/docs/Web/CSS/Reference/At-rules/@layer) trước đó.
    - {{CSSXref("unset")}}
      - : Hoạt động như `inherit` hoặc `initial` tùy thuộc vào việc thuộc tính có được kế thừa hay không.
- {{cssxref("&lt;custom-ident&gt;")}}
  - : Một định danh do người dùng định nghĩa, ví dụ như tên được gán bằng thuộc tính {{cssxref("grid-area")}}.
- {{cssxref("&lt;dashed-ident&gt;")}}
  - : Một `<custom-ident>` với yêu cầu bổ sung là phải bắt đầu bằng hai dấu gạch ngang, ví dụ như với [Thuộc tính tùy chỉnh CSS](/vi/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties).
- {{cssxref("&lt;string&gt;")}}
  - : Một chuỗi được trích dẫn, chẳng hạn như được dùng cho giá trị của thuộc tính {{cssxref("content")}}.
- {{cssxref("url_value", "&lt;url&gt;")}}
  - : Một con trỏ đến một tài nguyên, ví dụ như giá trị của {{cssxref("background-image")}}.

## Kiểu dữ liệu số

Các kiểu dữ liệu này được dùng để chỉ định số lượng, chỉ số và vị trí. Hầu hết các kiểu này được định nghĩa trong module giá trị và đơn vị CSS, tuy nhiên các kiểu bổ sung được mô tả trong các module khác khi chúng chỉ áp dụng cho thông số kỹ thuật đó — ví dụ như đơn vị `fr` trong module [bố cục lưới CSS](/vi/docs/Web/CSS/Guides/Grid_layout).

- {{cssxref("&lt;integer&gt;")}}
  - : Một hoặc nhiều chữ số thập phân từ 0 đến 9, tùy chọn đứng trước bởi `-` hoặc `+`.
- {{cssxref("&lt;number&gt;")}}
  - : Số thực có thể có thành phần thập phân, ví dụ `1` hoặc `1.34`.
- {{cssxref("&lt;dimension&gt;")}}
  - : Một số với đơn vị đi kèm, ví dụ `90deg`, `50ms`, hoặc `15em`. Kiểu này bao gồm khoảng cách ({{cssxref("&lt;length&gt;")}}), thời lượng ({{cssxref("&lt;time&gt;")}}), tần số ({{cssxref("&lt;frequency&gt;")}}), độ phân giải ({{cssxref("resolution")}}) và các đại lượng khác.
- {{cssxref("&lt;percentage&gt;")}}
  - : Một số với dấu phần trăm đi kèm, ví dụ `10%`.
- {{cssxref("&lt;ratio&gt;")}}
  - : Một tỉ lệ, được viết theo cú pháp `<number> / <number>`.
- {{cssxref("&lt;flex&gt;")}}
  - : Độ dài linh hoạt được giới thiệu cho [bố cục lưới CSS](/vi/docs/Web/CSS/Guides/Grid_layout), được viết là `<number>` với đơn vị `fr` đi kèm và được dùng để xác định kích thước đường ray lưới.

## Đại lượng

Các kiểu {{cssxref("&lt;dimension&gt;")}} này được dùng để chỉ định khoảng cách và các đại lượng khác.

- {{cssxref("&lt;length&gt;")}}
  - : Độ dài là một `<dimension>` và biểu thị khoảng cách.
- {{cssxref("angle")}}
  - : Góc được dùng trong các thuộc tính như {{cssxref("gradient/linear-gradient", "linear-gradient()")}} và là một `<dimension>` với một trong các đơn vị `deg`, `grad`, `rad`, hoặc `turn` đi kèm.
- {{cssxref("&lt;time&gt;")}}
  - : Đơn vị thời lượng là một `<dimension>` với đơn vị `s` hoặc `ms`.
- {{cssxref("&lt;frequency&gt;")}}
  - : Tần số là một `<dimension>` với đơn vị `Hz` hoặc `kHz` đi kèm.
- {{cssxref("resolution")}}
  - : Là một `<dimension>` với định danh đơn vị `dpi`, `dpcm`, `dppx`, hoặc `x`.

## Kết hợp các kiểu

Một số thuộc tính CSS có thể nhận giá trị {{cssxref("&lt;dimension&gt;")}} hoặc {{cssxref("&lt;percentage&gt;")}}. Trong trường hợp này, giá trị phần trăm sẽ được giải quyết thành đại lượng khớp với kích thước được phép. Các thuộc tính có thể chấp nhận phần trăm ngoài kích thước sẽ dùng một trong các kiểu được liệt kê dưới đây.

- {{cssxref("&lt;length-percentage&gt;")}}
  - : Một kiểu có thể chấp nhận độ dài hoặc phần trăm làm giá trị.
- {{cssxref("&lt;frequency-percentage&gt;")}}
  - : Một kiểu có thể chấp nhận tần số hoặc phần trăm làm giá trị.
- {{cssxref("&lt;angle-percentage&gt;")}}
  - : Một kiểu có thể chấp nhận góc hoặc phần trăm làm giá trị.
- {{cssxref("&lt;time-percentage&gt;")}}
  - : Một kiểu có thể chấp nhận thời gian hoặc phần trăm làm giá trị.

## Màu sắc

Module [màu sắc CSS](/vi/docs/Web/CSS/Guides/Colors) định nghĩa kiểu dữ liệu {{cssxref("&lt;color&gt;")}} và các kiểu khác liên quan đến màu sắc trong CSS.

- {{cssxref("&lt;color&gt;")}}
  - : Được chỉ định dưới dạng từ khóa hoặc giá trị màu số.
- {{cssxref("&lt;alpha-value&gt;")}}
  - : Chỉ định độ trong suốt của màu. Có thể là `<number>`, trong đó 0 là hoàn toàn trong suốt và 1 là hoàn toàn không trong suốt, hoặc là `<percentage>`, trong đó 0% là hoàn toàn trong suốt và 100% là hoàn toàn không trong suốt.
- {{cssxref("hue")}}
  - : Chỉ định `<angle>` với định danh đơn vị `deg`, `grad`, `rad`, hoặc `turn`, hoặc `<number>` không đơn vị được hiểu là `deg`, của {{glossary("color wheel", "vòng tròn màu")}} đặc trưng cho `<absolute-color-functions>` mà nó là thành phần.

## Hình ảnh

Module [hình ảnh CSS](/vi/docs/Web/CSS/Guides/Images) định nghĩa các kiểu dữ liệu xử lý hình ảnh, bao gồm gradient.

- {{cssxref("image")}}
  - : Một tham chiếu URL đến hình ảnh hoặc gradient màu.
- `<color-stop-list>`
  - : Danh sách gồm hai hoặc nhiều điểm dừng màu với thông tin chuyển tiếp tùy chọn bằng gợi ý màu.
- `<linear-color-stop>`
  - : Một `<color>` và một `<length-percentage>` để chỉ định điểm dừng màu cho phần này của gradient.
- `<linear-color-hint>`
  - : Một `<length-percentage>` để chỉ định cách màu nội suy.
- `<ending-shape>`
  - : Được dùng cho gradient hướng tâm; có thể có giá trị từ khóa `circle` hoặc `ellipse`.
- `<size>`
  - : Xác định kích thước hình kết thúc của gradient hướng tâm. Chấp nhận giá trị từ khóa hoặc `<length>` nhưng không phải phần trăm.

## Định vị 2D

Kiểu dữ liệu {{cssxref("&lt;position&gt;")}} được hiểu như được định nghĩa cho thuộc tính {{cssxref("&lt;background-position&gt;")}}.

- {{cssxref("&lt;position&gt;")}}
  - : Định nghĩa vị trí của một vùng đối tượng. Chấp nhận giá trị từ khóa như `top` hoặc `left`, hoặc `<length-percentage>`.

## Kiểu dữ liệu tính toán

Các kiểu dữ liệu này được dùng trong các phép tính [hàm toán học CSS](/vi/docs/Web/CSS/Reference/Values/Functions#math_functions).

- {{cssxref("&lt;calc-sum&gt;")}}
  - : Một phép tính là chuỗi các giá trị tính toán xen kẽ với các toán tử cộng (`+`) và trừ (`-`). Kiểu dữ liệu này yêu cầu cả hai giá trị đều có đơn vị.
- {{cssxref("&lt;calc-product&gt;")}}
  - : Một phép tính là chuỗi các giá trị tính toán xen kẽ với các toán tử nhân (`*`) và chia (`/`). Khi nhân, một giá trị phải không có đơn vị. Khi chia, giá trị thứ hai phải không có đơn vị.
- {{cssxref("&lt;calc-value&gt;")}}
  - : Định nghĩa các giá trị được chấp nhận trong phép tính, chẳng hạn như {{cssxref("&lt;number&gt;")}}, {{cssxref("&lt;dimension&gt;")}}, {{cssxref("&lt;percentage&gt;")}}, {{cssxref("&lt;calc-keyword&gt;")}} hoặc các phép tính {{cssxref("&lt;calc-sum&gt;")}} lồng nhau.
- {{cssxref("&lt;calc-keyword&gt;")}}
  - : Định nghĩa một số từ khóa CSS biểu diễn các hằng số số như `e` và `π`, có thể được dùng trong các hàm toán học CSS.

## Kiểu dữ liệu hình dạng

Các module [hình dạng CSS](/vi/docs/Web/CSS/Guides/Shapes) và [đường viền và trang trí hộp CSS](/vi/docs/Web/CSS/Guides/Borders_and_box_decorations) định nghĩa các kiểu dữ liệu hình dạng:

- {{cssxref("&lt;basic-shape>")}}
  - : Mô tả các hàm hình dạng được dùng trong các thuộc tính {{cssxref("clip-path")}}, {{cssxref("shape-outside")}}, và {{cssxref("offset-path")}}.
- {{cssxref("&lt;corner-shape-value>")}}
  - : Mô tả hình dạng của góc container. Được dùng bởi thuộc tính viết tắt {{cssxref("corner-shape")}} và các [thuộc tính cấu thành](/vi/docs/Web/CSS/Reference/Properties/corner-shape#constituent_properties) của nó để chỉ định hình dạng áp dụng cho các góc container bị ảnh hưởng.

## Chỉ mục bảng chữ cái các kiểu dữ liệu

- {{cssxref("absolute-size")}}
- {{cssxref("alpha-value")}}
- {{cssxref("angle")}}
- {{cssxref("angle-percentage")}}
- {{cssxref("axis")}}
- {{cssxref("baseline-position")}}
- {{cssxref("basic-shape")}}
- {{cssxref("blend-mode")}}
- {{cssxref("box-edge")}}
- {{cssxref("calc-keyword")}}
- {{cssxref("calc-sum")}}
- {{cssxref("color_value", "&lt;color&gt;")}}
- {{cssxref("color-interpolation-method")}}
- {{cssxref("content-distribution")}}
- {{cssxref("content-position")}}
- {{cssxref("corner-shape-value")}} {{experimental_inline}}
- {{cssxref("custom-ident")}}
- {{cssxref("dashed-function")}} {{experimental_inline}}
- {{cssxref("dashed-ident")}}
- {{cssxref("dimension")}}
- {{cssxref("display-box")}}
- {{cssxref("display-inside")}}
- {{cssxref("display-internal")}}
- {{cssxref("display-legacy")}}
- {{cssxref("display-listitem")}}
- {{cssxref("display-outside")}}
- {{cssxref("easing-function")}}
- {{cssxref("filter-function")}}
- {{cssxref("flex_value", "&lt;flex&gt;")}}
- {{cssxref("frequency")}}
- {{cssxref("frequency-percentage")}}
- {{cssxref("generic-family")}}
- {{cssxref("gradient")}}
- {{cssxref("hex-color")}}
- {{cssxref("hue")}}
- {{cssxref("hue-interpolation-method")}}
- {{cssxref("ident")}}
- {{cssxref("image")}}
- {{cssxref("integer")}}
- {{cssxref("length")}}
- {{cssxref("length-percentage")}}
- {{cssxref("line-style")}}
- {{cssxref("named-color")}}
- {{cssxref("number")}}
- {{cssxref("overflow_value", "&lt;overflow&gt;")}}
- {{cssxref("overflow-position")}}
- {{cssxref("percentage")}}
- {{cssxref("position_value", "&lt;position&gt;")}}
- {{cssxref("position-area_value", "&lt;position-area&gt;")}}
- {{cssxref("ratio")}}
- {{cssxref("relative-size")}}
- {{cssxref("resolution")}}
- {{cssxref("self-position")}}
- {{cssxref("shape")}} {{deprecated_inline}}
- {{cssxref("string")}}
- {{cssxref("system-color")}}
- {{cssxref("text-edge")}}
- {{cssxref("time")}}
- {{cssxref("timeline-range-name")}}
- {{cssxref("time-percentage")}}
- {{cssxref("transform-function")}}
- {{cssxref("url_value", "&lt;url&gt;")}}

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- Module [giá trị và đơn vị CSS](/vi/docs/Web/CSS/Guides/Values_and_units)
- [Học: Giá trị và đơn vị](/vi/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
- [Ký hiệu hàm CSS](/vi/docs/Web/CSS/Reference/Values/Functions)
