---
title: Overview of shapes
short-title: Overview
slug: Web/CSS/Guides/Shapes/Overview
page-type: guide
sidebar: cssref
---

[Module CSS Shapes](/en-US/docs/Web/CSS/Guides/Shapes) mô tả các hình dạng hình học trong CSS. Bài viết này cung cấp tổng quan về cách bạn có thể sử dụng shape để bọc văn bản xung quanh các phần tử float không nhất thiết phải là hình chữ nhật.

Khi bạn float một phần tử sang trái, văn bản sẽ bọc xung quanh phía phải và phía dưới của phần tử theo dạng chữ nhật. Với CSS Shapes, bạn có thể, ví dụ, áp dụng shape hình tròn và văn bản sẽ bọc theo đường cong của hình tròn.

Có nhiều cách để tạo hình tròn này. Trong hướng dẫn này, chúng ta sẽ xem cách CSS Shapes hoạt động và cách sử dụng chúng.

## Đặc tả định nghĩa những gì?

Đặc tả định nghĩa một số thuộc tính, bao gồm:

- {{cssxref("shape-outside")}} — Cho phép xác định các basic shape.
- {{cssxref("shape-image-threshold")}} — Đặt giá trị ngưỡng độ mờ. Nếu hình ảnh được dùng để xác định shape, chỉ những phần của hình ảnh có độ mờ bằng hoặc lớn hơn giá trị ngưỡng mới được dùng trong shape. Các phần còn lại bị bỏ qua.
- {{cssxref("shape-margin")}} — Đặt margin xung quanh shape đã được xác định.

## Xác định basic shape

Thuộc tính `shape-outside` cho phép chúng ta xác định một shape. Nó nhận nhiều giá trị khác nhau để định nghĩa các shape khác nhau được chỉ định trong kiểu dữ liệu {{cssxref("basic-shape")}}.

Trong ví dụ sau, một hình ảnh được float sang trái. Chúng ta áp dụng thuộc tính `shape-outside` với giá trị `circle(50%)`. Kết quả là nội dung bây giờ uốn cong xung quanh shape hình tròn thay vì đi theo hình chữ nhật tạo ra bởi hộp của hình ảnh.

```html live-sample___circle
<div class="box">
  <img
    alt="An orange hot air balloon as seen from below"
    src="https://mdn.github.io/shared-assets/images/examples/round-balloon.png" />
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___circle
body {
  font: 1.2em / 1.4 sans-serif;
}

img {
  float: left;
  shape-outside: circle(50%);
}
```

{{EmbedLiveSample("circle", "", "280px")}}

Ở đây chúng ta sử dụng hàm {{cssxref("basic-shape/circle", "circle()")}}, được hỗ trợ trên tất cả các trình duyệt hiện đại. Nếu chúng ta sử dụng một kiểu shape mới hơn chưa được hỗ trợ đầy đủ, người dùng của các trình duyệt không hỗ trợ sẽ thấy nội dung chảy xung quanh các cạnh của hình chữ nhật do hình ảnh được float. Shape là một tính năng tăng cường trực quan có tính chất tiến bộ.

### Basic shapes

Giá trị `circle(50%)` là một ví dụ về basic shape. Đặc tả định nghĩa nhiều giá trị `<basic-shape>`, bao gồm:

- {{cssxref("basic-shape/circle","circle()")}}
- {{cssxref("basic-shape/ellipse","ellipse()")}}
- {{cssxref("basic-shape/inset","inset()")}}
- {{cssxref("basic-shape/path","path()")}}
- {{cssxref("basic-shape/polygon","polygon()")}}
- {{cssxref("basic-shape/rect","rect()")}}
- {{cssxref("basic-shape/shape","shape()")}}
- {{cssxref("basic-shape/xywh","xywh()")}}

Ba trong số các hàm này chỉ xác định hình chữ nhật. Với hàm `inset()`, bạn xác định bốn giá trị offset, qua đó kéo các line box của nội dung bọc lại gần đối tượng hơn so với bình thường. Hàm `rect()` xác định hình chữ nhật bằng cách chỉ định khoảng cách từ cạnh trên và cạnh trái của containing block. Hàm `xywh()` hoạt động bằng cách chỉ định khoảng cách từ cạnh trên và cạnh trái của reference box, rồi đặt chiều rộng và chiều cao của hình chữ nhật từ điểm bắt đầu đó.

Chúng ta đã thấy cách `circle()` tạo shape hình tròn. Một `ellipse()` về cơ bản là hình tròn bị dẹt. Nếu không có basic shape nào phù hợp, bạn có thể tạo các shape phức tạp hơn bằng hàm `polygon()`, cho phép xác định một loạt các đường thẳng. Các hàm `path()` và `shape()` có thể được dùng để tạo BẤT KỲ shape nào thông qua một loạt lệnh vẽ đường thẳng, đường cong và di chuyển.

