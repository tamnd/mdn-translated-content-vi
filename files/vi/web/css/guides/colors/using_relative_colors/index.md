---
title: Using relative colors
slug: Web/CSS/Guides/Colors/Using_relative_colors
page-type: guide
sidebar: cssref
---

[Module CSS colors](/en-US/docs/Web/CSS/Guides/Colors) định nghĩa **cú pháp relative color**, cho phép giá trị CSS {{cssxref("&lt;color&gt;")}} được định nghĩa tương đối so với màu khác. Đây là tính năng mạnh mẽ cho phép tạo ra các biến thể bổ sung cho màu hiện có theo lập trình — chẳng hạn như các biến thể sáng hơn, tối hơn, bão hòa hơn, bán trong suốt, hoặc đảo ngược — cho phép tạo bảng màu hiệu quả hơn.

Bài viết này giải thích cú pháp relative color, trình bày các tùy chọn khác nhau là gì, và xem xét một số ví dụ minh họa.

## Cú pháp chung

Giá trị relative CSS color có cấu trúc cú pháp chung sau:

```css
color-function(from origin-color channel1 channel2 channel3)
color-function(from origin-color channel1 channel2 channel3 / alpha)

/* color space included in the case of color() functions */
color(from origin-color colorspace channel1 channel2 channel3)
color(from origin-color colorspace channel1 channel2 channel3 / alpha)
```

