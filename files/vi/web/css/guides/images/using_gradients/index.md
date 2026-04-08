---
title: Using CSS gradients
short-title: Using gradients
slug: Web/CSS/Guides/Images/Using_gradients
page-type: guide
sidebar: cssref
---

**CSS gradients** được biểu diễn bởi kiểu dữ liệu {{cssxref("gradient")}}, một loại {{cssxref("image")}} đặc biệt được tạo bởi sự chuyển tiếp dần dần giữa hai hoặc nhiều màu sắc. Bạn có thể chọn giữa ba loại gradient: _linear_ (được tạo bằng hàm {{cssxref("gradient/linear-gradient", "linear-gradient()")}}), _radial_ (được tạo bằng hàm {{cssxref("gradient/radial-gradient", "radial-gradient()")}}), và _conic_ (được tạo bằng hàm {{cssxref("gradient/conic-gradient", "conic-gradient()")}}). Bạn cũng có thể tạo repeating gradients với các hàm {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}, {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}, và {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}.

Gradients có thể được sử dụng ở bất kỳ đâu bạn dùng `<image>`, chẳng hạn như trong backgrounds. Vì gradients được tạo ra một cách động, chúng có thể loại bỏ nhu cầu sử dụng các file hình ảnh raster mà trước đây thường được dùng để đạt được các hiệu ứng tương tự. Ngoài ra, vì gradients được trình duyệt tạo ra, chúng trông đẹp hơn hình ảnh raster khi phóng to và có thể thay đổi kích thước ngay lập tức.

Chúng ta sẽ bắt đầu bằng cách giới thiệu linear gradients, sau đó giới thiệu các tính năng được hỗ trợ trong tất cả các loại gradient bằng cách dùng linear gradients làm ví dụ, rồi chuyển sang radial, conic và repeating gradients.

## Sử dụng linear gradients

Một linear gradient tạo ra một dải màu sắc chuyển tiếp theo đường thẳng.

### Linear gradient cơ bản

Để tạo loại gradient đơn giản nhất, bạn chỉ cần chỉ định hai màu. Chúng được gọi là _color stops_. Bạn phải có ít nhất hai, nhưng bạn có thể có bao nhiêu tùy thích.

```html hidden
<div class="simple-linear"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
}
```

```css
.simple-linear {
  background: linear-gradient(blue, pink);
}
```

{{ EmbedLiveSample('A_basic_linear_gradient', 120, 120) }}

### Thay đổi hướng

Theo mặc định, linear gradients chạy từ trên xuống dưới. Bạn có thể thay đổi hướng của chúng bằng cách chỉ định một hướng.

```html hidden
<div class="horizontal-gradient"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
}
```

```css
.horizontal-gradient {
  background: linear-gradient(to right, blue, pink);
}
```

{{ EmbedLiveSample('Changing_the_direction', 120, 120) }}

### Diagonal gradients

Bạn thậm chí có thể làm cho gradient chạy theo đường chéo, từ góc này sang góc kia.

```html hidden
<div class="diagonal-gradient"></div>
```

```css hidden
div {
  width: 200px;
  height: 100px;
}
```

```css
.diagonal-gradient {
  background: linear-gradient(to bottom right, blue, pink);
}
```

{{ EmbedLiveSample('Diagonal_gradients', 200, 100) }}

### Sử dụng góc

Nếu bạn muốn kiểm soát hướng nhiều hơn, bạn có thể cho gradient một góc cụ thể.

```html hidden
<div class="angled-gradient"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
}
```

```css
.angled-gradient {
  background: linear-gradient(70deg, blue, pink);
}
```

{{ EmbedLiveSample('Using_angles', 120, 120) }}

Khi sử dụng góc, `0deg` tạo ra một gradient dọc chạy từ dưới lên trên, `90deg` tạo ra một gradient ngang chạy từ trái sang phải, và cứ thế theo chiều kim đồng hồ. Góc âm chạy ngược chiều kim đồng hồ.

![Bốn hộp liệt kê góc và hiển thị gradient từ đỏ đến trắng tương ứng. 0deg bắt đầu từ dưới lên trên. 90deg bắt đầu từ trái sang phải. 180deg bắt đầu từ trên xuống dưới. -90deg bắt đầu từ phải sang trái.](linear_red_angles.png)

## Khai báo màu sắc & tạo hiệu ứng

