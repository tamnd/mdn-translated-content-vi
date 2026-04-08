---
title: progress()
slug: Web/CSS/Reference/Values/progress
page-type: css-function
browser-compat: css.types.progress
sidebar: cssref
---

Hàm **`progress()`** trong [CSS](/vi/docs/Web/CSS) trả về giá trị {{cssxref("&lt;number>")}} đại diện cho vị trí của một giá trị (giá trị tiến trình) so với hai giá trị khác (giá trị bắt đầu và kết thúc tiến trình).

## Cú pháp

```css-nolint
/* Với giá trị tiến trình cố định */
progress(300, 0, 1000)
progress(50px, 0px, 100px)
progress(50%, 30%, 80%)

/* Với thuộc tính tùy chỉnh */
progress(var(--container-width), 320, 1200)

/* Bên trong hàm toán học */
calc((progress(var(--container-width), 20%, 80%) / 2) + 0.5)

/* Bên trong hàm không phải toán học */
rgb(
  calc(255 * progress(var(--container-width), 320px, 1200px))
  calc(255 * progress(var(--container-width), 320px, 1200px)) 255 / 0.5
);

/* Hàm toán học bên trong progress() */
progress(calc(20 + 30), 0, 100)
```

### Tham số

Hàm `progress()` nhận ba biểu thức {{cssxref("&lt;calc-sum>")}} phân tách bằng dấu phẩy làm tham số:

```plain
progress(<calc-sum>, <calc-sum>, <calc-sum>)
```

Lần lượt, đây là:

- Progress (Tiến trình)
  - : Giá trị cần tính vị trí so với hai giá trị kia.
- Progress start (Bắt đầu tiến trình)
  - : Giới hạn dưới của tiến trình.
- Progress end (Kết thúc tiến trình)
  - : Giới hạn trên của tiến trình.

### Giá trị trả về

Một {{cssxref("&lt;number>")}} đại diện cho vị trí của giá trị tiến trình so với hai giá trị kia. Được tính như sau:

```plain
(tiến trình - bắt đầu tiến trình) / (kết thúc tiến trình - bắt đầu tiến trình)
```

Nếu giá trị tiến trình nằm giữa giá trị bắt đầu và kết thúc tiến trình, giá trị trả về sẽ nằm giữa `0` và `1`, đại diện cho một phần trăm. Nếu giá trị tiến trình nhỏ hơn giá trị bắt đầu, hoặc lớn hơn giá trị kết thúc, hàm vẫn hợp lệ, nhưng giá trị trả về bị kẹp tại `0` hoặc `1` tương ứng.

## Mô tả

Hàm CSS `progress()` cung cấp cách tính tỷ lệ tiến trình, hữu ích để tạo các trường hợp sử dụng như hoạt ảnh thanh tiến trình, hoặc các hộp mờ dần khi chúng rộng hơn để hiển thị nội dung.

Cách sử dụng đơn giản nhất có thể trông như sau:

```css
opacity: progress(5, 0, 10);
```

Trong trường hợp này, giá trị tính toán của {{cssxref("opacity")}} sẽ là `0.5`, vì 5 nằm giữa `0` và `10`.

### Các loại đơn vị được phép

Các tham số của hàm `progress()` có thể là biểu thức toán học hoặc giá trị đơn giản. Các giá trị (hoặc kết quả biểu thức) có thể là bất kỳ giá trị {{cssxref("&lt;number>")}}, {{cssxref("&lt;dimension>")}}, hoặc {{cssxref("&lt;percentage>")}} nào. Chúng có thể có các đơn vị khác nhau, nhưng tất cả phải cùng loại, nếu không hàm sẽ không hợp lệ.

Ví dụ trước là hợp lệ — tất cả các tham số của nó là giá trị `<number>` không có đơn vị:

```css example-good
progress(5, 0, 10)
```

Ví dụ tiếp theo cũng hợp lệ — tất cả các tham số có đơn vị {{cssxref("&lt;length>")}}. Các giá trị tính toán được dùng cho tính toán. Nếu {{cssxref("font-size")}} là `16px` tại thời điểm tính toán, `3em` sẽ thành `48px`, là `48%` quãng đường giữa `0px` và `100px`, nên giá trị trả về sẽ là `0.48`.

```css example-good
progress(3em, 0px, 100px)
```

Một số ví dụ cuối cùng trong mục này không hợp lệ. Các loại không khớp nên kết quả tính toán không có nghĩa.

```css example-bad
progress(3s, 0px, 100px)
progress(3em, 0, 100)
```

### Tạo giá trị không có đơn vị

