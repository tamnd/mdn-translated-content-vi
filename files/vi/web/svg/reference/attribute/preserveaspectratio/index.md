---
title: preserveAspectRatio
slug: Web/SVG/Reference/Attribute/preserveAspectRatio
page-type: svg-attribute
spec-urls:
  - https://drafts.csswg.org/filter-effects-1/#element-attrdef-feimage-preserveaspectratio
  - https://svgwg.org/svg2-draft/coords.html#PreserveAspectRatioAttribute
sidebar: svgref
---

Thuộc tính **`preserveAspectRatio`** cho biết cách một phần tử có viewBox và một {{glossary("aspect ratio")}} nhất định phải vừa với viewport có tỷ lệ khung hình khác.

Tỷ lệ khung hình của một ảnh SVG được xác định bởi thuộc tính {{SVGAttr('viewBox')}}. Vì vậy, nếu `viewBox` không được đặt, thuộc tính `preserveAspectRatio` sẽ không ảnh hưởng đến việc co giãn của SVG, ngoại trừ trường hợp phần tử {{SVGElement('image')}}, nơi `preserveAspectRatio` hoạt động khác như mô tả bên dưới.

## Syntax

```plain
preserveAspectRatio="<align> [<meet or slice>]"
```

Giá trị của thuộc tính `preserveAspectRatio` gồm tối đa hai từ khóa: một giá trị căn chỉnh bắt buộc và một từ khóa tùy chọn `meet` hoặc `slice`.

Giá trị căn chỉnh cho biết có ép co giãn đồng nhất hay không và nếu có thì dùng phương pháp căn chỉnh nào khi tỷ lệ khung hình của {{ SVGAttr("viewBox") }} không khớp với tỷ lệ khung hình của viewport. `xMidYMid` là giá trị mặc định. Giá trị căn chỉnh phải là một trong các từ khóa sau:

- `none`
  - : Không ép co giãn đồng nhất. Co giãn nội dung đồ họa của phần tử đó không đồng đều nếu cần để hộp giới hạn của phần tử khớp chính xác với hình chữ nhật viewport. Lưu ý rằng nếu `<align>` là `none`, thì giá trị tùy chọn `<meetOrSlice>` sẽ bị bỏ qua.

- `xMinYMin`
  - : Ép co giãn đồng nhất.
    Căn chỉnh `<min-x>` của {{ SVGAttr("viewBox") }} của phần tử với giá trị X nhỏ nhất của viewport.
    Căn chỉnh `<min-y>` của {{ SVGAttr("viewBox") }} của phần tử với giá trị Y nhỏ nhất của viewport.

- `xMidYMin`
  - : Ép co giãn đồng nhất.
    Căn chỉnh giá trị X giữa của {{ SVGAttr("viewBox") }} của phần tử với giá trị X giữa của viewport.
    Căn chỉnh `<min-y>` của {{ SVGAttr("viewBox") }} của phần tử với giá trị Y nhỏ nhất của viewport.

- `xMaxYMin`
  - : Ép co giãn đồng nhất.
    Căn chỉnh `<min-x>+<width>` của {{ SVGAttr("viewBox") }} của phần tử với giá trị X lớn nhất của viewport.
    Căn chỉnh `<min-y>` của {{ SVGAttr("viewBox") }} của phần tử với giá trị Y nhỏ nhất của viewport.

- `xMinYMid`
  - : Ép co giãn đồng nhất.
    Căn chỉnh `<min-x>` của {{ SVGAttr("viewBox") }} của phần tử với giá trị X nhỏ nhất của viewport.
    Căn chỉnh giá trị Y giữa của {{ SVGAttr("viewBox") }} của phần tử với giá trị Y giữa của viewport.

- `xMidYMid`
  - : Ép co giãn đồng nhất.
    Căn chỉnh giá trị X giữa của {{ SVGAttr("viewBox") }} của phần tử với giá trị X giữa của viewport.
    Căn chỉnh giá trị Y giữa của {{ SVGAttr("viewBox") }} của phần tử với giá trị Y giữa của viewport. Đây là giá trị mặc định.