Tất cả các loại CSS gradient đều là một dải màu sắc phụ thuộc vào vị trí. Màu sắc do CSS gradients tạo ra có thể thay đổi liên tục theo vị trí, tạo ra các chuyển tiếp màu mượt mà. Nó cũng có thể tạo ra các dải màu đơn sắc và các chuyển tiếp cứng giữa hai màu. Những điều sau đây có hiệu lực với tất cả các hàm gradient:

### Sử dụng nhiều hơn hai màu

Bạn không phải giới hạn bản thân ở hai màu — bạn có thể dùng bao nhiêu màu tùy thích! Theo mặc định, các màu được phân bổ đều dọc theo gradient.

```html hidden
<div class="auto-spaced-linear-gradient"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
}
```

```css
.auto-spaced-linear-gradient {
  background: linear-gradient(red, yellow, blue, orange);
}
```

{{ EmbedLiveSample('Using_more_than_two_colors', 120, 120) }}

### Định vị color stops

Bạn không phải để color stops ở vị trí mặc định của chúng. Để tinh chỉnh vị trí của chúng, bạn có thể cho mỗi cái không, một hoặc hai giá trị phần trăm hoặc, đối với radial và linear gradients, giá trị độ dài tuyệt đối. Nếu bạn chỉ định vị trí là phần trăm, `0%` đại diện cho điểm bắt đầu, trong khi `100%` đại diện cho điểm kết thúc; tuy nhiên, bạn có thể dùng các giá trị ngoài phạm vi đó nếu cần thiết để đạt được hiệu ứng mong muốn. Nếu bạn không chỉ định vị trí cho một color stop, vị trí của color stop cụ thể đó sẽ được tự động tính toán, với color stop đầu tiên ở `0%` và color stop cuối cùng ở `100%`, và bất kỳ color stop nào khác nằm ở giữa các color stop liền kề.

```html hidden
<div class="multicolor-linear"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
}
```

```css
.multicolor-linear {
  background: linear-gradient(to left, lime 28px, red 77%, cyan);
}
```

{{ EmbedLiveSample('Positioning_color_stops', 120, 120) }}

### Tạo đường cứng

Để tạo một đường cứng giữa hai màu, tạo ra một sọc thay vì chuyển tiếp dần dần, các color stops liền kề có thể được đặt ở cùng một vị trí. Trong ví dụ này, các màu chia sẻ một color stop ở mốc `50%`, ở giữa gradient:

```html hidden
<div class="striped"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
}
```

```css
.striped {
  background: linear-gradient(to bottom left, cyan 50%, palegoldenrod 50%);
}
```

{{ EmbedLiveSample('Creating_hard_lines', 120, 120) }}

### Gradient hints

Theo mặc định, gradient chuyển tiếp đều từ màu này sang màu tiếp theo. Bạn có thể bao gồm một color-hint để di chuyển điểm giữa của giá trị chuyển tiếp đến một điểm nhất định dọc theo gradient. Trong ví dụ này, chúng ta đã di chuyển điểm giữa của chuyển tiếp từ mốc 50% xuống mốc 10%.

```html hidden
<div class="color-hint"></div>
<div class="simple-linear"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
  float: left;
  margin-right: 10px;
}
```

```css
.color-hint {
  background: linear-gradient(blue, 10%, pink);
}
.simple-linear {
  background: linear-gradient(blue, pink);
}
```

{{ EmbedLiveSample('Gradient_hints', 120, 120) }}

### Tạo color bands & stripes

Để bao gồm một vùng màu đồng nhất, không chuyển tiếp trong một gradient, hãy bao gồm hai vị trí cho color stop. Color stops có thể có hai vị trí, tương đương với hai color stops liên tiếp có cùng màu ở các vị trí khác nhau. Màu sẽ đạt độ bão hòa đầy đủ tại color stop đầu tiên, duy trì độ bão hòa đó cho đến color stop thứ hai, và chuyển tiếp sang màu của color stop liền kề qua vị trí đầu tiên của color stop liền kề.

```html hidden
<div class="multiposition-stops"></div>
<div class="multiposition-stop2"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
  float: left;
  margin-right: 10px;
  box-sizing: border-box;
}
```

```css
.multiposition-stops {
  background: linear-gradient(
    to left,
    lime 20%,
    red 30%,
    red 45%,
    cyan 55%,
    cyan 70%,
    yellow 80%
  );
  background: linear-gradient(
    to left,
    lime 20%,
    red 30% 45%,
    cyan 55% 70%,
    yellow 80%
  );
}
.multiposition-stop2 {
  background: linear-gradient(
    to left,
    lime 25%,
    red 25%,
    red 50%,
    cyan 50%,
    cyan 75%,
    yellow 75%
  );
  background: linear-gradient(
    to left,
    lime 25%,
    red 25% 50%,
    cyan 50% 75%,
    yellow 75%
  );
}
```

