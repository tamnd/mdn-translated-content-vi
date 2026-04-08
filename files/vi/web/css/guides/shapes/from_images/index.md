---
title: Shapes from images
short-title: Image-based shapes
slug: Web/CSS/Guides/Shapes/From_images
page-type: guide
sidebar: cssref
---

Trong hướng dẫn này, chúng ta sẽ xem cách tạo shape từ một tệp hình ảnh có alpha channel hoặc thậm chí từ một CSS Gradient. Đây là một cách rất linh hoạt để tạo shape. Thay vì vẽ một đường dẫn bằng polygon phức tạp trong CSS, bạn có thể tạo shape trong một chương trình đồ họa rồi sử dụng đường dẫn được tạo bởi các pixel có độ mờ thấp hơn một ngưỡng nhất định.

## Tạo shape từ hình ảnh

Để sử dụng hình ảnh tạo shape, hình ảnh cần có Alpha Channel, tức là một vùng không hoàn toàn mờ đục. Thuộc tính {{cssxref("shape-image-threshold")}} được dùng để đặt ngưỡng độ mờ này. Các pixel có độ mờ đục lớn hơn giá trị này sẽ được dùng để tính toán vùng của shape.

Trong ví dụ dưới đây, có một hình ảnh ngôi sao với vùng màu đỏ đặc và vùng hoàn toàn trong suốt. Đường dẫn tới tệp hình ảnh được dùng làm giá trị cho thuộc tính {{cssxref("shape-outside")}}. Nội dung bây giờ bọc quanh hình ngôi sao.

```html live-sample___simple-example
<div class="box">
  <img
    alt="A red star"
    src="https://mdn.github.io/shared-assets/images/examples/star-shape.png" />
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

```css live-sample___simple-example
body {
  font: 1.2em / 1.5 sans-serif;
}
img {
  float: left;
  shape-outside: url("https://mdn.github.io/shared-assets/images/examples/star-shape.png");
}
```

{{EmbedLiveSample("simple-example", "", "340px")}}

Bạn có thể dùng {{cssxref("shape-margin")}} để đẩy văn bản ra xa shape hơn, tạo margin xung quanh shape được tạo ra và văn bản.

```html hidden live-sample___margin
<div class="box">
  <img
    alt="A red star"
    src="https://mdn.github.io/shared-assets/images/examples/star-shape.png" />
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

```css live-sample___margin
body {
  font: 1.2em / 1.5 sans-serif;
}

img {
  float: left;
  shape-outside: url("https://mdn.github.io/shared-assets/images/examples/star-shape.png");
  shape-margin: 20px;
}
```

{{EmbedLiveSample("margin", "", "340px")}}

## Tương thích CORS

Một vấn đề bạn sẽ gặp khi tạo shape từ hình ảnh là hình ảnh bạn dùng phải [tương thích CORS](/en-US/docs/Web/HTTP/Guides/CORS). Hình ảnh được lưu trên cùng domain với trang web của bạn sẽ hoạt động; tuy nhiên, nếu hình ảnh được lưu trên domain khác, chẳng hạn như trên CDN, bạn nên đảm bảo rằng chúng gửi các header chính xác để có thể sử dụng cho Shapes. Do yêu cầu hình ảnh tương thích CORS này, nếu bạn đang xem trước tệp cục bộ mà không dùng web server cục bộ, shape của bạn sẽ không hoạt động.

### Đây có phải vấn đề CORS không?

DevTools có thể giúp bạn xác định lỗi CORS. Trong Chrome, Console sẽ cảnh báo bạn về các vấn đề CORS. Trong Firefox, nếu bạn kiểm tra thuộc tính, bạn sẽ được thông báo rằng không thể tải hình ảnh. Điều này cho thấy hình ảnh của bạn không thể được dùng làm nguồn tạo shape vì lý do CORS.

## Đặt ngưỡng

Thuộc tính {{cssxref("shape-image-threshold")}} cho phép tạo shape từ các vùng không hoàn toàn trong suốt. Nếu giá trị của `shape-image-threshold` là `0.0` (giá trị ban đầu) thì vùng phải hoàn toàn trong suốt. Nếu giá trị là `1.0` thì hoàn toàn mờ đục. Các giá trị trung gian cho phép bạn đặt một vùng bán trong suốt làm vùng xác định shape.

