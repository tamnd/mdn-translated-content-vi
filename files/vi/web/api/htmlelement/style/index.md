---
title: "HTMLElement: thuộc tính style"
short-title: style
slug: Web/API/HTMLElement/style
page-type: web-api-instance-property
browser-compat: api.HTMLElement.style
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`style`** của giao diện {{domxref("HTMLElement")}} trả về kiểu [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) _nội tuyến_ của một phần tử dưới dạng đối tượng {{domxref("CSSStyleProperties")}} trực tiếp.
Đối tượng này có thể được dùng để lấy và đặt các kiểu nội tuyến của một phần tử.

## Giá trị

Một đối tượng {{domxref("CSSStyleProperties")}} trực tiếp.

> [!NOTE]
> Các phiên bản đặc tả trước trả về {{domxref("CSSStyleDeclaration")}} (mà {{domxref("CSSStyleProperties")}} kế thừa từ đó).
> Xem bảng [tương thích trình duyệt](#browser_compatibility) để biết thông tin hỗ trợ của trình duyệt.

Mặc dù bản thân thuộc tính `style` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `CSSStyleProperties`, bạn vẫn có thể gán trực tiếp cho thuộc tính `style`, tương đương với việc gán cho thuộc tính {{domxref("CSSStyleDeclaration/cssText", "cssText")}} của nó. Bạn cũng có thể sửa đổi đối tượng `CSSStyleProperties` bằng các phương thức {{domxref("CSSStyleDeclaration/setProperty", "setProperty()")}} và {{domxref("CSSStyleDeclaration/removeProperty", "removeProperty()")}}.

## Mô tả

Các giá trị của các kiểu nội tuyến được đặt trong thuộc tính [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style) của phần tử được phản ánh bởi các thuộc tính tương ứng của đối tượng {{domxref("CSSStyleProperties")}} được trả về.

> [!NOTE]
> {{domxref("CSSStyleProperties")}} có cả thuộc tính đặt tên theo dấu gạch ngang và thuộc tính {{Glossary("camel_case", "camelCase")}} tương ứng cho **tất cả** [thuộc tính CSS](/en-US/docs/Web/CSS/Reference/Properties) được trình duyệt hỗ trợ (không chỉ những thuộc tính có kiểu nội tuyến). Các thuộc tính không có kiểu nội tuyến tương ứng được đặt thành `""`.

Các thuộc tính CSS viết tắt của phần tử được mở rộng thành các thuộc tính dạng dài tương ứng.
Ví dụ: phần tử có kiểu `"border-top: 1px solid black"` sẽ được đại diện trong đối tượng trả về bởi các thuộc tính có tên {{cssxref("border-top")}} và `borderTop`, và các thuộc tính dạng dài tương ứng {{cssxref("border-top-color")}} và `borderTopColor`, {{cssxref("border-top-style")}} và `borderTopStyle`, và {{cssxref("border-top-width")}} và `borderTopWidth`.

Để thêm các kiểu cụ thể vào một phần tử mà không thay đổi các giá trị kiểu khác, thường nên đặt các thuộc tính riêng lẻ trên đối tượng {{domxref("CSSStyleProperties")}}.
Ví dụ: bạn có thể viết `element.style.backgroundColor = "red"`.
Khai báo kiểu được đặt lại bằng cách đặt nó thành `null` hoặc chuỗi rỗng, ví dụ: `element.style.color = null`.

Thuộc tính `style` có cùng mức độ ưu tiên trong tầng CSS như khai báo kiểu nội tuyến được đặt qua thuộc tính `style`.

## Ví dụ

### Sử dụng cơ bản

Ví dụ mã này cho thấy cách bạn có thể đọc các kiểu nội tuyến của một phần tử.
Trong mỗi trường hợp, nó đọc các thuộc tính kiểu đặt tên theo dấu gạch ngang bằng {{DOMxRef("CSSStyleDeclaration/getPropertyPriority", "getPropertyValue()")}} và lấy các thuộc tính camelCase bằng toán tử dấu chấm.

#### HTML

Đầu tiên, chúng ta xác định một phần tử {{htmlelement("div")}} và phần tử lồng nhau định nghĩa các kiểu nội tuyến khác nhau, dùng cả dạng viết tắt và dạng dài.

```html
<div style="font-weight: bold;">
  <div style="border-top: 1px solid blue; color: red;" id="elt">
    An example div
  </div>
  <pre id="log"></pre>
</div>
```

```css hidden
#log {
  height: 200px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

Đoạn mã sau lấy phần tử bên trong, đọc kiểu của nó và ghi nhật ký các thuộc tính kiểu CSS đặt tên theo dấu gạch ngang và camelCase.

```js
const element = document.getElementById("elt");
const elementStyle = element.style;

// Longhand styles
log(`"border-top" = '${elementStyle.getPropertyValue("border-top")}'`);
log(`"borderTop" = '${elementStyle.borderTop}'`);

// Expanded longhand styles
log(
  `"border-top-width" = '${elementStyle.getPropertyValue("border-top-width")}'`,
);
log(`"borderTopWidth" = '${elementStyle.borderTopWidth}'`);

log(
  `"border-top-style" = '${elementStyle.getPropertyValue("border-top-style")}'`,
);
log(`"borderTopStyle" = '${elementStyle.borderTopStyle}'`);

log(
  `"border-top-color" = '${elementStyle.getPropertyValue("border-top-color")}'`,
);
log(`"borderTopColor" = '${elementStyle.borderTopColor}'`);

// Original shorthand style
log(`"color" = '${elementStyle.getPropertyValue("color")}'`);
log(`"color" = '${elementStyle.color}'`);

// Defined on parent
log(`"font-weight" = '${elementStyle.getPropertyValue("font-weight")}'`);
log(`"fontWeight" = '${elementStyle.fontWeight}'`);
```

#### Kết quả

Kết quả được hiển thị bên dưới.
Trong mỗi trường hợp, chúng ta thấy rằng các kiểu được đọc bằng các thuộc tính đặt tên theo dấu gạch ngang và camelCase là giống nhau.
Chúng ta cũng thấy rằng thuộc tính {{cssxref("border-top")}} tương ứng với thuộc tính `style` của phần tử có mặt, và thuộc tính dạng dài được xác định cho mỗi phần của nó ({{cssxref("border-top-color")}}, {{cssxref("border-top-style")}} và {{cssxref("border-top-width")}}).

{{EmbedLiveSample("Basic usage", "100", "280")}}

Lưu ý rằng `font-weight` được xác định trên `CSSStyleProperties` (cũng như tất cả các thuộc tính CSS khác, mặc dù chúng ta chưa ghi nhật ký chúng).
Tuy nhiên, nó không phải là kiểu nội tuyến cho phần tử lồng nhau, vì vậy giá trị của nó được đặt thành chuỗi rỗng (`""`).

### Liệt kê thông tin kiểu

Ví dụ này mô tả cách chúng ta có thể liệt kê các thuộc tính đặt tên theo dấu gạch ngang của {{domxref("CSSStyleProperties")}}.

#### HTML

Đầu tiên, chúng ta xác định một phần tử {{htmlelement("div")}} và phần tử lồng nhau định nghĩa các kiểu nội tuyến khác nhau, dùng cả dạng viết tắt và dạng dài.
Đây là cùng HTML với ví dụ trước.

```html
<div style="font-weight: bold;">
  <div style="border-top: 1px solid blue; color: red;" id="elt">
    An example div
  </div>
  <pre id="log"></pre>
</div>
```

```css hidden
#log {
  height: 100px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

Đoạn mã sau lặp qua các thuộc tính có thể liệt kê của `CSSStyleProperties` và ghi nhật ký kết quả.

```js
const element = document.getElementById("elt");
const elementStyle = element.style;

// Loop through all the element's styles using `for...in`
for (const prop in elementStyle) {
  // Check the property belongs to the CSSStyleProperties instance
  // Ensure the property is a numeric index (indicating a dash-named/inline style)
  if (
    Object.hasOwn(elementStyle, prop) &&
    !Number.isNaN(Number.parseInt(prop, 10))
  ) {
    log(
      `${
        elementStyle[prop]
      } = '${elementStyle.getPropertyValue(elementStyle[prop])}`,
    );
  }
}
```

#### Kết quả

Kết quả được hiển thị bên dưới.
Lưu ý rằng chỉ các thuộc tính CSS dạng dài của phần tử được liệt kê (thuộc tính viết tắt nội tuyến không được liệt kê).

{{EmbedLiveSample("Enumerating style information", "100", "180")}}

### Cập nhật kiểu viền

```html
<div id="box"></div>

