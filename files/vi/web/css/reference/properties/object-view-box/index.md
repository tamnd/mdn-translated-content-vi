---
title: object-view-box
slug: Web/CSS/Reference/Properties/object-view-box
page-type: css-property
status:
  - experimental
browser-compat: css.properties.object-view-box
sidebar: cssref
---

{{SeeCompatTable}}

Thuộc tính **`object-view-box`** [CSS](/en-US/docs/Web/CSS) xác định một hình chữ nhật làm vùng hiển thị (viewbox) trong một {{glossary("replaced elements", "phần tử thay thế")}}, cho phép nội dung của phần tử thay thế được phóng to hoặc dịch chuyển. Nó hoạt động tương tự như thuộc tính SVG {{SVGAttr("viewBox")}}.

{{InteractiveExample("CSS Demo: object-view-box")}}

```css interactive-example-choice
object-view-box: inset(0 0);
```

```css interactive-example-choice
object-view-box: inset(20%);
```

```css interactive-example-choice
object-view-box: xywh(95px 20px 60px 60px);
```

```css interactive-example-choice
object-view-box: rect(110px 120px 200px 45px);
```

```css interactive-example-choice
object-view-box: none;
```

```html interactive-example
<section id="default-example">
  <img
    class="transition-all"
    id="example-element"
    src="/shared-assets/images/examples/plumeria-146x200.jpg"
    alt="A close-up of red flowers and buds on a branch." />
</section>
```

```css interactive-example
#example-element {
  height: 100%;
  width: 100%;
  border: 2px dotted #888888;
}

@supports not (object-view-box: none) {
  body::before {
    content: "Your browser does not support the 'object-view-box' property.";
    color: black;
    background-color: #ffcd33;
    display: block;
    width: 100%;
    text-align: center;
  }
}
```

## Cú pháp

```css
/* từ khóa */
object-view-box: none;

/* hàm <basic-shape-rect> */
object-view-box: inset(20%);
object-view-box: inset(20% 30%);
object-view-box: inset(10px 0 25px 33px);
object-view-box: xywh(95px 20px 60px 60px);
object-view-box: rect(10px 30px 30px 10px);

/* Giá trị toàn cục */
object-view-box: inherit;
object-view-box: initial;
object-view-box: revert;
object-view-box: revert-layer;
object-view-box: unset;
```

### Giá trị

- `none`
  - : Phần tử không có view box. Đây là giá trị mặc định.

