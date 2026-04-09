---
title: Áp dụng hiệu ứng SVG lên nội dung HTML
short-title: Hiệu ứng SVG cho HTML
slug: Web/SVG/Guides/Applying_SVG_effects_to_HTML_content
page-type: guide
sidebar: svgref
---

Trình duyệt hiện đại hỗ trợ dùng [SVG](/en-US/docs/Web/SVG) trong các kiểu [CSS](/en-US/docs/Web/CSS) để áp dụng hiệu ứng đồ họa lên nội dung HTML.

Bạn có thể chỉ định SVG trong style, либо ngay trong cùng tài liệu, либо trong một stylesheet bên ngoài. Có 3 thuộc tính bạn có thể dùng: {{cssxref("mask")}}, {{cssxref("clip-path")}}, và {{cssxref("filter")}}.

> [!NOTE]
> Các tham chiếu tới SVG trong tệp bên ngoài phải là cùng [origin](/en-US/docs/Web/Security/Defenses/Same-origin_policy) với tài liệu đang tham chiếu.

## Dùng SVG nhúng

Để áp dụng hiệu ứng SVG bằng kiểu CSS, trước tiên bạn cần tạo kiểu CSS tham chiếu tới SVG sẽ được áp dụng.

```css
p {
  mask: url("#my-mask");
}
```

Trong ví dụ trên, tất cả các đoạn văn đều bị che bởi một [SVG `<mask>`](/en-US/docs/Web/SVG/Reference/Element/mask) có [ID](/en-US/docs/Web/HTML/Reference/Global_attributes/id) là `my-mask`.

### Ví dụ: Masking

Ví dụ, bạn có thể tạo một mask gradient cho nội dung HTML bằng mã SVG và CSS tương tự như sau, trong tài liệu HTML của bạn:

```html
<svg height="0">
  <mask id="mask-1">
    <linearGradient id="gradient-1" y2="1">
      <stop stop-color="white" offset="0" />
      <stop stop-opacity="0" offset="1" />
    </linearGradient>
    <circle cx="0.25" cy="0.25" r="0.25" id="circle" fill="white" />
    <rect x="0.5" y="0.2" width="300" height="100" fill="url(#gradient-1)" />
  </mask>
</svg>
```

```css
.target {
  mask: url("#mask-1");
}
p {
  width: 300px;
  border: 1px solid black;
  display: inline-block;
}
p.target {
  background: lime;
}
```

Lưu ý rằng trong CSS, mask được chỉ định bằng một URL tới ID `#mask-1`, chính là ID của SVG mask được định nghĩa bên dưới. Mọi thứ khác mô tả chi tiết của chính gradient mask.

Việc áp dụng hiệu ứng SVG lên HTML được thực hiện bằng cách gán class `target` đã định nghĩa ở trên cho một phần tử, như sau:

```html
<p class="target">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.
</p>
<p>
  Lorem ipsum dolor sit amet, consectetur adipisicing
  <em class="target"
    >elit, sed do eiusmod tempor incididunt ut labore et dolore magna
    aliqua.</em
  >
  Ut enim ad minim veniam.
</p>
```

Ví dụ trên sẽ được hiển thị với mask được áp dụng.

{{EmbedLiveSample('Example_Masking', 650, 200)}}

### Ví dụ: Clipping

Ví dụ này minh họa việc dùng SVG để clip nội dung HTML. Lưu ý rằng ngay cả vùng có thể nhấp của liên kết cũng bị cắt.

```html
<p class="target">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.
</p>
<p>
  Lorem ipsum dolor sit amet, consectetur adipisicing
  <em class="target"
    >elit, sed do eiusmod tempor incididunt ut labore et dolore magna
    aliqua.</em
  >
  Ut enim ad minim veniam.
</p>

<button>Chuyển đổi bán kính</button>

<svg height="0">
  <clipPath id="clipping-path-1" clipPathUnits="objectBoundingBox">
    <circle cx="0.25" cy="0.25" r="0.25" id="circle" />
    <rect x="0.5" y="0.2" width="0.5" height="0.8" />
  </clipPath>
</svg>
```

