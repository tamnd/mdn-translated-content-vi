---
title: SVGStyleElement
slug: Web/API/SVGStyleElement
page-type: web-api-interface
browser-compat: api.SVGStyleElement
---

{{APIRef("SVG")}}

Giao diện **`SVGStyleElement`** tương ứng với phần tử SVG {{SVGElement("style")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha {{domxref("SVGElement")}}._

- {{domxref("SVGStyleElement.type")}} {{deprecated_inline}}
  - : Một chuỗi tương ứng với thuộc tính {{SVGAttr("type")}} của phần tử đã cho.

- {{domxref("SVGStyleElement.media")}}
  - : Một chuỗi tương ứng với thuộc tính {{SVGAttr("media")}} của phần tử đã cho.

- {{domxref("SVGStyleElement.title")}}
  - : Một chuỗi tương ứng với thuộc tính [`title`](/en-US/docs/Web/SVG/Reference/Element/style#title) của phần tử đã cho.

- {{domxref("SVGStyleElement.sheet")}} {{ReadOnlyInline}}
  - : Trả về đối tượng {{domxref("CSSStyleSheet")}} được liên kết với phần tử đã cho, hoặc `null` nếu không có.

- {{domxref("SVGStyleElement.disabled")}}
  - : Một giá trị boolean cho biết liệu stylesheet được liên kết có bị vô hiệu hóa hay không.

## Phương thức phiên bản

_Giao diện này không triển khai bất kỳ phương thức cụ thể nào, nhưng kế thừa các phương thức từ giao diện cha {{domxref("SVGElement")}}._

## Ví dụ

### Thêm phần tử style SVG một cách linh hoạt

Để tạo một phần tử SVG style (`SVGStyleElement`) một cách linh hoạt, bạn cần sử dụng [`Document.createElementNS()`](/en-US/docs/Web/API/Document/createElementNS), chỉ định một phần tử `style` trong không gian tên SVG.

> [!NOTE]
> [`Document.createElement()`](/en-US/docs/Web/API/Document/createElement) không thể được sử dụng để tạo các phần tử style SVG (nó trả về một [`HTMLStyleElement`](/en-US/docs/Web/API/HTMLStyleElement)).

Cho phần tử SVG sau:

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <circle cx="50" cy="50" r="25" />
</svg>
```

Bạn có thể tạo một phần tử SVG style như sau:

```js
// Lấy đối tượng phần tử SVG theo tên thẻ
const svg = document.querySelector("svg");

// Tạo phần tử `style` trong không gian tên SVG
const style = document.createElementNS("http://www.w3.org/2000/svg", "style");
const node = document.createTextNode("circle { fill: red; }");
style.appendChild(node);

// Thêm phần tử style vào phần tử SVG
svg.appendChild(style);
```

### Truy cập style SVG hiện có

Bạn có thể truy cập một phần tử SVG style được định nghĩa trong HTML (hoặc tệp SVG) bằng các phương thức HTML thông thường để lấy thẻ, id, v.v.
Bao gồm: {{domxref("Document.getElementsByTagName()")}}, {{domxref("Document.getElementById()")}}, {{domxref("Document.querySelector()")}}, {{domxref("Document.querySelectorAll()")}}, v.v.

Ví dụ, hãy xem HTML bên dưới định nghĩa một tệp SVG với phần tử style.

```html
<svg
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <style id="circle_style_id">
    circle {
      fill: gold;
      stroke: green;
      stroke-width: 3px;
    }
  </style>
  <circle cx="50" cy="50" r="25" />
</svg>
```

Để lấy phần tử `style` đầu tiên trong phần tử `svg` đầu tiên, bạn có thể sử dụng {{domxref("Document.querySelector()")}} như sau.

```js
const svg = document.querySelector("svg");
const style = svg.querySelector("style");
```

Ngoài ra, bạn có thể sử dụng {{domxref("Document.getElementById()")}}, chỉ định id của thẻ:

```js
const svg = document.querySelector("svg");
const style = svg.getElementById("circle_style_id");
```

Hoặc chỉ lấy phần tử từ document bằng id (trong trường hợp này sử dụng `document.querySelector()`):

```js
const style = document.querySelector("#circle_style_id");
```

## Lấy và đặt thuộc tính

Ví dụ này minh họa cách lấy và đặt các thuộc tính của một phần tử style, trong trường hợp này đã được chỉ định trong một định nghĩa SVG.

### HTML

HTML chứa một định nghĩa SVG cho một [`<circle>`](/en-US/docs/Web/SVG/Reference/Element/circle) với một phần tử [`<style>`](/en-US/docs/Web/SVG/Reference/Element/style), cùng với một phần tử HTML [`<button>`](/en-US/docs/Web/HTML/Reference/Elements/button) sẽ được dùng để bật và tắt style, và một phần tử HTML [`<textarea>`](/en-US/docs/Web/HTML/Reference/Elements/button) để ghi lại các giá trị thuộc tính.

```html
<button>Disable</button>
<textarea id="log" rows="6" cols="90"></textarea>
<svg
  xmlns="http://www.w3.org/2000/svg"
  xmlns:xlink="http://www.w3.org/1999/xlink">
  <style id="circle_style_id" media="(width >= 600px)">
    circle {
      fill: gold;
      stroke: green;
      stroke-width: 3px;
    }
  </style>
  <circle cx="60" cy="60" r="50" />
</svg>
```

Lưu ý rằng ở trên chúng ta đã đặt thuộc tính `media` trên thẻ `style`.
Chúng ta không đặt `type` vì nó đã bị lỗi thời, cũng không đặt `disabled` vì không có thuộc tính như vậy (chỉ có thuộc tính trên phần tử).

### JavaScript

Đoạn mã bên dưới lấy phần tử `style` (một `SVGStyleElement`) bằng id của nó.

```js
const svg = document.querySelector("svg");
const style = svg.getElementById("circle_style_id");
```

Sau đó chúng ta thêm một hàm để ghi lại các thuộc tính style.
Hàm này được gọi sau khi khởi tạo, mỗi khi khung thay đổi kích thước, và nếu nút được nhấn.

```js
// Lấy vùng văn bản ghi nhật ký
const log = document.getElementById("log");

function setLogText() {
  // Ghi lại các giá trị hiện tại của thuộc tính
  log.value = `style.media: ${style.media} (frame width: ${window.innerWidth})\n`; // mặc định là 'all'
  log.value += `style.title: ${style.title}\n`; // không có giá trị mặc định
  log.value += `style.disabled: ${style.disabled}\n`; // mặc định là 'false'
  log.value += `style.type: ${style.type}\n`; // đã lỗi thời (không sử dụng)
  log.value += `style.sheet.rules[0].cssText: ${style.sheet.rules[0].cssText}\n`;
}

// Ghi lại các giá trị thuộc tính ban đầu
setLogText();

// Ghi lại khi khung thay đổi kích thước
addEventListener("resize", () => {
  setLogText();
});
```

Cuối cùng chúng ta đặt một trình xử lý sự kiện cho nút.
Khi nút được nhấn, thuộc tính {{domxref("SVGStyleElement.disabled","disabled")}} được chuyển đổi.
Điều này cũng cập nhật nhật ký và văn bản nút.

```js
const button = document.querySelector("button");

button.addEventListener("click", () => {
  style.disabled = !style.disabled;
  button.textContent = style.disabled ? "Enable" : "Disable";

  // Ghi lại sau khi nhấn nút
  setLogText();
});
```

### Kết quả

Kết quả được hiển thị bên dưới.
Chuyển đổi nút để bật và tắt phần tử SVG style.
Nếu SVG style không bị vô hiệu hóa, bạn cũng có thể thay đổi kích thước chiều rộng cửa sổ để xem hiệu ứng của thuộc tính `media` trên style khi khung chứa ví dụ trực tiếp rộng 600px.

{{EmbedLiveSample("Getting and setting properties","200","250")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLStyleElement")}}