Relative colors được tạo bằng cùng [hàm màu](/en-US/docs/Web/CSS/Guides/Colors#functions) như absolute colors, nhưng với các tham số khác:

1. Bao gồm hàm màu cơ bản (được đại diện bởi _`color-function()`_ ở trên) như [`rgb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb), [`hsl()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hsl), v.v. Cái bạn chọn phụ thuộc vào mô hình màu bạn muốn sử dụng cho relative color bạn đang tạo (**màu đầu ra**).
2. Truyền vào **màu gốc** (được đại diện ở trên bởi _`origin-color`_) mà relative color của bạn sẽ dựa trên, được đặt trước bởi keyword `from`. Đây có thể là bất kỳ giá trị {{cssxref("&lt;color&gt;")}} hợp lệ nào sử dụng bất kỳ mô hình màu nào có sẵn, bao gồm giá trị màu có trong [CSS custom property](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties), system colors, `currentColor`, hoặc thậm chí là relative color khác.
3. Trong trường hợp hàm [`color()`](/en-US/docs/Web/CSS/Reference/Values/color_value/color), bao gồm _[`colorspace`](/en-US/docs/Web/CSS/Reference/Values/color_value/color#colorspace)_ của màu đầu ra.
4. Cung cấp giá trị đầu ra cho từng kênh riêng lẻ. Màu đầu ra được định nghĩa sau màu gốc — được đại diện ở trên bởi các placeholder _`channel1`_, _`channel2`_, và _`channel3`_. Các kênh được định nghĩa ở đây phụ thuộc vào [hàm màu](/en-US/docs/Web/CSS/Guides/Colors#functions) bạn đang sử dụng cho relative color. Ví dụ, nếu bạn đang dùng [`hsl()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hsl), bạn cần định nghĩa các giá trị cho hue, saturation, và lightness. Mỗi giá trị kênh có thể là giá trị mới, giống giá trị ban đầu, hoặc giá trị tương đối so với giá trị kênh của màu gốc.
5. Tùy chọn, giá trị kênh `alpha` kiểu {{CSSXref("&lt;alpha-value&gt;")}} cho màu đầu ra có thể được định nghĩa, đặt trước bởi dấu gạch chéo (`/`). Nếu giá trị kênh `alpha` không được chỉ định tường minh, nó mặc định là giá trị kênh alpha của _`origin-color`_ (không phải 100%, đây là trường hợp cho absolute color values).

Trình duyệt chuyển đổi màu gốc sang cú pháp tương thích với hàm màu rồi phân tách nó thành các kênh màu thành phần (cộng với kênh `alpha` nếu màu gốc có một). Chúng được làm sẵn dưới dạng các giá trị được đặt tên thích hợp bên trong hàm màu — `r`, `g`, `b`, và `alpha` trong trường hợp hàm `rgb()`, `l`, `a`, `b`, và `alpha` trong trường hợp hàm `lab()`, `h`, `w`, `b`, và `alpha` trong trường hợp `hwb()`, v.v. — có thể được dùng để tính toán giá trị kênh đầu ra mới.

Hãy xem cú pháp relative color trong thực tế. CSS dưới đây được dùng để tạo style cho hai phần tử {{htmlelement("div")}}, một có màu nền tuyệt đối — `red` — và một có màu nền tương đối được tạo với hàm `rgb()`, dựa trên cùng giá trị màu `red`:

```html hidden live-sample___simple-relative-color
<div id="container">
  <div class="item" id="one"></div>
  <div class="item" id="two"></div>
</div>
```

```css hidden live-sample___simple-relative-color
#container {
  display: flex;
  width: 100vw;
  height: 100vh;
  box-sizing: border-box;
}

.item {
  flex: 1;
  margin: 20px;
}
```

```css live-sample___simple-relative-color
#one {
  background-color: red;
}

#two {
  background-color: rgb(from red 200 g b / alpha);
}
```

Đầu ra như sau:

{{ EmbedLiveSample("simple-relative-color", "100%", "200") }}

Relative color sử dụng hàm [`rgb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb), lấy `red` làm màu gốc, chuyển đổi nó thành màu `rgb()` tương đương (`rgb(255 0 0)`) và sau đó định nghĩa màu mới có kênh đỏ giá trị `200` và kênh lục, lam và alpha với giá trị giống màu gốc (nó sử dụng giá trị `g` và `b` được tạo sẵn bên trong hàm bởi trình duyệt, cả hai đều bằng `0`, và `alpha` là `100%`).

Điều này tạo ra đầu ra `rgb(200 0 0)` — một màu đỏ sẫm hơn một chút. Nếu chúng ta chỉ định giá trị kênh đỏ là `255` (hoặc chỉ giá trị `r`), màu đầu ra kết quả sẽ giống hệt giá trị đầu vào. Màu đầu ra cuối cùng của trình duyệt (giá trị tính toán) là giá trị `color()` sRGB tương đương với `rgb(200 0 0)` — `color(srgb 0.784314 0 0)`.

> [!NOTE]
> Như đã đề cập ở trên, khi tính toán relative color, điều đầu tiên trình duyệt làm là chuyển đổi màu gốc được cung cấp (`red` trong ví dụ trên) thành giá trị tương thích với hàm màu đang được sử dụng (trong trường hợp này, `rgb()`). Điều này được thực hiện để trình duyệt có thể tính toán màu đầu ra từ màu gốc. Trong khi các tính toán được thực hiện tương đối so với hàm màu được sử dụng, giá trị màu đầu ra thực tế phụ thuộc vào không gian màu của màu:
>
> - Các hàm màu sRGB cũ hơn không thể biểu diễn toàn bộ phổ màu sắc có thể nhìn thấy. Màu đầu ra của ([`hsl()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hsl), [`hwb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hwb), và [`rgb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb)) được serialize thành `color(srgb)` để tránh những hạn chế này. Điều đó có nghĩa là truy vấn giá trị màu đầu ra qua thuộc tính {{domxref("HTMLElement.style")}} hoặc phương thức {{domxref("CSSStyleDeclaration.getPropertyValue()")}} trả về màu đầu ra dưới dạng giá trị [`color(srgb ...)`](/en-US/docs/Web/CSS/Reference/Values/color_value/color).
> - Đối với các hàm màu gần đây hơn (`lab()`, `oklab()`, `lch()`, và `oklch()`), giá trị đầu ra relative color được biểu diễn theo cú pháp giống như hàm màu được sử dụng. Ví dụ, nếu hàm màu [`lab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lab) đang được sử dụng, màu đầu ra sẽ là giá trị `lab()`.

Tất cả các dòng sau đây tạo ra màu đầu ra tương đương:

```css
red
rgb(255 0 0)
rgb(from red 255 0 0)
rgb(from red 255 0 0 / 1)
rgb(from red 255 0 0 / 100%)

rgb(from red 255 g b)
rgb(from red r 0 0)
rgb(from red r g b / 1)
rgb(from red r g b / 100%)

rgb(from red r g b)
rgb(from red r g b / alpha)

/* With `red`, the g and b are the same, making them interchangeable */
rgb(from red r g g)
rgb(from red r b b)
rgb(from red 255 g g)
rgb(from red 255 b b)
```

## Tính linh hoạt của cú pháp

Có sự phân biệt quan trọng cần thực hiện giữa các giá trị kênh màu gốc được phân tách và làm sẵn trong hàm, và các giá trị kênh của màu đầu ra được đặt bởi developer.

Để nhắc lại, khi relative color được định nghĩa, các giá trị kênh của màu gốc được làm sẵn trong hàm để sử dụng khi định nghĩa các giá trị kênh màu đầu ra. Ví dụ sau định nghĩa relative color sử dụng hàm `rgb()` và sử dụng các giá trị kênh màu gốc (được làm sẵn như `r`, `g`, và `b`) cho các giá trị kênh đầu ra, có nghĩa là màu đầu ra giống màu gốc:

```css
rgb(from red r g b)
```

Tuy nhiên, khi chỉ định các giá trị đầu ra, bạn không cần phải sử dụng các giá trị kênh màu gốc chút nào. Bạn cần cung cấp các giá trị kênh đầu ra theo đúng thứ tự (ví dụ: đỏ, rồi lục, rồi lam trong trường hợp `rgb()`), nhưng chúng có thể là bất kỳ giá trị nào miễn là chúng là giá trị hợp lệ cho các kênh đó. Điều này mang lại cho relative CSS colors mức độ linh hoạt cao.

Ví dụ, nếu muốn, bạn có thể chỉ định các giá trị tuyệt đối như bên dưới, chuyển đổi `red` thành `blue`:

```css
rgb(from red 0 0 255)
/* output color is equivalent to rgb(0 0 255), full blue */
```

> [!NOTE]
> Nếu bạn đang sử dụng cú pháp relative color nhưng xuất ra cùng màu với màu gốc hoặc màu không dựa trên màu gốc chút nào, bạn thực sự không tạo ra relative color. Bạn khó có thể làm điều này trong một codebase thực tế, và có thể chỉ dùng giá trị màu tuyệt đối. Nhưng chúng tôi thấy hữu ích khi giải thích rằng bạn _có thể_ làm điều này với cú pháp relative color, như điểm khởi đầu để tìm hiểu về nó.

Bạn thậm chí có thể trộn hoặc lặp lại các giá trị được cung cấp. Ví dụ sau lấy màu đỏ sẫm hơn một chút làm đầu vào và xuất ra màu xám nhạt — các kênh `r`, `g`, và `b` của màu đầu ra đều được đặt thành giá trị kênh `r` của màu gốc:

```css
rgb(from rgb(200 0 0) r r r)
/* output color is equivalent to rgb(200 200 200), light gray */
```

Ví dụ sau sử dụng các giá trị kênh màu gốc cho các giá trị kênh `r`, `g`, và `b` của màu đầu ra, nhưng theo thứ tự ngược lại:

```css
rgb(from rgb(200 170 0) b g r)
/* output color is equivalent to rgb(0 170 200) */
```

## Các hàm màu hỗ trợ relative colors

Trong phần trên, chúng ta chỉ thấy relative colors được định nghĩa qua hàm [`rgb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb). Tuy nhiên, relative colors có thể được định nghĩa bằng bất kỳ hàm màu CSS hiện đại nào — [`color()`](/en-US/docs/Web/CSS/Reference/Values/color_value/color), [`hsl()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hsl), [`hwb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hwb), [`lab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lab), [`lch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lch), [`oklab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/oklab), [`oklch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/oklch), hoặc [`rgb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb). Cấu trúc cú pháp chung là như nhau trong mỗi trường hợp, mặc dù các giá trị màu gốc có tên khác nhau phù hợp với hàm được sử dụng.

Dưới đây bạn có thể tìm thấy các ví dụ cú pháp relative color cho mỗi hàm màu. Mỗi trường hợp là đơn giản nhất có thể, với các giá trị kênh màu đầu ra khớp chính xác với các giá trị kênh màu gốc:

```css
/* color() with and without alpha channel */
color(from red a98-rgb r g b)
color(from red a98-rgb r g b / alpha)

color(from red xyz-d50 x y z)
color(from red xyz-d50 x y z / alpha)

/* hsl() with and without alpha channel */
hsl(from red h s l)
hsl(from red h s l / alpha)

/* hwb() with and without alpha channel */
hwb(from red h w b)
hwb(from red h w b / alpha)

/* lab() with and without alpha channel */
lab(from red l a b)
lab(from red l a b / alpha)

/* lch() with and without alpha channel */
lch(from red l c h)
lch(from red l c h / alpha)

/* oklab() with and without alpha channel */
oklab(from red l a b)
oklab(from red l a b / alpha)

/* oklch() with and without alpha channel */
oklch(from red l c h)
oklch(from red l c h / alpha)

/* rgb() with and without alpha channel */
rgb(from red r g b)
rgb(from red r g b / alpha)
```

Đáng đề cập lại rằng hệ thống màu của màu gốc không cần phải khớp với hệ thống màu được sử dụng để tạo màu đầu ra. Điều này một lần nữa mang lại nhiều linh hoạt. Thông thường bạn sẽ không quan tâm và thậm chí có thể không biết hệ thống màu mà màu gốc được định nghĩa (bạn có thể chỉ có [giá trị custom property](#using_custom_properties) để thao tác). Bạn sẽ chỉ muốn nhập một màu và, ví dụ, tạo biến thể sáng hơn của nó bằng cách đưa nó vào hàm `hsl()` và thay đổi giá trị lightness.

## Sử dụng custom properties

Khi tạo relative color, bạn có thể sử dụng các giá trị được định nghĩa trong [CSS custom properties](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties) cả cho màu gốc và trong các định nghĩa giá trị kênh màu đầu ra. Hãy xem một ví dụ.

Trong CSS dưới đây chúng ta định nghĩa hai custom properties:

- `--base-color` chứa màu thương hiệu cơ sở của chúng ta — `purple`. Ở đây chúng ta đang sử dụng color keyword có tên, nhưng relative colors có thể chấp nhận bất kỳ cú pháp màu nào cho màu gốc.
- `--standard-opacity` chứa giá trị độ mờ đục thương hiệu tiêu chuẩn mà chúng ta muốn áp dụng cho các hộp bán trong suốt — `0.75`.

Sau đó chúng ta đặt hai phần tử {{htmlelement("div")}} một màu nền. Một phần tử được đặt màu tuyệt đối — màu tím thương hiệu `--base-color` của chúng ta. Phần tử kia được đặt màu tương đối bằng màu tím thương hiệu của chúng ta, được biến đổi để thêm kênh alpha bằng giá trị độ mờ đục tiêu chuẩn của chúng ta.

```html hidden
<div id="container">
  <div class="item" id="one"></div>
  <div class="item" id="two"></div>
</div>
```

```css hidden
#container {
  display: flex;
  width: 100vw;
  height: 100vh;
  box-sizing: border-box;
  background-image: repeating-linear-gradient(
    45deg,
    white,
    white 24px,
    black 25px,
    black 50px
  );
}

.item {
  flex: 1;
  margin: 20px;
}
```

```css
:root {
  --base-color: purple;
  --standard-opacity: 0.75;
}

#one {
  background-color: var(--base-color);
}

#two {
  background-color: hwb(from var(--base-color) h w b / var(--standard-opacity));
}
```

Đầu ra như sau:

{{ EmbedLiveSample("Using custom properties", "100%", "200") }}

## Sử dụng hàm toán học

Bạn có thể sử dụng [hàm toán học](/en-US/docs/Web/CSS/Reference/Values/Functions#math_functions) CSS như {{cssxref("calc")}} để tính toán giá trị cho các kênh màu đầu ra. Hãy xem một ví dụ.

CSS dưới đây được dùng để tạo style cho ba phần tử {{htmlelement("div")}} với các màu nền khác nhau. Phần tử giữa được đặt `--base-color` không được sửa đổi, trong khi phần tử trái và phải được đặt các biến thể sáng hơn và tối hơn của `--base-color` đó. Các biến thể này được định nghĩa bằng relative colors — `--base-color` được truyền vào hàm `lch()`, và màu đầu ra có kênh lightness được sửa đổi để đạt được hiệu ứng mong muốn qua hàm `calc()`. Màu sáng hơn có 20% được thêm vào kênh lightness, và màu tối hơn có 20% bị trừ đi từ nó.

```html hidden
<div id="container">
  <div class="item" id="one"></div>
  <div class="item" id="two"></div>
  <div class="item" id="three"></div>
