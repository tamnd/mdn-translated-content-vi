---
title: <blend-mode>
slug: Web/CSS/Reference/Values/blend-mode
page-type: css-type
browser-compat: css.types.blend-mode
sidebar: cssref
---

Kiểu dữ liệu **`<blend-mode>`** trong [CSS](/vi/docs/Web/CSS) mô tả cách màu sắc sẽ hiển thị khi các phần tử chồng lên nhau. Nó được sử dụng trong các thuộc tính {{cssxref("background-blend-mode")}} và {{cssxref("mix-blend-mode")}}.

## Cú pháp

Kiểu dữ liệu `<blend-mode>` được định nghĩa bằng một giá trị từ khóa được chọn từ danh sách bên dưới.

### Giá trị

- `normal`
  - : Màu cuối cùng là màu trên cùng, bất kể màu phía dưới là gì.
    Hiệu ứng giống như hai tờ giấy mờ chồng lên nhau.
- `multiply`
  - : Màu cuối cùng là kết quả của việc nhân màu trên và màu dưới.
    Một lớp màu đen dẫn đến lớp cuối cùng màu đen, và một lớp màu trắng không tạo ra thay đổi.
    Hiệu ứng giống như hai hình ảnh được in trên phim trong suốt chồng lên nhau.
- `screen`
  - : Màu cuối cùng là kết quả của việc đảo ngược màu sắc, nhân chúng lại, và đảo ngược giá trị đó.
    Một lớp màu đen không tạo ra thay đổi, và một lớp màu trắng dẫn đến lớp cuối cùng màu trắng.
    Hiệu ứng giống như hai hình ảnh chiếu lên màn chiếu.
- `overlay`
  - : Màu cuối cùng là kết quả của `multiply` nếu màu dưới tối hơn, hoặc `screen` nếu màu dưới sáng hơn.
    Chế độ pha trộn này tương đương với `hard-light` nhưng với các lớp được hoán đổi.
- `darken`
  - : Màu cuối cùng được tạo thành từ các giá trị tối nhất của mỗi kênh màu.
- `lighten`
  - : Màu cuối cùng được tạo thành từ các giá trị sáng nhất của mỗi kênh màu.
- `color-dodge`
  - : Màu cuối cùng là kết quả của việc chia màu dưới cho nghịch đảo của màu trên.
    Màu nền trước màu đen không tạo ra thay đổi. Màu nền trước với màu nghịch đảo của nền dẫn đến màu được chiếu sáng hoàn toàn.
    Chế độ pha trộn này tương tự `screen`, nhưng nền trước chỉ cần sáng bằng màu nghịch đảo của nền để tạo ra màu được chiếu sáng hoàn toàn.
- `color-burn`
  - : Màu cuối cùng là kết quả của việc đảo ngược màu dưới, chia giá trị cho màu trên, và đảo ngược giá trị đó.
    Màu nền trước trắng không tạo ra thay đổi. Màu nền trước với màu nghịch đảo của nền dẫn đến hình ảnh cuối cùng màu đen.
    Chế độ pha trộn này tương tự `multiply`, nhưng nền trước chỉ cần tối bằng màu nghịch đảo của nền để làm cho hình ảnh cuối cùng thành màu đen.
- `hard-light`
  - : Màu cuối cùng là kết quả của `multiply` nếu màu trên tối hơn, hoặc `screen` nếu màu trên sáng hơn.
    Chế độ pha trộn này tương đương với `overlay` nhưng với các lớp được hoán đổi.
    Hiệu ứng tương tự như chiếu một đèn spotlight _cứng_ lên nền.
- `soft-light`
  - : Màu cuối cùng tương tự `hard-light`, nhưng mềm mại hơn.
    Chế độ pha trộn này hoạt động tương tự `hard-light`.
    Hiệu ứng tương tự như chiếu một đèn spotlight _khuếch tán_ lên nền.
- `difference`
  - : Màu cuối cùng là kết quả của việc trừ màu tối hơn trong hai màu khỏi màu sáng hơn.
    Một lớp màu đen không có hiệu ứng gì, trong khi lớp màu trắng đảo ngược màu của lớp kia.
