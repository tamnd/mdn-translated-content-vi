---
title: Using filter effects
slug: Web/CSS/Guides/Filter_effects/Using
page-type: guide
sidebar: cssref
---

Bạn đã bao giờ di chuột qua một hình ảnh đen trắng hoặc sepia và hình ảnh đầy màu sắc hiện ra ngay lập tức chưa? Bạn đã bao giờ gặp một hình nền có một khu vực nhỏ bị làm mờ khiến văn bản phía trên dễ đọc hơn chưa? Trong quá khứ, những thao tác này đòi hỏi phần mềm chỉnh sửa ảnh, tốn thời gian và các HTTP request bổ sung.

## Ưu điểm khi sử dụng CSS filter effects

Module [Filter effects](/en-US/docs/Web/CSS/Guides/Filter_effects) trong CSS cung cấp các thuộc tính và hàm cho phép bạn áp dụng các hiệu ứng trực quan mô tả ở trên mà không cần dùng Photoshop hay gửi thêm HTTP request. Phần mềm duy nhất cần thiết là trình duyệt của người dùng. Hơn nữa, không giống như các hiệu ứng hình ảnh cố định, CSS filter effects có khả năng responsive và có thể animate được.

Module CSS filter effects cung cấp các thuộc tính {{cssxref("filter")}} và {{cssxref("backdrop-filter")}} mà bạn có thể dùng để tác động lên phần hiển thị của văn bản, hình ảnh, nền và viền, hoặc bất kỳ phần tử nào bạn áp dụng các thuộc tính này. Module này cũng định nghĩa kiểu dữ liệu {{cssxref("filter-function")}} cho phép bạn thêm các hiệu ứng đồ họa như làm mờ hoặc dịch chuyển màu sắc. Sử dụng các hàm filter, bạn không chỉ có thể thay đổi giao diện của một phần tử mà còn có thể tham chiếu đến một SVG filter bằng cách sử dụng filter mà bạn tạo ra.

## Các thuộc tính filter effect

Hai thuộc tính filter sau đây của module CSS filter effects cho phép bạn áp dụng không, một hoặc nhiều hiệu ứng đồ họa lên một phần tử:

- Sử dụng thuộc tính {{cssxref("filter")}}, bạn có thể áp dụng các filter effects như blur, drop-shadow và sepia lên một phần tử trước khi phần tử đó được render. Các filter effects được áp dụng trực tiếp lên phần tử, bao gồm nội dung, viền và padding của phần tử đó.

- Sử dụng thuộc tính {{cssxref("backdrop-filter")}}, bạn có thể áp dụng các hiệu ứng đồ họa lên vùng phía sau một phần tử (phần "backdrop" của phần tử). Thuộc tính `backdrop-filter` thường được dùng để làm cho nội dung ở phía trước dễ đọc hơn, đặc biệt khi vùng rộng hơn chứa nội dung đó không có đủ độ tương phản cho nội dung. Các filter effects chỉ được áp dụng lên nền của phần tử chứ không áp dụng lên nội dung của phần tử.

Các thuộc tính `filter` và `backdrop-filter` chấp nhận danh sách các filter phân cách bằng khoảng trắng, được áp dụng theo thứ tự khai báo.

## Các hàm filter

Module CSS filter effects cung cấp 10 hàm {{cssxref("filter-function")}}, cùng với khả năng định nghĩa gần như vô hạn các hiệu ứng sử dụng SVG filters được áp dụng thông qua tham chiếu `url()`.

Bảng dưới đây liệt kê 10 hàm filter, cùng với kiểu giá trị của chúng, giá trị hợp lệ tối thiểu nếu có, giá trị lớn nhất tạo ra hiệu ứng và giá trị mặc định dùng cho [interpolation](/en-US/docs/Glossary/Interpolation).