</div>
```

```css hidden
#container {
  display: flex;
  width: 100vw;
  height: 100vh;
  box-sizing: border-box;
}

.item {
  flex: 1;
  margin: 20px;
}
```

```css
:root {
  --base-color: orange;
}

#one {
  background-color: lch(from var(--base-color) calc(l + 20) c h);
}

#two {
  background-color: var(--base-color);
}

#three {
  background-color: lch(from var(--base-color) calc(l - 20) c h);
}
```

Đầu ra như sau:

{{ EmbedLiveSample("Using math functions", "100%", "200") }}

## Thao tác kênh alpha

Ví dụ này minh họa việc thay đổi kênh alpha của một màu có tên. Ở đây, chúng ta có một mục được bao bọc trong container, cả hai đều có nền `teal`. Để phân biệt các nền, chúng ta thay đổi giá trị kênh alpha bằng tính năng relative color, [hàm `calc()`](/en-US/docs/Web/CSS/Reference/Values/calc), và [custom property](/en-US/docs/Web/CSS/Reference/Properties/--*).

```html
<div class="container">
  <div class="item"></div>
</div>
```

```css hidden
.container {
  padding: 60px;
}

.item {
  height: 60px;
}
```

```css
div {
  background-color: rgb(
    from teal r g b / calc(alpha * var(--alpha-multiplier))
  );
}