- `exclusion`
  - : Màu cuối cùng tương tự `difference`, nhưng với độ tương phản ít hơn.
    Như với `difference`, một lớp màu đen không có hiệu ứng gì, trong khi lớp màu trắng đảo ngược màu của lớp kia.
- `hue`
  - : Màu cuối cùng có _sắc độ_ của màu trên, trong khi sử dụng _độ bão hòa_ và _độ sáng_ của màu dưới.
- `saturation`
  - : Màu cuối cùng có _độ bão hòa_ của màu trên, trong khi sử dụng _sắc độ_ và _độ sáng_ của màu dưới.
    Một nền xám thuần túy, không có độ bão hòa, sẽ không có hiệu ứng gì.
- `color`
  - : Màu cuối cùng có _sắc độ_ và _độ bão hòa_ của màu trên, trong khi sử dụng _độ sáng_ của màu dưới.
    Hiệu ứng bảo toàn các mức độ xám và có thể được dùng để tô màu cho nền trước.
- `luminosity`
  - : Màu cuối cùng có _độ sáng_ của màu trên, trong khi sử dụng _sắc độ_ và _độ bão hòa_ của màu dưới.
    Chế độ pha trộn này tương đương với `color`, nhưng với các lớp được hoán đổi.

## Mô tả

Đối với mỗi pixel trong các lớp mà nó được áp dụng, chế độ pha trộn lấy màu sắc của nền trước và nền sau, thực hiện tính toán trên chúng, và trả về một giá trị màu mới.

Các thay đổi giữa các chế độ pha trộn không được nội suy. Bất kỳ thay đổi nào đều xảy ra ngay lập tức.

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

### Ví dụ sử dụng "normal"

```html hidden
<div id="div"></div>
```

```css
#div {
  width: 150px;
  height: 150px;
  background: url("br.png"), url("tr.png");
  background-blend-mode: normal;
}
```

Đặt các giá trị khác cho `background-blend-mode`, bạn sẽ nhận được các kết quả khác nhau.

{{ EmbedLiveSample('Example using "normal"', "100%", "300") }}

### So sánh giữa các giá trị khác nhau với `background-blend-mode`

```html hidden
<div class="container"></div>
```

```css
.container {
  width: 720px;
  height: 760px;
  display: grid;
  grid: auto-flow 190px / repeat(4, 180px);
  border-top: 1px solid #d8d8d8;
  border-left: 1px solid #d8d8d8;
}

.container > div {
  border-right: 1px solid #d8d8d8;
  border-bottom: 1px solid #d8d8d8;
}

.container div div {
  margin-left: 15px;
  width: 150px;
  height: 150px;
  background: url("br.png"), url("tr.png");
}

.container div p {
  line-height: 30px;
  margin: 0;
  color: #a33333;
  text-align: center;
}
```

```js
const list = [
  "normal",
  "multiply",
  "screen",
  "overlay",
  "darken",
  "lighten",
  "color-dodge",
  "color-burn",
  "hard-light",
  "soft-light",
  "difference",
  "exclusion",
  "hue",
  "saturation",
  "color",
  "luminosity",
];

const containerElem = document.querySelector(".container");

list.forEach((item) => {
  const innerElem = document.createElement("div");
  innerElem.style.backgroundBlendMode = item;

  const textElem = document.createElement("p");
  textElem.innerText = item;

  const outerElem = document.createElement("div");
  outerElem.appendChild(textElem);
  outerElem.appendChild(innerElem);

  containerElem.appendChild(outerElem);
});
```

Tạo nhiều phần tử `div` bằng cách duyệt qua danh sách và đặt các giá trị `backgroundBlendMode` khác nhau cho mỗi phần tử.

{{ EmbedLiveSample('Comparison between different values with `background-blend-mode`', "100%", "780") }}

### So sánh giữa các giá trị khác nhau với `mix-blend-mode`

```html hidden
<div class="container"></div>
```

