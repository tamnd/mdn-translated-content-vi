---
title: Using CSS typed arithmetic
short-title: Using typed arithmetic
slug: Web/CSS/Guides/Values_and_units/Using_typed_arithmetic
page-type: guide
sidebar: cssref
---

**CSS typed arithmetic** (số học kiểu chữ trong CSS) đề cập đến các phép tính được phép thực hiện với các giá trị CSS có kiểu thông qua các hàm như {{cssxref("calc()")}}, và cụ thể hơn là hành vi được định nghĩa trong module [CSS values and units](/en-US/docs/Web/CSS/Guides/Values_and_units). CSS typed arithmetic cho phép chia một giá trị có đơn vị cho một giá trị có đơn vị khác nhưng cùng kiểu dữ liệu, tạo ra thương số không có đơn vị.

Các thương số không có đơn vị này có thể được sử dụng như một {{cssxref("number")}} trong các giá trị của thuộc tính không có đơn vị, hoặc được chuyển đổi sang bất kỳ kiểu dữ liệu số nào (như {{cssxref("length")}}, {{cssxref("percentage")}}, hay {{cssxref("angle")}}) bằng cách nhân chúng với một giá trị số có kiểu.

Hành vi số học kiểu chữ này cho phép tạo ra các mối quan hệ giữa các giá trị khác nhau trên trang. Bài viết này khám phá typed arithmetic và trình bày một số ví dụ minh họa cách sử dụng.