- `xMaxYMid`
  - : Ép co giãn đồng nhất.
    Căn chỉnh `<min-x>+<width>` của {{ SVGAttr("viewBox") }} của phần tử với giá trị X lớn nhất của viewport.
    Căn chỉnh giá trị Y giữa của {{ SVGAttr("viewBox") }} của phần tử với giá trị Y giữa của viewport.

- `xMinYMax`
  - : Ép co giãn đồng nhất.
    Căn chỉnh `<min-x>` của {{ SVGAttr("viewBox") }} của phần tử với giá trị X nhỏ nhất của viewport.
    Căn chỉnh `<min-y>+<height>` của {{ SVGAttr("viewBox") }} của phần tử với giá trị Y lớn nhất của viewport.

- `xMidYMax`
  - : Ép co giãn đồng nhất.
    Căn chỉnh giá trị X giữa của {{ SVGAttr("viewBox") }} của phần tử với giá trị X giữa của viewport.
    Căn chỉnh `<min-y>+<height>` của {{ SVGAttr("viewBox") }} của phần tử với giá trị Y lớn nhất của viewport.

- `xMaxYMax`
  - : Ép co giãn đồng nhất.
    Căn chỉnh `<min-x>+<width>` của {{ SVGAttr("viewBox") }} của phần tử với giá trị X lớn nhất của viewport.
    Căn chỉnh `<min-y>+<height>` của {{ SVGAttr("viewBox") }} của phần tử với giá trị Y lớn nhất của viewport.

Hai từ khóa sau quyết định cách SVG được co giãn tương đối với ranh giới của vùng chứa. Việc chỉ định tham chiếu `meet` hoặc `slice` là tùy chọn và nếu có, nó chỉ được là một trong hai từ khóa này. `meet` là giá trị mặc định.

- `meet`
  - : Co giãn đồ họa sao cho:
    - Tỷ lệ khung hình được giữ nguyên.
    - Toàn bộ {{ SVGAttr("viewBox") }} hiển thị trong viewport.
    - {{ SVGAttr("viewBox") }} được phóng to nhiều nhất có thể nhưng vẫn thỏa các tiêu chí còn lại.

    Trong trường hợp này, nếu tỷ lệ khung hình của đồ họa không khớp với viewport, một phần viewport sẽ vượt ra ngoài ranh giới của {{ SVGAttr("viewBox") }} (tức vùng mà {{ SVGAttr("viewBox") }} sẽ vẽ vào sẽ nhỏ hơn viewport).

- `slice`
  - : Co giãn đồ họa sao cho:
    - Tỷ lệ khung hình được giữ nguyên.
    - Toàn bộ viewport được {{ SVGAttr("viewBox") }} phủ kín.
    - {{ SVGAttr("viewBox") }} được thu nhỏ nhiều nhất có thể nhưng vẫn thỏa các tiêu chí còn lại.

    Trong trường hợp này, nếu tỷ lệ khung hình của {{ SVGAttr("viewBox") }} không khớp với viewport, một phần {{ SVGAttr("viewBox") }} sẽ vượt ra ngoài ranh giới của viewport (tức vùng mà {{ SVGAttr("viewBox") }} sẽ vẽ vào sẽ lớn hơn viewport).

## Examples

### Using `meet` when width > height

Ví dụ này cho thấy cách dùng `meet` khi `width` của phần tử lớn hơn `height`. Nó trình bày ba biến thể, với ba giá trị căn chỉnh khác nhau: `xMidYMid`, `xMinYMid`, và `xMaxYMid`.

```css hidden
html,
body,
svg {
  height: 100%;
}

/* đặt phần tử flex trên mỗi body của iframe để phản hồi ở các kích thước màn hình khác nhau */
body {
  display: flex;
}
```

```html-nolint
<svg viewBox="-1 -1 202 40" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <path
      id="smiley"
      d="M50,10 A40,40,1,1,1,50,90 A40,40,1,1,1,50,10 M30,40 Q36,35,42,40 M58,40 Q64,35,70,40 M30,60 Q50,75,70,60 Q50,75,30,60" />
  </defs>
```

