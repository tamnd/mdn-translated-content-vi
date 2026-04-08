---
title: corner-shape
slug: Web/CSS/Reference/Properties/corner-shape
page-type: css-shorthand-property
status:
  - experimental
browser-compat: css.properties.corner-shape
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính [CSS](/en-US/docs/Web/CSS) viết tắt **`corner-shape`** chỉ định hình dạng các góc của một hộp, trong phạm vi vùng được xác định bởi giá trị thuộc tính {{cssxref("border-radius")}} của nó.

## Các thuộc tính thành phần

Thuộc tính `corner-shape` là dạng viết tắt của các thuộc tính vật lý sau:

- {{cssxref("corner-top-left-shape")}}
- {{cssxref("corner-top-right-shape")}}
- {{cssxref("corner-bottom-left-shape")}}
- {{cssxref("corner-bottom-right-shape")}}

## Cú pháp

```css
/* Single value set for all four corners */
corner-shape: bevel;

/* top-left and bottom-right, top-right and bottom-left */
corner-shape: notch superellipse(0.6);

/* top-left, top-right and bottom-left, bottom-right */
corner-shape: superellipse(-1.2) square squircle;

/* top-left, top-right, bottom-right, bottom-left */
corner-shape: scoop superellipse(-1.6) superellipse(-2.2) round;

/* Global values */
corner-shape: inherit;
corner-shape: initial;
corner-shape: revert;
corner-shape: revert-layer;
corner-shape: unset;
```

Thuộc tính `corner-shape` có thể được chỉ định bằng một, hai, ba hoặc bốn giá trị {{cssxref("&lt;corner-shape-value>")}}:

- Nếu **một** giá trị được sử dụng, nó chỉ định hình dạng của **cả bốn góc**.
- Nếu **hai** giá trị được sử dụng, hình dạng đầu tiên áp dụng cho góc **trên-trái và dưới-phải**, hình dạng thứ hai áp dụng cho góc **trên-phải và dưới-trái**.
- Nếu **ba** giá trị được sử dụng, hình dạng đầu tiên chỉ định hình dạng của góc **trên-trái**, hình dạng thứ hai áp dụng cho góc **trên-phải và dưới-trái**, hình dạng thứ ba áp dụng cho góc **dưới-phải**.
- Nếu bốn giá trị được sử dụng, chúng chỉ định hình dạng của các góc **trên-trái**, **trên-phải**, **dưới-phải**, và **dưới-trái**, theo thứ tự đó (theo chiều kim đồng hồ).

### Giá trị

- {{cssxref("corner-shape-value")}}
  - : Một hàm {{cssxref("superellipse()")}} hoặc từ khóa tương đương mô tả hình dạng của góc.

## Mô tả

Thuộc tính `corner-shape` được dùng để thay đổi hình dạng của các góc bo tròn được tạo ra bởi thuộc tính {{cssxref("border-radius")}} và các thuộc tính thành phần của nó. Các góc đã bo tròn có thể được tùy chỉnh thêm về mức độ bo tròn, cho phép tạo ra các góc vát, góc khía, và góc squircle chẳng hạn. Đường viền, outline, đổ bóng và hiệu ứng nền áp dụng cho container sẽ theo hình dạng góc đã xác định.

Nếu `border-radius` không được áp dụng cho container, hoặc `border-radius` có giá trị `0`, thì `corner-shape` sẽ không có hiệu lực.

