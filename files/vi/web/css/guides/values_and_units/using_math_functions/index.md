---
title: Using CSS math functions
short-title: Using math functions
slug: Web/CSS/Guides/Values_and_units/Using_math_functions
page-type: guide
sidebar: cssref
---

**Hàm toán học CSS** cho phép viết giá trị thuộc tính — chẳng hạn như `height`, `animation-duration` hay `font-size` của một phần tử — dưới dạng biểu thức toán học.

Không cần dùng đến toán học, các [đơn vị CSS](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units) tích hợp sẵn như `rem`, `vw` và `%` thường đủ linh hoạt để tạo kiểu cho các phần tử HTML nhằm đạt được trải nghiệm người dùng mong muốn.

Tuy nhiên, có những trường hợp chúng ta có thể cảm thấy bị giới hạn khi diễn đạt kiểu của phần tử bằng một giá trị và đơn vị duy nhất. Hãy xem xét các ví dụ sau:

1. Chúng ta muốn đặt chiều cao của vùng nội dung là "chiều cao của viewport trừ đi chiều cao của thanh điều hướng".
2. Chúng ta muốn cộng chiều rộng của hai phần tử lại để xác định chiều rộng của phần tử thứ ba.
3. Chúng ta muốn ngăn `font-size` biến đổi của một đoạn văn bản tăng vượt quá một kích thước nhất định.

Trong tất cả các trường hợp này, chúng ta cần dựa vào toán học để đạt được kết quả mong muốn. Một giải pháp có thể là dựa vào các hàm toán học được định nghĩa bởi JavaScript, và tự động đặt kiểu phần tử dựa trên kết quả được tính toán bởi script của chúng ta.

Trong nhiều trường hợp, bao gồm cả các ví dụ trên, **chúng ta có thể thay thế bằng cách sử dụng các hàm toán học được tích hợp trực tiếp trong CSS**. Giải pháp này thường đơn giản hơn để triển khai và nhanh hơn để trình duyệt thực thi so với việc sử dụng JavaScript.