```html
<rect x="0" y="0" width="60" height="30">
  <title>xMidYMid meet</title>
</rect>
<svg
  viewBox="0 0 100 100"
  width="60"
  height="30"
  preserveAspectRatio="xMidYMid meet"
  x="0"
  y="0">
  <use href="#smiley" />
</svg>
```

```html
<rect x="70" y="0" width="60" height="30">
  <title>xMinYMid meet</title>
</rect>
<svg
  viewBox="0 0 100 100"
  width="60"
  height="30"
  preserveAspectRatio="xMinYMid meet"
  x="70"
  y="0">
  <use href="#smiley" />
</svg>
```

```html
<rect x="140" y="0" width="60" height="30">
  <title>xMaxYMid meet</title>
</rect>
<svg
  viewBox="0 0 100 100"
  width="60"
  height="30"
  preserveAspectRatio="xMaxYMid meet"
  x="140"
  y="0">
  <use href="#smiley" />
</svg>
```

```html-nolint
</svg>
```

```css
path {
  fill: yellow;
  stroke: black;
  stroke-width: 8px;
  stroke-linecap: round;
  stroke-linejoin: round;
  pointer-events: none;
}

rect:hover,
rect:active {
  outline: 1px solid red;
}
```

{{EmbedLiveSample('Using meet when width height', '100%', 200)}}

### Using `slice` when width > height

Ví dụ này cho thấy cách dùng `slice` khi `width` của phần tử lớn hơn `height`. Nó trình bày ba biến thể, với ba giá trị căn chỉnh khác nhau: `xMidYMin`, `xMidYMid`, và `xMidYMax`.

```css hidden
html,
body,
svg {
  height: 100%;
}

/* đặt phần tử flex trên mỗi body của iframe để phản hồi ở các kích thước màn hình khác nhau */
body {
  display: flex;
}
```

```html-nolint
<svg viewBox="-1 -1 202 57" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <path
      id="smiley"
      d="M50,10 A40,40,1,1,1,50,90 A40,40,1,1,1,50,10 M30,40 Q36,35,42,40 M58,40 Q64,35,70,40 M30,60 Q50,75,70,60 Q50,75,30,60" />
  </defs>
```

```html
<rect x="0" y="15" width="60" height="30">
  <title>xMidYMin slice</title>
</rect>
<svg
  viewBox="0 0 100 100"
  width="60"
  height="30"
  preserveAspectRatio="xMidYMin slice"
  x="0"
  y="15">
  <use href="#smiley" />
</svg>
```

```html
<rect x="70" y="15" width="60" height="30">
  <title>xMidYMid slice</title>
</rect>
<svg
  viewBox="0 0 100 100"
  width="60"
  height="30"
  preserveAspectRatio="xMidYMid slice"
  x="70"
  y="15">
  <use href="#smiley" />
</svg>
```

```html
<rect x="140" y="15" width="60" height="30">
  <title>xMidYMax slice</title>
</rect>
<svg
  viewBox="0 0 100 100"
  width="60"
  height="30"
  preserveAspectRatio="xMidYMax slice"
  x="140"
  y="15">
  <use href="#smiley" />
</svg>
```

```html-nolint
</svg>
```

```css
path {
  fill: yellow;
  stroke: black;
  stroke-width: 8px;
  stroke-linecap: round;
  stroke-linejoin: round;
  pointer-events: none;
}

rect:hover,
rect:active {
  outline: 1px solid red;
}
```

{{EmbedLiveSample('Using slice when width height', '100%', 200)}}

### Using `meet` when height > width

Ví dụ này cho thấy cách dùng `meet` khi `height` của phần tử lớn hơn `width`. Nó trình bày ba biến thể, với ba giá trị căn chỉnh khác nhau: `xMidYMin`, `xMidYMid`, và `xMidYMax`.

```css hidden
html,
body,
svg {
  height: 100%;
}

/* đặt phần tử flex trên mỗi body của iframe để phản hồi ở các kích thước màn hình khác nhau */
body {
  display: flex;
}
```

