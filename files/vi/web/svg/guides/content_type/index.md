---
title: Kiểu nội dung
slug: Web/SVG/Guides/Content_type
page-type: guide
sidebar: svgref
---

SVG sử dụng nhiều kiểu dữ liệu khác nhau. Bài viết này liệt kê các kiểu đó cùng với cú pháp và phần mô tả về mục đích sử dụng của chúng.

## Góc

- \<angle>
  - : Góc được chỉ định theo một trong hai cách. Khi dùng trong giá trị của một thuộc tính trong stylesheet, một \<angle> được định nghĩa như sau:

    ```plain
    angle ::= number (~"deg" | ~"grad" | ~"rad")?
    ```

    trong đó `deg` biểu thị độ, `grad` biểu thị grad, và `rad` biểu thị radian.

    Với các thuộc tính được định nghĩa trong CSS2, phải cung cấp định danh đơn vị góc. Với các giá trị góc trong các thuộc tính dành riêng cho SVG và các thuộc tính trình bày tương ứng của chúng, định danh đơn vị góc là tùy chọn. Nếu không được cung cấp, giá trị góc được hiểu là tính bằng độ. Trong các thuộc tính trình bày cho mọi thuộc tính, dù được định nghĩa trong SVG1.1 hay trong CSS2, nếu có chỉ định định danh góc thì nó phải ở dạng chữ thường.

    Khi góc được dùng trong một thuộc tính SVG, \<angle> được định nghĩa như sau:

    ```plain
    angle ::= number ("deg" | "grad" | "rad")?
    ```

    Các định danh đơn vị trong các giá trị \<angle> này phải ở dạng chữ thường.

    Trong SVG DOM, các giá trị \<angle> được biểu diễn bằng các đối tượng {{domxref("SVGAngle")}} hoặc {{domxref("SVGAnimatedAngle")}}.

## Bất kỳ thứ gì

- \<anything>
  - : Kiểu cơ bản \<anything> là một chuỗi gồm không hoặc nhiều ký tự. Cụ thể:

    ```plain
    anything ::= Char*
    ```

    trong đó Char là bất kỳ ký tự Unicode hợp lệ nào không phải ký tự điều khiển.

## Giá trị đồng hồ