{{ EmbedLiveSample('Creating_color_bands_stripes', 120, 120) }}

Trong ví dụ đầu tiên ở trên, màu xanh lá đi từ mốc 0%, được ngụ ý, đến mốc 20%, chuyển tiếp từ xanh lá sang đỏ trong 10% chiều rộng tiếp theo của gradient, đạt màu đỏ đơn sắc ở mốc 30% và duy trì màu đỏ đơn sắc cho đến 45% qua gradient, nơi nó chuyển dần sang cyan, hoàn toàn là cyan trong 15% gradient, và cứ thế tiếp tục.

Trong ví dụ thứ hai, color stop thứ hai cho mỗi màu nằm ở cùng vị trí với color stop đầu tiên của màu liền kề, tạo ra hiệu ứng sọc.

Trong cả hai ví dụ, gradient được viết hai lần: lần đầu là phương pháp CSS Images Level 3 lặp lại màu cho mỗi stop và ví dụ thứ hai là phương pháp multiple color stop của CSS Images Level 4 bao gồm hai color-stop-lengths trong một khai báo linear-color-stop.

### Kiểm soát tiến trình của gradient

Theo mặc định, một gradient tiến đều giữa các màu của hai color stops liền kề, với điểm giữa giữa hai color stops đó là giá trị màu giữa. Bạn có thể kiểm soát {{Glossary("interpolation")}}, hay tiến trình, giữa hai color stops bằng cách bao gồm một vị trí color hint. Trong ví dụ này, màu đạt đến điểm giữa giữa lime và cyan 20% qua gradient thay vì 50%. Ví dụ thứ hai không chứa hint để làm nổi bật sự khác biệt mà color hint có thể tạo ra:

```html hidden
<div class="color-hint-gradient"></div>
<div class="regular-progression"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
  float: left;
  margin-right: 10px;
  box-sizing: border-box;
}
```

```css
.color-hint-gradient {
  background: linear-gradient(to top, lime, 20%, cyan);
}
.regular-progression {
  background: linear-gradient(to top, lime, cyan);
}
```

{{ EmbedLiveSample('Controlling_the_progression_of_a_gradient', 120, 120) }}

### Chồng lên nhau các gradients

Gradients hỗ trợ độ trong suốt, vì vậy bạn có thể xếp chồng nhiều backgrounds để đạt được một số hiệu ứng khá ấn tượng. Các backgrounds được xếp chồng từ trên xuống dưới, với cái được chỉ định đầu tiên ở trên cùng.

```html hidden
<div class="layered-image"></div>
```

```css hidden
div {
  width: 300px;
  height: 150px;
}
```

```css
.layered-image {
  background:
    linear-gradient(to right, transparent, mistyrose), url("critters.png");
}
```

{{ EmbedLiveSample('Overlaying_gradients', 300, 150) }}

### Xếp chồng các gradients

Bạn thậm chí có thể xếp chồng gradients với các gradients khác. Miễn là các gradients ở trên không hoàn toàn mờ đục, các gradients bên dưới vẫn sẽ hiển thị.

```html hidden
<div class="stacked-linear"></div>
```

```css hidden
div {
  width: 200px;
  height: 200px;
}
```

```css
.stacked-linear {
  background:
    linear-gradient(217deg, rgb(255 0 0 / 80%), transparent 70.71%),
    linear-gradient(127deg, rgb(0 255 0 / 80%), transparent 70.71%),
    linear-gradient(336deg, rgb(0 0 255 / 80%), transparent 70.71%);
}
```

{{ EmbedLiveSample('Stacked_gradients', 200, 200) }}

### Pha trộn gradients

Ngoài độ trong suốt, xếp chồng nhiều gradients bán trong suốt và xếp chồng gradients lên hình ảnh background raster, gradients có thể được sử dụng với các hiệu ứng CSS khác. Trong ví dụ này, bốn phần tử {{htmlelement("div")}} có hai gradients hoàn toàn mờ đục giống nhau làm hình ảnh background. Chúng ta áp dụng các giá trị thuộc tính CSS {{cssxref("background-blend-mode")}} khác nhau cho ba phần tử cuối để pha trộn hai hình ảnh background tạo ra các hiệu ứng khác nhau.

```html hidden
<div class="original"></div>
<div class="screen"></div>
<div class="overlay"></div>
<div class="difference"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
  float: left;
  margin-right: 10px;
  box-sizing: border-box;
}
```