<form name="FormName">
  <button id="btn1">Make border 20px-wide</button>
  <button id="btn2">Make border 5px-wide</button>
</form>
```

```css
#box {
  border: 5px solid green;
  width: 100px;
  height: 100px;
}
```

```js
function setBorderWidth(width) {
  document.getElementById("box").style.borderWidth = `${width}px`;
}

document.getElementById("btn1").addEventListener("click", () => {
  setBorderWidth(20);
});
document.getElementById("btn2").addEventListener("click", () => {
  setBorderWidth(5);
});
```

{{EmbedLiveSample("Updating border style", "", "200")}}

### Thao tác kiểu

Trong ví dụ này, một số thuộc tính kiểu cơ bản của phần tử đoạn văn HTML được truy cập bằng đối tượng kiểu trên phần tử và các thuộc tính kiểu CSS của đối tượng đó, có thể được lấy và đặt từ DOM. Trong trường hợp này, bạn đang thao tác trực tiếp với các kiểu riêng lẻ. Bạn cũng có thể dùng {{domxref("document.styleSheets", "styleSheets")}} và các quy tắc của chúng để thay đổi kiểu cho toàn bộ tài liệu.

```html
<p id="pid">Some text</p>
<form>
  <p><button type="button">Change text</button></p>
</form>
```

```js
function changeText() {
  const p = document.getElementById("pid");

  p.style.color = "blue";
  p.style.fontSize = "18pt";
}

document.querySelector("button").addEventListener("click", () => {
  changeText();
});
```

{{EmbedLiveSample("Manipulating styles", "", "200")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng thông tin kiểu động](/en-US/docs/Web/API/CSS_Object_Model/Using_dynamic_styling_information)
- {{domxref("SVGElement.style")}}
- {{domxref("MathMLElement.style")}}
- {{domxref("HTMLElement.attributeStyleMap")}}
- Thuộc tính HTML [`style`](/en-US/docs/Web/HTML/Reference/Global_attributes/style)