```css
.target {
  clip-path: url("#clipping-path-1");
}
p {
  width: 300px;
  border: 1px solid black;
  display: inline-block;
}
p.target {
  background: lime;
}
```

Điều này tạo ra một vùng clipping gồm một hình tròn và hình chữ nhật, gán cho nó ID `#clipping-path-1`, rồi tham chiếu tới nó trong CSS. Đường clip có thể được gán cho bất kỳ phần tử nào có class `target`.

Bạn có thể thay đổi SVG theo thời gian thực và thấy ngay nó ảnh hưởng tới việc render HTML. Ví dụ, bạn có thể thay đổi kích thước hình tròn trong đường clip đã tạo ở trên:

```js
const circle = document.getElementById("circle");

function toggleRadius() {
  circle.r.baseVal.value = 0.4 - circle.r.baseVal.value;
}

document.querySelector("button").addEventListener("click", toggleRadius);
```

{{EmbedLiveSample('Example_Clipping', 650, 200)}}

### Ví dụ: Filtering

Ví dụ này minh họa việc áp dụng bộ lọc lên nội dung HTML bằng SVG. Nó thiết lập một số bộ lọc, được áp dụng bằng CSS lên ba phần tử ở cả trạng thái bình thường và trạng thái rê chuột [hover](/en-US/docs/Web/CSS/Reference/Selectors/:hover).

```html
<p class="target">
  Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
  tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.
</p>
<pre class="target">lorem</pre>
<p>
  Lorem ipsum dolor sit amet, consectetur adipisicing
  <em class="target"
    >elit, sed do eiusmod tempor incididunt ut labore et dolore magna
    aliqua.</em
  >
  Ut enim ad minim veniam.
</p>
```

```css hidden
p.target {
  background: lime;
}
```

Bất kỳ bộ lọc SVG nào cũng có thể được áp dụng theo cách này. Ví dụ, để áp dụng hiệu ứng blur, bạn có thể dùng:

```html
<svg height="0">
  <filter id="f1">
    <feGaussianBlur stdDeviation="3" />
  </filter>
</svg>
```

Bạn cũng có thể áp dụng một color matrix:

```html
<svg height="0">
  <filter id="f2">
    <feColorMatrix
      values="0.3333 0.3333 0.3333 0 0
              0.3333 0.3333 0.3333 0 0
              0.3333 0.3333 0.3333 0 0
              0      0      0      1 0" />
  </filter>
</svg>
```

Và một số bộ lọc khác:

```html
<svg height="0">
  <filter id="f3">
    <feConvolveMatrix
      filterRes="100 100"
      color-interpolation-filters="sRGB"
      order="3"
      kernelMatrix="0 -1 0
                   -1 4 -1
                    0 -1 0"
      preserveAlpha="true" />
  </filter>
  <filter id="f4">
    <feSpecularLighting
      surfaceScale="5"
      specularConstant="1"
      specularExponent="10"
      lighting-color="white">
      <fePointLight x="-5000" y="-10000" z="20000" />
    </feSpecularLighting>
  </filter>
  <filter id="f5">
    <feColorMatrix
      values="1 0 0 0 0
              0 1 0 0 0
              0 0 1 0 0
              0 1 0 0 0"
      color-interpolation-filters="sRGB" />
  </filter>
</svg>
```

Năm bộ lọc được áp dụng bằng CSS sau:

```css
p.target {
  filter: url("#f3");
}
p.target:hover {
  filter: url("#f5");
}
em.target {
  filter: url("#f1");
}
em.target:hover {
  filter: url("#f4");
}
pre.target {
  filter: url("#f2");
}
pre.target:hover {
  filter: url("#f3");
}
```

{{EmbedLiveSample('Example_Filtering', 650, 200)}}

### Ví dụ: Văn bản bị làm mờ

Để làm mờ văn bản, có một hàm lọc CSS gọi là {{cssxref("filter-function/blur")}}. Bạn có thể đạt hiệu ứng tương tự bằng SVG filter.

```html
<p class="blur">Đã đến lúc lau kính của tôi</p>
<svg height="0">
  <defs>
    <filter id="wherearemyglasses" x="0" y="0">
      <feGaussianBlur in="SourceGraphic" stdDeviation="1" />
    </filter>
  </defs>
</svg>
```