Hàm `progress()` xuất ra các giá trị không có đơn vị, do đó nó có thể được dùng để loại bỏ đơn vị khỏi các giá trị tương tự như [hack `tan(atan2())`](https://dev.to/janeori/css-type-casting-to-numeric-tanatan2-scalars-582j). Tuy nhiên, lưu ý rằng do các cập nhật về hành vi xung quanh [CSS typed arithmetic](/vi/docs/Web/CSS/Guides/Values_and_units/Using_typed_arithmetic), điều này cũng có thể đạt được thông qua phép chia đơn giản.

### Kết hợp `progress()` với các hàm và thuộc tính tùy chỉnh khác

Vì `progress()` chỉ trả về giá trị không có đơn vị trong khoảng `0` đến `1`, thường cần kết hợp nó với hàm toán học khác như {{cssxref("calc()")}} để xuất giá trị và đơn vị mong muốn. Bạn cũng có thể dùng [thuộc tính tùy chỉnh CSS](/vi/docs/Web/CSS/Reference/Properties/--*) bên trong các hàm `progress()` — điều này hợp lý vì bạn thường muốn đặt các giá trị giống nhau ở nhiều nơi, và/hoặc dựa chúng trên các thuộc tính tùy chỉnh được thiết lập qua JavaScript.

Ví dụ sau tính toán chiều rộng viewport nằm ở vị trí nào giữa chiều rộng tối thiểu `320px` và tối đa `1200px`. Hàm `calc()` được dùng để nhân giá trị trả về của `progress()` với `600px` để chuyển đổi thành giá trị pixel bằng một nửa tiến trình của chiều rộng viewport giữa `320px` và `1200px`.

```css
width: calc(progress(100vw, 320px, 1200px) * 600px);
```

Ví dụ, nếu chiều rộng viewport là `700px`, giá trị tiến trình sẽ được tính là `((700 - 320) / (1200 - 320))` = `0.431818`. Chiều rộng sau đó sẽ được tính là `0.431818 * 600px`, tương đương `259.1px`.

Ví dụ tiếp theo là bản cập nhật của ví dụ trước, trong đó chúng ta đã dùng thuộc tính tùy chỉnh cho các giá trị tiến trình, bắt đầu và kết thúc tiến trình.

```css
width: calc(
  progress(
      var(--container-width),
      var(--custom-min-width),
      var(--custom-max-width)
    ) *
    var(--custom-max-width)
);
```

Có thể dùng hàm `progress()` để tính toán các giá trị riêng lẻ bên trong các hàm khác và các giá trị thành phần bên trong các giá trị thuộc tính tốc ký, miễn là các hàm của bạn trả về các loại hợp lệ cho các giá trị đó.

Điều này có thể dẫn đến một số biểu thức phức tạp. Ví dụ, ở đây chúng ta đang tính toán hai kênh đầu tiên của màu [`rgb()`](/vi/docs/Web/CSS/Reference/Values/color_value/rgb) tỷ lệ với cùng tỷ lệ chiều rộng như trước:

```css
background-color: rgb(
  calc(
      255 *
        progress(
          var(--container-width),
          var(--custom-min-width),
          var(--custom-max-width)
        )
    )
    calc(
      255 *
        progress(
          var(--container-width),
          var(--custom-min-width),
          var(--custom-max-width)
        )
    )
    255 / 0.5
);
```

## Cú pháp chính thức

{{CSSSyntax}}

## Ví dụ

### Sử dụng `progress()` cơ bản

Trong ví dụ này, chúng ta sẽ trình bày cách sử dụng cơ bản của hàm `progress()` để đặt `width` của thanh tiến trình dưới dạng phần trăm bằng tỷ lệ tiến trình `width` của phần tử cha giữa `min-width` và `max-width` của nó.

#### HTML

HTML có một phần tử {{htmlelement("section")}} đại diện cho nội dung và một phần tử {{htmlelement("div")}} đại diện cho thanh tiến trình chiều rộng.

```html live-sample___basic
<section>
  <div class="progress"></div>
</section>
```

#### CSS

Trong CSS, trước tiên chúng ta đặt một số thuộc tính tùy chỉnh trên phần tử `<section>` để đại diện cho `min-width`, `max-width` và `width` của nó. Sau đó chúng ta đặt các thuộc tính đó theo giá trị thuộc tính tùy chỉnh phù hợp, rồi cho `<section>` một {{cssxref("background-color")}} đặc để nhìn thấy.

```css hidden live-sample___basic
html {
  height: 100%;
  font-family: sans-serif;
}

body,
section {
  height: inherit;
}
```

```css live-sample___basic
section {
  --custom-min-width: 300px;
  --custom-max-width: 700px;
  --custom-width: 600px;

  min-width: var(--custom-min-width);
  max-width: var(--custom-max-width);
  width: var(--custom-width);

  background-color: cyan;
}
```

Tiếp theo với `<div>` — trước tiên chúng ta cho nó một `height` và `background-color` tối để nổi bật so với phần tử `<section>`. Sau đó chúng ta tính `width` của nó bằng cách dùng hàm `progress()` để tính tỷ lệ tiến trình của chiều rộng giữa chiều rộng tối thiểu và tối đa, rồi dùng hàm `calc()` để nhân giá trị trả về của `progress()` với `100%` để trả về một phần trăm.

```css live-sample___basic
.progress {
  height: 4px;
  background-color: red;

  width: calc(
    progress(
        var(--custom-width),
        var(--custom-min-width),
        var(--custom-max-width)
      ) *
      100%
  );
}
```

#### Kết quả

Demo sẽ hiển thị như sau:

{{EmbedLiveSample("basic", "100%", "150")}}

Chiều rộng của `<div>` là `75%` chiều rộng của `<section>`, vì `min-width` là `400px`, `max-width` là `700px`, và `width` là `600px`, tương đương `75%` khoảng cách giữa hai giá trị trước.

### Hiệu ứng thay đổi kích thước trên container

Ví dụ này trình bày một số cách sử dụng `progress()` phức tạp hơn, tạo ra một số hiệu ứng thú vị khi cửa sổ trình duyệt được thay đổi kích thước.

Ví dụ này hoạt động tốt hơn nhiều khi được hiển thị toàn màn hình trong tab trình duyệt máy tính. Do đó, chúng ta không hiển thị nó trong một mẫu trực tiếp nhúng trên trang này. Thay vào đó, bạn có thể tìm thấy nó đang chạy trực tiếp tại [Demo hàm CSS `progress()`](https://mdn.github.io/dom-examples/css-progress/) (xem thêm [mã nguồn](https://github.com/mdn/dom-examples/tree/main/css-progress)).

Mở ví dụ trực tiếp trong một tab riêng biệt, và thử tăng và giảm chiều rộng cửa sổ trình duyệt để xem hiệu ứng. Giữ tab này mở để bạn có thể tham khảo lại khi đọc giải thích bên dưới.

#### HTML

HTML có một phần tử {{htmlelement("article")}} chứa phần còn lại của nội dung, và hai phần tử {{htmlelement("section")}} — một cho ảnh nền, và một chứa nội dung. `<section class="content">` cũng chứa một `<div class="progress">` đại diện cho thanh tiến trình chiều rộng, giống như trong demo trước. Chúng ta đã bỏ qua phần nội dung còn lại để ngắn gọn.

```html
<article>
  <section class="background"></section>
  <section class="content">
    <div class="progress"></div>
    <!-- Nội dung ở đây -->
  </section>
</article>
```

#### JavaScript

Trong script, trước tiên chúng ta lấy tham chiếu đến phần tử `<article>`. Sau đó chúng ta định nghĩa hàm `setContainerWidth()`, lấy chiều rộng client của `<article>` qua {{domxref("Element.getBoundingClientRect()")}}, và đặt một thuộc tính tùy chỉnh `--container-width` trên nó, bằng chiều rộng client làm tròn xuống với `px` được thêm vào.

Sau đó chúng ta đặt trình nghe sự kiện {{domxref("Window.resize_event", "resize")}} trên đối tượng `Window`, chạy `setContainerWidth()` khi cửa sổ trình duyệt được thay đổi kích thước. Chúng ta cũng chạy nó một lần để đặt thuộc tính tùy chỉnh `--container-width` trên phần tử `<article>` khi trang tải.

```js
const articleElem = document.querySelector("article");

function setContainerWidth() {
  const clientWidth = articleElem.getBoundingClientRect().width;
  articleElem.style.setProperty(
    "--container-width",
    `${Math.floor(clientWidth)}px`,
  );
}

window.addEventListener("resize", setContainerWidth);

setContainerWidth();
```

Với thiết lập này, chúng ta có thể đặt một số giá trị thuộc tính dựa trên `--container-width`, để các phần của thiết kế thay đổi linh hoạt khi cửa sổ thay đổi kích thước.

#### CSS

Phần sau chỉ giải thích CSS liên quan đến cách chúng ta đã dùng hàm `progress()` trong demo. Để xem CSS đầy đủ, hãy xem [mã nguồn CSS](https://github.com/mdn/dom-examples/blob/main/css-progress/index.css).

Trước tiên, chúng ta căn giữa `<article>` bên trong `<body>` bằng [flexbox](/vi/docs/Web/CSS/Guides/Flexible_box_layout), rồi đặt một số thuộc tính tùy chỉnh để đại diện cho các giá trị `min-width` và `max-width` sẽ dùng ở nơi khác. Sau đó chúng ta nhắm vào phần tử `<article>`, cho nó giá trị {{cssxref("min-width")}} và {{cssxref("max-width")}} bằng các thuộc tính tùy chỉnh đã đặt trước đó. Chúng ta đặt {{cssxref("position")}} của nó là `relative` để định vị nội dung tương đối với nó, rồi cho nó {{cssxref("width")}} phần trăm, {{cssxref("height")}} cố định và {{cssxref("border")}}.

```css
body {
  height: inherit;
  display: flex;
  justify-content: center;
  align-items: center;
  --custom-min-width: 320px;
  --custom-max-width: 1200px;
}

article {
  min-width: var(--custom-min-width);
  max-width: var(--custom-max-width);
  position: relative;
  width: 70%;
  height: 600px;
  border: 3px solid black;
}
```

Tiếp theo với `<div>` `progress`. Chúng ta đặt `width` của nó bằng phần trăm dựa trên tỷ lệ tiến trình của thuộc tính tùy chỉnh `--container-width` được đặt trên phần tử `<article>` qua JavaScript giữa `min-width` và `max-width` của nó (chúng ta dùng cùng thuộc tính tùy chỉnh ở đây cho tham số thứ hai và thứ ba của `progress()` như đã dùng cho `min-width` và `max-width` của `<article>`).

Chúng ta cũng cho nó một `height` và {{cssxref("background-color")}}, rồi định vị tuyệt đối ở góc trên bên trái của `<article>`.

```css
.progress {
  width: calc(
    progress(
        var(--container-width),
        var(--custom-min-width),
        var(--custom-max-width)
      ) *
      100%
  );
  height: 4px;
  background-color: red;
  position: absolute;
  top: 0;
  left: 0;
}
```

Tiếp theo, chúng ta xem xét `<section>` `background`. Chúng ta định vị tuyệt đối nó tương đối với `<article>`, đặt {{cssxref("inset", "inset: 0")}} trên nó để nó có cùng kích thước và phủ lên trên nó. Sau đó chúng ta đặt một {{cssxref("background-image")}} khá rộng trên nó, và định vị ảnh nền bằng cách cho thuộc tính {{cssxref("background-position-x")}} cùng giá trị với thuộc tính `width` của thanh tiến trình. Điều này tạo ra hiệu ứng khi tăng chiều rộng cửa sổ trình duyệt, ảnh nền di chuyển sang trái, tạo hiệu ứng cuộn ảnh đẹp.

```css
.background {
  position: absolute;
  inset: 0;
  background-image: url("https://mdn.github.io/shared-assets/images/examples/wide-background.jpg");
  background-position-x: calc(
    progress(
        var(--container-width),
        var(--custom-min-width),
        var(--custom-max-width)
      ) *
      100%
  );
}
```

Chúng ta định vị tuyệt đối `<section>` `content` để nó phủ lên trên `<section>` `background`, rồi cho nó một số {{cssxref("padding")}}. Sau đó chúng ta thay đổi hai giá trị thuộc tính khi cửa sổ trình duyệt thay đổi kích thước, sử dụng cùng tỷ lệ tiến trình như trước:

- Chúng ta thay đổi các thành phần R và G của `background-color`, nhân tỷ lệ tiến trình với 255 trong mỗi trường hợp để có giá trị kênh tỷ lệ. Khi cửa sổ rộng hơn, màu nền ít xanh lam hơn và trắng hơn, làm cho cảnh trông như đang chuyển từ đêm sang ngày (giá trị màu có độ mờ `0.5`, nên nó hoạt động như lớp tô màu cho ảnh bên dưới).
- Chúng ta thay đổi {{cssxref("opacity")}} để nội dung mờ dần khi cửa sổ rộng hơn.

```css
.content {
  position: absolute;
  inset: 0;
  padding: 20px;
  background-color: rgb(
    calc(
        255 *
          progress(
            var(--container-width),
            var(--custom-min-width),
            var(--custom-max-width)
          )
      )
      calc(
        255 *
          progress(
            var(--container-width),
            var(--custom-min-width),
            var(--custom-max-width)
          )
      )
      255 / 0.5
  );
  opacity: calc(
    (
        progress(
            var(--container-width),
            var(--custom-min-width),
            var(--custom-max-width)
          ) /
          2
      ) +
      0.5
  );
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Mô-đun CSS values and units](/vi/docs/Web/CSS/Guides/Values_and_units)
- [Container style queries](/vi/docs/Web/CSS/Guides/Containment/Container_size_and_style_queries#container_style_queries)
- [Media queries](/vi/docs/Web/CSS/Guides/Media_queries/Using)
- [Feature queries](/vi/docs/Web/CSS/Guides/Conditional_rules/Using_feature_queries)