Trong ví dụ dưới đây, nền của ngôi sao không hoàn toàn trong suốt, có độ mờ 20% như tôi đã tạo trong chương trình đồ họa. Nếu tôi đặt `shape-image-threshold` thành `0.2` hoặc lớn hơn, tôi thấy shape; nếu đặt nhỏ hơn `0.2` thì không có shape.

```html hidden live-sample___threshold
<div class="box">
  <img
    alt="A red star"
    src="https://mdn.github.io/shared-assets/images/examples/star-red-20.png" />
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
  font: 1.2em / 1.5 sans-serif;
}

img {
  float: left;
  shape-outside: url("https://mdn.github.io/shared-assets/images/examples/star-red-20.png");
  shape-image-threshold: 0.2;
}
```

{{EmbedLiveSample("threshold", "", "340px")}}

## Sử dụng hình ảnh với generated content

Trong ví dụ trên, tôi đã vừa dùng hình ảnh làm giá trị của {{cssxref("shape-outside")}} vừa thêm nó vào trang. Nhiều bản demo làm điều này vì nó giúp hiển thị shape chúng ta đang theo, tuy nhiên thuộc tính `shape-outside` không liên quan đến hình ảnh được hiển thị trên trang, vì vậy bạn không cần hiển thị hình ảnh để dùng hình ảnh tạo shape.

Bạn cần có thứ gì đó để float, nhưng đó có thể là generated content như trong ví dụ dưới đây. Tôi đang float generated content và dùng hình ảnh ngôi sao lớn hơn để tạo hình dạng cho nội dung mà không hiển thị bất kỳ hình ảnh nào trên trang.

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
  font: 1.2em / 1.5 sans-serif;
}

.box::before {
  content: "";
  float: left;
  width: 400px;
  height: 300px;
  shape-outside: url("https://mdn.github.io/shared-assets/images/examples/star-shape.png");
  shape-image-threshold: 0.3;
}
```

{{EmbedLiveSample("generated-content", "", "420px")}}

## Tạo shape bằng gradient

Vì [CSS gradient](/en-US/docs/Web/CSS/Guides/Images/Using_gradients) được coi là hình ảnh, bạn có thể dùng gradient để tạo shape bằng cách có các vùng trong suốt hoặc bán trong suốt như một phần của gradient.

Ví dụ tiếp theo sử dụng generated content. Nội dung được float, với hình nền là linear gradient. Tôi dùng cùng giá trị đó làm giá trị của {{cssxref("shape-outside")}}. Linear gradient chạy từ màu tím đến trong suốt. Bằng cách thay đổi giá trị của {{cssxref("shape-image-threshold")}}, bạn có thể quyết định mức độ trong suốt của các pixel tạo nên shape. Bạn có thể thử nghiệm với giá trị đó trong ví dụ dưới đây để thấy đường chéo sẽ di chuyển trên shape như thế nào tùy thuộc vào giá trị đó.

Bạn cũng có thể thử xóa hình nền hoàn toàn, sử dụng gradient thuần túy để tạo shape mà không hiển thị nó trên trang.

```html live-sample___gradient
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

```css live-sample___gradient
body {
  font: 1.2em / 1.5 sans-serif;
}

.box::before {
  content: "";
  float: left;
  height: 250px;
  width: 400px;
  background-image: linear-gradient(
    to bottom right,
    rebeccapurple,
    transparent
  );
  shape-outside: linear-gradient(to bottom right, rebeccapurple, transparent);
  shape-image-threshold: 0.3;
}
```

{{EmbedLiveSample("gradient", "", "400px")}}

Ví dụ tiếp theo sử dụng radial gradient với ellipse, một lần nữa dùng phần trong suốt của gradient để tạo shape.

```html hidden live-sample___radial-gradient
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

```css live-sample___radial-gradient
body {
  font: 1.2em / 1.5 sans-serif;
}

.box::before {
  content: "";
  float: left;
  height: 250px;
  width: 400px;
  background-image: radial-gradient(
    ellipse closest-side,
    rebeccapurple,
    blue 50%,
    transparent
  );
  shape-outside: radial-gradient(
    ellipse closest-side,
    rebeccapurple,
    blue 50%,
    transparent
  );
  shape-image-threshold: 0.3;
}
```

{{EmbedLiveSample("radial-gradient", "", "400px")}}

Bạn có thể thử nghiệm trực tiếp trong các ví dụ trực tiếp này để xem cách thay đổi gradient sẽ thay đổi đường dẫn của shape.
