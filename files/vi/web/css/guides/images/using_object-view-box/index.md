---
title: Using the CSS object-view-box property
short-title: Using object-view-box
slug: Web/CSS/Guides/Images/Using_object-view-box
page-type: guide
sidebar: cssref
---

Thuộc tính {{cssxref("object-view-box")}} có thể được sử dụng để định nghĩa một viewbox trong {{glossary("replaced elements")}}, cho phép hiển thị chỉ một phần của nội dung được thay thế. Phần con của phần tử được hiển thị có thể được trình bày ở dạng phóng to, thu nhỏ hoặc ở kích thước gốc, trong khi vẫn duy trì {{glossary("aspect ratio")}} intrinsic của nội dung. Trong hướng dẫn này, chúng ta xem xét thuộc tính này, so sánh nó với thuộc tính {{cssxref("object-fit")}} tương tự, và khám phá chức năng của nó thông qua việc phóng to, thu nhỏ và di chuyển qua một phần tử.

## Intrinsic size, extrinsic size và `object-fit`

Mỗi replaced element có hai kích thước: một {{glossary("extrinsic size")}} và một {{glossary("intrinsic size")}}.

Extrinsic size là kích thước của phần tử HTML trong đó nội dung được hiển thị dựa trên các mô hình hộp và định dạng trực quan. [Box model](/en-US/docs/Web/CSS/Guides/Box_model/Introduction) và [visual formatting model](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model) xác định kích thước của các phần tử được hiển thị dựa trên nội dung, thuộc tính HTML, CSS áp dụng cho các phần tử và tổ tiên của chúng, và kích thước viewport.

Intrinsic size là kích thước thực tế của nội dung; kích thước của phần tử khi không có style nào được áp dụng và không có bất kỳ ràng buộc bố cục nào. Trong khi intrinsic và extrinsic sizes không nhất thiết phải giống nhau, điều quan trọng nói chung là duy trì {{glossary("aspect ratio")}} intrinsic của một replaced element.

## `object-view-box` so với `object-fit`

CSS có nhiều thuộc tính điều chỉnh kích thước. Khi nói đến việc điều chỉnh kích thước replaced elements, thuộc tính {{cssxref("object-fit")}} cho phép chúng ta kiểm soát, ở một mức độ nào đó, cách các replaced elements được hiển thị trong một hộp được xác định. Ví dụ, trong ảnh chụp màn hình sau, một hình ảnh 1200 x 400 được hiển thị bằng phần tử {{htmlelement("img")}}. Phần tử `<img>` có kích thước 400 x 200. Nội dung hình ảnh được định vị bằng khai báo `object-fit: none;`.