.container {
  --alpha-multiplier: 0.3;
}

.item {
  --alpha-multiplier: 1;
}
```

Kênh alpha được tham chiếu bằng keyword `alpha`. Trong trường hợp này, biểu thức `calc(alpha * var(--alpha-multiplier))` sửa đổi giá trị kênh alpha bằng cách nhân `alpha` với giá trị custom property `--alpha-multiplier`. Container có nền bán trong suốt vì hệ số nhân `0.3` nhỏ hơn `1.0`.

Đầu ra như sau:

{{ EmbedLiveSample("Manipulating alpha channel", "100%", "200") }}

## Giá trị kênh phân giải thành giá trị `<number>`

Để các phép tính giá trị kênh hoạt động trong relative colors, tất cả giá trị kênh màu gốc phân giải thành các giá trị {{cssxref("&lt;number&gt;")}} thích hợp. Ví dụ, trong các ví dụ `lch()` ở trên, chúng ta đang tính toán giá trị lightness mới bằng cách cộng hoặc trừ các số từ giá trị kênh `l` của màu gốc. Nếu chúng ta thử `calc(l + 20%)`, điều đó sẽ dẫn đến màu không hợp lệ — `l` là `<number>` và không thể có {{cssxref("&lt;percentage&gt;")}} được thêm vào nó.

- Giá trị kênh ban đầu được chỉ định dưới dạng `<percentage>` phân giải thành `<number>` phù hợp với hàm màu đầu ra.
- Giá trị kênh ban đầu được chỉ định dưới dạng góc {{cssxref("hue")}} phân giải thành số độ trong phạm vi `0` đến `360`, bao gồm.

Kiểm tra các [trang hàm màu](/en-US/docs/Web/CSS/Guides/Colors#functions) khác nhau để biết chi tiết về các giá trị kênh gốc của chúng phân giải thành gì.

## Kiểm tra hỗ trợ trình duyệt

Bạn có thể kiểm tra xem trình duyệt có hỗ trợ cú pháp relative color bằng cách chạy nó qua at-rule {{cssxref("@supports")}}.

Ví dụ:

```css
@supports (color: hsl(from white h s l)) {
  /* safe to use hsl() relative color syntax */
}
```

## Ví dụ

> [!NOTE]
> Bạn có thể tìm thêm ví dụ minh họa việc sử dụng cú pháp relative color trong các kiểu ký hiệu hàm khác nhau trên các trang dành riêng của chúng: [`color()`](/en-US/docs/Web/CSS/Reference/Values/color_value/color#using_relative_colors_with_color), [`hsl()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hsl#using_relative_colors_with_hsl), [`hwb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/hwb#using_relative_colors_with_hwb), [`lab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lab#using_relative_colors_with_lab), [`lch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lch#using_relative_colors_with_lch), [`oklab()`](/en-US/docs/Web/CSS/Reference/Values/color_value/oklab#using_relative_colors_with_oklab), [`oklch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/oklch#using_relative_colors_with_oklch), [`rgb()`](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb#using_relative_colors_with_rgb).

