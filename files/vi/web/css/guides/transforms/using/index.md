---
title: Using CSS transforms
short-title: Using transforms
slug: Web/CSS/Guides/Transforms/Using
page-type: guide
sidebar: cssref
---

Bằng cách thay đổi không gian tọa độ, **CSS transforms** thay đổi hình dạng và vị trí của nội dung bị ảnh hưởng mà không làm gián đoạn luồng tài liệu thông thường. Hướng dẫn này giới thiệu cách sử dụng transforms.

CSS transforms được triển khai bằng một tập hợp các thuộc tính CSS cho phép bạn áp dụng các phép biến đổi tuyến tính affine lên các phần tử HTML. Các phép biến đổi này bao gồm rotation (xoay), skewing (nghiêng), scaling (tỷ lệ) và translation (dịch chuyển) cả trong mặt phẳng lẫn trong không gian 3D.

> [!WARNING]
> Chỉ các phần tử có thể biến đổi mới có thể được `transform`; tức là tất cả các phần tử có bố cục được điều chỉnh bởi [box model](/en-US/docs/Web/CSS/Guides/Box_model) CSS, ngoại trừ: [non-replaced inline boxes](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model#inline-level_and_block-level_boxes), [table-column boxes](/en-US/docs/Web/HTML/Reference/Elements/col) và [table-column-group boxes](/en-US/docs/Web/HTML/Reference/Elements/colgroup).

## Các thuộc tính CSS transforms

Hai thuộc tính chính được dùng để định nghĩa CSS transforms: {{cssxref("transform")}} (hoặc các thuộc tính riêng lẻ {{cssxref('translate')}}, {{cssxref('rotate')}} và {{cssxref('scale')}}) và {{cssxref("transform-origin")}}.

- {{cssxref("transform-origin")}}
  - : Chỉ định vị trí của điểm gốc. Theo mặc định, nó nằm ở trung tâm của phần tử và có thể được di chuyển. Thuộc tính này được dùng bởi nhiều phép biến đổi như rotation, scaling hay skewing, vốn cần một điểm cụ thể làm tham số.
- {{cssxref("transform")}}
  - : Chỉ định các phép biến đổi áp dụng lên phần tử. Đây là danh sách các transforms được phân tách bằng khoảng trắng, được áp dụng lần lượt theo thứ tự, như yêu cầu của phép tổ hợp. Các phép biến đổi tổ hợp thực sự được áp dụng theo thứ tự từ phải sang trái.

## Ví dụ

Đây là hình ảnh logo MDN chưa được chỉnh sửa:

![MDN Logo](logo.png)

### Xoay (Rotating)

Đây là logo MDN được xoay 90 độ từ góc dưới bên trái.

```html
<img src="logo.png" alt="MDN Logo" />
```

```css
img {
  rotate: 90deg;
  transform-origin: bottom left;
}
```

{{EmbedLiveSample('Rotating', 'auto', 240) }}

### Nghiêng và dịch chuyển (Skewing and translating)

Đây là logo MDN, được nghiêng 10 độ và dịch chuyển 150 pixel theo trục X.

```html
<img src="logo.png" alt="MDN logo" />
```

```css
img {
  transform: skewX(10deg) translateX(150px);
  transform-origin: bottom left;
}
```

{{EmbedLiveSample('Skewing_and_translating') }}

## Thuộc tính CSS dành riêng cho 3D

Thực hiện các phép biến đổi CSS trong không gian 3D phức tạp hơn một chút. Trước tiên bạn cần cấu hình không gian 3D bằng cách đặt perspective (phối cảnh), sau đó cấu hình cách các phần tử 2D sẽ hoạt động trong không gian đó.

### Phối cảnh (Perspective)

Phần tử đầu tiên cần thiết lập là {{cssxref("perspective")}}. Phối cảnh là yếu tố tạo ra ấn tượng 3D cho chúng ta. Các phần tử càng xa người xem thì trông càng nhỏ hơn.

#### Thiết lập perspective

Ví dụ này hiển thị một khối lập phương với perspective được đặt ở các vị trí khác nhau. Tốc độ thu nhỏ của khối lập phương được xác định bởi thuộc tính {{ cssxref("perspective") }}. Giá trị càng nhỏ thì phối cảnh càng sâu.

##### HTML

HTML bên dưới tạo ra bốn bản sao của cùng một hộp, với perspective được đặt ở các giá trị khác nhau.

```html
<table>
  <tbody>
    <tr>
      <th><code>perspective: 250px;</code></th>
      <th><code>perspective: 350px;</code></th>
    </tr>
    <tr>
      <td>
        <div class="container">
          <div class="cube perspective-250">
            <div class="face front">1</div>
            <div class="face back">2</div>
            <div class="face right">3</div>
            <div class="face left">4</div>
            <div class="face top">5</div>
            <div class="face bottom">6</div>
          </div>
        </div>
      </td>
      <td>
        <div class="container">
          <div class="cube perspective-350">
            <div class="face front">1</div>
            <div class="face back">2</div>
            <div class="face right">3</div>
            <div class="face left">4</div>
            <div class="face top">5</div>
            <div class="face bottom">6</div>
          </div>
        </div>
      </td>
    </tr>
    <tr>
      <th><code>perspective: 500px;</code></th>
      <th><code>perspective: 650px;</code></th>
    </tr>
    <tr>
      <td>
        <div class="container">
          <div class="cube perspective-500">
            <div class="face front">1</div>
            <div class="face back">2</div>
            <div class="face right">3</div>
            <div class="face left">4</div>
            <div class="face top">5</div>
            <div class="face bottom">6</div>
          </div>
        </div>
      </td>
      <td>
        <div class="container">
          <div class="cube perspective-650">
            <div class="face front">1</div>
            <div class="face back">2</div>
            <div class="face right">3</div>
            <div class="face left">4</div>
            <div class="face top">5</div>
            <div class="face bottom">6</div>
          </div>
        </div>
      </td>
    </tr>
  </tbody>
</table>
```

##### CSS

CSS thiết lập các class có thể dùng để đặt perspective ở các khoảng cách khác nhau. Nó cũng bao gồm các class cho div container, div khối lập phương và từng mặt của nó.

```css
/* Shorthand classes for different perspective values */
.perspective-250 {
  perspective: 250px;
}

.perspective-350 {
  perspective: 350px;
}

.perspective-500 {
  perspective: 500px;
}

.perspective-650 {
  perspective: 650px;
}

/* Define the container div, the cube div, and a generic face */
.container {
  width: 200px;
  height: 200px;
  margin: 75px 0 0 75px;
  border: none;
}

.cube {
  width: 100%;
  height: 100%;
  perspective-origin: 150% 150%;
  transform-style: preserve-3d;
}

.face {
  display: block;
  position: absolute;
  width: 100px;
  height: 100px;
  border: none;
  line-height: 100px;
  font-family: sans-serif;
  font-size: 60px;
  color: white;
  text-align: center;
  backface-visibility: visible;
}

/* Define each face based on direction */
.front {
  background: rgb(0 0 0 / 30%);
  transform: translateZ(50px);
}

.back {
  background: lime;
  color: black;
  transform: rotateY(180deg) translateZ(50px);
}

.right {
  background: rgb(196 0 0 / 70%);
  transform: rotateY(90deg) translateZ(50px);
}

.left {
  background: rgb(0 0 196 / 70%);
  transform: rotateY(-90deg) translateZ(50px);
}

.top {
  background: rgb(196 196 0 / 70%);
  transform: rotateX(90deg) translateZ(50px);
}

.bottom {
  background: rgb(196 0 196 / 70%);
  transform: rotateX(-90deg) translateZ(50px);
}

/* Make the table a little nicer */
th,
p,
td {
  background-color: #eeeeee;
  padding: 10px;
  font-family: sans-serif;
  text-align: left;
}
```

##### Kết quả

{{EmbedLiveSample('Setting_perspective', 660, 700)}}

Phần tử thứ hai cần cấu hình là vị trí của người xem, với thuộc tính {{ cssxref("perspective-origin") }}. Theo mặc định, phối cảnh được căn giữa theo người xem, điều này không phải lúc nào cũng phù hợp.

#### Thay đổi điểm gốc perspective

Ví dụ này hiển thị các khối lập phương với các giá trị `perspective-origin` phổ biến.

##### HTML

```html
<section>
  <figure>
    <figcaption><code>perspective-origin: top left;</code></figcaption>
    <div class="container">
      <div class="cube po-tl">
        <div class="face front">1</div>
        <div class="face back">2</div>
        <div class="face right">3</div>
        <div class="face left">4</div>
        <div class="face top">5</div>
        <div class="face bottom">6</div>
      </div>
    </div>
  </figure>

  <figure>
    <figcaption><code>perspective-origin: top;</code></figcaption>
    <div class="container">
      <div class="cube po-tm">
        <div class="face front">1</div>
        <div class="face back">2</div>
        <div class="face right">3</div>
        <div class="face left">4</div>
        <div class="face top">5</div>
        <div class="face bottom">6</div>
      </div>
    </div>
  </figure>

  <figure>
    <figcaption><code>perspective-origin: top right;</code></figcaption>
    <div class="container">
      <div class="cube po-tr">
        <div class="face front">1</div>
        <div class="face back">2</div>
        <div class="face right">3</div>
        <div class="face left">4</div>
        <div class="face top">5</div>
        <div class="face bottom">6</div>
      </div>
    </div>
  </figure>

  <figure>
    <figcaption><code>perspective-origin: left;</code></figcaption>
    <div class="container">
      <div class="cube po-ml">
        <div class="face front">1</div>
        <div class="face back">2</div>
        <div class="face right">3</div>
        <div class="face left">4</div>
        <div class="face top">5</div>
        <div class="face bottom">6</div>
      </div>
    </div>
  </figure>

  <figure>
    <figcaption><code>perspective-origin: 50% 50%;</code></figcaption>
    <div class="container">
      <div class="cube po-mm">
        <div class="face front">1</div>
        <div class="face back">2</div>
        <div class="face right">3</div>
        <div class="face left">4</div>
        <div class="face top">5</div>
        <div class="face bottom">6</div>
      </div>
    </div>
  </figure>

  <figure>
    <figcaption><code>perspective-origin: right;</code></figcaption>
    <div class="container">
      <div class="cube po-mr">
        <div class="face front">1</div>
        <div class="face back">2</div>
        <div class="face right">3</div>
        <div class="face left">4</div>
        <div class="face top">5</div>
        <div class="face bottom">6</div>
      </div>
    </div>
  </figure>

  <figure>
    <figcaption><code>perspective-origin: bottom left;</code></figcaption>
    <div class="container">
      <div class="cube po-bl">
        <div class="face front">1</div>
        <div class="face back">2</div>
        <div class="face right">3</div>
        <div class="face left">4</div>
        <div class="face top">5</div>
        <div class="face bottom">6</div>
      </div>
    </div>
  </figure>

  <figure>
    <figcaption><code>perspective-origin: bottom;</code></figcaption>
    <div class="container">
      <div class="cube po-bm">
        <div class="face front">1</div>
        <div class="face back">2</div>
        <div class="face right">3</div>
        <div class="face left">4</div>
        <div class="face top">5</div>
        <div class="face bottom">6</div>
      </div>
    </div>
  </figure>

  <figure>
    <figcaption><code>perspective-origin: bottom right;</code></figcaption>
    <div class="container">
      <div class="cube po-br">
        <div class="face front">1</div>
        <div class="face back">2</div>
        <div class="face right">3</div>
        <div class="face left">4</div>
        <div class="face top">5</div>
        <div class="face bottom">6</div>
      </div>
    </div>
  </figure>

  <figure>
    <figcaption><code>perspective-origin: -200% -200%;</code></figcaption>
    <div class="container">
      <div class="cube po-200200neg">
        <div class="face front">1</div>
        <div class="face back">2</div>
        <div class="face right">3</div>
        <div class="face left">4</div>
        <div class="face top">5</div>
        <div class="face bottom">6</div>
      </div>
    </div>
  </figure>

  <figure>
    <figcaption><code>perspective-origin: 200% 200%;</code></figcaption>
    <div class="container">
      <div class="cube po-200200pos">
        <div class="face front">1</div>
        <div class="face back">2</div>
        <div class="face right">3</div>
        <div class="face left">4</div>
        <div class="face top">5</div>
        <div class="face bottom">6</div>
      </div>
    </div>
  </figure>

  <figure>
    <figcaption><code>perspective-origin: 200% -200%;</code></figcaption>
    <div class="container">
      <div class="cube po-200200">
        <div class="face front">1</div>
        <div class="face back">2</div>
        <div class="face right">3</div>
        <div class="face left">4</div>
        <div class="face top">5</div>
        <div class="face bottom">6</div>
      </div>
    </div>
  </figure>
</section>
```

##### CSS

```css
/* perspective-origin values (unique per example) */
.po-tl {
  perspective-origin: top left;
}
.po-tm {
  perspective-origin: top;
}
.po-tr {
  perspective-origin: top right;
}
.po-ml {
  perspective-origin: left;
}
.po-mm {
  perspective-origin: 50% 50%;
}
.po-mr {
  perspective-origin: right;
}
.po-bl {
  perspective-origin: bottom left;
}
.po-bm {
  perspective-origin: bottom;
}
.po-br {
  perspective-origin: bottom right;
}
.po-200200neg {
  perspective-origin: -200% -200%;
}
.po-200200pos {
  perspective-origin: 200% 200%;
}
.po-200200 {
  perspective-origin: 200% -200%;
}

/* Define the container div, the cube div, and a generic face */
.container {
  width: 100px;
  height: 100px;
  margin: 24px;
  border: none;
}

.cube {
  width: 100%;
  height: 100%;
  perspective: 300px;
  transform-style: preserve-3d;
}

.face {
  display: block;
  position: absolute;
  width: 100px;
  height: 100px;
  border: none;
  line-height: 100px;
  font-family: sans-serif;
  font-size: 60px;
  color: white;
  text-align: center;
  backface-visibility: visible;
}

/* Define each face based on direction */
.front {
  background: rgb(0 0 0 / 30%);
  transform: translateZ(50px);
}
.back {
  background: lime;
  color: black;
  transform: rotateY(180deg) translateZ(50px);
}
.right {
  background: rgb(196 0 0 / 70%);
  transform: rotateY(90deg) translateZ(50px);
}
.left {
  background: rgb(0 0 196 / 70%);
  transform: rotateY(-90deg) translateZ(50px);
}
.top {
  background: rgb(196 196 0 / 70%);
  transform: rotateX(90deg) translateZ(50px);
}
.bottom {
  background: rgb(196 0 196 / 70%);
  transform: rotateX(-90deg) translateZ(50px);
}

/* Make the layout a little nicer */
section {
  background-color: #eeeeee;
  padding: 10px;
  font-family: sans-serif;
  text-align: left;
  display: grid;
  grid-template-columns: repeat(3, 1fr);
}
```

##### Kết quả

{{EmbedLiveSample('Changing_the_perspective_origin', '100%', 700)}}

Sau khi thực hiện xong các bước này, bạn có thể làm việc với phần tử trong không gian 3D.

## Xem thêm

- [Thuộc tính CSS `transform`](/en-US/docs/Web/CSS/Reference/Properties/transform) và [kiểu dữ liệu CSS `<transform-function>`](/en-US/docs/Web/CSS/Reference/Values/transform-function)
- Các thuộc tính transform riêng lẻ: {{cssxref('translate')}}, {{cssxref('rotate')}} và {{cssxref('scale')}} (Không có thuộc tính `skew`)
- [Sử dụng device orientation với 3D Transforms](/en-US/docs/Web/API/Device_orientation_events/Using_device_orientation_with_3D_transforms)
- [Giới thiệu về CSS 3D transforms](https://3dtransforms.desandro.com/) (Bài đăng trên blog của David DeSandro)
- [CSS Transform Playground](https://css-transform.moro.es/) (Công cụ trực tuyến để trực quan hóa các hàm CSS Transform)