```css hidden
.container {
  width: 640px;
  height: 800px;
  display: grid;
  grid: auto-flow 160px / repeat(4, 160px);
  border-top: 1px solid #d8d8d8;
  border-left: 1px solid #d8d8d8;
}

.container > div {
  border-right: 1px solid #d8d8d8;
  border-bottom: 1px solid #d8d8d8;
}

.container > div > div {
  position: relative;
  margin-left: 20px;
  width: 120px;
  height: 120px;
}

.container div p {
  margin: 0;
  line-height: 30px;
  color: #a33333;
  text-align: center;
}
.circle {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  mix-blend-mode: screen;
  position: absolute;
}

.circle-1 {
  background: red;
}

.circle-2 {
  background: lightgreen;
  left: 40px;
}

.circle-3 {
  background: blue;
  left: 20px;
  top: 40px;
}

.isolate {
  isolation: isolate; /* Without isolation, the background color will be taken into account */
  position: relative;
}
```

```js hidden
const list = [
  "normal",
  "multiply",
  "screen",
  "overlay",
  "darken",
  "lighten",
  "color-dodge",
  "color-burn",
  "hard-light",
  "soft-light",
  "difference",
  "exclusion",
  "hue",
  "saturation",
  "color",
  "luminosity",
  "plus-darker",
  "plus-lighter",
];

const containerElem = document.querySelector(".container");

list.forEach((item) => {
  const innerElem = document.createElement("div");
  innerElem.innerHTML = `
    <div class="circle circle-1"></div>
    <div class="circle circle-2"></div>
    <div class="circle circle-3"></div>
  `;

  innerElem.querySelectorAll(".circle").forEach((circle) => {
    circle.style.mixBlendMode = item;
  });

  const textElem = document.createElement("p");
  textElem.innerText = item;

  const outerElem = document.createElement("div");
  outerElem.appendChild(textElem);
  outerElem.appendChild(innerElem);

  containerElem.appendChild(outerElem);
});
```

Trong ví dụ sau, chúng ta tạo nhiều phần tử `<div>` bằng cách duyệt qua danh sách và đặt các giá trị `mixBlendMode` khác nhau cho mỗi phần tử.

{{ EmbedLiveSample('Comparison between different values with `mix-blend-mode`', "100%", "820") }}

### So sánh chế độ pha trộn

Trong ví dụ sau, chúng ta có một `<div>` với hai hình ảnh nền được đặt trên nó — logo Firefox trên một dải chuyển màu tuyến tính. Bên dưới, chúng ta cung cấp một menu `<select>` cho phép bạn thay đổi `background-blend-mode` được áp dụng cho `<div>`, giúp bạn so sánh các hiệu ứng chế độ pha trộn khác nhau.

#### HTML

```html
<div></div>
<p>Choose a blend-mode:</p>
<select>
  <option selected>normal</option>
  <option>multiply</option>
  <option>screen</option>
  <option>overlay</option>
  <option>darken</option>
  <option>lighten</option>
  <option>color-dodge</option>
  <option>color-burn</option>
  <option>hard-light</option>
  <option>soft-light</option>
  <option>difference</option>
  <option>exclusion</option>
  <option>hue</option>
  <option>saturation</option>
  <option>color</option>
  <option>luminosity</option>
</select>
```

#### CSS

```css
div {
  width: 300px;
  height: 300px;
  background:
    url("https://mdn.dev/archives/media/attachments/2020/07/29/17350/3b4892b7e820122ac6dd7678891d4507/firefox.png")
      no-repeat center,
    linear-gradient(to bottom, blue, orange);
}
```

#### JavaScript

```js
const selectElem = document.querySelector("select");
const divElem = document.querySelector("div");

selectElem.addEventListener("change", () => {
  divElem.style.backgroundBlendMode = selectElem.value;
});
```

#### Kết quả

{{EmbedLiveSample('Blend_mode_comparison', '100%', 400)}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Module [CSS compositing and blending](/vi/docs/Web/CSS/Guides/Compositing_and_blending) định nghĩa các giá trị `<blend-mode>`.
- Các thuộc tính sử dụng kiểu dữ liệu này: {{cssxref("background-blend-mode")}}, {{cssxref("mix-blend-mode")}}

Mô tả về các chế độ pha trộn trên các trang web khác:

- [Blend modes](https://en.wikipedia.org/wiki/Blend_modes) trên Wikipedia
- [Blending modes in Adobe Photoshop](https://helpx.adobe.com/photoshop/desktop/repair-retouch/adjust-light-tone/blending-mode-descriptions.html) by Adobe