### Trình tạo bảng màu

Ví dụ này cho phép bạn chọn màu cơ sở và kiểu bảng màu. Trình duyệt sau đó sẽ hiển thị bảng màu phù hợp dựa trên màu cơ sở được chọn. Các lựa chọn bảng màu như sau:

- **Complementary**: Bao gồm hai màu ở hai phía đối diện của bánh xe màu, hay nói cách khác, _hue đối diện_ (xem kiểu dữ liệu {{cssxref("hue")}} để biết thêm thông tin về hue và bánh xe màu). Hai màu được định nghĩa là màu cơ sở, và màu cơ sở với kênh hue +180 độ.
- **Triadic**: Bao gồm ba màu cách đều nhau xung quanh bánh xe màu. Ba màu được định nghĩa là màu cơ sở, màu cơ sở với kênh hue -120 độ, và màu cơ sở với kênh hue +120 độ.
- **Tetradic**: Bao gồm bốn màu cách đều nhau xung quanh bánh xe màu. Bốn màu được định nghĩa là màu cơ sở, và màu cơ sở với kênh hue +90, +180, và +270 độ.
- **Monochrome**: Bao gồm nhiều màu có cùng hue nhưng giá trị lightness khác nhau. Trong ví dụ của chúng ta, chúng ta đã định nghĩa năm màu trong bảng màu đơn sắc — màu cơ sở, và màu cơ sở với kênh lightness -20, -10, +10, và +20.

#### HTML

HTML đầy đủ được bao gồm dưới đây để tham khảo. Các phần thú vị nhất như sau:

- Custom property `--base-color` được lưu trữ như thuộc tính inline [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) trên phần tử {{htmlelement("div")}} có ID là `container`. Chúng ta đặt nó ở đó để cập nhật giá trị bằng JavaScript. Chúng ta đã cung cấp giá trị ban đầu là `#ff0000` (`red`) để hiển thị bảng màu dựa trên giá trị đó khi ví dụ tải. Lưu ý rằng thông thường chúng ta sẽ đặt điều này trên phần tử {{htmlelement("html")}}, nhưng MDN live sample đã loại bỏ nó khi render.
- Color picker cơ sở được tạo bằng điều khiển [`<input type="color">`](/en-US/docs/Web/HTML/Reference/Elements/input/color). Khi giá trị mới được đặt trong điều khiển này, custom property `--base-color` được đặt thành giá trị này bằng JavaScript, điều này lần lượt tạo ra bảng màu mới. Tất cả các màu được hiển thị là relative colors dựa trên `--base-color`.
- Tập hợp các điều khiển [`<input type="radio">`](/en-US/docs/Web/HTML/Reference/Elements/input/radio) cho phép chọn kiểu bảng màu để tạo. Khi giá trị mới được chọn ở đây, JavaScript được dùng để đặt class mới trên `<div>` `container` để đại diện cho bảng màu được chọn. Trong CSS, các bộ chọn descendant được dùng để nhắm mục tiêu các `<div>` con (ví dụ: `.comp :nth-child(1)`) để chúng có thể áp dụng màu sắc đúng và ẩn các nút `<div>` không được sử dụng.
- `<div>` `container` chứa các `<div>` con hiển thị các màu của bảng màu được tạo. Lưu ý rằng class ban đầu là `comp` được đặt trên nó, để trang sẽ hiển thị bảng màu bổ sung khi tải lần đầu.

```html
<div>
  <h1>Color palette generator</h1>
  <form>
    <div id="color-picker">
      <label for="color">Select a base color:</label>
      <input type="color" id="color" name="color" value="#ff0000" />
    </div>
    <div>
      <fieldset>
        <legend>Select a color palette type:</legend>

        <div>
          <input
            type="radio"
            id="comp"
            name="palette-type"
            value="comp"
            checked />
          <label for="comp">Complementary</label>
        </div>

        <div>
          <input
            type="radio"
            id="triadic"
            name="palette-type"
            value="triadic" />
          <label for="triadic">Triadic</label>
        </div>

        <div>
          <input
            type="radio"
            id="tetradic"
            name="palette-type"
            value="tetradic" />
          <label for="tetradic">Tetradic</label>
        </div>

        <div>
          <input
            type="radio"
            id="monochrome"
            name="palette-type"
            value="monochrome" />
          <label for="monochrome">Monochrome</label>
        </div>
      </fieldset>
    </div>
  </form>
  <div id="container" class="comp">
    <div></div>
    <div></div>
    <div></div>
    <div></div>
    <div></div>
  </div>
</div>
```

#### CSS