| Hàm filter                                                  | Kiểu tham số                                                       | Giá trị min | Hiệu ứng tối đa | Giá trị mặc định (không có hiệu ứng) |
| ----------------------------------------------------------- | ------------------------------------------------------------------ | ----------- | --------------- | ------------------------------------ |
| {{cssxref("filter-function/blur", "blur()")}}               | {{cssxref("&lt;length&gt;")}}                                      | `0`         |                 | `0`                                  |
| {{cssxref("filter-function/brightness", "brightness()")}}   | {{cssxref("&lt;number&gt;")}} or {{cssxref("&lt;percentage&gt;")}} | `0`         |                 | `1` or `100%`                        |
| {{cssxref("filter-function/contrast", "contrast()")}}       | {{cssxref("&lt;length&gt;")}}                                      | `0`         |                 | `1` or `100%`                        |
| {{cssxref("filter-function/drop-shadow", "drop-shadow()")}} | `<shadow>`                                                         |             |                 | `0 0 0 currentColor`                 |
| {{cssxref("filter-function/grayscale", "grayscale()")}}     | {{cssxref("&lt;number&gt;")}} or {{cssxref("&lt;percentage&gt;")}} | `0`         | `100%`          | `0` or `0%`                          |
| {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}   | {{cssxref("angle")}}                                               |             |                 | `0deg`                               |
| {{cssxref("filter-function/invert", "invert()")}}           | {{cssxref("&lt;number&gt;")}} or {{cssxref("&lt;percentage&gt;")}} | `0`         | `100%`          | `0` or `0%`                          |
| {{cssxref("filter-function/opacity", "opacity()")}}         | {{cssxref("&lt;number&gt;")}} or {{cssxref("&lt;percentage&gt;")}} | `0`         | `100%`          | `1` or `100%`                        |
| {{cssxref("filter-function/saturate", "saturate()")}}       | {{cssxref("&lt;number&gt;")}} or {{cssxref("&lt;percentage&gt;")}} | `0`         | `100%`          | `100%`                               |
| {{cssxref("filter-function/sepia", "sepia()")}}             | {{cssxref("&lt;number&gt;")}} or {{cssxref("&lt;percentage&gt;")}} | `0`         | `100%`          | `0%`                                 |

Giá trị tối thiểu được phép có mặt với các hàm filter có giá trị tối thiểu. Nếu bao gồm một giá trị nhỏ hơn giá trị tối thiểu cho bất kỳ hàm filter nào, toàn bộ khai báo thuộc tính sẽ không hợp lệ, không chỉ hàm filter vi phạm trong danh sách phân cách bằng dấu phẩy.

