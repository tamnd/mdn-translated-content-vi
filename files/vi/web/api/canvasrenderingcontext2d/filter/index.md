---
title: "CanvasRenderingContext2D: thuộc tính bộ lọc"
short-title: lọc
slug: Web/API/CanvasRenderingContext2D/filter
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.filter
---

{{APIRef("Canvas API")}}

Thuộc tính **`CanvasRenderingContext2D.filter`** của API Canvas 2D cung cấp các hiệu ứng bộ lọc như làm mờ và chuyển thang độ xám. Nó tương tự như thuộc tính CSS {{cssxref("filter")}} và chấp nhận các giá trị giống nhau.

## Giá trị

Thuộc tính `filter`chấp nhận giá trị`"none"` hoặc một hoặc nhiều hàm lọc sau trong một chuỗi.

- {{cssxref("url_function", "url()")}}
- : Một CSS {{cssxref("url_function", "url()")}}. Lấy bất kỳ URL nào phân giải thành phần tử bộ lọc SVG.
  Đây có thể là ID của một phần tử, đường dẫn đến tệp XML bên ngoài hoặc thậm chí là giá trị SVG được mã hóa dữ liệu.
- {{cssxref("filter-function/blur", "blur()")}}
- : Một CSS {{cssxref("&lt;length&gt;")}}. Áp dụng hiệu ứng làm mờ Gaussian cho bản vẽ. Nó
  xác định giá trị của độ lệch chuẩn cho hàm Gaussian, tức là có bao nhiêu pixel trên màn hình hòa vào nhau; do đó, giá trị lớn hơn sẽ tạo ra nhiều mờ hơn. Giá trị `0` giữ nguyên đầu vào.
- {{cssxref("filter-function/brightness", "brightness()")}}
- : Một CSS {{cssxref("&lt;percentage&gt;")}}. Áp dụng hệ số nhân tuyến tính cho bản vẽ,
  làm cho nó trông sáng hơn hoặc tối hơn. Giá trị dưới `100%`làm tối hình ảnh, trong khi giá trị trên`100%`làm sáng hình ảnh. Giá trị`0%`sẽ tạo ra một hình ảnh có màu đen hoàn toàn, trong khi giá trị`100%` không thay đổi đầu vào.
- {{cssxref("filter-function/contrast", "contrast()")}}
- : Một CSS {{cssxref("&lt;percentage&gt;")}}. Điều chỉnh độ tương phản của bản vẽ. MỘT
  giá trị `0%`sẽ tạo ra một bản vẽ hoàn toàn màu đen. Giá trị`100%` giữ nguyên bản vẽ.
- {{cssxref("filter-function/drop-shadow", "drop-shadow()")}}
- : Áp dụng hiệu ứng đổ bóng cho bản vẽ. Bóng đổ thực sự là một bóng mờ,
  phiên bản offset của mặt nạ alpha của bản vẽ được vẽ bằng một màu cụ thể, được tổng hợp bên dưới bản vẽ. Hàm này có tối đa năm đối số: -`<offset-x>`
- : Xem {{cssxref("&lt;length&gt;")}} để biết có thể
  đơn vị. Chỉ định khoảng cách ngang của bóng. -`<offset-y>`
- : Xem {{cssxref("&lt;length&gt;")}} để biết có thể
  đơn vị. Chỉ định khoảng cách theo chiều dọc của bóng. -`<blur-radius>`
- : Giá trị này càng lớn thì độ mờ càng lớn, vì vậy
  cái bóng trở nên lớn hơn và nhẹ hơn. Giá trị âm không được phép. -`<color>`
- : Xem các giá trị {{cssxref("&lt;color&gt;")}} để biết có thể
  từ khóa và ký hiệu.

- {{cssxref("filter-function/grayscale", "grayscale()")}}
- : Một CSS {{cssxref("&lt;percentage&gt;")}}. Chuyển đổi bản vẽ sang thang độ xám. Một giá trị
  của `100%`hoàn toàn có thang độ xám. Giá trị`0%` giữ nguyên bản vẽ.
- {{cssxref("filter-function/hue-rotate", "hue-rotate()")}}
- : Một CSS {{cssxref("&lt;angle&gt;")}}. Áp dụng xoay màu sắc trên bản vẽ. Một giá trị
  của `0deg` giữ nguyên đầu vào.
- {{cssxref("filter-function/invert", "invert()")}}
- : Một CSS {{cssxref("&lt;percentage&gt;")}}. Đảo ngược bản vẽ. Một giá trị của
  `100%`có nghĩa là đảo ngược hoàn toàn. Giá trị`0%` giữ nguyên bản vẽ.
- {{cssxref("filter-function/opacity", "opacity()")}}
- : Một CSS {{cssxref("&lt;percentage&gt;")}}. Áp dụng độ trong suốt cho bản vẽ. MỘT
  giá trị `0%`có nghĩa là hoàn toàn minh bạch. Giá trị`100%` giữ nguyên bản vẽ.
- {{cssxref("filter-function/saturate", "saturate()")}}
- : Một CSS {{cssxref("&lt;percentage&gt;")}}. Làm bão hòa bản vẽ. Một giá trị của
  `0%`có nghĩa là hoàn toàn không bão hòa. Giá trị`100%` giữ nguyên bản vẽ.
- {{cssxref("filter-function/sepia", "sepia()")}}
- : Một CSS {{cssxref("&lt;percentage&gt;")}}. Chuyển đổi bản vẽ sang màu nâu đỏ. Một giá trị của
  `100%`có nghĩa là màu nâu đỏ hoàn toàn. Giá trị`0%` giữ nguyên bản vẽ.
- `none`
- : Không có bộ lọc nào được áp dụng. Giá trị ban đầu.

## Ví dụ

Để xem những ví dụ này, hãy đảm bảo sử dụng trình duyệt hỗ trợ tính năng này; xem bảng tương thích bên dưới.

### Áp dụng làm mờ

Ví dụ này làm mờ một đoạn văn bản bằng thuộc tính `filter`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.filter = "blur(4px)";
ctx.font = "48px serif";
ctx.fillText("Hello world", 50, 100);
```

#### Kết quả

{{ EmbedLiveSample('Applying_a_blur', 700, 180) }}

### Áp dụng nhiều bộ lọc

Bạn có thể kết hợp bao nhiêu bộ lọc tùy thích. Ví dụ này áp dụng các bộ lọc `contrast`,`sepia`và`drop-shadow` cho ảnh tê giác.

#### HTML

```html
<canvas id="canvas" width="400" height="150"></canvas>
<div class="hidden">
  <img
    id="source"
    src="https://mdn.github.io/shared-assets/images/examples/rhino.jpg" />
</div>
```

```css hidden
.hidden {
  display: none;
}
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
const image = document.getElementById("source");

image.addEventListener("load", (e) => {
  // Draw unfiltered image
  ctx.drawImage(image, 0, 0, image.width * 0.6, image.height * 0.6);

  // Draw image with filter
  ctx.filter = "contrast(1.4) sepia(1) drop-shadow(-9px 9px 3px #ee8811)";
  ctx.drawImage(image, 400, 0, -image.width * 0.6, image.height * 0.6);
});
```

#### Kết quả

{{ EmbedLiveSample('Applying_multiple_filters', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định thuộc tính này: {{domxref("CanvasRenderingContext2D")}}
- CSS {{cssxref("filter")}}
- CSS {{cssxref("&lt;filter-function&gt;")}}
