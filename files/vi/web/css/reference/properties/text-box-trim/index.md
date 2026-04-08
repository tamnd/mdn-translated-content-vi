---
title: text-box-trim
slug: Web/CSS/Reference/Properties/text-box-trim
page-type: css-property
browser-compat: css.properties.text-box-trim
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`text-box-trim`** chỉ định cạnh trên và/hoặc cạnh dưới của nội dung văn bản cần cắt khỏi vùng chứa khối của một phần tử văn bản.

Khoảng cách dọc khác nhau giữa các phông chữ, khiến việc sắp chữ nhất quán trên web luôn là thách thức. Thuộc tính `text-box-trim` cùng với thuộc tính đối ứng {{cssxref("text-box-edge")}} (chỉ định lượng khoảng cách cần cắt) giúp đạt được khoảng cách dọc nhất quán của văn bản dễ dàng hơn.

> [!NOTE]
> Thuộc tính viết tắt {{cssxref("text-box")}} có thể dùng để chỉ định các giá trị `text-box-trim` và `text-box-edge` trong một khai báo duy nhất.

## Cú pháp

```css
/* Từ khóa */
text-box-trim: none;
text-box-trim: trim-both;
text-box-trim: trim-start;
text-box-trim: trim-end;

/* Giá trị toàn cục */
text-box-trim: inherit;
text-box-trim: initial;
text-box-trim: revert;
text-box-trim: revert-layer;
text-box-trim: unset;
```

### Giá trị

Giá trị của thuộc tính `text-box-trim` có thể được chỉ định là một trong các từ khóa sau:

- `none`
  - : Giá trị mặc định. Không cắt khoảng cách khỏi văn bản.
- `trim-both`
  - : Cắt cả cạnh bắt đầu (trên) và cạnh kết thúc (dưới).
- `trim-start`
  - : Cắt cạnh bắt đầu (trên).
- `trim-end`
  - : Cắt cạnh kết thúc (dưới).

## Mô tả

Chiều cao của nội dung chỉ có văn bản tương đối so với chiều cao của phông chữ. Trong các tệp phông chữ kỹ thuật số, chiều cao bao gồm tất cả các ký tự, bao gồm chữ in hoa, nét lên, nét xuống, v.v. Các phông chữ khác nhau có chiều cao dòng cơ sở khác nhau, nghĩa là các dòng văn bản có cùng `font-size` sẽ tạo ra các hộp dòng có chiều cao khác nhau, ảnh hưởng đến khoảng cách giữa các dòng.

Thuộc tính `text-box-trim` cho phép cắt cạnh trên và cạnh dưới của vùng chứa khối văn bản, giúp kiểm soát khoảng cách văn bản theo hướng khối dễ dàng hơn.

Lượng khoảng cách thực sự được cắt được chỉ định bằng thuộc tính {{cssxref("text-box-edge")}}. Ví dụ, bạn có thể chọn cắt cạnh trên theo đường chữ in hoa hoặc chữ thường của phông chữ, và cắt cạnh dưới bằng phẳng với đường cơ sở của phông chữ.

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Sử dụng `text-box-trim` cơ bản

Trong ví dụ sau, chúng ta đặt `text-box-edge: cap alphabetic` trên hai đoạn văn, điều này cắt cạnh trên của vùng chứa khối phần tử văn bản đến đỉnh các chữ in hoa và cạnh dưới bằng phẳng với đường cơ sở văn bản.

Sau đó chúng ta đặt giá trị `text-box-trim` là `trim-end` cho đoạn đầu tiên và `trim-both` cho đoạn thứ hai. Kết quả là đoạn đầu tiên chỉ được cắt ở cạnh dưới, trong khi đoạn thứ hai được cắt cả cạnh trên _và_ cạnh dưới.

```html hidden
<p class="one">This is .one</p>

<p class="two">This is .two</p>
```

```css hidden
html {
  font-family: sans-serif;
  height: 100%;
}

body {
  height: inherit;
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 100px;
}

p {
  margin: 0;
  font-size: 6rem;
  font-weight: bold;
}
```

```css
p {
  text-box-edge: cap alphabetic;
  border-top: 5px solid magenta;
  border-bottom: 5px solid magenta;
}

.one {
  text-box-trim: trim-end;
}

.two {
  text-box-trim: trim-both;
}
```

#### Kết quả

Kết quả hiển thị như sau. Lưu ý rằng chúng ta đã thêm đường viền trên và dưới cho mỗi đoạn văn để bạn có thể thấy khoảng cách đã được cắt trong từng trường hợp.

{{EmbedLiveSample("Basic `text-box-edge` usage","100%","360")}}

### So sánh giá trị `text-box-trim` và `text-box-edge` tương tác

Trong ví dụ này, chúng ta cung cấp giao diện người dùng cho phép bạn chọn các giá trị `text-box-trim` và `text-box-edge` áp dụng cho một đoạn văn bản.

#### HTML

Trong HTML của chúng ta, có ba mục chính:

- Ba phần tử {{htmlelement("select")}} cho phép bạn đặt cạnh nào của đoạn văn cần cắt (giá trị `text-box-trim`) và lượng khoảng cách cần cắt từ cạnh block-start và block-end của đoạn văn (giá trị {{cssxref("text-box-edge")}}).
- Một phần tử {{htmlelement("p")}} chứa văn bản, nơi các giá trị `text-box-*` được áp dụng. Đoạn văn này có [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable) được bật để bạn có thể chỉnh sửa văn bản.
- Một phần tử {{htmlelement("output")}} hiển thị các khai báo `text-box-*` đang được áp dụng cho đoạn văn. Phần tử này được cập nhật khi có lựa chọn thay đổi.