Tổng cộng, các nhà phát triển có thể sử dụng kết hợp [gần hai mươi hàm toán học CSS](/en-US/docs/Web/CSS/Reference/Values/Functions#math_functions) trong stylesheet của họ. Trong hướng dẫn này, chúng ta sẽ minh họa bốn hàm được sử dụng phổ biến hơn và giới thiệu các hàm nâng cao hơn.

## `calc()`: Phép tính cơ bản

Trong hai trong ba ví dụ của chúng ta ở trên, chúng ta muốn đặt kiểu của một phần tử theo kết quả của phép cộng hoặc phép trừ. Đây chính xác là một trong các trường hợp sử dụng của {{cssxref("calc()")}}.

Hàm **`calc()`** cho phép bạn chỉ định các giá trị thuộc tính CSS bằng cách sử dụng **phép cộng, phép trừ, phép nhân và phép chia**. Nó thường được dùng để kết hợp hai giá trị CSS có đơn vị khác nhau, chẳng hạn như `%` và `px`.

Hàm toán học `calc()` nhận một biểu thức toán học làm tham số và trả về kết quả của biểu thức đó, ví dụ:

```css
property: calc(expression);
```

### Ví dụ `calc()`

Nhấp vào biểu tượng play bên dưới để xem ví dụ `calc()` trong sân chơi mã và tự mình thử.

```html hidden
<div class="calc1">
  <code>width: calc(10px + 100px);</code>
</div>
<div class="calc2">
  <code>width: calc(2em * 5);</code>
</div>
<div class="calc3">
  <code>width: calc(100% - 32px);</code>
</div>
<div class="calc4">
  <code>width: calc(var(--predefined-width) - calc(16px * 2));</code>
</div>
```

```css
div {
  background-color: black;
  margin: 4px 0;
  width: 100%;
}

div > code {
  display: block;
  background-color: red;
  color: white;
  height: 48px;
}

.calc1 > code {
  /* Output width: `110px` */
  width: calc(10px + 100px);
}

.calc2 > code {
  /* Output width: `10em` */
  width: calc(2em * 5);
}

.calc3 > code {
  /* Output width: Depends on the container's width */
  width: calc(100% - 32px);
}

.calc4 > code {
  --predefined-width: 100%;
  /* Output width: Depends on the container's width */
  width: calc(var(--predefined-width) - calc(16px * 2));
}
```

{{EmbedLiveSample('calc_Example', '100%', 212) }}

## `min()`: Tìm giá trị nhỏ nhất trong tập hợp

Có những trường hợp chúng ta không muốn giá trị của một thuộc tính CSS vượt quá một số nhất định. Ví dụ, chúng ta muốn chiều rộng của container nội dung là giá trị nhỏ hơn giữa "toàn bộ chiều rộng màn hình" và "500 pixel". Trong những trường hợp đó, chúng ta có thể dùng hàm toán học CSS {{cssxref("min()")}}.

Hàm toán học `min()` nhận một tập hợp các giá trị được phân tách bằng dấu phẩy làm đối số và trả về giá trị nhỏ nhất trong số đó, ví dụ:

```css
width: min(32px, 50%, 2rem);
```

Hàm này thường được dùng để so sánh hai giá trị CSS có đơn vị khác nhau, chẳng hạn như `%` và `px`.

### Ví dụ `min()`

Nhấp vào biểu tượng play bên dưới để xem ví dụ `min()` trong sân chơi mã và tự mình thử.

```html hidden
<div class="min1">
  <code>width: min(9999px, 50%);</code>
</div>
<div class="min2">
  <code>width: min(9999px, 100%);</code>
</div>
<div class="min3">
  <code>width: min(120px, 150px, 90%);</code>
</div>
<div class="min4">
  <code>width: min(80px, 90%);</code>
</div>
```

```css
div {
  background-color: black;
  margin: 4px 0;
  width: 100%;
}

div > code {
  display: block;
  background-color: darkblue;
  color: white;
  height: 48px;
}

.min1 > code {
  /* Output width: Depends on the container's width; */
  /* on this page, likely to be `50%` of the container's width */
  width: min(9999px, 50%);
}

.min2 > code {
  /* Output width: Depends on the container's width; */
  /* on this page, likely to be `100%` of the container's width */
  width: min(9999px, 100%);
}

.min3 > code {
  /* Output width: Depends on the container's width; */
  /* on this page, likely to be `120px` of the container's width */
  width: min(120px, 150px, 90%);
}

.min4 > code {
  /* Output width: Depends on the container's width; */
  /* on this page, likely to be `80px` of the container's width */
  width: min(80px, 90%);
}
```

{{EmbedLiveSample('min_Example', '100%', 212) }}

## `max()`: Tìm giá trị lớn nhất trong tập hợp

Tương tự như `min()`, đôi khi chúng ta không muốn giá trị của một thuộc tính CSS giảm xuống dưới một số nhất định. Ví dụ, chúng ta có thể muốn chiều rộng của container nội dung là giá trị _lớn hơn_ giữa "toàn bộ chiều rộng màn hình" và "500 pixel". Trong những trường hợp đó, chúng ta có thể dùng hàm toán học CSS {{cssxref("max()")}}.

Hàm toán học `max()` nhận một tập hợp các giá trị được phân tách bằng dấu phẩy làm đối số và trả về giá trị lớn nhất trong số đó, ví dụ:

```css
width: max(32px, 50%, 2rem);
```

Hàm này thường được dùng để so sánh hai giá trị CSS có đơn vị khác nhau, chẳng hạn như `%` và `px`.

Hãy chú ý các điểm tương đồng và khác biệt giữa các ví dụ cho `min()` và `max()`.

### Ví dụ `max()`

Nhấp vào biểu tượng play bên dưới để xem ví dụ `max()` trong sân chơi mã và tự mình thử.

```html hidden
<div class="max1">
  <code>width: max(50px, 50%);</code>
</div>
<div class="max2">
  <code>width: max(50px, 100%);</code>
</div>
<div class="max3">
  <code>width: max(20px, 50px, 90%);</code>
</div>
<div class="max4">
  <code>width: max(80px, 80%);</code>
</div>
```

```css
div {
  background-color: black;
  margin: 4px 0;
  width: 100%;
  height: 48px;
}

div > code {
  display: block;
  background-color: darkmagenta;
  color: white;
  height: 48px;
}

.max1 > code {
  /* Output width: Depends on the container's width; */
  /* on this page, likely to be `50%` of the container's width */
  width: max(50px, 50%);
}

.max2 > code {
  /* Output width: Depends on the container's width; */
  /* on this page, likely to be `100%` of the container's width */
  width: max(50px, 100%);
}

.max3 > code {
  /* Output width: Depends on the container's width; */
  /* on this page, likely to be `90%` of the container's width */
  width: max(20px, 50px, 90%);
}

.max4 > code {
  /* Output width: Depends on the container's width; */
  /* on this page, likely to be `80%` of the container's width */
  width: max(80px, 80%);
}
```

{{EmbedLiveSample('max_Example', '100%', 212) }}

## `clamp()`: Ràng buộc giá trị trong khoảng giữa hai giá trị

Chúng ta có thể kết hợp chức năng của `min()` và `max()` bằng cách sử dụng {{cssxref("clamp()")}}. Hàm toán học `clamp()` nhận một giá trị tối thiểu, giá trị cần được ràng buộc và giá trị tối đa làm đối số, ví dụ:

```css
/* clamped value: 50%, minimum: 100px, maximum: 300px */
width: clamp(100px, 50%, 300px);
```

- Nếu giá trị cần ràng buộc nhỏ hơn giá trị tối thiểu đã truyền vào, hàm sẽ trả về giá trị tối thiểu.
- Nếu giá trị cần ràng buộc lớn hơn giá trị tối đa đã truyền vào, hàm sẽ trả về giá trị tối đa.
- Nếu giá trị cần ràng buộc nằm giữa giá trị tối thiểu và tối đa đã truyền vào, hàm sẽ trả về giá trị gốc cần ràng buộc.

Hàm này thường được dùng để so sánh hai giá trị CSS có đơn vị khác nhau, chẳng hạn như `%` và `px`.

### Ví dụ `clamp()`

Nhấp vào biểu tượng play bên dưới để xem ví dụ `clamp()` trong sân chơi mã và tự mình thử.

```html hidden
<div class="clamp1">
  <code>width: clamp(10%, 1px, 90%);</code>
</div>
<div class="clamp2">
  <code>width: clamp(10%, 9999px, 90%);</code>
</div>
<div class="clamp3">
  <code>width: clamp(125px, 1px, 250px);</code>
</div>
<div class="clamp4">
  <code>width: clamp(25px, 9999px, 150px);</code>
</div>
```

```css
div {
  background-color: black;
  margin: 4px 0;
  width: 100%;
  height: 48px;
}

div > code {
  display: block;
  background-color: darkgreen;
  color: white;
  height: 48px;
}

.clamp1 > code {
  /* Output width: Depends on the container's width; */
  /* on this page, likely to be `20%` of the container's width */
  width: clamp(20%, 1px, 80%);
}

.clamp2 > code {
  /* Output width: Depends on the container's width; */
  /* on this page, likely to be `90%` of the container's width */
  width: clamp(10%, 9999px, 90%);
}

.clamp3 > code {
  /* Output width: `125px` */
  width: clamp(125px, 1px, 250px);
}

.clamp4 > code {
  /* Output width: `150px` */
  width: clamp(25px, 9999px, 150px);
}
```

{{EmbedLiveSample('clamp_Example', '100%', 212) }}

## Hàm toán học CSS nâng cao

Khi bố cục và tạo kiểu cho các phần tử DOM, bốn hàm toán học cơ bản {{cssxref("calc()")}}, {{cssxref("min()")}}, {{cssxref("max()")}} và {{cssxref("clamp()")}} thường đủ dùng. Tuy nhiên, cho các mục đích nâng cao như tài liệu học toán học, hiển thị 3D hoặc CSS animations, bạn có thể cân nhắc sử dụng:

- [Hàm giá trị bậc thang](/en-US/docs/Web/CSS/Reference/Values/Functions#stepped_value_functions)
  - {{cssxref("round()")}}: tính toán một **giá trị theo chiến lược làm tròn**
  - {{cssxref("mod()")}}: tính toán **số dư** của phép chia với **dấu giống divisor**
  - {{cssxref("rem()")}}: tính toán **số dư** của phép chia với **dấu giống dividend**
- [Hàm lượng giác](/en-US/docs/Web/CSS/Reference/Values/Functions#trigonometric_functions)
  - {{cssxref("sin()")}}: tính toán **sine lượng giác** của một số
  - {{cssxref("cos()")}}: tính toán **cosine lượng giác** của một số
  - {{cssxref("tan()")}}: tính toán **tangent lượng giác** của một số
  - {{cssxref("asin()")}}: tính toán **arcsine lượng giác** của một số
  - {{cssxref("acos()")}}: tính toán **arccosine lượng giác** của một số
  - {{cssxref("atan()")}}: tính toán **arctangent lượng giác** của một số
  - {{cssxref("atan2()")}}: tính toán **arctangent lượng giác** từ hai số
- [Hàm mũ](/en-US/docs/Web/CSS/Reference/Values/Functions#exponential_functions)
  - {{cssxref("pow()")}}: tính toán một số **nâng lên lũy thừa** của một số khác
  - {{cssxref("sqrt()")}}: tính toán **căn bậc hai** của một số
  - {{cssxref("hypot()")}}: tính toán **căn bậc hai của tổng bình phương** các số đã cho
  - {{cssxref("log()")}}: tính toán **logarithm** của một số (với `e` là cơ số mặc định)
  - {{cssxref("exp()")}}: tính toán **`e` nâng lên lũy thừa** của một số khác
- [Hàm dấu](/en-US/docs/Web/CSS/Reference/Values/Functions#sign-related_functions)
  - {{cssxref("abs()")}}: tính toán **giá trị tuyệt đối** của một số
  - {{cssxref("sign()")}}: tính toán **dấu (dương, âm hoặc không)** của một số

## Suy nghĩ cuối

- Bạn có thể sử dụng các hàm toán học CSS để tạo giao diện người dùng responsive mà không cần viết bất kỳ mã JavaScript nào.
- Các hàm toán học CSS đôi khi có thể được dùng thay thế cho [CSS media queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using) để định nghĩa các breakpoint bố cục.
- Vào năm 2023, các thành viên của Interop Project [đã chọn "CSS Math Functions" là một lĩnh vực cần cải thiện](https://github.com/web-platform-tests/interop/blob/main/2023/README.md#css-math-functions). Điều này có nghĩa là các nhà cung cấp trình duyệt đang cùng nhau đảm bảo rằng các hàm toán học CSS hoạt động nhất quán trên các trình duyệt và thiết bị.
