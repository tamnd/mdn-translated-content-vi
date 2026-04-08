---
title: Các hàm giá trị CSS
short-title: Hàm
slug: Web/CSS/Reference/Values/Functions
page-type: landing-page
sidebar: cssref
---

**Các hàm giá trị CSS** là các câu lệnh gọi xử lý dữ liệu hoặc tính toán đặc biệt để trả về [giá trị](/vi/docs/Web/CSS/Guides/Values_and_units) [CSS](/vi/docs/Web/CSS) cho một thuộc tính CSS. Các hàm giá trị CSS đại diện cho các [kiểu dữ liệu](/vi/docs/Web/CSS/Reference/Values/Data_types) phức tạp hơn và chúng có thể nhận một số đối số đầu vào để tính toán giá trị trả về.

## Cú pháp

```plain
selector {
  property: function([argument]? [, argument]!);
}
```

Cú pháp giá trị bắt đầu bằng **tên của hàm**, theo sau là dấu ngoặc trái `(`. Tiếp theo là các đối số, và hàm kết thúc bằng dấu ngoặc phải `)`.

Hàm có thể nhận nhiều đối số, được định dạng tương tự như các giá trị thuộc tính CSS. Khoảng trắng được cho phép, nhưng là tùy chọn bên trong dấu ngoặc. Trong một số ký pháp hàm, nhiều đối số được phân tách bằng dấu phẩy, trong khi các hàm khác dùng dấu cách.