Dưới đây chúng ta chỉ hiển thị CSS đặt màu bảng màu. Lưu ý cách, trong mỗi trường hợp, các bộ chọn descendant được dùng để áp dụng {{cssxref("background-color")}} đúng cho mỗi `<div>` con cho bảng màu được chọn. Chúng ta quan tâm đến vị trí của các `<div>` trong thứ tự nguồn hơn là kiểu phần tử, vì vậy chúng ta đã sử dụng {{cssxref(":nth-child")}} để nhắm mục tiêu chúng.

Trong quy tắc cuối cùng, chúng ta đã sử dụng [bộ chọn sibling chung (`~`)](/en-US/docs/Web/CSS/Reference/Selectors/Subsequent-sibling_combinator) để nhắm mục tiêu các phần tử `<div>` không được sử dụng trong mỗi kiểu bảng màu, đặt [`display: none`](/en-US/docs/Web/CSS/Reference/Selectors/Subsequent-sibling_combinator) để ngăn chúng được render.

Các màu sắc bao gồm `--base-color`, cộng với relative colors được dẫn xuất từ `--base-color` đó. Các relative colors sử dụng hàm [`lch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lch) — truyền vào `--base-color` gốc và định nghĩa màu đầu ra với kênh lightness hoặc hue được điều chỉnh thích hợp.

```css hidden
html {
  font-family: sans-serif;
}

body {
  margin: 0;
}

h1 {
  margin-left: 16px;
}

/* Basic form styling */

#color-picker {
  margin-left: 16px;
  margin-bottom: 20px;
}

#color-picker label,
legend {
  display: block;
  font-size: 0.8rem;
  margin-bottom: 10px;
}

input[type="color"] {
  width: 200px;
  display: block;
}

fieldset {
  display: flex;
  gap: 20px;
  border: 0;
}

/* Palette container styling */

#container {
  /* Default value */
  --base-color: red;

  display: flex;
  width: 100vw;
  height: 250px;
  box-sizing: border-box;
}

#container div {
  flex: 1;
}
```

```css
/* Complementary colors */
/* Base color, and base color with hue channel +180 degrees */

.comp :nth-child(1) {
  background-color: var(--base-color);
}

.comp :nth-child(2) {
  background-color: lch(from var(--base-color) l c calc(h + 180));
}

/* Use @supports to add in support old syntax that requires deg units
   to be specified in hue calculations. This is required for Safari 16.4+. */
@supports (color: lch(from red l c calc(h + 180deg))) {
  .comp :nth-child(2) {
    background-color: lch(from var(--base-color) l c calc(h + 180deg));
  }
}

/* Triadic colors */
/* Base color, base color with hue channel -120 degrees, and base color */
/* with hue channel +120 degrees */

.triadic :nth-child(1) {
  background-color: var(--base-color);
}

.triadic :nth-child(2) {
  background-color: lch(from var(--base-color) l c calc(h - 120));
}

.triadic :nth-child(3) {
  background-color: lch(from var(--base-color) l c calc(h + 120));
}

/* Use @supports to add in support old syntax that requires deg units
   to be specified in hue calculations. This is required for Safari 16.4+. */
@supports (color: lch(from red l c calc(h + 120deg))) {
  .triadic :nth-child(2) {
    background-color: lch(from var(--base-color) l c calc(h - 120deg));
  }

  .triadic :nth-child(3) {
    background-color: lch(from var(--base-color) l c calc(h + 120deg));
  }
}

/* Tetradic colors */
/* Base color, and base color with hue channel +90, +180, and +270 degrees */

.tetradic :nth-child(1) {
  background-color: var(--base-color);
}

.tetradic :nth-child(2) {
  background-color: lch(from var(--base-color) l c calc(h + 90));
}

.tetradic :nth-child(3) {
  background-color: lch(from var(--base-color) l c calc(h + 180));
}

.tetradic :nth-child(4) {
  background-color: lch(from var(--base-color) l c calc(h + 270));
}

/* Use @supports to add in support old syntax that requires deg units
   to be specified in hue calculations. This is required for Safari 16.4+. */
@supports (color: lch(from red l c calc(h + 90deg))) {
  .tetradic :nth-child(2) {
    background-color: lch(from var(--base-color) l c calc(h + 90deg));
  }

  .tetradic :nth-child(3) {
    background-color: lch(from var(--base-color) l c calc(h + 180deg));
  }

  .tetradic :nth-child(4) {
    background-color: lch(from var(--base-color) l c calc(h + 270deg));
  }
}

/* Monochrome colors */
/* Base color, and base color with lightness channel -20, -10, +10, and +20 */

.monochrome :nth-child(1) {
  background-color: lch(from var(--base-color) calc(l - 20) c h);
}

.monochrome :nth-child(2) {
  background-color: lch(from var(--base-color) calc(l - 10) c h);
}

.monochrome :nth-child(3) {
  background-color: var(--base-color);
}

.monochrome :nth-child(4) {
  background-color: lch(from var(--base-color) calc(l + 10) c h);
}

.monochrome :nth-child(5) {
  background-color: lch(from var(--base-color) calc(l + 20) c h);
}