- \<clock-value>
  - : Giá trị đồng hồ có cùng cú pháp như trong đặc tả [SMIL Animation](https://www.w3.org/TR/smil-animation/#Timing-ClockValueSyntax). Ngữ pháp cho giá trị đồng hồ được nhắc lại ở đây:

    ```plain
    Clock-val         ::= Full-clock-val | Partial-clock-val
                          | Timecount-val
    Full-clock-val    ::= Hours ":" Minutes ":" Seconds ("." Fraction)?
    Partial-clock-val ::= Minutes ":" Seconds ("." Fraction)?
    Timecount-val     ::= Timecount ("." Fraction)? (Metric)?
    Metric            ::= "h" | "min" | "s" | "ms"
    Hours             ::= DIGIT+; any positive number
    Minutes           ::= 2DIGIT; range from 00 to 59
    Seconds           ::= 2DIGIT; range from 00 to 59
    Fraction          ::= DIGIT+
    Timecount         ::= DIGIT+
    2DIGIT            ::= DIGIT DIGIT
    DIGIT             ::= [0-9]
    ```

    Với các giá trị `Timecount`, hậu tố đơn vị mặc định là `s` (giây). Không được có khoảng trắng xen giữa trong giá trị đồng hồ, mặc dù các ký tự khoảng trắng ở đầu và cuối sẽ bị bỏ qua.

    Các ví dụ sau là những giá trị đồng hồ hợp lệ:
    - Giá trị đồng hồ đầy đủ:
      - `02:30:03` = 2 giờ, 30 phút và 3 giây
      - `50:00:10.25` = 50 giờ, 10 giây và 250 mili giây
    - Giá trị đồng hồ rút gọn:
      - `02:33` = 2 phút và 33 giây
      - `00:10.5` = 10,5 giây = 10 giây và 500 mili giây
    - Giá trị `Timecount`:
      - `3.2h` = 3,2 giờ = 3 giờ và 12 phút
      - `45min` = 45 phút
      - `30s` = 30 giây
      - `5ms` = 5 mili giây
      - `12.467` = 12 giây và 467 mili giây
    - Các giá trị phân số chỉ là định nghĩa số thực dấu phẩy động cơ số 10 của giây. Vì vậy:
      - `00.5s` = 500 mili giây
      - `00:00.005` = 5 mili giây

## Màu

- \<color>
  - : Kiểu cơ bản \<color> là một đặc tả tương thích CSS2 cho màu trong không gian màu sRGB. \<color> áp dụng cho việc SVG sử dụng thuộc tính {{SVGAttr("color")}} và là một thành phần trong định nghĩa của các thuộc tính {{SVGAttr("fill")}}, {{SVGAttr("stroke")}}, {{SVGAttr("stop-color")}}, {{SVGAttr("flood-color")}} và {{SVGAttr("lighting-color")}}, các thuộc tính này cũng cho phép đặc tả màu dựa trên ICC tùy chọn.

    Định nghĩa của \<color> trong SVG hoàn toàn giống với định nghĩa {{cssxref("color_value", "&lt;color&gt;")}} của CSS.

## Tọa độ

- \<coordinate>
  - : Một \<coordinate> là một độ dài trong hệ tọa độ người dùng, có giá trị cách gốc của hệ tọa độ người dùng một khoảng xác định dọc theo trục liên quan (trục x cho tọa độ X, trục y cho tọa độ Y). Cú pháp của nó giống như cú pháp của [\<length>](#length).

    Trong SVG DOM, một \<coordinate> được biểu diễn như một {{domxref("SVGLength")}} hoặc {{domxref("SVGAnimatedLength")}}.

## Tần số

- \<frequency>
  - : Giá trị tần số được dùng với các thuộc tính liên quan đến âm thanh. Như được định nghĩa trong CSS2, một giá trị tần số là một [\<number>](#number) theo ngay sau bởi một định danh đơn vị tần số. Các định danh đơn vị tần số là:
    - `Hz`: Hertz
    - `kHz`: kilo Hertz

    Giá trị tần số không được âm.

## FuncIRI

- \<FuncIRI>
  - : Ký hiệu hàm cho một tham chiếu. Cú pháp cho tham chiếu này giống với [CSS URI](/en-US/docs/Web/CSS/Reference/Values/url_value).

## Số nguyên

- \<integer>
  - : Một \<integer> được chỉ định bằng một ký tự dấu tùy chọn (`+` hoặc `-`) theo sau bởi một hay nhiều chữ số `0` đến `9`:

    ```plain
    integer ::= [+-]? [0-9]+
    ```

    Nếu ký tự dấu không xuất hiện, số được xem là không âm.

    Trừ khi có quy định khác cho một thuộc tính hay tính chất cụ thể, khoảng giá trị của một \<integer> bao trùm (ít nhất) từ `-2147483648` đến `2147483647`.

    Trong SVG DOM, một \<integer> được biểu diễn bởi kiểu `number` hoặc {{domxref("SVGAnimatedInteger")}}.

## IRI

- \<IRI>
  - : Một **I**dentifier **R**esource **I**nternationalized, tức một **định danh tài nguyên quốc tế hóa**.

    Trên Internet, tài nguyên được xác định bằng _IRI_ (Internationalized Resource Identifier). Ví dụ, một tệp SVG tên `someDrawing.svg` nằm tại `http://example.com` có thể có _IRI_ như sau:

    ```plain
    http://example.com/someDrawing.svg
    ```

    Một _IRI_ cũng có thể trỏ tới một phần tử cụ thể trong tài liệu XML bằng cách bao gồm một bộ định danh phân mảnh _IRI_ như một phần của _IRI_. Một _IRI_ có chứa bộ định danh phân mảnh _IRI_ gồm một _IRI_ cơ sở tùy chọn, theo sau là ký tự `#`, rồi đến bộ định danh phân mảnh _IRI_. Ví dụ, _IRI_ sau có thể dùng để chỉ phần tử có ID `Lamppost` trong tệp `someDrawing.svg`:

    ```plain
    http://example.com/someDrawing.svg#Lamppost
    ```

    _IRI_ được dùng trong thuộc tính {{SVGAttr("href")}}.
    Một số thuộc tính cho phép cả _IRI_ lẫn chuỗi văn bản làm nội dung. Để phân biệt chuỗi văn bản với một _IRI_ tương đối, ký hiệu hàm \<FuncIRI> được dùng. Đây là một _IRI_ được bao quanh bởi ký hiệu hàm. Lưu ý: Vì lý do lịch sử, các dấu phân cách là `url(` và `)`, để tương thích với các đặc tả CSS. Dạng _FuncIRI_ được dùng trong các thuộc tính trình bày.

    SVG sử dụng rộng rãi các tham chiếu _IRI_, cả tuyệt đối lẫn tương đối, tới các đối tượng khác. Ví dụ, để tô một hình chữ nhật bằng một gradient tuyến tính, trước hết bạn định nghĩa một phần tử {{SVGElement("linearGradient")}} và gán cho nó một ID, như sau:

    ```html
    <linearGradient xml:id="MyGradient">...</linearGradient>
    ```

    Sau đó bạn tham chiếu gradient tuyến tính đó như giá trị của thuộc tính {{SVGAttr("fill")}} của hình chữ nhật, như trong ví dụ sau:

    ```html
    <rect fill="url(#MyGradient)" />
    ```

    SVG hỗ trợ hai loại tham chiếu _IRI_:
    - **tham chiếu _IRI_ cục bộ**, khi tham chiếu IRI không chứa \<absoluteIRI> hoặc \<relativeIRI> và vì vậy chỉ chứa bộ định danh phân mảnh (tức là `#<elementID>` hoặc `#xpointer(id<elementID>)`).
    - **tham chiếu _IRI_ không cục bộ**, khi tham chiếu _IRI_ có chứa \<absoluteIRI> hoặc \<relativeIRI>.

    IRI hiện là khái niệm đã bị loại bỏ trong SVG 2, được thay thế bằng kiểu [URL](#url) phổ quát.

## Độ dài

- \<length>
  - : Độ dài là phép đo khoảng cách, được cho dưới dạng một con số cùng với một đơn vị.
    Đặc tả SVG2 đồng bộ với các kiểu dữ liệu và đơn vị {{cssxref("length")}} của CSS cho cú pháp và giá trị thuộc tính.
    Phải cung cấp định danh đơn vị độ dài và các giá trị của định danh đơn vị độ dài không phân biệt chữ hoa chữ thường.
    Cú pháp tuân theo cú pháp `<length>` của CSS:

    ```plain
    length ::= <number> (<absolute-length> | <relative-length>)?
    ```

    Với các thuộc tính dành riêng cho SVG được định nghĩa trong SVG1.1 và các thuộc tính trình bày tương ứng của chúng, các định danh đơn vị trong giá trị là tùy chọn. Nếu không được cung cấp, giá trị độ dài biểu thị một khoảng cách trong hệ tọa độ người dùng hiện tại. Các định danh độ dài phải ở dạng chữ thường khi được dùng trong các thuộc tính trình bày cho mọi thuộc tính, bất kể chúng được định nghĩa trong SVG hay trong CSS. Tính phân biệt hoa thường này được nới lỏng trong SVG2 để đồng bộ với CSS.

    Lưu ý rằng định nghĩa \<length> không phải thuộc tính cũng cho phép định danh đơn vị phần trăm (`%`).
    Ý nghĩa của một giá trị độ dài phần trăm phụ thuộc vào thuộc tính mà giá trị đó được chỉ định cho. Hai trường hợp phổ biến là:
    - khi một giá trị độ dài phần trăm biểu thị một phần của chiều rộng hoặc chiều cao viewport
    - khi một giá trị độ dài phần trăm biểu thị một phần của chiều rộng hoặc chiều cao hộp bao quanh trên một đối tượng nhất định.

    Trong SVG DOM, các giá trị \<length> được biểu diễn bằng các đối tượng {{domxref("SVGLength")}} hoặc {{domxref("SVGAnimatedLength")}}.

## Danh sách T

- \<list-of-Ts>
  - : (Trong đó _T_ là một kiểu nào đó.) Một danh sách gồm một chuỗi các giá trị được phân tách. Trừ khi được mô tả khác đi một cách rõ ràng, các danh sách trong thuộc tính XML của SVG có thể được ngăn cách bằng dấu phẩy (có hoặc không có khoảng trắng trước hoặc sau dấu phẩy), hoặc bằng khoảng trắng.

    Khoảng trắng trong danh sách được định nghĩa là một hay nhiều ký tự liên tiếp sau đây: "space" (`U+0020`), "tab" (`U+0009`), "line feed" (`U+000A`), "carriage return" (`U+000D`) và "form-feed" (`U+000C`).

    Sau đây là mẫu EBNF mô tả cú pháp \<list-of-Ts>:

    ```plain
    list-of-Ts ::= T
                    | T, list-of-Ts
    ```

    Trong SVG DOM, các giá trị của kiểu \<list-of-Ts> được biểu diễn bởi một giao diện riêng cho kiểu _T_ cụ thể. Ví dụ, một \<list-of-lengths> được biểu diễn trong SVG DOM bằng đối tượng {{domxref("SVGLengthList")}} hoặc {{domxref("SVGAnimatedLengthList")}}.

## Tên

- \<name>
  - : Một tên, là một chuỗi mà một vài ký tự có ý nghĩa cú pháp đặc biệt bị cấm.

    ```plain
    name  ::= [^,()#x20#x9#xD#xA] /* any char except ",", "(", ")" or wsp */
    ```

## Số

- \<number>
  - : Số thực được chỉ định theo một trong hai cách. Khi dùng trong stylesheet, một \<number> được định nghĩa như sau:

    ```plain
    number ::= integer
                | [+-]? [0-9]* "." [0-9]+
    ```

    Cú pháp này giống với định nghĩa trong CSS (CSS2, mục 4.3.1).

    Khi dùng trong một thuộc tính SVG, một \<number> được định nghĩa khác đi để có thể biểu diễn các số có độ lớn lớn hơn một cách gọn hơn:

    ```plain
    number ::= integer ([Ee] integer)?
                | [+-]? [0-9]* "." [0-9]+ ([Ee] integer)?
    ```

    Trong SVG DOM, một \<number> được biểu diễn bằng kiểu float, {{domxref("SVGNumber")}} hoặc {{domxref("SVGAnimatedNumber")}}.

## Number-optional-number

- \<number-optional-number>
  - : Một cặp các \<number>, trong đó số thứ hai là tùy chọn.

    ```plain
    number-optional-number ::= number
                                | number, number
    ```