```css
div {
  background:
    linear-gradient(to top, red, blue),
    linear-gradient(to right, #5500ff, #00ff55);
}

.screen {
  background-blend-mode: screen;
}

.overlay {
  background-blend-mode: overlay;
}

.difference {
  background-blend-mode: difference;
}
```

{{ EmbedLiveSample('Blending_gradients', 120, 120) }}

## Sử dụng radial gradients

Radial gradients tương tự như linear gradients, ngoại trừ việc chúng tỏa ra từ một điểm trung tâm. Bạn có thể xác định điểm trung tâm đó ở đâu. Bạn cũng có thể làm cho chúng hình tròn hoặc hình ellipse.

### Radial gradient cơ bản

Cũng như linear gradients, tất cả những gì bạn cần để tạo một radial gradient là hai màu. Theo mặc định, tâm của gradient nằm ở mốc 50% 50%, và gradient có dạng ellipse khớp với {{glossary("aspect ratio")}} của hộp của nó:

```html hidden
<div class="simple-radial"></div>
```

```css hidden
div {
  width: 240px;
  height: 120px;
}
```

```css
.simple-radial {
  background: radial-gradient(red, blue);
}
```

{{ EmbedLiveSample('A_basic_radial_gradient', 120, 120) }}

### Định vị radial color stops

Cũng như linear gradients, bạn có thể định vị mỗi radial color stop bằng phần trăm hoặc độ dài tuyệt đối.

```html hidden
<div class="radial-gradient"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
}
```

```css
.radial-gradient {
  background: radial-gradient(red 10px, yellow 30%, dodgerblue 50%);
}
```

{{ EmbedLiveSample('Positioning_radial_color_stops', 120, 120) }}

### Định vị tâm của gradient

Bạn có thể định vị tâm của gradient bằng từ khóa, phần trăm hoặc độ dài tuyệt đối, giá trị độ dài và phần trăm lặp lại nếu chỉ có một, nếu không thì theo thứ tự vị trí từ trái và vị trí từ trên.

```html hidden
<div class="radial-gradient"></div>
```

```css hidden
div {
  width: 120px;
  height: 240px;
}
```

```css
.radial-gradient {
  background: radial-gradient(at 0% 30%, red 10px, yellow 30%, dodgerblue 50%);
}
```

{{ EmbedLiveSample('Positioning_the_center_of_the_gradient', 120, 120) }}

### Điều chỉnh kích thước radial gradients

Không giống linear gradients, bạn có thể chỉ định kích thước của radial gradients. Các giá trị có thể bao gồm `closest-corner`, `closest-side`, `farthest-corner` và `farthest-side`, với `farthest-corner` là mặc định. Hình tròn cũng có thể được kích thước bằng một độ dài, và hình ellipse bằng độ dài hoặc phần trăm.

#### Ví dụ: `closest-side` cho ellipses

Ví dụ này sử dụng giá trị kích thước `closest-side`, có nghĩa là kích thước được đặt bởi khoảng cách từ điểm bắt đầu (tâm) đến cạnh gần nhất của hộp bao quanh.

```html hidden
<div class="radial-ellipse-side"></div>
```

```css hidden
div {
  width: 240px;
  height: 100px;
}
```

```css
.radial-ellipse-side {
  background: radial-gradient(
    ellipse closest-side,
    red,
    yellow 10%,
    dodgerblue 50%,
    beige
  );
}
```

{{ EmbedLiveSample('Example_closest-side_for_ellipses', 240, 100) }}

#### Ví dụ: `farthest-corner` cho ellipses

Ví dụ này tương tự như ví dụ trước, ngoại trừ kích thước của nó được chỉ định là `farthest-corner`, đặt kích thước của gradient bởi khoảng cách từ điểm bắt đầu đến góc xa nhất của hộp bao quanh từ điểm bắt đầu.

```html hidden
<div class="radial-ellipse-far"></div>
```

```css hidden
div {
  width: 240px;
  height: 100px;
}
```

```css
.radial-ellipse-far {
  background: radial-gradient(
    ellipse farthest-corner at 90% 90%,
    red,
    yellow 10%,
    dodgerblue 50%,
    beige
  );
}
```

{{ EmbedLiveSample('Example_farthest-corner_for_ellipses', 240, 100) }}

#### Ví dụ: `closest-side` cho circles