> [!NOTE]
> Các hàm giá trị CSS được dùng làm giá trị thuộc tính và không nên nhầm lẫn với các pseudo-class. Các [pseudo-class hàm](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes#functional_pseudo-classes), [pseudo-class ngôn ngữ](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes#linguistic_pseudo-classes), và một số [pseudo-class cấu trúc cây](/vi/docs/Web/CSS/Reference/Selectors/Pseudo-classes#tree-structural_pseudo-classes) yêu cầu giá trị tham số, nhưng chúng không phải là hàm giá trị. Các at-rule điều kiện cũng không phải là hàm giá trị; dấu ngoặc được dùng để nhóm.

## Hàm biến đổi

Kiểu dữ liệu {{CSSxRef("&lt;transform-function&gt;")}} trong CSS đại diện cho biến đổi ngoại hình. Nó được dùng làm giá trị của thuộc tính {{CSSxRef("transform")}}.

### Hàm dịch chuyển

- {{CSSxRef("transform-function/translateX", "translateX()")}}
  - : Dịch chuyển phần tử theo chiều ngang.
- {{CSSxRef("transform-function/translateY", "translateY()")}}
  - : Dịch chuyển phần tử theo chiều dọc.
- {{CSSxRef("transform-function/translateZ", "translateZ()")}}
  - : Dịch chuyển phần tử dọc theo trục z.
- {{CSSxRef("transform-function/translate", "translate()")}}
  - : Dịch chuyển phần tử trên mặt phẳng 2D.
- {{CSSxRef("transform-function/translate3d", "translate3d()")}}
  - : Dịch chuyển phần tử trong không gian 3D.

### Hàm xoay

- {{CSSxRef("transform-function/rotateX", "rotateX()")}}
  - : Xoay phần tử quanh trục ngang.
- {{CSSxRef("transform-function/rotateY", "rotateY()")}}
  - : Xoay phần tử quanh trục dọc.
- {{CSSxRef("transform-function/rotateZ", "rotateZ()")}}
  - : Xoay phần tử quanh trục z.
- {{CSSxRef("transform-function/rotate", "rotate()")}}
  - : Xoay phần tử quanh một điểm cố định trên mặt phẳng 2D.
- {{CSSxRef("transform-function/rotate3d", "rotate3d()")}}
  - : Xoay phần tử quanh một trục cố định trong không gian 3D.

### Hàm tỷ lệ

- {{CSSxRef("transform-function/scaleX", "scaleX()")}}
  - : Phóng to hoặc thu nhỏ phần tử theo chiều ngang.
- {{CSSxRef("transform-function/scaleY", "scaleY()")}}
  - : Phóng to hoặc thu nhỏ phần tử theo chiều dọc.
- {{CSSxRef("transform-function/scaleZ", "scaleZ()")}}
  - : Phóng to hoặc thu nhỏ phần tử dọc theo trục z.
- {{CSSxRef("transform-function/scale", "scale()")}}
  - : Phóng to hoặc thu nhỏ phần tử trên mặt phẳng 2D.
- {{CSSxRef("transform-function/scale3d", "scale3d()")}}
  - : Phóng to hoặc thu nhỏ phần tử trong không gian 3D.

### Hàm nghiêng

- {{CSSxRef("transform-function/skewX", "skewX()")}}
  - : Nghiêng phần tử theo chiều ngang.
- {{CSSxRef("transform-function/skewY", "skewY()")}}
  - : Nghiêng phần tử theo chiều dọc.
- {{CSSxRef("transform-function/skew", "skew()")}}
  - : Nghiêng phần tử trên mặt phẳng 2D.

### Hàm ma trận

- {{CSSxRef("transform-function/matrix", "matrix()")}}
  - : Mô tả ma trận biến đổi 2D đồng nhất.
- {{CSSxRef("transform-function/matrix3d", "matrix3d()")}}
  - : Mô tả biến đổi 3D dưới dạng ma trận đồng nhất 4×4.

### Hàm phối cảnh

- {{CSSxRef("transform-function/perspective", "perspective()")}}
  - : Đặt khoảng cách giữa người dùng và mặt phẳng z=0.

## Hàm toán học

Các hàm toán học cho phép viết các giá trị số CSS dưới dạng biểu thức toán học.

Mỗi trang bên dưới chứa thông tin chi tiết về cú pháp, dữ liệu tương thích trình duyệt, ví dụ, và nhiều thông tin khác của một hàm toán học. Để có phần giới thiệu toàn diện về các hàm toán học CSS, xem [Sử dụng hàm toán học CSS](/vi/docs/Web/CSS/Guides/Values_and_units/Using_math_functions).

### Số học cơ bản

- {{cssxref("calc()")}}
  - : Thực hiện các phép tính số học cơ bản trên các giá trị số.
- {{cssxref("calc-size()")}}
  - : Thực hiện các phép tính trên các giá trị kích thước nội tại như `auto`, `fit-content`, và `max-content`, vốn không được hỗ trợ bởi hàm `calc()`.

### Hàm so sánh

- {{cssxref("min()")}}
  - : Tính giá trị nhỏ nhất trong danh sách các giá trị.
- {{cssxref("max()")}}
  - : Tính giá trị lớn nhất trong danh sách các giá trị.
- {{cssxref("clamp()")}}
  - : Tính giá trị trung tâm từ giá trị tối thiểu, trung tâm và tối đa.

### Hàm giá trị bậc thang

- {{cssxref("round()")}}
  - : Tính số đã làm tròn dựa trên chiến lược làm tròn.
- {{cssxref("mod()")}}
  - : Tính phần dư modulus (cùng dấu với số chia) khi chia một số cho số khác.
- {{cssxref("progress()")}}
  - : Tính vị trí của một giá trị giữa hai giá trị khác — giá trị bắt đầu và giá trị kết thúc. Kết quả được biểu thị dưới dạng số từ 0 đến 1 đại diện cho tiến trình giữa giá trị bắt đầu và kết thúc.
- {{cssxref("rem()")}}
  - : Tính phần dư (cùng dấu với số bị chia) khi chia một số cho số khác.

### Hàm lượng giác

- {{cssxref("sin()")}}
  - : Tính sin lượng giác của một số.
- {{cssxref("cos()")}}
  - : Tính cos lượng giác của một số.
- {{cssxref("tan()")}}
  - : Tính tan lượng giác của một số.
- {{cssxref("asin()")}}
  - : Tính arcsin lượng giác của một số.
- {{cssxref("acos()")}}
  - : Tính arccos lượng giác của một số.
- {{cssxref("atan()")}}
  - : Tính arctan lượng giác của một số.
- {{cssxref("atan2()")}}
  - : Tính arctan lượng giác của hai số trong một mặt phẳng.

### Hàm mũ

- {{cssxref("pow()")}}
  - : Tính cơ số lũy thừa của một số.
- {{cssxref("sqrt()")}}
  - : Tính căn bậc hai của một số.
- {{cssxref("hypot()")}}
  - : Tính căn bậc hai của tổng bình phương các đối số của nó.
- {{cssxref("log()")}}
  - : Tính logarithm của một số.
- {{cssxref("exp()")}}
  - : Tính `e` lũy thừa của một số.

### Hàm liên quan đến dấu

- {{cssxref("abs()")}}
  - : Tính giá trị tuyệt đối của một số.
- {{cssxref("sign()")}}
  - : Tính dấu (dương hoặc âm) của số.

## Hàm bộ lọc

Kiểu dữ liệu {{cssxref("filter-function")}} trong CSS đại diện cho hiệu ứng đồ họa có thể thay đổi ngoại hình của hình ảnh đầu vào. Nó được dùng trong các thuộc tính {{CSSxRef("filter")}} và {{CSSxRef("backdrop-filter")}}.

- {{CSSxRef("filter-function/blur", "blur()")}}
  - : Tăng độ mờ Gaussian của hình ảnh.
- {{CSSxRef("filter-function/brightness", "brightness()")}}
  - : Làm sáng hoặc tối hình ảnh.
- {{CSSxRef("filter-function/contrast", "contrast()")}}
  - : Tăng hoặc giảm độ tương phản của hình ảnh.
- {{CSSxRef("filter-function/drop-shadow", "drop-shadow()")}}
  - : Áp dụng bóng đổ phía sau hình ảnh.
- {{CSSxRef("filter-function/grayscale", "grayscale()")}}
  - : Chuyển đổi hình ảnh sang thang xám.
- {{CSSxRef("filter-function/hue-rotate", "hue-rotate()")}}
  - : Thay đổi màu tổng thể của hình ảnh.
- {{CSSxRef("filter-function/invert", "invert()")}}
  - : Đảo ngược màu sắc của hình ảnh.
- {{CSSxRef("filter-function/opacity", "opacity()")}}
  - : Thêm độ trong suốt vào hình ảnh.
- {{CSSxRef("filter-function/saturate", "saturate()")}}
  - : Thay đổi độ bão hòa tổng thể của hình ảnh.
- {{CSSxRef("filter-function/sepia", "sepia()")}}
  - : Tăng màu sepia của hình ảnh.

## Hàm màu sắc

Kiểu dữ liệu {{CSSxRef("color_value","&lt;color&gt;")}} trong CSS chỉ định các biểu diễn màu sắc khác nhau.

- {{CSSxRef("color_value/rgb", "rgb()")}}
  - : Xác định màu sắc đã cho theo các thành phần đỏ, xanh lá, xanh lam và alpha (độ trong suốt) của nó.
- {{CSSxRef("color_value/hsl", "hsl()")}}
  - : Xác định màu sắc đã cho theo các thành phần màu sắc, độ bão hòa, độ sáng và alpha (độ trong suốt) của nó.
- {{CSSxRef("color_value/hwb", "hwb()")}}
  - : Xác định màu sắc đã cho theo các thành phần màu sắc, độ trắng và độ đen của nó.
- {{CSSxRef("color_value/lch", "lch()")}}
  - : Xác định màu sắc đã cho theo các thành phần độ sáng, độ màu và màu sắc của nó.
- {{CSSxRef("color_value/oklch", "oklch()")}}
  - : Xác định màu sắc đã cho theo các thành phần độ sáng, độ màu, màu sắc và alpha (độ trong suốt) của nó.
- {{CSSxRef("color_value/lab", "lab()")}}
  - : Xác định màu sắc đã cho theo độ sáng, khoảng cách trục a và khoảng cách trục b trong không gian màu Lab.
- {{CSSxRef("color_value/oklab", "oklab()")}}
  - : Xác định màu sắc đã cho theo độ sáng, khoảng cách trục a, khoảng cách trục b trong không gian màu Lab và alpha (độ trong suốt).
- {{CSSxRef("color_value/color", "color()")}}
  - : Chỉ định một không gian màu cụ thể thay vì không gian màu sRGB ngầm định.
- {{CSSxRef("color_value/color-mix", "color-mix()")}}
  - : Pha trộn hai giá trị màu sắc trong một không gian màu đã cho theo lượng đã cho.
- {{CSSxRef("color_value/contrast-color", "contrast-color()")}}
  - : Trả về màu có độ tương phản màu tối đa cho một màu đã cho.
- {{CSSxRef("color_value/device-cmyk", "device-cmyk()")}}
  - : Xác định màu CMYK theo cách phụ thuộc thiết bị.
- {{CSSXref("color_value/light-dark", "light-dark()")}}
  - : Trả về một trong hai màu sắc được cung cấp dựa trên bảng màu hiện tại.
- {{cssxref("dynamic-range-limit-mix()")}}
  - : Tạo giới hạn độ sáng tối đa tùy chỉnh là sự pha trộn của các từ khóa {{cssxref("dynamic-range-limit")}} khác nhau theo tỷ lệ phần trăm đã chỉ định.

## Hàm hình ảnh

Kiểu dữ liệu {{cssxref("image")}} trong CSS cung cấp biểu diễn đồ họa của hình ảnh hoặc gradient.

### Hàm gradient

- {{CSSxRef("gradient/linear-gradient","linear-gradient()")}}
  - : Gradient tuyến tính chuyển đổi màu dần dần dọc theo một đường thẳng tưởng tượng.
- {{CSSxRef("gradient/radial-gradient","radial-gradient()")}}
  - : Gradient xuyên tâm chuyển đổi màu dần dần từ một điểm trung tâm (điểm gốc).
- {{CSSxRef("gradient/conic-gradient", "conic-gradient()")}}
  - : Gradient hình nón chuyển đổi màu dần dần xung quanh một vòng tròn.
- {{CSSxRef("gradient/repeating-linear-gradient","repeating-linear-gradient()")}}
  - : Tương tự như `linear-gradient()` và nhận các đối số giống nhau, nhưng nó lặp lại các điểm dừng màu vô hạn theo mọi hướng để bao phủ toàn bộ vùng chứa.
- {{CSSxRef("gradient/repeating-radial-gradient","repeating-radial-gradient()")}}
  - : Tương tự như `radial-gradient()` và nhận các đối số giống nhau, nhưng nó lặp lại các điểm dừng màu vô hạn theo mọi hướng để bao phủ toàn bộ vùng chứa.
- {{CSSxRef("gradient/repeating-conic-gradient","repeating-conic-gradient()")}}
  - : Tương tự như `conic-gradient()` và nhận các đối số giống nhau, nhưng nó lặp lại các điểm dừng màu vô hạn theo mọi hướng để bao phủ toàn bộ vùng chứa.

### Hàm hình ảnh

- {{CSSxRef("image/image","image()")}}
  - : Xác định {{cssxref("image")}} theo cách tương tự như kiểu {{cssxref("url_value", "&lt;url&gt;")}}, nhưng với tính năng bổ sung bao gồm chỉ định hướng của hình ảnh và hình ảnh dự phòng khi hình ảnh ưa thích không được hỗ trợ.
- {{CSSxRef("image/image-set","image-set()")}}
  - : Chọn hình ảnh CSS phù hợp nhất từ một tập hợp đã cho, chủ yếu cho màn hình có mật độ pixel cao.
- {{cssxref("cross-fade()")}}
  - : Pha trộn hai hoặc nhiều hình ảnh với độ trong suốt đã xác định.
- {{cssxref("element()")}}
  - : Xác định giá trị {{cssxref("image")}} được tạo ra từ một phần tử HTML tùy ý.
- {{CSSxRef("image/paint", "paint()")}}
  - : Xác định giá trị {{cssxref("image")}} được tạo ra bằng PaintWorklet.

## Hàm đếm

Các hàm đếm CSS thường được dùng với thuộc tính {{CSSxRef("content")}}, mặc dù về lý thuyết, chúng có thể được dùng bất cứ nơi nào {{CSSxRef("&lt;string&gt;")}} được hỗ trợ.

- {{cssxref("counter()")}}
  - : Trả về một chuỗi đại diện cho giá trị hiện tại của bộ đếm được đặt tên nếu có.
- {{cssxref("counters()")}}
  - : Cho phép các bộ đếm lồng nhau, trả về một chuỗi nối đại diện cho các giá trị hiện tại của các bộ đếm được đặt tên, nếu có.
- {{cssxref("symbols()")}}
  - : Xác định kiểu bộ đếm nội tuyến, trực tiếp là giá trị của một thuộc tính.

## Hàm hình dạng

### Hình dạng cơ bản

Kiểu dữ liệu {{cssxref("basic-shape")}} trong CSS đại diện cho một hình dạng đồ họa. Nó được dùng trong các thuộc tính {{CSSxRef("clip-path")}}, {{CSSxRef("offset-path")}}, và {{CSSxRef("shape-outside")}}.

- {{CSSxRef("basic-shape/circle","circle()")}}
  - : Xác định hình dạng hình tròn.
- {{CSSxRef("basic-shape/ellipse","ellipse()")}}
  - : Xác định hình dạng hình ellipse.
- {{CSSxRef("basic-shape/inset","inset()")}}
  - : Xác định hình dạng hình chữ nhật lùi vào.
- {{CSSxRef("basic-shape/rect","rect()")}}
  - : Xác định hình dạng hình chữ nhật sử dụng khoảng cách từ các cạnh trên và trái của hộp tham chiếu.
- {{CSSxRef("basic-shape/xywh","xywh()")}}
  - : Xác định hình dạng hình chữ nhật sử dụng các khoảng cách được chỉ định từ các cạnh trên và trái của hộp tham chiếu cùng với chiều rộng và chiều cao của hình chữ nhật.
- {{CSSxRef("basic-shape/polygon","polygon()")}}
  - : Xác định hình dạng đa giác.
- {{CSSxRef("basic-shape/path", "path()")}}
  - : Chấp nhận chuỗi đường dẫn SVG để cho phép vẽ một hình dạng.
- {{CSSxRef("basic-shape/shape", "shape()")}}
  - : Chấp nhận danh sách lệnh phân tách bằng dấu phẩy xác định hình dạng cần vẽ.

### Các hàm hình dạng khác

- {{cssxref("ray()")}}
  - : Hợp lệ với {{cssxref("offset-path")}}; xác định đoạn đường mà phần tử được tạo hoạt ảnh có thể đi theo.
- {{CSSxRef("superellipse()")}}
  - : Xác định độ cong của một ellipse; có thể được dùng để chỉ định {{cssxref("corner-shape-value")}}, được dùng với {{cssxref("corner-shape")}} và các thuộc tính [thành phần](/vi/docs/Web/CSS/Reference/Properties/corner-shape#constituent_properties) và [liên quan](/vi/docs/Web/CSS/Reference/Properties/corner-shape#properties_that_follow_the_corner_shape) của nó.

## Hàm tham chiếu

Các hàm sau được dùng làm giá trị của các thuộc tính để tham chiếu đến giá trị được xác định ở nơi khác:

- {{cssxref("attr()")}}
  - : Sử dụng các thuộc tính được xác định trên phần tử HTML.
- {{cssxref("env()")}}
  - : Sử dụng biến môi trường do user-agent xác định.
- {{cssxref("if()")}}
  - : Đặt giá trị thuộc tính có điều kiện tùy thuộc vào kết quả của [truy vấn kiểu](/vi/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries#container_style_queries), [truy vấn media](/vi/docs/Web/CSS/Guides/Media_queries/Using), hoặc [truy vấn tính năng](/vi/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries).
- {{cssxref("url_function", "url()")}}
  - : Sử dụng tệp từ URL được chỉ định.
- {{cssxref("var()")}}
  - : Sử dụng giá trị thuộc tính tùy chỉnh thay vì bất kỳ phần nào của giá trị của một thuộc tính khác.

## Hàm grid

Các hàm sau được dùng để xác định [CSS grid](/vi/docs/Web/CSS/Guides/Grid_layout):

- {{cssxref("fit-content()")}}
  - : Kẹp kích thước đã cho vào kích thước khả dụng theo công thức `min(kích thước tối đa, max(kích thước tối thiểu, đối số))`.
- {{cssxref("minmax()")}}
  - : Xác định phạm vi kích thước lớn hơn hoặc bằng _min_ và nhỏ hơn hoặc bằng _max_.
- {{cssxref("repeat()")}}
  - : Đại diện cho một đoạn lặp lại của danh sách track, cho phép số lượng lớn các cột hoặc hàng thể hiện một mẫu lặp đi lặp lại.

## Hàm phông chữ

Các hàm phông chữ CSS được dùng với thuộc tính {{CSSxRef("font-variant-alternates")}} để kiểm soát việc sử dụng các ký tự thay thế.

- {{CSSxRef("font-variant-alternates#stylistic", "stylistic()")}}
  - : Bật các kiểu thay thế cho từng ký tự. Tham số là tên phông chữ cụ thể được ánh xạ tới một số. Nó tương ứng với giá trị OpenType `salt`, như `salt 2`.
- {{CSSxRef("font-variant-alternates#styleset", "styleset()")}}
  - : Bật các kiểu thay thế cho tập hợp ký tự. Tham số là tên phông chữ cụ thể được ánh xạ tới một số. Nó tương ứng với giá trị OpenType `ssXY`, chẳng hạn như `ss02`.
- {{CSSxRef("font-variant-alternates#character-variant", "character-variant()")}}
  - : Bật các kiểu thay thế cụ thể cho ký tự. Nó tương tự như `styleset()`, nhưng không tạo ra các ký tự nhất quán cho một tập hợp ký tự; các ký tự riêng lẻ sẽ có kiểu dáng độc lập và không nhất thiết phải nhất quán. Tham số là tên phông chữ cụ thể được ánh xạ tới một số. Nó tương ứng với giá trị OpenType `cvXY`, chẳng hạn như `cv02`.
- {{CSSxRef("font-variant-alternates#swash", "swash()")}}
  - : Bật các ký tự [swash](https://en.wikipedia.org/wiki/Swash_%28typography%29). Tham số là tên phông chữ cụ thể được ánh xạ tới một số. Nó tương ứng với các giá trị OpenType `swsh` và `cswh`, chẳng hạn như `swsh 2` và `cswh 2`.
- {{CSSxRef("font-variant-alternates#ornaments", "ornaments()")}}
  - : Bật các trang trí như [fleurons](https://en.wikipedia.org/wiki/Fleuron_%28typography%29) và các ký tự dingbat khác. Tham số là tên phông chữ cụ thể được ánh xạ tới một số. Nó tương ứng với giá trị OpenType `ornm`, chẳng hạn như `ornm 2`.
- {{CSSxRef("font-variant-alternates#annotation", "annotation()")}}
  - : Bật các chú thích như chữ số có vòng tròn hoặc ký tự đảo ngược. Tham số là tên phông chữ cụ thể được ánh xạ tới một số. Nó tương ứng với giá trị OpenType `nalt`, chẳng hạn như `nalt 2`.

## Hàm easing

Kiểu dữ liệu {{cssxref("easing-function")}} trong CSS đại diện cho một hàm toán học. Nó được dùng trong các thuộc tính chuyển đổi và hoạt ảnh:

- {{cssxref("easing-function/linear", "linear()")}}
  - : Hàm easing nội suy tuyến tính giữa các điểm của nó.
- {{cssxref("easing-function/cubic-bezier", "cubic-bezier()")}}
  - : Hàm easing xác định đường cong Bézier bậc ba.
- {{cssxref("easing-function/steps", "steps()")}}
  - : Lặp dọc theo số điểm dừng được chỉ định trong quá trình chuyển đổi, hiển thị mỗi điểm dừng trong khoảng thời gian bằng nhau.

## Hàm hoạt ảnh

Các hàm sau được dùng làm giá trị của các thuộc tính {{CSSxRef("animation-timeline")}} khác nhau:

- {{cssxref("animation-timeline/scroll", "scroll()")}}
  - : Đặt {{cssxref("animation-timeline")}} của phần tử thành _timeline tiến trình cuộn ẩn danh_.
- {{cssxref("animation-timeline/view", "view()")}}
  - : Đặt {{cssxref("animation-timeline")}} của phần tử thành _timeline tiến trình xem ẩn danh_.

## Hàm định vị neo

Các hàm định vị neo được dùng khi định vị và xác định kích thước các phần tử được định vị bằng neo tương đối với vị trí và kích thước của các phần tử neo liên kết với chúng.

- {{cssxref("anchor()")}}
  - : Trả về độ dài tương đối với vị trí các cạnh của phần tử neo liên kết của phần tử được định vị bằng neo.
- {{cssxref("anchor-size()")}}
  - : Trả về độ dài tương đối với kích thước của phần tử neo liên kết.

## Hàm đếm cây

Các hàm sau trả về giá trị số nguyên dựa trên cây DOM, thay vì cây phẳng như hầu hết các giá trị CSS:

- {{cssxref("sibling-index()")}}
  - : Trả về số nguyên phản ánh vị trí của phần tử được chọn trong số các phần tử anh chị em của nó.
- {{cssxref("sibling-count()")}}
  - : Trả về số nguyên phản ánh tổng số phần tử anh chị em, bao gồm cả phần tử được chọn.

## Chỉ mục bảng chữ cái của các hàm

- {{cssxref("-moz-image-rect")}} {{non-standard_inline}} {{deprecated_inline}}
- {{cssxref("abs")}}
- {{cssxref("acos")}}
- {{cssxref("anchor")}}
- {{cssxref("anchor-size")}}
- {{cssxref("asin")}}
- {{cssxref("atan")}}
- {{cssxref("atan2")}}
- {{cssxref("attr")}}
- {{cssxref("filter-function/blur", "blur()")}}
- {{cssxref("filter-function/brightness", "brightness()")}}
- {{cssxref("calc")}}
- {{cssxref("calc-size")}} {{experimental_inline}}
- {{cssxref("basic-shape/circle", "circle()")}}
- {{cssxref("clamp")}}
- {{cssxref("color_value/color", "color()")}}
- {{cssxref("color_value/color-mix", "color-mix()")}}
- {{cssxref("gradient/conic-gradient", "conic-gradient()")}}
- {{cssxref("filter-function/contrast", "contrast()")}}
- {{cssxref("color_value/contrast-color", "contrast-color()")}} {{experimental_inline}}
- {{cssxref("cos")}}
- {{cssxref("counter")}}
- {{cssxref("counters")}}
- {{cssxref("cross-fade")}}
- {{cssxref("easing-function/cubic-bezier", "cubic-bezier()")}}
- {{cssxref("color_value/device-cmyk", "device-cmyk()")}}
- {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
- {{cssxref("dynamic-range-limit-mix")}} {{experimental_inline}}
- {{cssxref("element")}} {{experimental_inline}}
- {{cssxref("basic-shape/ellipse", "ellipse()")}}
- {{cssxref("env")}}
- {{cssxref("exp")}}
- {{cssxref("fit-content()")}}
- {{cssxref("filter-function/grayscale", "grayscale()")}}
- {{cssxref("color_value/hsl", "hsl()")}}
- {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}
- {{cssxref("color_value/hwb", "hwb()")}}
- {{cssxref("hypot")}}
- {{cssxref("if")}} {{experimental_inline}}
- {{cssxref("image/image", "image()")}}
- {{cssxref("image/image-set", "image-set()")}}
- {{cssxref("basic-shape/inset", "inset()")}}
- {{cssxref("filter-function/invert", "invert()")}}
- {{cssxref("color_value/lab", "lab()")}}
- {{cssxref("@import/layer_function", "layer()")}}
- {{cssxref("color_value/lch", "lch()")}}
- {{cssxref("color_value/light-dark", "light-dark()")}}
- {{cssxref("easing-function/linear", "linear()")}}
- {{cssxref("gradient/linear-gradient", "linear-gradient()")}}
- {{cssxref("log")}}
- {{cssxref("transform-function/matrix", "matrix()")}}
- {{cssxref("transform-function/matrix3d", "matrix3d()")}}
- {{cssxref("max")}}
- {{cssxref("min")}}
- {{cssxref("minmax")}}
- {{cssxref("mod")}}
- {{cssxref("color_value/oklab", "oklab()")}}
- {{cssxref("color_value/oklch", "oklch()")}}
- {{cssxref("filter-function/opacity", "opacity()")}}
- {{cssxref("image/paint", "paint()")}}
- {{cssxref("font-palette/palette-mix", "palette-mix()")}}
- {{cssxref("basic-shape/path", "path()")}}
- {{cssxref("transform-function/perspective", "perspective()")}}
- {{cssxref("basic-shape/polygon", "polygon()")}}
- {{cssxref("pow")}}
- {{cssxref("progress")}} {{experimental_inline}}
- {{cssxref("gradient/radial-gradient", "radial-gradient()")}}
- {{cssxref("random")}}
- {{cssxref("ray")}}
- {{cssxref("basic-shape/rect", "rect()")}}
- {{cssxref("rem")}}
- {{cssxref("repeat")}}
- {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}
- {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}
- {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}
- {{cssxref("color_value/rgb", "rgb()")}}
- {{cssxref("transform-function/rotate", "rotate()")}}
- {{cssxref("transform-function/rotate3d", "rotate3d()")}}
- {{cssxref("transform-function/rotateX", "rotateX()")}}
- {{cssxref("transform-function/rotateY", "rotateY()")}}
- {{cssxref("transform-function/rotateZ", "rotateZ()")}}
- {{cssxref("round")}}
- {{cssxref("filter-function/saturate", "saturate()")}}
- {{cssxref("transform-function/scale", "scale()")}}
- {{cssxref("transform-function/scale3d", "scale3d()")}}
- {{cssxref("transform-function/scaleX", "scaleX()")}}
- {{cssxref("transform-function/scaleY", "scaleY()")}}
- {{cssxref("transform-function/scaleZ", "scaleZ()")}}
- {{cssxref("animation-timeline/scroll", "scroll()")}}
- {{cssxref("filter-function/sepia", "sepia()")}}
- {{cssxref("basic-shape/shape", "shape()")}}
- {{cssxref("sibling-count")}} {{experimental_inline}}
- {{cssxref("sibling-index")}} {{experimental_inline}}
- {{cssxref("sign")}}
- {{cssxref("sin")}}
- {{cssxref("transform-function/skew", "skew()")}}
- {{cssxref("transform-function/skewx", "skewx()")}}
- {{cssxref("transform-function/skewy", "skewy()")}}
- {{cssxref("sqrt")}}
- {{cssxref("easing-function/steps", "steps()")}}
- {{cssxref("superellipse")}} {{experimental_inline}}
- {{cssxref("symbols")}}
- {{cssxref("tan")}}
- {{cssxref("transform-function/translate", "translate()")}}
- {{cssxref("transform-function/translate3d", "translate3d()")}}
- {{cssxref("transform-function/translateX", "translateX()")}}
- {{cssxref("transform-function/translateY", "translateY()")}}
- {{cssxref("transform-function/translateZ", "translateZ()")}}
- {{cssxref("type")}} {{experimental_inline}}
- {{cssxref("url_function", "url()")}}
- {{cssxref("var")}}
- {{cssxref("animation-timeline/view", "view()")}}
- {{cssxref("basic-shape/xywh", "xywh()")}}

## Xem thêm

- Module [CSS values and units](/vi/docs/Web/CSS/Guides/Values_and_units)
- [Tìm hiểu: Giá trị và đơn vị](/vi/docs/Learn_web_development/Core/Styling_basics/Values_and_units)