Giá trị hiệu ứng tối đa có thể bị vượt quá. Bao gồm một giá trị lớn hơn giá trị tối đa được liệt kê là hợp lệ, nhưng nó không tăng hiệu ứng vượt quá giá trị tối đa được liệt kê. Nói cách khác, hiệu ứng trên phần tử sẽ trông giống nhau như khi giá trị hiệu ứng tối đa được đặt. Ví dụ, đặt `sepia(400%)` trong [ví dụ sepia](#applying_sepia_filter_effect) sẽ tạo ra cùng hiệu ứng như `sepia(100%)`, giá trị tối đa.

Giá trị mặc định là giá trị không tạo ra hiệu ứng nào. Mặc dù các giá trị này không tạo ra hiệu ứng, chúng cung cấp giá trị interpolation ban đầu và đưa ra ví dụ về cách giá trị có thể được đặt. Các giá trị mặc định này cung cấp thước đo giữa giá trị tối thiểu được phép và giá trị hiệu ứng tối đa.

## Áp dụng filter effects

Các thuộc tính `filter` và `backdrop-filter` chấp nhận danh sách hàm filter, có thể chứa một hoặc nhiều `<filter-function>`, từ khóa mặc định `none`, hoặc một [SVG filter](#using_svg_filters) dưới dạng giá trị `url()`.

### Áp dụng hiệu ứng filter sepia

Nếu bạn di chuột qua hình ảnh sepia bên dưới, bạn sẽ thấy hình ảnh đầy màu sắc hiện ra ngay lập tức.

Hình ảnh được đặt thành sepia bằng cách chỉ định giá trị của thuộc tính `filter` là hàm filter [`sepia()`](/en-US/docs/Web/CSS/Reference/Values/filter-function/sepia). Filter bị xóa khi {{cssxref(":hover")}} và {{cssxref(":focus")}} bằng cách đặt `filter: none`.

```html
<img tabindex="0" alt="Four trans-people, circa 1912" src="activists.jpg" />
```

```css
img {
  filter: sepia(100%);
}
img:hover,
img:focus {
  filter: none;
}
```

Trong phần tử {{HTMLElement("img")}}, [`tabindex`](/en-US/docs/Web/HTML/Reference/Global_attributes/tabindex) được đặt thành `0` để cho phép focus mà không thay đổi thứ tự tab cho người dùng bàn phím vì `<img>` không phải là phần tử tương tác.

```css hidden
img {
  max-width: 100%;
  height: 100%;
}
```

{{EmbedLiveSample("Applying_sepia_filter_effect", 600, 550)}}

### Áp dụng filter effects lên các phần tử khác

Mặc dù thường được áp dụng lên hình ảnh, các thuộc tính `filter` và `backdrop-filter` có thể được áp dụng cho bất kỳ phần tử hoặc pseudo-element nào.

Trong ví dụ này, hiệu ứng phát sáng được thêm vào bằng cách sử dụng filter [`drop-shadow()`](/en-US/docs/Web/CSS/Reference/Values/filter-function/drop-shadow) với độ mờ `3px` và offset `0`.

```css
h1 {
  color: midnightblue;
  filter: drop-shadow(0 0 3px magenta);
}
```

```css hidden
h1 {
  font-family: sans-serif;
  font-size: 2rem;
}
```

```html hidden
<h1>Glow created with CSS filter</h1>
```

{{EmbedLiveSample('Applying_filter_effects_to_other_elements','100%','80')}}

### Áp dụng nhiều filter

Trong khi ví dụ filter sepia chỉ bao gồm một hàm filter duy nhất, bạn có thể đặt nhiều filter. Các thuộc tính `filter` và `backdrop-filter` chấp nhận danh sách các filter phân cách bằng khoảng trắng, được áp dụng theo thứ tự khai báo.

Ví dụ này áp dụng hai filter — [`hue-rotate()`](/en-US/docs/Web/CSS/Reference/Values/filter-function/hue-rotate) và [`blur()`](/en-US/docs/Web/CSS/Reference/Values/filter-function/blur) — thông qua thuộc tính `backdrop-filter`. Backdrop, vùng phía sau phần tử {{HTMLElement("p")}}, có sự thay đổi màu sắc và blur được áp dụng.

```css
.container {
  background: url("/shared-assets/images/examples/listen_to_black_women.jpg")
    no-repeat left / contain goldenrod;
}
p {
  backdrop-filter: hue-rotate(240deg) blur(5px);
  background-color: rgb(255 255 255 / 10%);
  text-shadow: 2px 2px black;
}
```

```css hidden
.container {
  padding: 3rem;
  width: 30rem;
}
p {
  padding: 0.5rem;
  color: white;
  font-size: 2rem;
  font-family: sans-serif;
}
```

```html hidden
<div class="container">
  <p>
    Text on images can be illegible and inaccessible even with a drop shadow.
  </p>
</div>
```

{{EmbedLiveSample('Applying_multiple_filters','100%','300')}}

### Áp dụng filter lặp lại

Vì các filter được áp dụng theo thứ tự tuần tự, bạn có thể sử dụng các hàm filter nhiều lần. Trong ví dụ này, filter [`drop-shadow()`](/en-US/docs/Web/CSS/Reference/Values/filter-function/drop-shadow) đã được sử dụng bốn lần, mỗi lần với một giá trị `<shadow>` khác nhau.

```html
<img src="mandala.svg" alt="Colorful mandala" role="img" />
<img src="mandala.svg" alt="Plain mandala" role="img" />
```

```css hidden
img {
  width: 49%;
}
```

```css
img {
  filter: drop-shadow(2px 2px 0 magenta) drop-shadow(-2px -2px 0 royalblue)
    drop-shadow(2px 2px 0 lime) drop-shadow(-2px -2px 0 darkorange);
}
img + img {
  filter: none;
}
```

Trong ví dụ Mandala đầu tiên, bốn drop shadow được áp dụng lên một SVG vẽ đường. Cùng một SVG đó, với filter bị xóa bằng `filter: none`, được đưa vào để so sánh.

{{EmbedLiveSample("Applying_repeated_filters", 600, 400)}}

### Xác định thứ tự hàm filter

Khi tạo filter effects, thuộc tính `filter` hoặc `backdrop-filter` được cung cấp danh sách các filter phân cách bằng khoảng trắng. Các filter effects này được áp dụng theo thứ tự chúng xuất hiện.

Trong ví dụ này, cả drop shadow `magenta` và xoay màu `180deg` đều được áp dụng trên tiêu đề cấp một. Ví dụ cho thấy hiệu ứng khi các filter này được áp dụng theo các thứ tự khác nhau.

```css
h1 {
  color: midnightblue;
}
#hueFirst {
  filter: hue-rotate(180deg) drop-shadow(3px 3px magenta);
}
#shadowFirst {
  filter: drop-shadow(3px 3px magenta) hue-rotate(180deg);
}
```

```css hidden
h1 {
  font-family: sans-serif;
  font-size: 2rem;
}
```

```html hidden
<h1 id="hueFirst">Hue change happens before drop shadow.</h1>
<h1 id="shadowFirst">Drop shadow applied before hue change.</h1>
<h1>No filter effects applied.</h1>
```

{{EmbedLiveSample('Applying_a_filter_to_an_element','100%','280')}}

Cùng các filter được áp dụng cho cả hai dòng văn bản nhưng theo thứ tự khác nhau. Ở dòng đầu tiên, màu sắc của văn bản được thay đổi trước khi shadow được áp dụng, nên shadow là `magenta`. Ở dòng thứ hai, drop shadow được thêm vào văn bản màu xanh đậm, sau đó màu của cả văn bản và shadow đều bị thay đổi.

Không có filter effect nào được áp dụng cho dòng thứ ba để hiển thị hiệu ứng gốc làm so sánh. Vì vậy dòng thứ ba giữ nguyên là `midnightblue` hay `#191970`. Filter `hue-rotate(180deg)` thay đổi văn bản ở hai dòng đầu thành `#252500`.

> [!NOTE]
> Màu hex rgb `#191970` tương đương với `hsl(240deg 63.5% 26.9%)`, trong khi `#252500` là `hsl(60deg 100% 7.3%)`. [Quá trình xoay màu diễn ra trong không gian màu sRGB](/en-US/docs/Web/CSS/Reference/Values/color_value#interpolation), đó là lý do tại sao màu sắc đã được thay đổi như mong đợi trong khi không duy trì cùng giá trị cho độ bão hòa và độ sáng.

## Sử dụng SVG filters

Ngoài 10 {{cssxref("filter-function")}} được định nghĩa sẵn, CSS filter effects hỗ trợ `url()`, với tham số là một [SVG filter](/en-US/docs/Web/SVG/Reference/Element/filter), có thể được nhúng trong một tệp SVG nội tuyến hoặc bên ngoài.

Một SVG duy nhất có thể được dùng để định nghĩa nhiều filter, mỗi filter với một `id`:

```html
<svg role="none">
  <defs>
    <filter id="blur1">
      <feGaussianBlur stdDeviation="1" edgeMode="duplicate" />
    </filter>
    <filter id="blur3">
      <feGaussianBlur stdDeviation="3" edgeMode="duplicate" />
    </filter>
    <filter id="hue-rotate90">
      <feColorMatrix type="hueRotate" values="90" />
    </filter>
  </defs>
</svg>
```

`id` của filter được tham chiếu trong `url()` cho cả SVG nội tuyến và bên ngoài:

```css
filter: url("#blur3");
filter: url("https://example.com/svg/filters.svg#blur3");
```

### Làm mờ hình ảnh

Giống như hàm filter {{cssxref("filter-function/blur", "blur()")}} áp dụng Gaussian blur lên các phần tử mà nó được áp dụng, phần tử SVG {{SVGElement("feGaussianBlur")}} cũng có thể được dùng để làm mờ nội dung.

Trong cả hai trường hợp, giá trị bán kính blur, được chỉ định là {{cssxref("&lt;length&gt;")}} trong CSS và là pixel tương đương {{cssxref("&lt;number&gt;")}} trong SVG, xác định giá trị độ lệch chuẩn cho hàm Gaussian. Nói cách khác, nó xác định số pixel trên màn hình pha trộn vào nhau; giá trị lớn hơn tạo ra blur nhiều hơn.

Thuộc tính {{SVGAttr("stdDeviation")}} của [`<filter>`](/en-US/docs/Web/SVG/Reference/Element/filter) chấp nhận tối đa hai giá trị cho phép tạo các giá trị blur phức tạp hơn. Để tạo blur tương đương, chúng ta bao gồm một giá trị cho `stdDeviation`:

```html hidden
<table>
  <thead>
    <tr>
      <th>CSS example</th>
      <th>SVG example</th>
      <th>Original image</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <img
          class="filter"
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
      </td>
      <td>
        <img
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag"
          class="svgFilter" />
      </td>
      <td>
        <img
          src="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
          alt="Pride flag" />
      </td>
    </tr>
  </tbody>
</table>
```

```html
<svg role="img" aria-label="Flag">
  <filter id="blur">
    <feGaussianBlur stdDeviation="3.5" edgeMode="duplicate" />
  </filter>
  <image
    xlink:href="https://mdn.github.io/shared-assets/images/examples/progress-pride-flag.jpg"
    filter="url(#blur)" />
</svg>
```

Giá trị filter `url()` của SVG có thể được đưa vào làm giá trị của thuộc tính [`filter`](/en-US/docs/Web/SVG/Reference/Attribute/filter) của phần tử SVG [`<image>`](/en-US/docs/Web/SVG/Reference/Element/image) hoặc là một phần của giá trị thuộc tính CSS `filter` và `backdrop-filter`.

```css hidden
th,
td {
  padding: 5px;
}
```

```css
.filter {
  filter: blur(3.5px);
}
.svgFilter {
  filter: url("#blur");
}
```

{{EmbedLiveSample('blur_example','100%','550')}}

## Xem thêm

- {{cssxref("mask")}}
- {{cssxref("background-blend-mode")}}, {{cssxref("mix-blend-mode")}}
- [CSS filter effects](/en-US/docs/Web/CSS/Guides/Filter_effects)
- Phần tử SVG {{SVGElement("filter")}}, thuộc tính SVG {{SVGAttr("filter")}} trong [SVG](/en-US/docs/Web/SVG)
- [Áp dụng SVG effects lên nội dung HTML](/en-US/docs/Web/SVG/Guides/Applying_SVG_effects_to_HTML_content)