Ví dụ này sử dụng `closest-side`, làm cho bán kính của hình tròn là khoảng cách giữa tâm của gradient và cạnh gần nhất. Trong trường hợp này, bán kính là khoảng cách giữa tâm và cạnh dưới, vì gradient được đặt cách bên trái 25% và cách dưới 25%, và chiều cao của phần tử div nhỏ hơn chiều rộng.

```html hidden
<div class="radial-circle-close"></div>
```

```css hidden
div {
  width: 240px;
  height: 120px;
}
```

```css
.radial-circle-close {
  background: radial-gradient(
    circle closest-side at 25% 75%,
    red,
    yellow 10%,
    dodgerblue 50%,
    beige
  );
}
```

{{ EmbedLiveSample('Example_closest-side_for_circles', 240, 120) }}

#### Ví dụ: độ dài hoặc phần trăm cho ellipses

Chỉ với ellipses, bạn có thể định kích thước ellipse bằng độ dài hoặc phần trăm. Giá trị đầu tiên đại diện cho bán kính ngang, giá trị thứ hai là bán kính dọc, khi bạn dùng phần trăm, nó tương ứng với kích thước của hộp theo chiều đó. Trong ví dụ dưới đây tôi đã dùng phần trăm cho bán kính ngang.

```html hidden
<div class="radial-ellipse-size"></div>
```

```css hidden
div {
  width: 240px;
  height: 120px;
}
```

```css
.radial-ellipse-size {
  background: radial-gradient(
    ellipse 50% 50px,
    red,
    yellow 10%,
    dodgerblue 50%,
    beige
  );
}
```

{{ EmbedLiveSample('Example_length_or_percentage_for_ellipses', 240, 120) }}

#### Ví dụ: độ dài cho circles

Đối với circles, kích thước có thể được cho dưới dạng {{cssxref("length")}}, là kích thước của hình tròn.

```html hidden
<div class="radial-circle-size"></div>
```

```css hidden
div {
  width: 240px;
  height: 120px;
}
```

```css
.radial-circle-size {
  background: radial-gradient(
    circle 50px,
    red,
    yellow 10%,
    dodgerblue 50%,
    beige
  );
}
```

{{ EmbedLiveSample('Example_length_for_circles', 240, 120) }}

### Xếp chồng radial gradients

Cũng như linear gradients, bạn cũng có thể xếp chồng radial gradients. Cái được chỉ định đầu tiên ở trên cùng, cái cuối cùng ở dưới cùng.

```html hidden
<div class="stacked-radial"></div>
```

```css hidden
div {
  width: 200px;
  height: 200px;
}
```

```css
.stacked-radial {
  background:
    radial-gradient(circle at 50% 0, rgb(255 0 0 / 50%), transparent 70.71%),
    radial-gradient(circle at 6.7% 75%, rgb(0 0 255 / 50%), transparent 70.71%),
    radial-gradient(circle at 93.3% 75%, rgb(0 255 0 / 50%), transparent 70.71%)
      beige;
  border-radius: 50%;
}
```

{{ EmbedLiveSample('Stacked_radial_gradients', 200, 200) }}

## Sử dụng conic gradients

Hàm **`conic-gradient()`** [CSS](/en-US/docs/Web/CSS) tạo ra một hình ảnh bao gồm một gradient với các chuyển tiếp màu xoay quanh một điểm trung tâm (thay vì tỏa ra từ tâm). Ví dụ về conic gradients bao gồm biểu đồ hình tròn và {{glossary("color wheel", "vòng màu")}}, nhưng chúng cũng có thể được dùng để tạo bàn cờ và các hiệu ứng thú vị khác.

Cú pháp conic-gradient tương tự như cú pháp radial-gradient, nhưng các color-stops được đặt xung quanh một cung gradient, chu vi của một vòng tròn, thay vì trên đường gradient phát ra từ tâm của gradient, và các color-stops là phần trăm hoặc độ: độ dài tuyệt đối không hợp lệ.

Trong một radial gradient, màu sắc chuyển tiếp từ tâm của một ellipse, ra ngoài, theo tất cả các hướng. Với conic gradients, màu sắc chuyển tiếp như thể quay quanh tâm của một vòng tròn, bắt đầu từ trên cùng và đi theo chiều kim đồng hồ. Tương tự như radial gradients, bạn có thể định vị tâm của gradient. Tương tự như linear gradients, bạn có thể thay đổi góc gradient.

### Conic gradient cơ bản

Cũng như linear và radial gradients, tất cả những gì bạn cần để tạo một conic gradient là hai màu. Theo mặc định, tâm của gradient nằm ở mốc 50% 50%, với điểm bắt đầu của gradient hướng lên:

```html hidden
<div class="simple-conic"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
}
```

```css
.simple-conic {
  background: conic-gradient(red, blue);
}
```

{{ EmbedLiveSample('A_basic_conic_gradient', 120, 120) }}

### Định vị tâm conic

Như radial gradients, bạn có thể định vị tâm của conic gradient bằng từ khóa, phần trăm hoặc độ dài tuyệt đối, với từ khóa "at".

```html hidden
<div class="conic-gradient"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
}
```

```css
.conic-gradient {
  background: conic-gradient(at 0% 30%, red 10%, yellow 30%, dodgerblue 50%);
}
```

{{ EmbedLiveSample('Positioning_the_conic_center', 120, 120) }}

### Thay đổi góc

Theo mặc định, các color stops khác nhau mà bạn chỉ định được phân bổ đều xung quanh vòng tròn. Bạn có thể định vị góc bắt đầu của conic gradient bằng từ khóa "from" ở đầu theo sau bởi một góc hoặc độ dài, và bạn có thể chỉ định các vị trí khác nhau cho các color stops bằng cách bao gồm một góc hoặc độ dài sau chúng.

```html hidden
<div class="conic-gradient"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
}
```

```css
.conic-gradient {
  background: conic-gradient(from 45deg, red, orange 50%, yellow 85%, green);
}
```

{{ EmbedLiveSample('Changing_the_angle', 120, 120) }}

## Sử dụng repeating gradients

Các hàm {{cssxref("gradient/linear-gradient", "linear-gradient()")}}, {{cssxref("gradient/radial-gradient", "radial-gradient()")}} và {{cssxref("gradient/conic-gradient", "conic-gradient()")}} không hỗ trợ tự động lặp lại color stops. Tuy nhiên, các hàm {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}, {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}} và {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}} có sẵn để cung cấp chức năng này.

Kích thước của đường gradient hoặc cung lặp lại là độ dài giữa giá trị color stop đầu tiên và giá trị độ dài color stop cuối cùng. Nếu color stop đầu tiên chỉ có màu mà không có độ dài color stop, giá trị mặc định là 0. Nếu color stop cuối cùng chỉ có màu mà không có độ dài color stop, giá trị mặc định là 100%. Nếu không có giá trị nào được khai báo, đường gradient là 100%, có nghĩa là linear và conic gradients sẽ không lặp lại và radial gradient chỉ lặp lại nếu bán kính của gradient nhỏ hơn độ dài giữa tâm của gradient và góc xa nhất. Nếu color stop đầu tiên được khai báo và giá trị lớn hơn 0, gradient sẽ lặp lại, vì kích thước của đường hoặc cung là hiệu giữa color stop đầu tiên và color stop cuối cùng nhỏ hơn 100% hoặc 360 độ.

### Repeating linear gradients

Ví dụ này sử dụng {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}} để tạo một gradient tiến đi liên tục theo đường thẳng. Màu sắc được lặp đi lặp lại khi gradient lặp lại. Trong trường hợp này, đường gradient dài 10px.

```html hidden
<div class="repeating-linear"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
}
```

```css
.repeating-linear {
  background: repeating-linear-gradient(
    -45deg,
    red,
    red 5px,
    blue 5px,
    blue 10px
  );
}
```

{{ EmbedLiveSample('Repeating_linear_gradients', 120, 120) }}

### Nhiều repeating linear gradients

Tương tự như linear và radial gradients thông thường, bạn có thể bao gồm nhiều gradients, cái này chồng lên cái kia. Điều này chỉ có ý nghĩa nếu các gradients một phần trong suốt cho phép các gradients tiếp theo hiển thị qua các vùng trong suốt, hoặc nếu bạn bao gồm các [background-sizes](/en-US/docs/Web/CSS/Reference/Properties/background-size) khác nhau, tùy chọn với các giá trị thuộc tính [background-position](/en-US/docs/Web/CSS/Reference/Properties/background-position) khác nhau, cho mỗi hình ảnh gradient. Chúng ta đang sử dụng độ trong suốt.

Trong trường hợp này, các đường gradient có độ dài 300px, 230px và 300px.

```html hidden
<div class="multi-repeating-linear"></div>
```

```css hidden
div {
  width: 600px;
  height: 400px;
}
```