Thuộc tính viết tắt `corner-shape` và các dạng viết tắt, dạng đầy đủ [`corner-*-shape`](#corner--shape_shorthands_and_longhands) liên quan chấp nhận một đến bốn giá trị {{cssxref("&lt;corner-shape-value>")}}. Mỗi giá trị được chỉ định trực tiếp dưới dạng hàm {{cssxref("superellipse()")}} hoặc từ khóa mô tả hình dạng phổ biến. Mỗi từ khóa tương đương với một giá trị `superellipse()` cụ thể.

Giá trị mặc định (khởi tạo) của `corner-shape` là `round`, cho hiệu ứng tương tự như chỉ dùng `border-radius` mà không có `corner-shape`. Ngoài ra có giá trị từ khóa `square`, cho hiệu ứng tương tự như các góc vuông mặc định, về cơ bản loại bỏ bất kỳ `border-radius` nào đã áp dụng. Giá trị `bevel` có tác dụng vẽ một đường thẳng giữa hai đầu của `border-radius`.

Các giá trị `corner-shape` khác nhau có thể được hoạt ảnh mượt mà giữa chúng, vì các giá trị tương đương `superellipse()` của các từ khóa được dùng làm giá trị nội suy.

Thuộc tính viết tắt `corner-shape` đặc biệt hữu ích khi bạn muốn cả bốn đường viền giống nhau, hoặc muốn đặt các giá trị khác nhau trong một khai báo duy nhất. Để chỉ đặt một hoặc hai hình dạng góc tại một thời điểm, hãy dùng các dạng viết tắt và đầy đủ `corner-*-shape`.

### Các dạng viết tắt và đầy đủ của `corner-*-shape`

Thuộc tính viết tắt `corner-shape` định nghĩa hình dạng của cả bốn góc trong một khai báo.

Để chỉ đặt một hình dạng góc tại một thời điểm, hãy dùng các thuộc tính đầy đủ của hình dạng góc:

- Thuộc tính đầy đủ hình dạng góc vật lý:
  - {{cssxref("corner-bottom-left-shape")}}
  - {{cssxref("corner-bottom-right-shape")}}
  - {{cssxref("corner-top-left-shape")}}
  - {{cssxref("corner-top-right-shape")}}
- Thuộc tính đầy đủ hình dạng góc logic:
  - {{cssxref("corner-start-start-shape")}}
  - {{cssxref("corner-start-end-shape")}}
  - {{cssxref("corner-end-start-shape")}}
  - {{cssxref("corner-end-end-shape")}}

Để đặt hai hình dạng góc cùng lúc, hãy dùng các thuộc tính viết tắt theo cạnh:

- Thuộc tính viết tắt theo cạnh vật lý:
  - {{cssxref("corner-top-shape")}}
  - {{cssxref("corner-right-shape")}}
  - {{cssxref("corner-bottom-shape")}}
  - {{cssxref("corner-left-shape")}}
- Thuộc tính viết tắt theo cạnh logic:
  - {{cssxref("corner-block-start-shape")}}
  - {{cssxref("corner-block-end-shape")}}
  - {{cssxref("corner-inline-start-shape")}}
  - {{cssxref("corner-inline-end-shape")}}

### Giới hạn bán kính góc đối diện

Khi các góc đối diện có giá trị `border-radius` và `corner-shape` mà sẽ khiến các hình dạng chồng lên nhau, trình duyệt sẽ giới hạn các giá trị để ngăn chặn sự chồng lấp đó.

Ví dụ, các giá trị sau sẽ khiến các góc trên-trái và dưới-phải chồng lên nhau, do đó trình duyệt điều chỉnh thành phần `border-radius` đầu tiên sang giá trị tránh chồng lấp này.

```css
div {
  width: 480px;
  height: 200px;
  background-color: goldenrod;
  border-radius: 80% 20px;
  corner-shape: scoop;
}
```

### Các thuộc tính theo hình dạng góc

Các thuộc tính sau đây đều theo hình dạng góc khi được đặt trên container:

- {{cssxref("background-color")}}
- {{cssxref("background-image")}}
- {{cssxref("border")}}
- {{cssxref("outline")}}
- {{cssxref("box-shadow")}}
- {{cssxref("overflow")}}
- {{cssxref("backdrop-filter")}}

Xem [Minh họa các thuộc tính theo `corner-shape`](#demonstration_of_properties_that_follow_the_corner-shape) để biết một số ví dụ.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Cách dùng cơ bản của `corner-shape`

#### HTML

Mã đánh dấu cho ví dụ này chứa một phần tử {{htmlelement("div")}} duy nhất.

```html live-sample___basic-corner-shape
<div>Nice scooped corners</div>
```

#### CSS

Chúng ta cho hộp một {{cssxref("height")}} cố định, một {{cssxref("box-shadow")}}, `border-radius` là 30 pixel, và `corner-shape` là `scoop`, cùng với một số kiểu dáng bổ sung được ẩn để ngắn gọn.

```css hidden live-sample___basic-corner-shape
body {
  font-family: "Helvetica", "Arial", sans-serif;
  width: 240px;
  margin: 20px auto;
}

div {
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: cyan;
  background-image: linear-gradient(
    to bottom,
    rgb(255 255 255 / 0),
    rgb(255 255 255 / 0.5)
  );
}

@supports not (corner-shape: scoop) {
  body {
    all: unset !important;
  }

  body::before {
    content: "Your browser does not support the 'corner-shape' property.";
    color: black;
    background-color: #ffcd33;
    display: block;
    width: 100%;
    text-align: center;
    padding: 1rem 0;
  }

  body > * {
    display: none;
  }
}
```

```css live-sample___basic-corner-shape
div {
  height: 180px;
  box-shadow: 1px 1px 3px gray;
  border-radius: 30px;
  corner-shape: scoop;
}
```

#### Kết quả

Kết quả hiển thị như sau:

{{EmbedLiveSample("basic-corner-shape", "100%", "240")}}

Lưu ý cách giá trị `corner-shape` là `scoop` tạo ra các góc lõm cho container — đường cong là phản chiều của đường cong `border-radius` mặc định. Lưu ý thêm rằng nền, đường viền và đổ bóng hộp đều theo hình dạng đường cong.

### Minh họa các thuộc tính theo `corner-shape`

#### HTML

Mã đánh dấu cho ví dụ này chứa một phần tử {{htmlelement("div")}} duy nhất với một số nội dung văn bản bên trong.

```html live-sample___styles-following-corner-shape
<div>
  Some styles follow the corner shape, such as border, outline, box-shadow,
  overflow, and backdrop-filter. This is useful for helping various aspects of
  your design to not clash. As shown, it can result in some interesting visual
  effects, so you should test your design carefully.
</div>
```

#### CSS

Để minh họa cách một số kiểu dáng theo hình dạng các góc của container, chúng ta áp dụng {{cssxref("background-image")}} cho phần tử `<body>` của tài liệu, sau đó áp dụng `border-radius` là `40px` và `corner-shape` là `scoop notch` cho `<div>`.

Chúng ta cũng áp dụng cho `<div>`:

- Một {{cssxref("background-color")}} bán trong suốt.
- Màu sắc và kiểu dáng {{cssxref("border")}} khác nhau trên mỗi cạnh.
- Một {{cssxref("backdrop-filter")}} đảo ngược `background-image` được đặt trên `<body>`.
- Một kiểu `:hover` để bạn có thể thấy vùng nội dung có thể nhấp nằm ngoài hình dạng góc.

Các kiểu thiết lập bổ sung đã được ẩn để ngắn gọn.

```css hidden live-sample___styles-following-corner-shape
html {
  height: 100%;
}

body {
  font-family: "Helvetica", "Arial", sans-serif;
  height: inherit;
  margin: 0;
  display: flex;
  justify-content: center;
  align-items: center;
}

div {
  width: 240px;
  height: 180px;
}

@supports not (corner-shape: scoop notch) {
  body {
    all: unset !important;
  }

  body::before {
    content: "Your browser does not support the 'corner-shape' property.";
    color: black;
    background-color: #ffcd33;
    display: block;
    width: 100%;
    text-align: center;
    padding: 1rem 0;
  }

  body > * {
    display: none;
  }
}
```

```css live-sample___styles-following-corner-shape
body {
  background: url("https://mdn.github.io/shared-assets/images/examples/leopard.jpg")
    no-repeat;
  background-size: cover;
}

div {
  border-radius: 40px;
  corner-shape: scoop notch;
  background-color: rgb(255 255 255 / 0.2);
  border-top: 3px solid blue;
  border-left: 6px dashed red;
  border-bottom: 9px solid yellow;
  border-right: 12px double green;
  backdrop-filter: invert(100%);
}

div:hover {
  background-color: white;
}
```

#### Kết quả

Kết quả hiển thị như sau:

{{EmbedLiveSample("styles-following-corner-shape", "100%", "240")}}

Lưu ý cách hầu hết các kiểu dáng đã đặt đều theo hình dạng của `<div>` từ các kiểu `corner-shape`, nhưng không phải tất cả. Nội dung được hiển thị tương đối với hộp gốc, và hiệu ứng hover vẫn được áp dụng nếu bạn di chuột qua phần văn bản nhô ra ngoài các góc trên- và dưới-trái.

### So sánh các giá trị `corner-shape`

Trong minh họa này, bạn có thể chọn các giá trị `corner-shape` khác nhau và đặt các giá trị {{cssxref("border-radius")}} khác nhau trên một container và so sánh các hiệu ứng.

#### HTML

Mã đánh dấu cho ví dụ này chứa một bộ chọn {{htmlelement("select")}} để chọn các giá trị `corner-shape` khác nhau, một thanh trượt [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range) để chọn các giá trị `border-radius` khác nhau, và một phần tử {{htmlelement("section")}} làm container áp dụng các giá trị đó. Các phần tử {{htmlelement("option")}} trong select cung cấp nhiều lựa chọn từ khóa và giá trị {{cssxref("superellipse()")}}, được nhóm thành hai nhóm bằng các phần tử {{htmlelement("optgroup")}}. Với các giá trị từ khóa, chúng ta cũng đã bao gồm giá trị `superellipse()` tương đương cho mỗi cái, được ngăn cách bởi ký tự đường ống.

```html live-sample___corner-shape-select
<form>
  <div>
    <label for="corner-shape-choice">Choose a corner-shape value:</label>
    <select id="corner-shape-choice">
      <optgroup label="Keywords">
        <option value="square">square | superellipse(infinity)</option>
        <option selected value="squircle">squircle | superellipse(2)</option>
        <option value="round">round | superellipse(1)</option>
        <option value="bevel">bevel | superellipse(0)</option>
        <option value="scoop">scoop | superellipse(-1)</option>
        <option value="notch">notch | superellipse(-infinity)</option>
      </optgroup>
      <optgroup label="Functions">
        <option>superellipse(3)</option>
        <option>superellipse(1.5)</option>
        <option>superellipse(0.5)</option>
        <option>superellipse(-0.5)</option>
        <option>superellipse(-1.5)</option>
        <option>superellipse(-3)</option>
      </optgroup>
    </select>
  </div>
  <div>
    <label for="radius-slider">Choose a border-radius value:</label>
    <input
      type="range"
      id="radius-slider"
      min="0"
      value="45"
      max="90"
      step="1" />
  </div>
</form>
<section></section>
```

#### CSS

Chúng ta áp dụng {{cssxref("box-shadow")}} cho `<section>`. Chúng ta cũng cho phần tử `<section>` và form một số kiểu dáng cơ bản, được ẩn để ngắn gọn.

```css hidden live-sample___corner-shape-select
html {
  font-family: "Helvetica", "Arial", sans-serif;
}

body {
  width: fit-content;
  margin: 20px auto;
}

section {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 20px;
}

select {
  padding: 3px 5px;
}

form div:nth-of-type(2) {
  margin-top: 5px;
  display: flex;
}

section {
  width: 100%;
  height: 180px;
  background-color: gold;
  background-image: linear-gradient(
    to bottom,
    rgb(255 255 255 / 0),
    rgb(255 255 255 / 0.5)
  );
}

@supports not (corner-shape: scoop) {
  body {
    all: unset !important;
  }

  body::before {
    content: "Your browser does not support the 'corner-shape' property.";
    color: black;
    background-color: #ffcd33;
    display: block;
    width: 100%;
    text-align: center;
    padding: 1rem 0;
  }

  body > * {
    display: none;
  }
}
```

```css live-sample___corner-shape-select
section {
  box-shadow: 1px 1px 3px gray;
}
```

```js hidden live-sample___corner-shape-select
const rectangle = document.querySelector("section");
const select = document.querySelector("select");
const range = document.getElementById("radius-slider");

function setCorners() {
  rectangle.style.cornerShape = select.value;
  const brValue = `${range.value}px`;
  rectangle.style.borderRadius = brValue;
  rectangle.innerHTML = `<div><code>corner-shape: ${select.value};</code><br><code>border-radius: ${brValue};</code></div>`;
}

select.addEventListener("change", setCorners);
range.addEventListener("input", setCorners);
setCorners();
```

JavaScript áp dụng các giá trị do người dùng chọn lên `<section>` đã được ẩn để ngắn gọn.

#### Kết quả

Kết quả hiển thị như sau:

{{EmbedLiveSample("corner-shape-select", "100%", "300")}}

Hãy thử chọn các giá trị khác nhau để xem ảnh hưởng đến hình dạng các góc.

### So sánh giá trị `superellipse()`

Trong ví dụ này, chúng ta cung cấp hai thanh trượt [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range) cho phép bạn duyệt qua nhiều giá trị `corner-shape` {{cssxref("superellipse()")}} và giá trị {{cssxref("border-radius")}} khác nhau để so sánh hiệu ứng của từng giá trị trên container.

#### HTML

Mã đánh dấu cho ví dụ này chứa hai phần tử `<input type="range">` để chọn các giá trị `corner-shape` `superellipse()` và `border-radius` khác nhau, và một phần tử {{htmlelement("section")}} để áp dụng các giá trị đó.

```html live-sample___superellipse-slider
<form>
  <div>
    <label for="superellipse-slider">Choose a superellipse() value:</label>
    <input
      type="range"
      id="superellipse-slider"
      min="-5"
      value="0"
      max="5"
      step="0.1" />
  </div>
  <div>
    <label for="radius-slider">Choose a border-radius value:</label>
    <input
      type="range"
      id="radius-slider"
      min="0"
      value="45"
      max="90"
      step="1" />
  </div>
</form>
<section></section>
```

#### CSS

Chúng ta áp dụng {{cssxref("box-shadow")}} cho phần tử `<section>`. Các kiểu dáng cơ bản bổ sung đã được ẩn để ngắn gọn.

```css hidden live-sample___superellipse-slider
html {
  font-family: "Helvetica", "Arial", sans-serif;
}

body {
  width: fit-content;
  margin: 20px auto;
}

section {
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 20px;
}

form div {
  margin-top: 5px;
  display: flex;
}

section {
  width: 100%;
  height: 180px;
  background-color: orange;
  background-image: linear-gradient(
    to bottom,
    rgb(255 255 255 / 0),
    rgb(255 255 255 / 0.5)
  );
}

@supports not (corner-shape: superellipse(0)) {
  body {
    all: unset !important;
  }

  body::before {
    content: "Your browser does not support the 'corner-shape' property.";
    color: black;
    background-color: #ffcd33;
    display: block;
    width: 100%;
    text-align: center;
    padding: 1rem 0;
  }

  body > * {
    display: none;
  }
}
```

```css live-sample___superellipse-slider
section {
  box-shadow: 1px 1px 3px gray;
}
```

```js hidden live-sample___superellipse-slider
const rectangle = document.querySelector("section");
const superEllipseRange = document.getElementById("superellipse-slider");
const borderRadiusRange = document.getElementById("radius-slider");

function setCorners() {
  const seValue = `superellipse(${superEllipseRange.value})`;
  rectangle.style.cornerShape = seValue;
  const brValue = `${borderRadiusRange.value}px`;
  rectangle.style.borderRadius = brValue;
  rectangle.innerHTML = `<div><code>corner-shape: ${seValue};</code><br><code>border-radius: ${brValue};</code></div>`;
}

superEllipseRange.addEventListener("input", setCorners);
borderRadiusRange.addEventListener("input", setCorners);
setCorners();
```

JavaScript áp dụng các giá trị do người dùng chọn lên `<section>` đã được ẩn để ngắn gọn.

#### Kết quả

Kết quả hiển thị như sau:

{{EmbedLiveSample("superellipse-slider", "100%", "300")}}

Hãy thử chọn các giá trị khác nhau để xem ảnh hưởng đến hình dạng các góc.

### Hoạt ảnh `corner-shape`

Trong ví dụ này, chúng ta minh họa cách thuộc tính `corner-shape` có thể được tạo hoạt ảnh.

#### HTML

```html live-sample___corner-shape-animation
<div></div>
```

#### CSS

Chúng ta tạo một tập hợp {{cssxref("@keyframes")}} tạo hoạt ảnh mượt mà giữa các giá trị `corner-shape` là `square` và `notch`. Sau đó chúng ta áp dụng {{cssxref("animation")}} dựa trên các `@keyframes` đó cho `<div>` khi phần tử `<html>` chứa nó được di chuột hoặc được focus. Các kiểu dáng cơ bản bổ sung của `<div>` đã được ẩn để ngắn gọn.

```css hidden live-sample___corner-shape-animation
body {
  width: 200px;
  margin: 20px auto;
}

div {
  width: 100%;
  height: 200px;
  background-color: green;
  background-image: linear-gradient(
    to bottom,
    rgb(255 255 255 / 0),
    rgb(255 255 255 / 0.5)
  );
  box-shadow: 1px 1px 3px gray;
  border-radius: 50%;
  corner-shape: square;
  outline: none;
}

@supports not (corner-shape: square) {
  body {
    all: unset !important;
  }

  body::before {
    content: "Your browser does not support the 'corner-shape' property.";
    color: black;
    background-color: #ffcd33;
    display: block;
    width: 100%;
    text-align: center;
    padding: 1rem 0;
  }

  body > * {
    display: none;
  }
}
```

```css live-sample___corner-shape-animation
@keyframes corner-pulse {
  0% {
    corner-shape: square;
  }

  /* To make the starting point apparent, let us keep
  the shape the same for a small duration. */
  20% {
    corner-shape: square;
  }

  100% {
    corner-shape: notch;
  }
}

div {
  animation: corner-pulse infinite alternate 4s linear;
}
```

#### Kết quả

Kết quả hiển thị như sau:

{{EmbedLiveSample("corner-shape-animation", "100%", "270")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{Cssxref("border-radius")}}
- [CSS borders and box decorations](/en-US/docs/Web/CSS/Guides/Borders_and_box_decorations) module
- [CSS backgrounds and borders](/en-US/docs/Web/CSS/Guides/Backgrounds_and_borders) module
- [CSS animations](/en-US/docs/Web/CSS/Guides/Animations) module