Trong [Hướng dẫn về Basic Shapes](/en-US/docs/Web/CSS/Guides/Shapes/Using_shape-outside) chúng ta khám phá từng Basic Shape có thể có và cách tạo chúng.

### Shape từ giá trị box

Shape cũng có thể được tạo xung quanh giá trị box. Do đó, bạn có thể tạo shape của mình trên:

- `border-box`
- `padding-box`
- `content-box`
- `margin-box`

Trong ví dụ dưới đây, bạn có thể thay đổi giá trị `border-box` thành bất kỳ giá trị được phép nào khác để thấy shape di chuyển gần hơn hoặc xa hơn so với hộp.

```html live-sample___box
<div class="box">
  <div class="shape"></div>
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___box
body {
  font: 1.2em / 1.4 sans-serif;
}

.shape {
  background-color: rebeccapurple;
  height: 150px;
  width: 150px;
  padding: 20px;
  margin: 20px;
  border-radius: 50%;
  float: left;
  shape-outside: border-box;
}
```

{{EmbedLiveSample("box", "", "320px")}}

Để khám phá các giá trị box chi tiết hơn, hãy xem hướng dẫn của chúng tôi về [Shapes from box values](/en-US/docs/Web/CSS/Guides/Shapes/From_box_values).

### Shape từ hình ảnh

Một cách thú vị để tạo đường dẫn là sử dụng hình ảnh có alpha channel — văn bản khi đó sẽ bọc xung quanh các phần không trong suốt của hình ảnh. Điều này cho phép phủ lên nội dung được bọc xung quanh hình ảnh hoặc sử dụng hình ảnh không bao giờ được hiển thị trên trang thuần túy như một phương pháp tạo shape phức tạp mà không cần lập bản đồ polygon cẩn thận.

Lưu ý rằng hình ảnh được dùng theo cách này phải [tương thích CORS](/en-US/docs/Web/HTTP/Guides/CORS), nếu không `shape-outside` sẽ hoạt động như thể đã được cho giá trị `none` và bạn sẽ không có shape.

Trong ví dụ tiếp theo, chúng ta có hình ảnh với vùng hoàn toàn trong suốt và đang dùng hình ảnh làm giá trị URL cho `shape-outside`. Shape được tạo xung quanh vùng mờ đục — hình ảnh quả bóng bay.

```html live-sample___image
<div class="box">
  <img
    alt="An orange hot air balloon as seen from below"
    src="https://mdn.github.io/shared-assets/images/examples/round-balloon.png" />
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___image
body {
  font: 1.2em / 1.4 sans-serif;
}

img {
  float: left;
  shape-outside: url("https://mdn.github.io/shared-assets/images/examples/round-balloon.png");
}
```

{{EmbedLiveSample("image", "", "280px")}}

#### `shape-image-threshold`

Thuộc tính `shape-image-threshold` được dùng để đặt ngưỡng độ trong suốt của hình ảnh, xác định vùng của hình ảnh được dùng cho shape. Nếu giá trị của `shape-image-threshold` là `0.0` (giá trị ban đầu) thì vùng phải hoàn toàn trong suốt. Nếu giá trị là `1.0` thì hoàn toàn mờ đục. Các giá trị trung gian cho phép bạn đặt một vùng bán trong suốt làm vùng xác định shape.

Bạn có thể thấy ngưỡng hoạt động nếu chúng ta dùng gradient làm hình ảnh xác định shape. Trong ví dụ dưới đây, nếu bạn thay đổi ngưỡng, đường dẫn mà shape đi qua sẽ thay đổi dựa trên mức độ mờ bạn đã chọn.

```html live-sample___threshold
<div class="box">
  <div class="shape"></div>
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___threshold
body {
  font: 1.2em / 1.4 sans-serif;
}

.shape {
  float: left;
  width: 200px;
  height: 200px;
  background-image: linear-gradient(
    45deg,
    rebeccapurple,
    transparent 80%,
    transparent
  );
  shape-outside: linear-gradient(
    45deg,
    rebeccapurple,
    transparent 80%,
    transparent
  );
  shape-image-threshold: 0.4;
}
```

{{EmbedLiveSample("threshold", "", "280px")}}

Để tìm hiểu thêm về việc tạo shape từ hình ảnh, hãy xem hướng dẫn [Shapes from images](/en-US/docs/Web/CSS/Guides/Shapes/From_images).

## Thuộc tính `shape-margin`

Thuộc tính {{cssxref("shape-margin")}} thêm margin vào `shape-outside`. Điều này sẽ thu ngắn hơn nữa các line box của nội dung bọc xung quanh shape, đẩy chúng ra xa shape hơn.