```html-nolint
<svg viewBox="-1 -1 202 80" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <path
      id="smiley"
      d="M50,10 A40,40,1,1,1,50,90 A40,40,1,1,1,50,10 M30,40 Q36,35,42,40 M58,40 Q64,35,70,40 M30,60 Q50,75,70,60 Q50,75,30,60" />
  </defs>
```

```html
<rect x="0" y="0" width="30" height="75">
  <title>xMidYMin meet</title>
</rect>
<svg
  viewBox="0 0 100 100"
  width="30"
  height="75"
  preserveAspectRatio="xMidYMin meet"
  x="0"
  y="0">
  <use href="#smiley" />
</svg>
```

```html
<rect x="35" y="0" width="30" height="75">
  <title>xMidYMid meet</title>
</rect>
<svg
  viewBox="0 0 100 100"
  width="30"
  height="75"
  preserveAspectRatio="xMidYMid meet"
  x="35"
  y="0">
  <use href="#smiley" />
</svg>
```

```html
<rect x="70" y="0" width="30" height="75">
  <title>xMidYMax meet</title>
</rect>
<svg
  viewBox="0 0 100 100"
  width="30"
  height="75"
  preserveAspectRatio="xMidYMax meet"
  x="70"
  y="0">
  <use href="#smiley" />
</svg>
```

```html-nolint
</svg>
```

```css
path {
  fill: yellow;
  stroke: black;
  stroke-width: 8px;
  stroke-linecap: round;
  stroke-linejoin: round;
  pointer-events: none;
}

rect:hover,
rect:active {
  outline: 1px solid red;
}
```

{{EmbedLiveSample('Using meet when height width', '100%', 200)}}

### Using `slice` when height > width

Ví dụ này cho thấy cách dùng `slice` khi `height` của phần tử lớn hơn `width`. Nó trình bày ba biến thể, với ba giá trị căn chỉnh khác nhau: `xMinYMid`, `xMidYMid`, và `xMaxYMid`.

```css hidden
html,
body,
svg {
  height: 100%;
}

/* đặt phần tử flex trên mỗi body của iframe để phản hồi ở các kích thước màn hình khác nhau */
body {
  display: flex;
}
```

```html-nolint
<svg viewBox="-1 -1 202 80" xmlns="http://www.w3.org/2000/svg">
  <defs>
    <path
      id="smiley"
      d="M50,10 A40,40,1,1,1,50,90 A40,40,1,1,1,50,10 M30,40 Q36,35,42,40 M58,40 Q64,35,70,40 M30,60 Q50,75,70,60 Q50,75,30,60" />
  </defs>
```

```html
<rect x="0" y="0" width="30" height="75">
  <title>xMinYMid slice</title>
</rect>
<svg
  viewBox="0 0 100 100"
  width="30"
  height="75"
  preserveAspectRatio="xMinYMid slice"
  x="0"
  y="0">
  <use href="#smiley" />
</svg>
```

```html
<rect x="35" y="0" width="30" height="75">
  <title>xMidYMid slice</title>
</rect>
<svg
  viewBox="0 0 100 100"
  width="30"
  height="75"
  preserveAspectRatio="xMidYMid slice"
  x="35"
  y="0">
  <use href="#smiley" />
</svg>
```

```html
<rect x="70" y="0" width="30" height="75">
  <title>xMaxYMid slice</title>
</rect>
<svg
  viewBox="0 0 100 100"
  width="30"
  height="75"
  preserveAspectRatio="xMaxYMid slice"
  x="70"
  y="0">
  <use href="#smiley" />
</svg>
```

```html-nolint
</svg>
```

```css
path {
  fill: yellow;
  stroke: black;
  stroke-width: 8px;
  stroke-linecap: round;
  stroke-linejoin: round;
  pointer-events: none;
}

rect:hover,
rect:active {
  outline: 1px solid red;
}
```

{{EmbedLiveSample('Using slice when height width', '100%', 200)}}

## Specifications

{{Specifications}}