> [!NOTE]
> Ban đầu, module [CSS values and units](/en-US/docs/Web/CSS/Guides/Values_and_units) giới hạn các đối số mà phép nhân và phép chia có thể nhận để đảm bảo khả năng phát hiện chia cho không tại thời điểm phân tích cú pháp và tránh các vấn đề như đơn vị bình phương. Typed arithmetic nới lỏng một số hạn chế đó trong [các trình duyệt hỗ trợ](/en-US/docs/Web/CSS/Reference/Values/calc#browser_compatibility).

## Quy tắc CSS typed arithmetic

Khi thực hiện các phép tính trên giá trị trong CSS, có một số quy tắc về tính tương thích của các giá trị với các kiểu dữ liệu khác nhau.

### Phép cộng và phép trừ

Khi cộng hoặc trừ các giá trị, tất cả các giá trị phải thuộc cùng một kiểu dữ liệu tổng thể. Các ví dụ sau đây đều tạo ra kết quả hợp lệ:

```css example-good
/* <length-percentage> units */
calc(250px - 150px)
calc(100% - 50px)
calc(50vw + 2rem)
calc(25cqw + 3in)

/* <angle> units */
calc(40deg + 2rad)
calc(420deg - 1turn)
```

Tuy nhiên, các ví dụ sau đây là không hợp lệ. Kết quả của các phép tính kiểu hỗn hợp như vậy sẽ không có ý nghĩa:

```css example-bad
calc(200px + 100ms)
calc(50% + 90deg)
```

## Phép nhân

Khi nhân các giá trị trong CSS, chỉ một trong các giá trị có thể có đơn vị. Tất cả các giá trị còn lại phải là các giá trị {{cssxref("number")}} không có đơn vị. Điều này là vì bạn muốn tích số là một lượng lớn hơn hoặc nhỏ hơn của cùng một đơn vị, và không muốn tạo ra các đơn vị bình phương mà không có thuộc tính CSS nào chấp nhận.

```css example-good
calc(200px * 4) /* 800px */
calc(60deg * 3) /* 180deg */
```

Nếu bạn cố nhân hai giá trị có đơn vị — dù là cùng đơn vị — các quy tắc toán học thông thường sẽ yêu cầu nhân cả các đơn vị với nhau. Ví dụ:

```css example-bad
calc(200px * 4px)
```

Trong trường hợp này, hàm không hợp lệ vì <code>800px<sup>2</sup></code> không có ý nghĩa trong CSS.

## Phép chia

Khi chia các giá trị trong CSS, bạn có thể chia một giá trị có đơn vị cho một giá trị không có đơn vị:

```css example-good
calc(1000px / 2) /* 500px */
calc(360deg / 4) /* 90deg */
```

Tuy nhiên, bạn không thể chia một giá trị không có đơn vị cho một giá trị có đơn vị vì điều đó không có ý nghĩa:

```css example-bad
calc(1000 / 2px) /* ?!? */
```

Khi một giá trị của bất kỳ kiểu dữ liệu số nào được chia cho một giá trị của cùng kiểu đó, các đơn vị triệt tiêu nhau, và bạn nhận được một giá trị không có đơn vị. Phía sau, hai giá trị được tính toán trước khi chia cho nhau.

Kết quả là, cùng một phép tính có thể cho kết quả rất khác nhau tùy thuộc vào ngữ cảnh sử dụng và đơn vị của số chia.

Xét ví dụ sau:

```css
calc(100vw / 1px)
```

`100vw` bằng `100%` chiều rộng của viewport. Nếu viewport hiện tại rộng `1000px`, phép tính sẽ trả về giá trị không có đơn vị là `1000`. Tuy nhiên, nếu viewport rộng `500px`, phép tính sẽ trả về giá trị không có đơn vị là `500`.

Nếu chúng ta thay số chia `1px` bằng `1em`, kết quả sẽ rất khác:

```css
calc(100vw / 1em)
```

Nếu viewport rộng `1000px`, và `1em` bằng với giá trị mặc định của trình duyệt là `16px` tại thời điểm tính toán, phép tính trên sẽ trả về `1000px / 16px` = `62.5`.

Trước đây, bạn không thể chia một giá trị có kiểu cho một giá trị khác, dù cả hai có đơn vị cùng loại. Tuy nhiên, đặc tả đã được cập nhật để cho phép điều này; hãy kiểm tra [tính tương thích trình duyệt](/en-US/docs/Web/CSS/Reference/Values/calc#browser_compatibility).

## Tại sao bản cập nhật hành vi này hữu ích?

Khả năng chia một giá trị có kiểu cho một giá trị khác cùng kiểu thoạt nghe có vẻ không đáng kể, nhưng nó cho phép tạo ra các liên kết hữu ích giữa các giá trị khác nhau để tạo ra các tính năng UI đáp ứng.

Chìa khóa của tất cả điều này là khả năng biểu diễn các giá trị dưới dạng không có đơn vị thông qua phép chia như sau:

```css
--viewport-width-in-pixels: calc(100vw / 1px);
```

Kết quả là một {{cssxref("number")}} biểu thị chiều rộng viewport tính bằng pixel dưới dạng giá trị không có đơn vị. Điều này có thể được sử dụng ở bất cứ đâu một số hợp lệ, bao gồm cả các hàm `calc()` khác. Bạn có thể thay đổi động các giá trị thuộc tính khác dựa trên giá trị này, bất kể chúng có đơn vị gì.

Ví dụ, giá trị không có đơn vị có thể được chuyển trực tiếp vào {{cssxref("opacity")}}:

```css
opacity: calc(var(--viewport-width-in-pixels) / 1000 - 0.5);
```

Bạn có thể nhân nó với một giá trị như `1deg` để tạo ra một giá trị {{cssxref("&lt;angle>")}}:

```css
rotate: calc(var(--viewport-width-in-pixels) * 1deg);
```

Bạn có thể nhân nó với một giá trị như `1rem` để tạo ra một giá trị {{cssxref("&lt;length>")}}:

```css
font-size: calc(var(--viewport-width-in-pixels) * 1rem / 200);
```

Hãy cùng xem một số ví dụ để thấy CSS typed arithmetic hữu ích như thế nào.

## Ví dụ cơ bản: độ mờ nền đáp ứng

Ví dụ [responsive background opacity](https://mdn.github.io/dom-examples/css-typed-arithmetic/responsive-background-opacity/) ([xem mã nguồn](https://github.com/mdn/dom-examples/tree/main/css-typed-arithmetic/responsive-background-opacity)) cho thấy cách thay đổi độ mờ của ảnh nền khi chiều rộng viewport thay đổi. Việc ảnh nền mờ dần khi màn hình thu hẹp có nghĩa là ảnh ít có khả năng ảnh hưởng đến khả năng đọc của nội dung văn bản khi chúng bắt đầu chồng lên nhau.

### HTML

HTML chứa một số nội dung văn bản cơ bản được bao trong phần tử {{htmlelement("div")}}.

```html
<div class="wrapper">
  <h1>Prose of the century</h1>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus
    aliquam dolor, eu lacinia lorem placerat vulputate. Duis felis orci,
    pulvinar id metus ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at
    ultricies tellus laoreet sit amet.
  </p>
</div>
```

### CSS

Chúng ta bắt đầu bằng cách định nghĩa một [CSS custom property](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) có tên `--width-percentage` trên phần tử {{cssxref(":root")}}, chứa kết quả của phép tính `100vw / 2000px`. Giá trị này biểu thị chiều rộng viewport dưới dạng phần trăm của `2000px` mà sau này sẽ được dùng làm giá trị kênh alpha. Khi viewport rộng `2000px`, phép tính sẽ trả về `1`, tương đương với alpha `100%`. Bất kỳ viewport nào nhỏ hơn `2000px` sẽ cho giá trị nhỏ hơn.

```css
:root {
  --width-percentage: calc((100vw / 2000px));
}
```

> [!NOTE]
> Bất kỳ giá trị alpha nào lớn hơn `1` đều được coi là `1`, vì vậy chúng ta không cần giới hạn giá trị tối đa.

Sau đó chúng ta đặt {{cssxref("width")}} cố định và một số {{cssxref("padding")}} cho `<div>` bao bọc, và căn giữa nó theo chiều ngang bằng {{cssxref("margin")}}.

```css
.wrapper {
  width: 480px;
  padding: 20px;
  margin: 0 auto;
}
```

Cuối cùng, chúng ta đặt nhiều nền cho phần tử {{htmlelement("body")}}. Hãy xem qua chúng theo thứ tự ngược lại:

1. Giá trị {{cssxref("background")}} cuối cùng và do đó nằm dưới cùng là một ảnh nền không lặp lại đặt gần góc trên bên phải.
2. Nền trên cùng là một lớp phủ trắng bán trong suốt được tạo bằng hàm {{cssxref("linear-gradient()")}} với cả hai điểm dừng màu được đặt cùng màu. Giá trị kênh alpha của màu được tính là `1` trừ đi thuộc tính tùy chỉnh `--width-percentage` đã đặt trước đó: Khi chiều rộng viewport thu hẹp, `--width-percentage` sẽ nhỏ hơn, do đó gradient trắng sẽ trở nên đục hơn, giảm độ mờ của ảnh nền.

```css
body {
  background:
    linear-gradient(
      rgb(255 255 255 / calc(1 - var(--width-percentage))),
      rgb(255 255 255 / calc(1 - var(--width-percentage)))
    ),
    url("https://mdn.github.io/shared-assets/images/examples/colorful-heart.png")
      no-repeat top 50px right 50px;
}
```

### Kết quả

Để xem kết quả, hãy [xem ví dụ responsive background opacity trực tiếp](https://mdn.github.io/dom-examples/css-typed-arithmetic/responsive-background-opacity/) ([xem mã nguồn](https://github.com/mdn/dom-examples/tree/main/css-typed-arithmetic/responsive-background-opacity)). Hãy thử thay đổi chiều rộng viewport để xem độ mờ nền thay đổi như thế nào.

## Thay đổi giá trị các kiểu khác nhau dựa trên một giá trị duy nhất

Ví dụ [different type variations](https://mdn.github.io/dom-examples/css-typed-arithmetic/different-type-variations/) ([xem mã nguồn](https://github.com/mdn/dom-examples/tree/main/css-typed-arithmetic/different-type-variations)) hoạt động theo cách tương tự ví dụ trước, ngoại trừ trong trường hợp này, chúng ta minh họa việc sử dụng một giá trị biến duy nhất trong định nghĩa nhiều giá trị khác với các kiểu dữ liệu khác nhau.

Cụ thể, chúng ta đặt màu nền _và_ kích thước font chữ của đoạn văn dựa trên chiều rộng viewport.

### HTML

Markup cho ví dụ này chứa một đoạn văn bản:

```html
<p>Hello there!</p>
```

### CSS

Chúng ta bắt đầu CSS theo cách tương tự demo trước, tạo một giá trị không có đơn vị dựa trên chiều rộng viewport. Lần này, chúng ta tính bằng cách chia `100vw` cho `1px` và lưu số kết quả vào một thuộc tính tùy chỉnh có tên `--viewport-in-pixels`. Giá trị này biểu thị chiều rộng viewport hiện tại tính bằng pixel, không có đơn vị.

```css
:root {
  --viewport-in-pixels: calc(100vw / 1px);
}
```

Bây giờ đến phần tạo kiểu cho đoạn văn. Trước tiên chúng ta cho nó một số kiểu cơ bản ({{cssxref("border")}} và {{cssxref("text-align")}} là `center`), sau đó đặt hai giá trị dựa trên thuộc tính `--viewport-in-pixels` đã tạo trước đó:

1. Chúng ta đặt {{cssxref("font-size")}} của đoạn văn bằng `--viewport-in-pixels` chia cho `200`, nhân với `1em` để chuyển thương số số học thành giá trị `em`.
2. Chúng ta đặt {{cssxref("background-color")}} của đoạn văn thành giá trị màu [`lch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lch). Thành phần lightness và chroma là các giá trị hằng số (`75%` và `50%` tương ứng), trong khi thành phần hue được đặt bằng `--viewport-in-pixels` chia cho `10`, cộng thêm `100`. Sau đó chúng ta nhân kết quả đó với `1deg` để đảm bảo giá trị là một {{cssxref("angle")}}.
   > [!NOTE]
   > Bước cuối cùng này không thực sự cần thiết, vì `lch()` cũng chấp nhận các giá trị hue không có đơn vị. Tuy nhiên, giá trị độ có thể trực quan hơn, và chúng ta muốn hiển thị thêm ví dụ về cách giá trị không có đơn vị có thể được chuyển đổi sang kiểu dữ liệu khác.

```css
p {
  border: 5px solid black;
  text-align: center;
  font-size: calc(1em * (var(--viewport-in-pixels) / 200));
  background-color: lch(
    75% 50% calc((100 + (var(--viewport-in-pixels) / 10)) * 1deg)
  );
}
```

### Kết quả

Để xem kết quả, hãy [xem ví dụ different type variations trực tiếp](https://mdn.github.io/dom-examples/css-typed-arithmetic/different-type-variations/) ([xem mã nguồn](https://github.com/mdn/dom-examples/tree/main/css-typed-arithmetic/different-type-variations)). Hãy thử thay đổi chiều rộng viewport để xem cả kích thước font chữ lẫn màu nền của đoạn văn thay đổi như thế nào.

## Vòng tròn câu chuyện hoạt hình

Ví dụ [animated story circle](https://mdn.github.io/dom-examples/css-typed-arithmetic/animated-story-circle/) ([xem mã nguồn](https://github.com/mdn/dom-examples/tree/main/css-typed-arithmetic/animated-story-circle)) minh họa một hiệu ứng phức tạp hơn được tạo ra bằng cách tận dụng các quy tắc CSS typed arithmetic. Trong trường hợp này, các đoạn văn khác nhau của một văn bản được bố trí thành một vòng tròn tỏa ra từ một điểm trung tâm. Hơn nữa, vòng tròn các đoạn văn thu nhỏ thành hình quạt khi viewport thu hẹp, và mở ra lại khi viewport rộng hơn.

### HTML

HTML khá đơn giản — một {{htmlelement("div")}} chứa nhiều phần tử {{htmlelement("p")}}. Văn bản của đoạn văn đầu tiên được bọc trong một phần tử {{htmlelement("strong")}} để chỉ ra điểm bắt đầu đọc.

```html
<div class="story-circle">
  <p><strong>Hello there!</strong></p>
  <p>This is</p>
  <p>quite an</p>
  <p>interesting way</p>
  <p>to tell a</p>
  <p>story</p>
  <p>all around in</p>
  <p>a circle.</p>
  <p>What fun!</p>
</div>
```

### CSS

Chúng ta bắt đầu CSS bằng cách đặt {{cssxref("height")}} là `100%` cho phần tử {{cssxref(":root")}}.

```css
:root {
  height: 100%;
}
```

Tiếp theo, chúng ta đặt một số thuộc tính cho phần tử {{htmlelement("body")}}:

- Chúng ta bắt đầu bằng cách đặt `height` là `inherit`, nghĩa là `<body>` sẽ kế thừa chiều cao `100%` của phần tử `:root` và do đó trải dài toàn bộ chiều cao của viewport.
- Tiếp theo, chúng ta căn giữa `<body>` theo chiều ngang bằng {{cssxref("margin")}}, và đặt cho nó một {{cssxref("max-width")}}. Như bạn sẽ thấy sau, giới hạn trên này quan trọng để kiểm soát góc quay tối đa của hình quạt/vòng tròn.
- Chúng ta căn giữa `<div>` với `class="story-circle"` theo chiều ngang và chiều dọc bên trong `<body>` bằng [flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout).
- Chúng ta sử dụng thuộc tính {{cssxref("container-type")}} để khai báo `<body>` là một [size query container](/en-US/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries#container_size_queries) inline. Điều này quan trọng vì chúng ta muốn thay đổi góc quay hình dạng dựa trên chiều rộng `<body>`, không phải chiều rộng viewport như trong các ví dụ trước. Đặt nó là size query container cho phép chúng ta tham chiếu kích thước của nó trong các phép tính.

```css
body {
  height: inherit;
  margin: 0 auto;
  max-width: 1600px;
  display: flex;
  align-items: center;
  justify-content: center;
  container-type: inline-size;
}
```

Bây giờ đến phần tạo kiểu cho `<div>` có `story-circle`. Chúng ta đặt `width` và `height` của nó là `1px`: nó sẽ hoạt động như một điểm tham chiếu với các đoạn văn con được định vị thành vòng tròn xung quanh nó. (Chúng ta thậm chí không cần đặt positioning cho nó, vì các đoạn văn được định vị tương đối với `<body>`).

Sau đó chúng ta tạo một thuộc tính tùy chỉnh có tên `--width-percentage` chứa kết quả của `100cqw` (100% chiều rộng của container query cha của phần tử, là phần tử `<body>`) chia cho `1200px`, trừ đi `0.33333`. Đây là giá trị quan trọng sẽ kiểm soát mức độ vòng tròn quay khi chiều rộng viewport thay đổi.

```css
.story-circle {
  width: 1px;
  height: 1px;
  --width-percentage: calc((100cqw / 1200px) - 0.33333);
}
```

Chúng ta sử dụng chiều rộng container query thay vì chiều rộng viewport để kiểm soát góc quay vì chúng ta muốn đặt một giới hạn tối đa cho container, được kiểm soát bởi `max-width` của `<body>`. Nếu giá trị quay trở nên lớn hơn một vòng tròn đầy đủ, đoạn văn cuối cùng sẽ bắt đầu chồng lên đoạn văn đầu tiên, làm hỏng hiệu ứng.

Vì `max-width` là `1600px`, bạn có thể mong đợi phép tính sẽ là `100cqw / 1600px)`. Điều này sẽ hoạt động, nhưng chúng ta đã chọn `(100cqw / 1200px) - 0.33333` (0.33333 đến từ `1600px/1200px - 1`). Cả hai đều khiến góc quay tối đa xảy ra ở chiều rộng `<body>` là `1600px`, nhưng hình quạt bây giờ có góc quay tối thiểu nhỏ hơn, tạo ra hiệu ứng tốt hơn ở chiều rộng viewport hẹp.

Quy tắc kiểu cuối cùng chọn các đoạn văn. Hầu hết các kiểu là cơ bản. Đáng chú ý là chúng ta đã đặt {{cssxref("position")}} thành `absolute` để tất cả các đoạn văn nằm chồng lên nhau, và chúng ta đặt giá trị {{cssxref("transform-origin")}} là `center left` để các đoạn văn quay xung quanh trung tâm cạnh trái của chúng, do đó tất cả sẽ tỏa ra từ một điểm trung tâm trên `<div>` chứa chúng.

Bây giờ đến phần thú vị — chúng ta định nghĩa một thuộc tính tùy chỉnh có tên `--angle` chứa góc quay không có đơn vị của đoạn văn, trước khi đặt thuộc tính {{cssxref("rotate")}} thành giá trị kết quả. Chúng ta nhân số kết quả với `1deg` để chuyển đổi nó thành giá trị độ. Thuộc tính tùy chỉnh `--angle` là tích của ba giá trị:

1. {{cssxref("sibling-index()")}} của đoạn văn trừ `1`, khiến đoạn văn đầu tiên có góc quay `0`, như mong muốn ở vị trí nằm ngang.
2. `360` chia cho {{cssxref("sibling-count()")}} của đoạn văn, khiến tất cả các đoạn văn được phân bố đều nhau quanh vòng tròn, nghĩa là thiết kế vẫn hoạt động nếu số lượng đoạn văn thay đổi.
3. Thuộc tính tùy chỉnh `--width-percentage` của chúng ta, khiến góc quay của các đoạn văn xung quanh vòng tròn thay đổi khi chiều rộng viewport thay đổi. Hãy nhớ rằng thuộc tính này có giá trị tối đa là `1`, đạt được khi phần tử `<body>` đạt `max-width` là `1600px`.

```css
p {
  padding: 10px;
  width: 150px;
  text-align: right;
  background: linear-gradient(to right, red, orange 50%);
  border-radius: 5px;

  position: absolute;
  transform-origin: center left;

  --angle: calc(
    ((sibling-index() - 1) * (360 / sibling-count())) * var(--width-percentage)
  );
  rotate: calc(var(--angle) * 1deg);
}
```

### Kết quả

Để xem kết quả, hãy [xem ví dụ animated story circle trực tiếp](https://mdn.github.io/dom-examples/css-typed-arithmetic/animated-story-circle/) ([xem mã nguồn](https://github.com/mdn/dom-examples/tree/main/css-typed-arithmetic/animated-story-circle)). Hãy thử tăng và giảm chiều rộng viewport để xem hình quạt các đoạn văn mở ra thành vòng tròn và thu lại.

## Xem thêm

- {{cssxref("calc()")}}, {{cssxref("abs()")}}
- Module [CSS values and units](/en-US/docs/Web/CSS/Guides/Values_and_units)
- [CSS Typed Arithmetic](https://css-tricks.com/css-typed-arithmetic/) trên css-tricks.com (2025)
