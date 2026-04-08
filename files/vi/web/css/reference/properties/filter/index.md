---
title: filter
slug: Web/CSS/Reference/Properties/filter
page-type: css-property
browser-compat: css.properties.filter
sidebar: cssref
---

Thuộc tính **`filter`** trong [CSS](/vi/docs/Web/CSS) áp dụng các hiệu ứng đồ họa như làm mờ hoặc dịch chuyển màu sắc cho một phần tử. Bộ lọc thường được sử dụng để điều chỉnh kết xuất của hình ảnh, nền và đường viền.

Một số [hàm](#hàm), chẳng hạn như `blur()` và `contrast()`, sẵn có để giúp bạn đạt được các hiệu ứng được định sẵn.

{{InteractiveExample("CSS Demo: filter")}}

```css interactive-example-choice
filter: url("/shared-assets/images/examples/shadow.svg#element-id");
```

```css interactive-example-choice
filter: blur(5px);
```

```css interactive-example-choice
filter: contrast(200%);
```

```css interactive-example-choice
filter: grayscale(80%);
```

```css interactive-example-choice
filter: hue-rotate(90deg);
```

```css interactive-example-choice
filter: drop-shadow(16px 16px 20px red) invert(75%);
```

```html interactive-example
<section id="default-example">
  <div class="example-container">
    <img
      id="example-element"
      src="/shared-assets/images/examples/firefox-logo.svg"
      width="200" />
  </div>
</section>
```

```css interactive-example
.example-container {
  background-color: white;
  width: 260px;
  height: 260px;
  display: flex;
  align-items: center;
  justify-content: center;
}

#example-element {
  flex: 1;
  padding: 30px;
}
```

## Cú pháp

```css
/* Giá trị <filter-function> */
filter: blur(5px);
filter: brightness(0.4);
filter: contrast(200%);
filter: drop-shadow(16px 16px 20px blue);
filter: grayscale(50%);
filter: hue-rotate(90deg);
filter: invert(75%);
filter: opacity(25%);
filter: saturate(30%);
filter: sepia(60%);

/* URL */
filter: url("filters.svg#filter-id");

/* Nhiều bộ lọc */
filter: contrast(175%) brightness(3%);
filter: drop-shadow(3px 3px red) sepia(100%) drop-shadow(-3px -3px blue);

/* Không dùng bộ lọc */
filter: none;

/* Giá trị toàn cục */
filter: inherit;
filter: initial;
filter: revert;
filter: revert-layer;
filter: unset;
```

### Tham chiếu bộ lọc SVG

Bạn có thể sử dụng `url()` để tham chiếu đến [phần tử bộ lọc SVG](/vi/docs/Web/SVG/Reference/Element/filter). Để tham chiếu đến phần tử SVG {{SVGElement("filter")}}, hãy sử dụng cú pháp sau:

```css
filter: url("file.svg#filter-element-id");
```

### Hàm

Thuộc tính `filter` được chỉ định là `none` hoặc một hoặc nhiều hàm được liệt kê bên dưới. Nếu tham số cho bất kỳ hàm nào không hợp lệ, hàm trả về `none`. Trừ khi có ghi chú, các hàm nhận giá trị được biểu thị bằng dấu phần trăm (như `34%`) cũng chấp nhận giá trị được biểu thị dưới dạng thập phân (như `0.34`).

Khi giá trị thuộc tính `filter` chứa nhiều hàm, các bộ lọc được áp dụng theo thứ tự.

- {{cssxref("filter-function/blur", "blur()")}}
  - : Áp dụng làm mờ Gaussian cho hình ảnh đầu vào.

    ```css
    filter: blur(5px);
    ```

- {{cssxref("filter-function/brightness", "brightness()")}}
  - : Áp dụng hệ số nhân tuyến tính cho hình ảnh đầu vào, làm cho nó trông sáng hơn hoặc tối hơn. Các giá trị là hệ số nhân tuyến tính trên hiệu ứng, với `0%` tạo ra hình ảnh hoàn toàn đen, `100%` không có hiệu lực, và các giá trị trên `100%` làm sáng hình ảnh.

    ```css
    filter: brightness(2);
    ```

- {{cssxref("filter-function/contrast", "contrast()")}}
  - : Điều chỉnh độ tương phản của hình ảnh đầu vào. Giá trị `0%` làm cho hình ảnh có màu xám, `100%` không có hiệu lực, và các giá trị trên `100%` tạo độ tương phản.

    ```css
    filter: contrast(200%);
    ```

- {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
  - : Áp dụng tham số `<shadow>` dưới dạng bóng đổ, theo đường viền của hình ảnh. Cú pháp bóng tương tự như `<box-shadow>` (được xác định trong [mô-đun nền và viền CSS](/vi/docs/Web/CSS/Guides/Backgrounds_and_borders)), ngoại trừ từ khóa `inset` và tham số `spread` không được phép. Như với tất cả các giá trị thuộc tính `filter`, bất kỳ bộ lọc nào sau `drop-shadow()` đều được áp dụng cho bóng.

    ```css
    filter: drop-shadow(16px 16px 10px black);
    ```

- {{cssxref("filter-function/grayscale", "grayscale()")}}
  - : Chuyển đổi hình ảnh sang màu xám. Giá trị `100%` là hoàn toàn màu xám. Giá trị ban đầu `0%` giữ nguyên đầu vào. Các giá trị từ `0%` đến `100%` tạo ra hệ số nhân tuyến tính trên hiệu ứng.

    ```css
    filter: grayscale(100%);
    ```

- {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}
  - : Áp dụng xoay màu sắc. Giá trị `<angle>` xác định số độ quanh vòng tròn màu sắc mà tại đó các mẫu đầu vào sẽ được điều chỉnh. Giá trị `0deg` giữ nguyên đầu vào.

    ```css
    filter: hue-rotate(90deg);
    ```

- {{cssxref("filter-function/invert", "invert()")}}
  - : Đảo ngược các mẫu trong hình ảnh đầu vào. Giá trị `100%` đảo ngược hoàn toàn hình ảnh. Giá trị `0%` giữ nguyên đầu vào. Các giá trị từ `0%` đến `100%` có hệ số nhân tuyến tính trên hiệu ứng.

    ```css
    filter: invert(100%);
    ```

- {{cssxref("filter-function/opacity", "opacity()")}}
  - : Áp dụng độ trong suốt. `0%` làm cho hình ảnh hoàn toàn trong suốt và `100%` giữ nguyên hình ảnh.

    ```css
    filter: opacity(50%);
    ```

- {{cssxref("filter-function/saturate", "saturate()")}}
  - : Bão hòa hình ảnh, với `0%` là hoàn toàn không bão hòa, `100%` giữ nguyên hình ảnh, và các giá trị trên `100%` tăng độ bão hòa.

    ```css
    filter: saturate(200%);
    ```

- {{cssxref("filter-function/sepia", "sepia()")}}
  - : Chuyển đổi hình ảnh sang sepia, với giá trị `100%` làm cho hình ảnh hoàn toàn sepia và `0%` không thay đổi.

    ```css
    filter: sepia(100%);
    ```

### Kết hợp các hàm

Bạn có thể kết hợp bất kỳ số lượng hàm nào để thao tác kết xuất. Các bộ lọc được áp dụng theo thứ tự khai báo. Ví dụ sau tăng cường độ tương phản và độ sáng của hình ảnh:

```css
filter: contrast(175%) brightness(103%);
```

### Nội suy

Khi được hoạt hình, nếu cả bộ lọc đầu và cuối đều có danh sách hàm có cùng độ dài mà không có {{cssxref("url_value", "&lt;url&gt;")}} theo cùng thứ tự, mỗi hàm bộ lọc của chúng được {{Glossary("interpolation", "nội suy")}} theo các quy tắc riêng của hàm bộ lọc.

Nếu danh sách bộ lọc có độ dài khác nhau, các hàm bộ lọc tương đương còn thiếu từ danh sách dài hơn được thêm vào cuối danh sách ngắn hơn. Các hàm được thêm vào sử dụng giá trị ban đầu của chúng, không có sửa đổi bộ lọc. Tất cả các bộ lọc được liệt kê sau đó được nội suy theo các quy tắc riêng của hàm bộ lọc. Ngược lại, nội suy rời rạc được sử dụng.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Áp dụng các hàm filter

Thuộc tính `filter` được áp dụng cho hình ảnh thứ hai, làm xám và mờ cả hình ảnh lẫn viền của nó.

```css
img {
  border: 5px solid yellow;
}
/* Làm xám hình ảnh thứ hai 40% và mờ 5px */
img:nth-of-type(2) {
  filter: grayscale(0.4) blur(5px);
}
```

```html
<img src="pencil.jpg" alt="Original image is sharp" />
<img src="pencil.jpg" alt="The image and border are blurred and muted" />
```

{{EmbedLiveSample('Applying_filter_functions','100%','229px')}}

### Lặp lại các hàm filter

Các hàm filter được áp dụng theo thứ tự xuất hiện. Cùng một hàm filter có thể được lặp lại.

```css
#MDN-logo {
  border: 1px solid blue;
  filter: drop-shadow(5px 5px 0 red) hue-rotate(180deg)
    drop-shadow(5px 5px 0 red);
}
```

```html hidden
<svg
  id="MDN-logo"
  xmlns="http://www.w3.org/2000/svg"
  viewBox="0 0 361 104.2"
  xml:space="preserve"
  role="img">
  <title>MDN Web Docs</title>
  <path
    d="M197.6 73.2h-17.1v-5.5h3.8V51.9c0-3.7-.7-6.3-2.1-7.9-1.4-1.6-3.3-2.3-5.7-2.3-3.2 0-5.6 1.1-7.2 3.4s-2.4 4.6-2.5 6.9v15.6h6v5.5h-17.1v-5.5h3.8V51.9c0-3.8-.7-6.4-2.1-7.9-1.4-1.5-3.3-2.3-5.6-2.3-3.2 0-5.5 1.1-7.2 3.3-1.6 2.2-2.4 4.5-2.5 6.9v15.8h6.9v5.5h-20.2v-5.5h6V42.4h-6.1v-5.6h13.4v6.4c1.2-2.1 2.7-3.8 4.7-5.2 2-1.3 4.4-2 7.3-2s5.3.7 7.5 2.1c2.2 1.4 3.7 3.5 4.5 6.4 1.1-2.5 2.7-4.5 4.9-6.1s4.8-2.4 7.9-2.4c3.5 0 6.5 1.1 8.9 3.3s3.7 5.6 3.7 10.2v18.2h6.1v5.5zm42.5 0h-13.2V66c-1.2 2.2-2.8 4.1-4.9 5.6-2.1 1.6-4.8 2.4-8.3 2.4-4.8 0-8.7-1.6-11.6-4.9-2.9-3.2-4.3-7.7-4.3-13.3 0-5 1.3-9.6 4-13.7 2.6-4.1 6.9-6.2 12.8-6.2s9.8 2.2 12.3 6.5V22.7h-8.6v-5.6h15.8v50.6h6v5.5zm-13.3-16.8V52c-.1-3-1.2-5.5-3.2-7.3s-4.4-2.8-7.2-2.8c-3.6 0-6.3 1.3-8.2 3.9-1.9 2.6-2.8 5.8-2.8 9.6 0 4.1 1 7.3 3 9.5s4.5 3.3 7.4 3.3c3.2 0 5.8-1.3 7.8-3.8 2.1-2.6 3.1-5.3 3.2-8zm61.5 16.8H269v-5.5h6V51.9c0-3.7-.7-6.3-2.2-7.9-1.4-1.6-3.4-2.3-5.7-2.3-3.1 0-5.6 1-7.4 3s-2.8 4.4-2.9 7v15.9h6v5.5h-19.3v-5.5h6V42.4h-6.2v-5.6h13.6V43c2.6-4.6 6.8-6.9 12.7-6.9 3.6 0 6.7 1.1 9.2 3.3s3.7 5.6 3.7 10.2v18.2h6v5.4h-.2z"></path>
  <g fill="blue">
    <path
      d="M42 .2 13.4 92.3H1.7L30.2.2H42zM52.4.2v92.1H42V.2h10.4zm40.3 0L64.2 92.3H52.5L81 .2h11.7zM103.1.2v92.1H92.7V.2h10.4zM294 95h67v8.8h-67V95z"></path>
  </g>
</svg>
```

{{EmbedLiveSample('Repeating_filter_functions','100%','229px')}}

Các bộ lọc được áp dụng theo thứ tự. Đây là lý do tại sao các bóng đổ không cùng màu: màu sắc của bóng đổ đầu tiên bị thay đổi bởi hàm `hue-rotate()` nhưng bóng thứ hai thì không.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("backdrop-filter")}}
- {{cssxref("mask")}}
- Thuộc tính SVG {{SVGAttr("filter")}}
- Mô-đun CSS [pha trộn và ghép](/vi/docs/Web/CSS/Guides/Compositing_and_blending), bao gồm các thuộc tính CSS {{cssxref("background-blend-mode")}} và {{cssxref("mix-blend-mode")}}.
- [SVG](/vi/docs/Web/SVG), bao gồm phần tử SVG {{SVGElement("filter")}} và thuộc tính SVG {{SVGAttr("filter")}}.
- [Áp dụng hiệu ứng SVG lên nội dung HTML](/vi/docs/Web/SVG/Guides/Applying_SVG_effects_to_HTML_content)