/* Hide unused swatches for each palette type */
.comp :nth-child(2) ~ div,
.triadic :nth-child(3) ~ div,
.tetradic :nth-child(4) ~ div {
  display: none;
}
```

##### Ghi chú về kiểm tra `@supports`

Trong CSS ví dụ, bạn sẽ chú ý các block {{cssxref("@supports")}} được dùng để cung cấp các giá trị {{cssxref("background-color")}} khác nhau cho các trình duyệt hỗ trợ phiên bản dự thảo trước của cú pháp relative color. Chúng cần thiết vì triển khai ban đầu của Safari dựa trên phiên bản cũ hơn của spec, trong đó các giá trị kênh màu gốc phân giải thành {{cssxref("&lt;number&gt;")}}s hoặc các kiểu đơn vị khác tùy thuộc vào ngữ cảnh. Điều này có nghĩa là các giá trị đôi khi yêu cầu đơn vị khi thực hiện cộng và trừ, gây ra sự nhầm lẫn. Trong các triển khai mới hơn, các giá trị kênh màu gốc luôn phân giải thành giá trị {{cssxref("&lt;number&gt;")}} tương đương, có nghĩa là các phép tính luôn được thực hiện với giá trị không có đơn vị.

Lưu ý cách kiểm tra hỗ trợ trong mỗi trường hợp được thực hiện bằng bất kỳ khai báo màu nào — `color: lch(from red l c calc(h + 90deg))` ví dụ — không nhất thiết là giá trị thực tế mà chúng ta cần thay đổi cho các trình duyệt khác. Khi kiểm tra các giá trị phức tạp như thế này, bạn nên dùng khai báo đơn giản nhất có thể vẫn chứa sự khác biệt cú pháp bạn muốn kiểm tra.

Bao gồm custom property trong kiểm tra `@supports` không hoạt động — kiểm tra luôn trả về dương tính bất kể giá trị nào được đặt cho custom property. Điều này là do giá trị custom property chỉ trở thành không hợp lệ khi được gán là giá trị không hợp lệ (hoặc một phần của giá trị không hợp lệ) của thuộc tính CSS thông thường. Để giải quyết vấn đề này, trong mỗi bài kiểm tra, chúng ta đã thay thế `var(--base-color)` bằng keyword `red`.

#### JavaScript

Trong JavaScript, chúng ta:

- Thêm event listener [`change`](/en-US/docs/Web/API/HTMLElement/change_event) vào các radio button để khi một button được chọn, hàm `setContainer()` chạy. Hàm này cập nhật giá trị `class` của `<div>` có `id="container"` với giá trị của radio button được chọn để màu nền đúng sẽ được áp dụng cho các `<div>` con cho kiểu bảng màu được chọn.
- Thêm event listener [`input`](/en-US/docs/Web/API/Element/input_event) vào điều khiển color picker để khi màu mới được chọn, hàm `setBaseColor()` chạy. Hàm này đặt giá trị của custom property `--base-color` thành màu mới.

```js
const form = document.forms[0];
const radios = form.elements["palette-type"];
const colorPicker = form.elements["color"];
const containerElem = document.getElementById("container");

for (const radio of radios) {
  radio.addEventListener("change", setContainer);
}

colorPicker.addEventListener("input", setBaseColor);

function setContainer(e) {
  const palType = e.target.value;
  console.log("radio changed");
  containerElem.setAttribute("class", palType);
}

function setBaseColor(e) {
  console.log("color changed");
  containerElem.style.setProperty("--base-color", e.target.value);
}
```

#### Kết quả

Đầu ra như sau. Điều này bắt đầu cho thấy sức mạnh của relative CSS colors — chúng ta đang định nghĩa nhiều màu và tạo các bảng màu được cập nhật trực tiếp bằng cách điều chỉnh một custom property duy nhất.

{{ EmbedLiveSample("Color palette generator", "100%", "500") }}

### Trình cập nhật bảng màu UI trực tiếp

Ví dụ này hiển thị một thẻ chứa tiêu đề và văn bản, nhưng với sự khác biệt — bên dưới thẻ là điều khiển slider ([`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range)). Khi giá trị của nó được thay đổi, JavaScript được dùng để đặt giá trị custom property `--hue` thành giá trị slider mới.

Điều này lần lượt điều chỉnh bảng màu cho toàn bộ UI:

- Giá trị `--base-color` là relative color với kênh hue được đặt thành giá trị của `--hue`.
- Các màu khác được sử dụng trong thiết kế là relative colors dựa trên `--base-color`. Kết quả là, chúng thay đổi khi `--base-color` thay đổi.

#### HTML

HTML cho ví dụ được hiển thị dưới đây.