- [`<basic-shape-rect>`](/en-US/docs/Web/CSS/Reference/Values/basic-shape#syntax_for_rectangles_basic-shape-rect)
  - : Hàm {{cssxref("basic-shape/inset","inset()")}}, {{cssxref("basic-shape/xywh","xywh()")}}, hoặc {{cssxref("basic-shape/rect","rect()")}} chỉ định một view box cho phần tử có kích thước tự nhiên (phần tử thay thế). Trong trường hợp khác, giá trị này được giải quyết thành `none`.

## Mô tả

Thuộc tính `object-view-box` có thể được sử dụng để cắt xén hoặc thay đổi kích thước {{glossary("replaced elements", "phần tử thay thế")}}, bao gồm hình ảnh và video. Nó hoạt động bằng cách hiển thị một phần nội dung của phần tử thay thế trong không gian dành cho phần tử đó. Phần của phần tử thay thế được hiển thị được xác định bởi giá trị của thuộc tính. Không gian dành riêng sẵn có được xác định bởi {{glossary("extrinsic size", "kích thước ngoại tại")}} mặc định của phần tử. Phần nội dung được hiển thị có thể được trình bày ở chế độ phóng to, thu nhỏ, hoặc ở kích thước gốc, trong khi vẫn duy trì {{glossary("aspect ratio", "tỉ lệ khung hình")}} nội tại của nội dung.

Giá trị thuộc tính là một `<basic-shape-rect>`, một trong các hàm {{cssxref("basic-shape")}} giới hạn để xác định hình chữ nhật. Ví dụ, giá trị có thể là hàm {{cssxref("basic-shape/xywh","xywh()")}}:

```css
img {
  object-view-box: xywh(410px 0 400px 150px);
}
```

Trong trường hợp này, góc trên bên trái của phần hình ảnh sẽ được hiển thị là `410px` từ cạnh trái và `0` từ phía trên, như được xác định bởi các tham số tọa độ x và y. Kích thước của phần hình ảnh gốc được hiển thị là `400px` rộng và `150px` cao; các thành phần `w` và `h` của hàm. Phần 400x150 của hình ảnh này sẽ được hiển thị trong không gian đã dành cho hình ảnh khi trang được bố cục. Việc phần nội dung hiển thị có kích thước nội tại gốc, phóng to, hay thu nhỏ phụ thuộc vào việc viewbox là 400px x 150px, nhỏ hơn, hay lớn hơn kích thước phần tử hình ảnh, tương ứng.

![Hình ảnh con báo được cắt xén bằng thuộc tính object-view-box, với viewbox 400px x 150px hiển thị một phần không được thu phóng của hình ảnh](https://mdn.github.io/shared-assets/images/diagrams/css/object-view-box/object-view-box_xywh.jpg)

Trong trường hợp này, vì viewbox hình chữ nhật được xác định bởi thuộc tính `object-view-box` và vùng hình chữ nhật của phần tử `<img>` có cùng kích thước, tức là 400 x 150 pixel, phần tử thay thế không được thu phóng.

Giảm các giá trị `w` và `h` để tạo hiệu ứng phóng to; khi phần hình ảnh nhỏ hơn được kéo giãn, nó có hiệu ứng phóng to.

Tăng các giá trị đối số `w` và `h` để tạo hiệu ứng thu nhỏ; khi phần hình ảnh lớn hơn được thu nhỏ, nó có hiệu ứng thu nhỏ.

Hoạt ảnh hóa các tọa độ `x` và `y` tạo hiệu ứng di chuyển bằng cách dịch chuyển viewbox của phần tử trong khi phần tử đó vẫn ở vị trí gốc.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng cơ bản

Ví dụ này minh họa cách sử dụng cơ bản và hiệu ứng của thuộc tính `object-view-box`, với các ví dụ sử dụng ba hàm `<basic-shape-rect>` khác nhau.

#### HTML

Chúng ta có ba phần tử {{htmlelement("img")}} gần như giống hệt nhau được bọc trong các phần tử {{htmlelement("figure")}}; sự khác biệt duy nhất là tên lớp của chúng.

```html
<figure>
  <img
    class="intrinsic"
    src="https://mdn.github.io/shared-assets/images/examples/painted-hand.jpg"
    alt="Original scale section of a painted hand" />
  <figcaption>intrinsic</figcaption>
</figure>
<figure>
  <img
    class="zoom-in"
    src="https://mdn.github.io/shared-assets/images/examples/painted-hand.jpg"
    alt="Zoomed in section of a painted hand" />
  <figcaption>zoomed in</figcaption>
</figure>
<figure>
  <img
    class="zoom-out"
    src="https://mdn.github.io/shared-assets/images/examples/painted-hand.jpg"
    alt="Zoomed out section of a painted hand" />
  <figcaption>zoomed out</figcaption>
</figure>
```

#### CSS

Chúng ta tạo kiểu cho tất cả các hình ảnh có cùng chiều rộng và chiều cao, sau đó đặt từng lớp, và do đó từng hình ảnh, có giá trị `object-view-box` khác nhau. Kích thước nội tại của hình ảnh bàn tay được vẽ là `298px` x `332px`. Chúng ta đặt {{cssxref("height")}} và {{cssxref("width")}}, thiết lập kích thước ngoại tại thành `200px` x `200px`.

```css
img {
  width: 200px;
  height: 200px;
  border: 1px solid red;
}
```

Chúng ta đặt ba giá trị thuộc tính `object-view-box` khác nhau bằng cách sử dụng ba hàm hình dạng khác nhau. Giá trị hàm {{cssxref("basic-shape/xywh","xywh()")}} của phần tử `intrinsic` hiển thị một phần vuông `200px` của nội dung hình ảnh, bắt đầu từ `70px` từ bên trái và `90px` từ phía trên. Hàm {{cssxref("basic-shape/rect","rect()")}} của phần tử `zoom-in` hiển thị một phần vuông `160px` của phần tử gốc, từ `110px` đến `270px` từ cạnh trên và `90px` đến `250px` từ cạnh trái. Hàm {{cssxref("basic-shape/inset","inset()")}} của phần tử thay thế `zoom-out` hiển thị một phần vuông `298px` của phần tử gốc; hiển thị toàn bộ chiều rộng của hình ảnh trong khi cắt bỏ 17px từ trên và dưới.

```css
.intrinsic {
  object-view-box: xywh(70px 90px 200px 200px);
}

.zoom-in {
  object-view-box: rect(110px 250px 270px 90px);
}

.zoom-out {
  object-view-box: inset(17px 0 17px 0);
}
```

```css hidden
@supports not (object-view-box: none) {
  body::before {
    content: "Your browser does not support the 'object-view-box' property.";
    color: black;
    background-color: #ffcd33;
    display: block;
    width: 100%;
    text-align: center;
  }
}

figure {
  display: inline-block;
  margin: 0;
}

figcaption {
  text-align: center;
}
```

#### Kết quả

{{ EmbedLiveSample("Basic usage", "", "300") }}

Phiên bản `intrinsic` hiển thị một phần không được thu phóng của hình ảnh. Phiên bản `zoom-in` hiển thị một phần nhỏ hơn (`160px` vuông) của hình ảnh, được phóng to để vừa với viewbox `200px` vuông. Vì phần này được kéo giãn, nó trông như được phóng to. Phiên bản `zoom-out` hiển thị một phần lớn hơn (`298px` vuông) của hình ảnh, được thu nhỏ để vừa với viewbox `200px` vuông. Vì phần này được thu nhỏ, nó trông như được thu nhỏ.

### Phóng to trực tiếp bằng thuộc tính object-view-box

Ví dụ này minh họa việc sử dụng thuộc tính `object-view-box` để phóng to và thu nhỏ một phần của phần tử thay thế, trong một phần tử HTML có kích thước tĩnh. Trong trường hợp này, mắt của con báo, trong một hình ảnh rất lớn, đóng vai trò là điểm tiêu điểm của hiệu ứng phóng to.

#### HTML

Chúng ta bao gồm một phần tử {{htmlelement("img")}} và một phần tử {{htmlelement("input")}} [`range`](/en-US/docs/Web/HTML/Reference/Elements/input/range), với {{htmlelement("label")}} liên kết. Kích thước tự nhiên, hay kích thước nội tại, của hình ảnh con báo gốc là `1244px` rộng x `416px` cao, với {{glossary("aspect ratio", "tỉ lệ khung hình")}} là `3:1`.

```html
<img
  src="https://mdn.github.io/shared-assets/images/examples/leopard.jpg"
  alt="leopard" />
<p>
  <label for="box-size">Zoom-in: </label>
  <input type="range" id="box-size" min="115" max="380" value="150" />
</p>
<output></output>
```

#### CSS

Chúng ta định nghĩa một thuộc tính tùy chỉnh `--box-size`, được sử dụng làm chiều cao và chiều rộng trong hàm {{cssxref("basic-shape/xywh", "xywh()")}}, tạo một viewbox vuông với tỉ lệ khung hình `1:1`. Điểm offset của view box, là điểm tiêu điểm trong hiệu ứng phóng to của chúng ta, được đặt ở `500px` cho tọa độ `x` và `30px` cho tọa độ `y`, tương ứng với góc trên bên trái của mắt phải của con báo.

```css hidden
input {
  width: 350px;
}

output {
  text-align: center;
  background-color: #dedede;
  font-family: monospace;
  padding: 5px;
  display: block;
}

@supports not (object-view-box: none) {
  body::before {
    content: "Your browser does not support the 'object-view-box' property.";
    color: black;
    background-color: #ffcd33;
    display: block;
    width: 100%;
    text-align: center;
  }
}
```

```css
img {
  width: 350px;
  height: 350px;
  border: 2px solid red;

  --box-size: 150px;
  object-view-box: xywh(500px 30px var(--box-size) var(--box-size));
}
```

#### JavaScript

Chúng ta thêm một event listener vào thanh trượt để cập nhật giá trị của thuộc tính tùy chỉnh `--boxSize` khi người dùng tương tác với nó. Để tăng hiệu ứng phóng to khi thanh trượt được di chuyển sang phải, giá trị của thanh trượt được đảo ngược bằng cách trừ nó từ `500px`, vì giảm kích thước view box làm tăng hiệu ứng phóng to.

```js
const img = document.querySelector("img");
const zoom = document.getElementById("box-size");
const output = document.querySelector("output");

function update() {
  const size = 500 - zoom.value;
  img.style.setProperty("--box-size", `${size}px`);
  output.innerText = `object-view-box: xywh(500px 30px ${size}px ${size}px);`;
}

zoom.addEventListener("input", update);
update();
```

#### Kết quả

{{ EmbedLiveSample("Live zoom in using object-view-box property", "", 480) }}

Di chuyển thanh trượt sang phải để tăng hiệu ứng phóng to và sang trái để giảm. Thanh trượt chỉ ảnh hưởng đến kích thước của view box, trong khi các giá trị x và y, điểm gốc của viewbox, vẫn không đổi. Kích thước của phần tử `<img>` cũng không thay đổi.

### Di chuyển bằng thuộc tính object-view-box

Ví dụ này minh họa việc di chuyển hình ảnh bằng cách tạo hoạt ảnh cho giá trị thuộc tính `object-view-box`.

#### HTML

HTML bao gồm một hình ảnh đơn.

```html
<img
  src="https://mdn.github.io/shared-assets/images/examples/leopard.jpg"
  alt="leopard" />
```

#### CSS

Chúng ta xác định kích thước hình ảnh và giữ kích thước viewbox, các thành phần `w` và `h` của hàm `xywh()`, không đổi, trong khi chúng ta tạo hoạt ảnh cho các vị trí trên và trái, thay đổi vị trí của các tham số `x` và `y` trong năm giây.

```css
img {
  width: 350px;
  height: 350px;

  object-view-box: xywh(0 30px 400px 400px);

  animation: panning 5s linear infinite alternate;
}

@keyframes panning {
  from {
    object-view-box: xywh(0 -50px 400px 400px);
  }
  to {
    object-view-box: xywh(800px 68px 400px 400px);
  }
}
```

```css hidden
@supports not (object-view-box: none) {
  body::before {
    content: "Your browser does not support the 'object-view-box' property.";
    color: black;
    background-color: #ffcd33;
    display: block;
    width: 100%;
    text-align: center;
  }
}
```

#### Kết quả

{{ EmbedLiveSample("Panning using the object-view-box property", "", 400) }}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng thuộc tính CSS `object-view-box`](/en-US/docs/Web/CSS/Guides/Images/Using_object-view-box)
- {{cssxref("object-fit")}}
- {{cssxref("object-position")}}
- {{cssxref("background-size")}}
- [Hiểu về tỉ lệ khung hình](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
- [Hình ảnh CSS](/en-US/docs/Web/CSS/Guides/Images) module