Chúng ta cũng nhập một phông chữ từ dịch vụ Google Fonts để áp dụng cho văn bản trong bản demo.

Chúng ta đã ẩn mã HTML chính xác để ngắn gọn.

```html hidden
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
  href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100..900;1,100..900&display=swap"
  rel="stylesheet" />
<section>
  <div>
    <label for="box-trim">Select edge(s) to trim:</label>
    <select id="box-trim">
      <option>none</option>
      <option>trim-start</option>
      <option>trim-end</option>
      <option selected>trim-both</option>
    </select>
  </div>
  <div>
    <label for="trim-over">Select trim over (start) value:</label>
    <select id="trim-over">
      <option>text</option>
      <option selected>cap</option>
      <option>ex</option>
    </select>
  </div>
</section>
<p class="display" contenteditable>Holly Golightly</p>
<section>
  <div>
    <label for="trim-under">Select trim under (end) value:</label>
    <select id="trim-under">
      <option>text</option>
      <option selected>alphabetic</option>
    </select>
  </div>
</section>
<output></output>
```

#### CSS

Trong CSS, chúng ta áp dụng phông chữ đã nhập cho phần tử {{htmlelement("html")}} và bố trí giao diện sử dụng [flexbox](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox). Chúng ta đã ẩn hầu hết mã CSS để ngắn gọn, nhưng dưới đây hiển thị các quy tắc tạo kiểu cho đoạn văn được áp dụng các hiệu ứng `text-box-*` và phần tử `<output>` hiển thị các quy tắc `text-box-*` đang được áp dụng:

```css hidden
html {
  font-family: "Roboto", sans-serif;
  height: 100%;
}

body {
  height: inherit;
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 30px;
}

section {
  display: flex;
  justify-content: space-between;
}

section:nth-of-type(2) {
  justify-content: flex-end;
  padding-bottom: 30px;
}

select {
  width: 6rem;
}
```

```css
p {
  margin: 0;
  font-size: 6rem;
  font-weight: bold;
  border-top: 5px solid magenta;
  border-bottom: 5px solid magenta;
}

output {
  border: 2px solid gray;
  border-radius: 10px;
  padding: 10px;
  margin: 0;
  width: fit-content;
}
```

Lưu ý rằng chúng ta đã thêm đường viền trên và dưới cho đoạn văn `.display`, để bạn có thể thấy khoảng cách được cắt thay đổi khi chọn các giá trị `text-box-*` khác nhau.

#### JavaScript

Trong JavaScript, chúng ta bắt đầu bằng cách lấy tham chiếu đến ba phần tử `<select>` và hai phần tử `<p>`:

```js
const boxTrimSelect = document.getElementById("box-trim");
const trimOverSelect = document.getElementById("trim-over");
const trimUnderSelect = document.getElementById("trim-under");

const displayElem = document.querySelector("p");
const codeElem = document.querySelector("output");
```

Tiếp theo, chúng ta định nghĩa hàm `setEdgeTrim()`. Hàm này áp dụng giá trị {{cssxref("text-box")}} cho đoạn văn dựa trên các giá trị của phần tử `<select>`, và cũng in các khai báo đã áp dụng ra phần tử output (cả dạng longhand và shorthand tương đương):

```js
function setEdgeTrim() {
  const textBoxTrimValue = boxTrimSelect.value;
  const textBoxEdgeValue = `${trimOverSelect.value} ${trimUnderSelect.value}`;
  displayElem.style.textBox = `${textBoxTrimValue} ${textBoxEdgeValue}`;

  codeElem.innerHTML = `
    <span><code>text-box-trim: ${textBoxTrimValue}</code></span>
    <br>
    <span><code>text-box-edge: ${textBoxEdgeValue}</code></span>
    <br><br>
    <span>Shorthand equivalent:</span>
    <br><br>
    <span><code>text-box: ${textBoxTrimValue} ${textBoxEdgeValue}</code></span>
  `;
}
```

Trong phần cuối của JavaScript, chúng ta chạy hàm `setEdgeTrim()` một lần để đặt trạng thái ban đầu cho giao diện. Sau đó chúng ta gắn trình nghe sự kiện [`change`](/en-US/docs/Web/API/HTMLElement/change_event) cho tất cả các phần tử `<select>` (qua [`addEventListener`](/en-US/docs/Web/API/EventTarget/addEventListener)) để `setEdgeTrim()` được chạy mỗi khi một giá trị `<select>` thay đổi nhằm cập nhật giao diện:

```js
setEdgeTrim();

boxTrimSelect.addEventListener("change", setEdgeTrim);
trimOverSelect.addEventListener("change", setEdgeTrim);
trimUnderSelect.addEventListener("change", setEdgeTrim);
```

#### Kết quả

Kết quả hiển thị như sau:

{{EmbedLiveSample("`text-box-trim` value comparison","100%","520")}}

`text-box-trim` ban đầu được đặt là `trim-both`, nghĩa là cả cạnh trên _và_ cạnh dưới của đoạn văn đều được cắt. `text-box-edge` ban đầu được đặt là `cap alphabetic`, nghĩa là văn bản được cắt bằng phẳng với đỉnh chữ in hoa ở cạnh bắt đầu và bằng phẳng với đường cơ sở ở cạnh kết thúc.

Hãy thử thay đổi các giá trị `<select>` để xem tác dụng của chúng đối với văn bản hiển thị.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("text-box")}}, {{cssxref("text-box-edge")}}
- Mô-đun [CSS inline layout](/en-US/docs/Web/CSS/Guides/Inline_layout)
- [CSS text-box-trim](https://developer.chrome.com/blog/css-text-box-trim) trên developer.chrome.com (2025)