- Phần tử {{htmlelement("main")}} đóng vai trò wrapper ngoài để chứa phần còn lại của nội dung, cho phép thẻ và form được căn giữa theo chiều dọc và ngang bên trong `<main>` như một đơn vị.
- Phần tử {{htmlelement("section")}} chứa các phần tử [`<h1>`](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements) và {{htmlelement("p")}} định nghĩa nội dung thẻ.
- Phần tử {{htmlelement("form")}} chứa điều khiển ([`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range)) và {{htmlelement("label")}} của nó.

```html
<main>
  <section>
    <h1>A love of colors</h1>
    <p>
      Colors, the vibrant essence of our surroundings, are truly awe-inspiring.
      From the fiery warmth of reds to the calming coolness of blues, they bring
      unparalleled richness to our world. Colors stir emotions, ignite
      creativity, and shape perceptions, acting as a universal language of
      expression. In their brilliance, colors create a visually enchanting
      tapestry that invites admiration and sparks joy.
    </p>
  </section>
  <form>
    <label for="hue-adjust">Adjust the hue:</label>
    <input
      type="range"
      name="hue-adjust"
      id="hue-adjust"
      value="240"
      min="0"
      max="360" />
  </form>
</main>
```

#### CSS

Trong CSS, `:root` có giá trị `--hue` mặc định được đặt trên nó, các màu [`lch()`](/en-US/docs/Web/CSS/Reference/Values/color_value/lch) tương đối để định nghĩa bảng màu, cộng với radial gradient lấp đầy toàn bộ body.

Các relative colors như sau:

- `--base-color`: Màu cơ sở lấy màu gốc là `red` (mặc dù bất kỳ màu đầy đủ nào cũng sẽ được) và điều chỉnh giá trị hue của nó thành giá trị được đặt trong custom property `--hue`.
- `--bg-color`: Một biến thể sáng hơn nhiều của `--base-color`, dự định dùng làm nền. Được tạo bằng cách lấy màu gốc là `--base-color` và thêm 40 vào giá trị lightness của nó.
- `--complementary-color`: Màu bổ sung cách 180 độ xung quanh bánh xe màu từ `--base-color`. Được tạo bằng cách lấy màu gốc là `--base-color` và thêm 180 vào giá trị hue của nó.

Bây giờ hãy xem phần còn lại của CSS và chú ý tất cả các nơi mà các màu này được sử dụng. Điều này bao gồm [backgrounds](/en-US/docs/Web/CSS/Reference/Properties/background), [borders](/en-US/docs/Web/CSS/Reference/Properties/border), {{cssxref("text-shadow")}}, và thậm chí {{cssxref("accent-color")}} của slider.

> [!NOTE]
> Để ngắn gọn, chỉ hiển thị các phần của CSS liên quan đến việc sử dụng relative color.

```css hidden
html {
  font-family: sans-serif;
}

main {
  width: 80vw;
  margin: 2rem auto;
}

h1 {
  text-align: center;
  margin: 0;
  color: black;
  border-radius: 16px 16px 0 0;
  font-size: 3rem;
  letter-spacing: -1px;
}

p {
  line-height: 1.5;
  margin: 0;
  padding: 1.2rem;
}

form {
  width: fit-content;
  display: flex;
  margin: 2rem auto;
  padding: 0.4rem;
}
```

```css
:root {
  /* Default hue value */
  --hue: 240;

  /* Relative color definitions */
  --base-color: lch(from red l c var(--hue));
  --bg-color: lch(from var(--base-color) calc(l + 40) c h);
  --complementary-color: lch(from var(--base-color) l c calc(h + 180));

  background: radial-gradient(ellipse at center, white 20%, var(--base-color));
}

/* Use @supports to add in support for --complementary-color with old
   syntax that requires deg units to be specified in hue calculations.
   This is required for in Safari 16.4+. */
@supports (color: lch(from red l c calc(h + 180deg))) {
  body {
    --complementary-color: lch(from var(--base-color) l c calc(h + 180deg));
  }
}

/* Box styling */

section {
  background-color: var(--bg-color);
  border: 3px solid var(--base-color);
  border-radius: 20px;
  box-shadow: 10px 10px 30px rgb(0 0 0 / 0.5);
}

h1 {
  background-color: var(--base-color);
  text-shadow:
    1px 1px 1px var(--complementary-color),
    -1px -1px 1px var(--complementary-color),
    0 0 3px var(--complementary-color);
}

/* Range slider styling */

form {
  background-color: var(--bg-color);
  border: 3px solid var(--base-color);
}

input {
  accent-color: var(--complementary-color);
}
```

#### JavaScript

JavaScript thêm event listener [`input`](/en-US/docs/Web/API/Element/input_event) vào điều khiển slider để khi giá trị mới được đặt, hàm `setHue()` chạy. Hàm này đặt giá trị custom property `--hue` inline mới trên `:root` (phần tử `<html>`) ghi đè giá trị mặc định ban đầu chúng ta đặt trong CSS.

```js
const rootElem = document.querySelector(":root");
const slider = document.getElementById("hue-adjust");

slider.addEventListener("input", setHue);

function setHue(e) {
  rootElem.style.setProperty("--hue", e.target.value);
}
```

#### Kết quả

Đầu ra được hiển thị bên dưới. Relative CSS colors đang được sử dụng ở đây để kiểm soát bảng màu của toàn bộ UI, có thể được điều chỉnh trực tiếp khi một giá trị duy nhất được sửa đổi.

{{ EmbedLiveSample("Live UI color scheme updater", "100%", "450") }}

## Xem thêm

- Kiểu dữ liệu {{CSSXref("&lt;color&gt;")}}
- [CSS colors](/en-US/docs/Web/CSS/Guides/Colors) module
- [sRGB](https://en.wikipedia.org/wiki/SRGB) trên Wikipedia
- [CIELAB](https://en.wikipedia.org/wiki/CIELAB_color_space) trên Wikipedia
- [CSS relative color syntax](https://developer.chrome.com/blog/css-relative-color-syntax) trên developer.chrome.com (2023)