```css
.multi-repeating-linear {
  background:
    repeating-linear-gradient(
      190deg,
      rgb(255 0 0 / 50%) 40px,
      rgb(255 153 0 / 50%) 80px,
      rgb(255 255 0 / 50%) 120px,
      rgb(0 255 0 / 50%) 160px,
      rgb(0 0 255 / 50%) 200px,
      rgb(75 0 130 / 50%) 240px,
      rgb(238 130 238 / 50%) 280px,
      rgb(255 0 0 / 50%) 300px
    ),
    repeating-linear-gradient(
      -190deg,
      rgb(255 0 0 / 50%) 30px,
      rgb(255 153 0 / 50%) 60px,
      rgb(255 255 0 / 50%) 90px,
      rgb(0 255 0 / 50%) 120px,
      rgb(0 0 255 / 50%) 150px,
      rgb(75 0 130 / 50%) 180px,
      rgb(238 130 238 / 50%) 210px,
      rgb(255 0 0 / 50%) 230px
    ),
    repeating-linear-gradient(
      23deg,
      red 50px,
      orange 100px,
      yellow 150px,
      green 200px,
      blue 250px,
      indigo 300px,
      violet 350px,
      red 370px
    );
}
```

{{ EmbedLiveSample('Multiple_repeating_linear_gradients', 600, 400) }}

### Plaid gradient

Để tạo plaid, chúng ta bao gồm một số gradients chồng lên nhau với độ trong suốt. Trong khai báo background đầu tiên, chúng ta liệt kê từng color stop riêng lẻ. Khai báo thuộc tính background thứ hai sử dụng cú pháp multiple position color stop:

```html hidden
<div class="plaid-gradient"></div>
```

```css hidden
div {
  width: 200px;
  height: 200px;
}
```

```css
.plaid-gradient {
  background:
    repeating-linear-gradient(
      90deg,
      transparent,
      transparent 50px,
      rgb(255 127 0 / 25%) 50px,
      rgb(255 127 0 / 25%) 56px,
      transparent 56px,
      transparent 63px,
      rgb(255 127 0 / 25%) 63px,
      rgb(255 127 0 / 25%) 69px,
      transparent 69px,
      transparent 116px,
      rgb(255 206 0 / 25%) 116px,
      rgb(255 206 0 / 25%) 166px
    ),
    repeating-linear-gradient(
      0deg,
      transparent,
      transparent 50px,
      rgb(255 127 0 / 25%) 50px,
      rgb(255 127 0 / 25%) 56px,
      transparent 56px,
      transparent 63px,
      rgb(255 127 0 / 25%) 63px,
      rgb(255 127 0 / 25%) 69px,
      transparent 69px,
      transparent 116px,
      rgb(255 206 0 / 25%) 116px,
      rgb(255 206 0 / 25%) 166px
    ),
    repeating-linear-gradient(
      -45deg,
      transparent,
      transparent 5px,
      rgb(143 77 63 / 25%) 5px,
      rgb(143 77 63 / 25%) 10px
    ),
    repeating-linear-gradient(
      45deg,
      transparent,
      transparent 5px,
      rgb(143 77 63 / 25%) 5px,
      rgb(143 77 63 / 25%) 10px
    );

  background:
    repeating-linear-gradient(
      90deg,
      transparent 0 50px,
      rgb(255 127 0 / 25%) 50px 56px,
      transparent 56px 63px,
      rgb(255 127 0 / 25%) 63px 69px,
      transparent 69px 116px,
      rgb(255 206 0 / 25%) 116px 166px
    ),
    repeating-linear-gradient(
      0deg,
      transparent 0 50px,
      rgb(255 127 0 / 25%) 50px 56px,
      transparent 56px 63px,
      rgb(255 127 0 / 25%) 63px 69px,
      transparent 69px 116px,
      rgb(255 206 0 / 25%) 116px 166px
    ),
    repeating-linear-gradient(
      -45deg,
      transparent 0 5px,
      rgb(143 77 63 / 25%) 5px 10px
    ),
    repeating-linear-gradient(
      45deg,
      transparent 0 5px,
      rgb(143 77 63 / 25%) 5px 10px
    );
}
```

{{ EmbedLiveSample('Plaid_gradient', 200, 200) }}

### Repeating radial gradients

Ví dụ này sử dụng {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}} để tạo một gradient tỏa ra liên tục từ một điểm trung tâm. Màu sắc được lặp đi lặp lại khi gradient lặp lại.

```html hidden
<div class="repeating-radial"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
}
```

```css
.repeating-radial {
  background: repeating-radial-gradient(
    black,
    black 5px,
    white 5px,
    white 10px
  );
}
```