Trong ví dụ dưới đây, chúng ta đã thêm `shape-margin` vào một basic shape. Thay đổi margin để đẩy văn bản ra xa hơn so với đường dẫn mà shape đi qua mặc định.

```html live-sample___shape-margin
<div class="box">
  <img
    alt="An orange hot air balloon as seen from below"
    src="https://mdn.github.io/shared-assets/images/examples/round-balloon.png" />
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___shape-margin
body {
  font: 1.2em / 1.4 sans-serif;
}
img {
  float: left;
  shape-outside: circle(50%);
  shape-margin: 5px;
}
```

{{EmbedLiveSample("shape-margin", "", "280px")}}

## Sử dụng Generated Content làm phần tử float

Trong các ví dụ trên, chúng ta đã dùng hình ảnh hoặc phần tử nhìn thấy được để xác định shape, nghĩa là bạn có thể nhìn thấy shape trên trang. Thay vào đó, bạn có thể muốn cho văn bản chảy theo một đường vô hình không phải hình chữ nhật. Chúng ta có thể, ví dụ, thêm một phần tử {{htmlelement("div")}} hoặc {{htmlelement("span")}} float trống vào DOM và làm nó vô hình. Tuy nhiên, chúng ta có thể tạo shape chỉ bằng CSS sử dụng [generated content](/en-US/docs/Learn_web_development/Howto/Solve_CSS_problems/Generated_content) và giữ toàn bộ chức năng tạo kiểu bên trong CSS.

Trong ví dụ này, chúng ta sử dụng generated content để chèn một phần tử có chiều cao và chiều rộng 150px. Sau đó, chúng ta có thể dùng basic shape, giá trị box, hoặc thậm chí alpha channel của một hình ảnh để tạo shape cho văn bản bọc xung quanh.

```html live-sample___generated-content
<div class="box">
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___generated-content
body {
  font: 1.2em sans-serif;
}

.box::before {
  content: "";
  display: block;
  height: 150px;
  width: 150px;
  padding: 20px;
  margin: 20px;
  border-radius: 50%;
  float: left;
  shape-outside: border-box;
}
```

{{EmbedLiveSample("generated-content", "", "260px")}}

## Mối quan hệ với `clip-path`

Các basic shape và giá trị box được dùng để tạo shape cũng giống như những giá trị được dùng làm giá trị cho {{cssxref("clip-path")}}. Do đó, nếu bạn muốn tạo shape bằng hình ảnh và cũng cắt bỏ một phần hình ảnh đó, bạn có thể dùng cùng các giá trị.

Hình ảnh dưới đây là hình ảnh vuông với nền màu xanh. Chúng ta đã xác định shape bằng `shape-outside: ellipse(40% 50%);` và cũng dùng `clip-path: ellipse(40% 50%);` để cắt bỏ cùng vùng chúng ta đã dùng để xác định shape.

```html live-sample___clip-path
<div class="box">
  <img
    alt="An orange hot air balloon as seen from below"
    src="https://mdn.github.io/shared-assets/images/examples/balloon-small.jpg" />
  <p>
    One November night in the year 1782, so the story runs, two brothers sat
    over their winter fire in the little French town of Annonay, watching the
    grey smoke-wreaths from the hearth curl up the wide chimney. Their names
    were Stephen and Joseph Montgolfier, they were papermakers by trade, and
    were noted as possessing thoughtful minds and a deep interest in all
    scientific knowledge and new discovery. Before that night—a memorable night,
    as it was to prove—hundreds of millions of people had watched the rising
    smoke-wreaths of their fires without drawing any special inspiration from
    the fact.
  </p>
</div>
```

```css live-sample___clip-path
body {
  font: 1.2em / 1.4 sans-serif;
}

img {
  float: left;
  shape-outside: ellipse(40% 50%);
  clip-path: ellipse(40% 50%);
}
```

{{EmbedLiveSample("clip-path", "", "280px")}}

## Công cụ Developer Tools cho Shapes

Có một [Shape Path Editor](https://firefox-source-docs.mozilla.org/devtools-user/page_inspector/how_to/edit_css_shapes/index.html) trong Firefox DevTools. Công cụ này có thể được dùng để kiểm tra các giá trị `circle()`, `inset()`, `ellipse()` và `polygon()`. Nếu polygon của bạn chưa hoàn toàn đúng, bạn có thể dùng Shapes Editor để chỉnh sửa, sau đó sao chép giá trị mới vào CSS.

## Thêm tính năng CSS Shapes

Trong hướng dẫn này, chúng ta đã thảo luận về việc bọc văn bản xung quanh các float shape. Xem [module CSS shapes](/en-US/docs/Web/CSS/Guides/Shapes) để có các liên kết đến tất cả các tính năng của module cùng với các tính năng liên quan bổ sung. Điều này bao gồm tất cả các hàm shape và các hướng dẫn liên quan.