![Hình ảnh minh họa kích thước extrinsic và intrinsic; phần trung tâm 400 x 200 của một hình ảnh lớn hơn nhiều 1200 x 400 được nhìn thấy trong view box 400 x 200 là kích thước của phần tử hiển thị hình ảnh.](https://mdn.github.io/shared-assets/images/diagrams/css/object-view-box/extrinsic-intrinsic_sizes.jpg)
Thuộc tính `object-view-box` linh hoạt hơn thuộc tính `object-fit` và có khả năng làm nhiều thứ hơn. Ví dụ, nó có thể được sử dụng để cắt, phóng to và di chuyển hình ảnh. Thuộc tính đặt vùng có thể xem (viewbox), xác định phần nào của nội dung cần hiển thị và cách khớp nó trong extrinsic size. Giá trị viewbox chứa một hình chữ nhật và vị trí của nó so với vùng intrinsic của nội dung, nhưng _kích thước vật lý của view box vẫn bằng extrinsic size_. Viewbox đánh dấu vùng trong nội dung cần hiển thị, và sau đó vùng nội dung được biến đổi để khớp với kích thước extrinsic phù hợp với phần tử HTML.

Trong hình ảnh sau, chúng ta có cùng bức ảnh báo đốm trong một phần tử hình ảnh 400 x 150. Tuy nhiên, lần này chúng ta đã sử dụng thuộc tính `object-view-box` để cắt phần của bức ảnh hiển thị mắt của báo đốm.

![Hình ảnh báo đốm được cắt bằng thuộc tính object-view-box, với viewbox 400px x 150px hiển thị một phần không bị thu phóng của hình ảnh](https://mdn.github.io/shared-assets/images/diagrams/css/object-view-box/object-view-box_xywh.jpg)

Trong trường hợp này, vì kích thước của phần tử `<img>` và viewbox được xác định bởi thuộc tính `object-view-box` giống nhau, tức là 400 x 150 pixel, tỉ lệ khung hình của cả hai đều giống nhau, và replaced element không bị co giãn hay biến dạng.

Duy trì cùng {{glossary("aspect ratio")}} ngăn chặn sự biến dạng hình ảnh. Với `object-view-box`, chúng ta có thể thực hiện nhiều thao tác hình ảnh khác nhau trong khi có kích thước extrinsic và view box khác nhau, mà không làm biến dạng replaced element khi nó thu phóng lên và xuống.

## Phóng to và thu nhỏ

Giảm kích thước viewbox, vùng của replaced element được hiển thị, tăng hiệu ứng phóng to, vì nội dung nhỏ hơn được kéo dài để phù hợp với kích thước của phần tử HTML. Giảm nó tạo ra hiệu ứng thu nhỏ.

Ví dụ này minh họa việc sử dụng thuộc tính `object-view-box` để phóng to và thu nhỏ một phần của replaced element, trong một phần tử HTML có kích thước cố định. Trong trường hợp này, mắt của con báo đốm, trong một hình ảnh rất lớn, đóng vai trò là điểm tiêu điểm của hiệu ứng phóng to.

### HTML

Chúng ta bao gồm một phần tử {{htmlelement("img")}} và một phần tử {{htmlelement("input")}} [`range`](/en-US/docs/Web/HTML/Reference/Elements/input/range), với một {{htmlelement("label")}} liên kết. Kích thước tự nhiên, hay intrinsic size, của hình ảnh báo đốm gốc là `1244px` rộng x `416px` cao, với {{glossary("aspect ratio")}} là `3:1`.

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

### CSS

Chúng ta định nghĩa một custom property `--box-size`, được sử dụng làm chiều cao và chiều rộng trong hàm {{cssxref("basic-shape/xywh", "xywh()")}}, tạo ra một viewbox hình vuông với tỉ lệ khung hình `1:1`. Điểm offset của view box, điểm tiêu điểm trong hiệu ứng phóng to của chúng ta, được đặt ở `500px` cho tọa độ `x` và `30px` cho tọa độ `y`, tương ứng với góc trên bên trái của mắt phải của con báo đốm.

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

### JavaScript

Chúng ta thêm một event listener vào slider để cập nhật giá trị của custom property `--box-size` khi người dùng tương tác với nó. Để tăng hiệu ứng phóng to khi slider được kéo sang phải, giá trị của slider được đảo ngược bằng cách trừ nó từ `500px`, vì việc giảm kích thước view box tăng hiệu ứng phóng to.

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

### Kết quả

{{ EmbedLiveSample("Zooming in and out", "", 480) }}

Di chuyển slider sang phải để tăng hiệu ứng phóng to và sang trái để giảm nó. Slider chỉ ảnh hưởng đến kích thước của view box, trong khi các giá trị x và y, điểm gốc của viewbox, vẫn giữ nguyên. Kích thước của phần tử `<img>` cũng vẫn giữ nguyên.

## Di chuyển qua một hình ảnh

Chúng ta có thể tạo hiệu ứng di chuyển (panning) bằng cách thay đổi tọa độ của cửa sổ view box, các thành phần `x` và `y` của hàm `xywh()`, trong khi giữ nguyên kích thước của phần hiển thị. Ví dụ, bằng cách giữ nguyên kích thước view box và chỉ thay đổi vị trí ngang — tham số `x` — chúng ta có thể tạo hiệu ứng di chuyển ngang.

```html hidden
<img
  src="https://mdn.github.io/shared-assets/images/examples/leopard.jpg"
  alt="leopard" />
<p>
  <label for="position">Left offset: </label>
  <input type="range" id="position" min="0" max="900" value="450" />
</p>
<output></output>
```

```css hidden
input {
  width: 350px;
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
output {
  text-align: center;
  background-color: #dedede;
  font-family: monospace;
  padding: 5px;
  display: block;
}

img {
  width: 350px;
  height: 350px;

  --x-position: 0;
  object-view-box: xywh(var(--x-position) 30px 350px 350px);
}
```

```js hidden
const img = document.querySelector("img");
const position = document.getElementById("position");
const output = document.querySelector("output");

function update() {
  img.style.setProperty("--x-position", `${position.value}px`);
  output.innerText = `xywh(${position.value}px 30px 350px 350px);`;
}

position.addEventListener("input", update);
update();
```

{{ EmbedLiveSample("Panning effect", "", 450) }}

Di chuyển slider. Lưu ý cách tăng và giảm giá trị `x` của hàm `xywh()` tạo ra hiệu ứng di chuyển.

## Xem thêm

- {{cssxref("object-view-box")}}
- {{cssxref("object-fit")}}
- {{cssxref("object-position")}}
- {{cssxref("background-size")}}
- [Understanding aspect ratio](/en-US/docs/Web/CSS/Guides/Box_sizing/Aspect_ratios)
