---
title: "CSSStyleDeclaration: phương thức setProperty()"
short-title: setProperty()
slug: Web/API/CSSStyleDeclaration/setProperty
page-type: web-api-instance-method
browser-compat: api.CSSStyleDeclaration.setProperty
---

{{ APIRef("CSSOM") }}

Phương thức giao diện **`CSSStyleDeclaration.setProperty()`** thiết lập một giá trị mới cho một thuộc tính trên một đối tượng khai báo kiểu CSS.

## Cú pháp

```js-nolint
setProperty(propertyName, value)
setProperty(propertyName, value, priority)
```

### Tham số

- `propertyName`
  - : Một chuỗi đại diện cho tên thuộc tính CSS (dạng hyphen case) cần sửa đổi.
- `value` {{optional_inline}}
  - : Một chuỗi chứa giá trị thuộc tính mới. Nếu không được chỉ định, được xem như chuỗi rỗng. Giá trị [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) được xem tương đương với chuỗi rỗng (`""`).
    > [!NOTE]
    > `value` không được chứa `"!important"`, tham số đó nên được thiết lập bằng tham số `priority`.
- `priority` {{optional_inline}}
  - : Một chuỗi cho phép thiết lập độ ưu tiên CSS thành important. Chỉ chấp nhận các giá trị sau:
    - `"important"` (không phân biệt hoa thường) để thiết lập thuộc tính là `!important`;
    - `""`, `undefined`, hoặc `null` để xóa cờ `!important` nếu có.

    Bất kỳ giá trị nào khác khiến phương thức trả về sớm và không có thay đổi nào xảy ra (trừ khi `value` rỗng, trong trường hợp đó thuộc tính bị xóa bất kể giá trị `priority`). Ví dụ, `false` không phải là giá trị priority hợp lệ.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NoModificationAllowedError` {{domxref('DOMException')}}
  - : Được ném nếu thuộc tính hoặc khối khai báo là chỉ đọc.

## Cách sử dụng thay thế

Nếu có thể bỏ qua `priority`, JavaScript có cú pháp đơn giản hơn để thiết lập một thuộc tính CSS trên một đối tượng khai báo kiểu:

```js
style.cssPropertyName = "value";
```

## Ví dụ

### Thiết lập các thuộc tính box

Trong ví dụ này, chúng ta có ba nút, có thể được nhấn để thay đổi động đường viền, màu nền và màu văn bản của đoạn box thành các giá trị ngẫu nhiên (xem ví dụ trực tiếp ở cuối phần này).

Cơ sở hạ tầng [mẫu trực tiếp](/en-US/docs/MDN/Writing_guidelines/Page_structures/Live_samples) của MDN kết hợp tất cả các khối CSS trong ví dụ thành một kiểu nội tuyến duy nhất có id `css-output`, vì vậy trước tiên chúng ta sử dụng {{domxref("document.getElementById()")}} để tìm bảng kiểu đó.

Sau đó, chúng ta lặp qua các quy tắc khác nhau chứa trong bảng kiểu trong mảng tìm thấy tại [`stylesheet.cssRules`](/en-US/docs/Web/API/CSSStyleSheet/cssRules).
Đối với mỗi quy tắc, chúng ta kiểm tra xem [`CSSStyleRule.selectorText`](/en-US/docs/Web/API/CSSStyleRule/selectorText) có bằng bộ chọn `.box p` hay không, đây là bộ chọn chúng ta muốn.

Nếu có, chúng ta lưu tham chiếu đến đối tượng `CSSStyleRule` này trong một biến.
Sau đó, chúng ta sử dụng ba hàm để tạo các giá trị ngẫu nhiên cho các thuộc tính liên quan và cập nhật quy tắc với các giá trị này.
Trong mỗi trường hợp, điều này được thực hiện bằng phương thức `setProperty()`, ví dụ: `boxParaRule.style.setProperty('border', newBorder);`.

### HTML

```html
<div class="controls">
  <button class="border">Border</button>
  <button class="bgcolor">Background</button>
  <button class="color">Text</button>
</div>
<div class="box">
  <p>Box</p>
</div>
```

### CSS

```css
html {
  background: orange;
  font-family: sans-serif;
  height: 100%;
}

body {
  height: inherit;
  width: 80%;
  min-width: 500px;
  max-width: 1000px;
  margin: 0 auto;
}

.controls {
  display: flex;
  justify-content: space-around;
  align-items: center;
}

div button {
  flex: 1;
  margin: 20px;
  height: 30px;
  line-height: 30px;
}

.box {
  display: flex;
  justify-content: center;
  align-items: center;
  height: calc(100% - 70px);
}

.box p {
  width: 50%;
  text-align: center;
  font-weight: bold;
  font-size: 40px;
  height: 150px;
  line-height: 150px;
  background: red;
  border: 5px solid purple;
  color: white;
  transition: all 1s;
}
```

### JavaScript

```js
const borderBtn = document.querySelector(".border");
const bgColorBtn = document.querySelector(".bgcolor");
const colorBtn = document.querySelector(".color");
const box = document.querySelector(".box");

function random(min, max) {
  const num = Math.floor(Math.random() * (max - min)) + min;
  return num;
}

function randomColor() {
  return `rgb(${random(0, 255)} ${random(0, 255)} ${random(0, 255)})`;
}

// Tìm bảng kiểu nội tuyến được tạo cho mẫu trực tiếp MDN
const stylesheet = document.getElementById("css-output").sheet;

const boxParaRule = [...stylesheet.cssRules].find(
  (r) => r.selectorText === ".box p",
);

function setRandomBorder() {
  const newBorder = `${random(1, 50)}px solid ${randomColor()}`;
  boxParaRule.style.setProperty("border", newBorder);
}

function setRandomBgColor() {
  const newBgColor = randomColor();
  boxParaRule.style.setProperty("background-color", newBgColor);
}

function setRandomColor() {
  const newColor = randomColor();
  boxParaRule.style.setProperty("color", newColor);
}

borderBtn.addEventListener("click", setRandomBorder);
bgColorBtn.addEventListener("click", setRandomBgColor);
colorBtn.addEventListener("click", setRandomColor);
```

### Kết quả

{{EmbedLiveSample('Examples', '100%', 400)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