{{ EmbedLiveSample('Repeating_radial_gradients', 120, 120) }}

### Nhiều repeating radial gradients

```html hidden
<div class="multi-target"></div>
```

```css hidden
div {
  width: 250px;
  height: 150px;
}
```

```css
.multi-target {
  background:
    repeating-radial-gradient(
        ellipse at 80% 50%,
        rgb(0 0 0 / 50%),
        rgb(0 0 0 / 50%) 15px,
        rgb(255 255 255 / 50%) 15px,
        rgb(255 255 255 / 50%) 30px
      )
      top left no-repeat,
    repeating-radial-gradient(
        ellipse at 20% 50%,
        rgb(0 0 0 / 50%),
        rgb(0 0 0 / 50%) 10px,
        rgb(255 255 255 / 50%) 10px,
        rgb(255 255 255 / 50%) 20px
      )
      top left no-repeat yellow;
  background-size:
    200px 200px,
    150px 150px;
}
```

{{ EmbedLiveSample('Multiple_repeating_radial_gradients', 250, 150) }}

### Repeating conic gradients

Ví dụ này sử dụng {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}} để tạo một gradient xoay liên tục quanh một điểm trung tâm. Trong trường hợp này, các color stops được khai báo lặp lại bốn lần.

```html hidden
<div class="repeating-conic"></div>
```

```css hidden
div {
  width: 120px;
  height: 120px;
}
```

```css
.repeating-conic {
  background: repeating-conic-gradient(
    #66ccff 0% 8.25%,
    #6633ff 8.25% 16.5%,
    #ff3399 16.5% 25%
  );
}
```

{{ EmbedLiveSample('Repeating_conic_gradients', 120, 120) }}

### Nhiều repeating conic gradients

Cũng như linear và radial repeating gradients, bạn có thể xếp chồng nhiều conic gradients lên nhau, tạo ra các hiệu ứng thú vị bằng cách sử dụng các giá trị `at <position>` khác nhau để các conic gradients không chồng lên nhau ở tâm và các giá trị `from <angle>` khác nhau để các hiệu ứng lặp lại không trùng nhau. Ví dụ này chồng lên nhau ba radial gradients bán trong suốt lặp lại, mỗi cái lặp lại bốn lần. Để làm cho các gradients chồng lên nhau hiển thị, bạn cần đảm bảo rằng các màu của gradients ở trên cùng của ngăn xếp một phần trong suốt hoặc sử dụng thuộc tính CSS {{cssxref("background-blend-mode")}}.

```html hidden
<div class="multi-repeating-conic"></div>
```

```css hidden
div {
  width: 250px;
  height: 250px;
}
```

```css
.multi-repeating-conic {
  background:
    repeating-conic-gradient(
      from 0deg at 80% 50%,
      #5691f580 0% 8.25%,
      #b338ff80 8.25% 16.5%,
      #f8305880 16.5% 25%
    ),
    repeating-conic-gradient(
      from 15deg at 50% 50%,
      #e856f580 0% 8.25%,
      #ff384c80 8.25% 16.5%,
      #e7f83080 16.5% 25%
    ),
    repeating-conic-gradient(
      from 0deg at 20% 50%,
      #f58356ff 0% 8.25%,
      #caff38ff 8.25% 16.5%,
      #30f88aff 16.5% 25%
    );
}
```

{{ EmbedLiveSample('Multiple_repeating_conic_gradients', 250, 250) }}

## Xem thêm

- Hàm gradient: {{cssxref("gradient/linear-gradient", "linear-gradient()")}}, {{cssxref("gradient/radial-gradient", "radial-gradient()")}}, {{cssxref("gradient/conic-gradient", "conic-gradient()")}}, {{cssxref("gradient/repeating-linear-gradient", "repeating-linear-gradient()")}}, {{cssxref("gradient/repeating-radial-gradient", "repeating-radial-gradient()")}}, {{cssxref("gradient/repeating-conic-gradient", "repeating-conic-gradient()")}}
- Kiểu dữ liệu CSS liên quan đến gradient: {{cssxref("gradient")}}, {{cssxref("image")}}
- Thuộc tính CSS liên quan đến gradient: {{cssxref("background")}}, {{cssxref("background-image")}}
- [CSS Gradients Patterns Gallery, by Lea Verou](https://projects.verou.me/css3patterns/)
- [Gradient CSS Generator](https://cssgenerator.org/gradient-css-generator.html)
- [Advanced CSS Gradient Generator](https://colorbeta.com/)
- [HDR gradient generator](https://gradient.style/)
