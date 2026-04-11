---
title: CSS value serialization
slug: Web/API/CSS_Object_Model/CSS_value_serialization
page-type: guide
spec-urls:
  - https://drafts.csswg.org/cssom/#serialize-a-css-value
  - https://drafts.csswg.org/css-color-4/#serialization
---

{{APIRef("CSSOM")}}

Một số API của CSSOM _tuần tự hóa_ các giá trị thuộc tính thành chuỗi chuẩn hóa dựa trên [kiểu dữ liệu](/en-US/docs/Web/CSS/Reference/Values/Data_types) của giá trị. Ví dụ, bạn có thể đặt một màu bằng cú pháp `hsl(240 100% 50%)`, nhưng khi truy cập qua JavaScript, giá trị sẽ được trả về dưới cú pháp tương đương `"rgb(0, 0, 255)"`.

Các kiểu dữ liệu CSS thường có thể được biểu đạt bằng nhiều cú pháp khác nhau. Ví dụ, kiểu dữ liệu {{cssxref("&lt;color&gt;")}} có thể được biểu diễn bằng màu đặt tên (`red`), ký hiệu thập lục phân (`#ff0000`), ký hiệu hàm (`rgb(255 0 0)`), và nhiều hơn nữa. Các cú pháp khác nhau này hoàn toàn tương đương ở mọi giai đoạn của [xử lý giá trị CSS](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing), tương tự như trong JavaScript, cùng một chuỗi có thể được viết bằng dấu nháy đơn hoặc kép, hoặc cùng một số có thể được viết ở các định dạng khác nhau (như `16`, `16.0`, hoặc `0x10`).

Vì CSS chuyển đổi tất cả các biểu diễn bề mặt này thành cùng một giá trị nền trong quá trình xử lý giá trị, nên thường không thể khôi phục lại cú pháp gốc từ CSSOM đã được phân tích cú pháp. Hơn nữa, một biểu diễn _chuẩn hóa_ thường hữu ích hơn cho script, vì nó cho phép so sánh và tính toán dựa trên cách nội dung được trình bày cho người dùng, thay vì cách nó được tác giả viết ban đầu.

## Khi nào và cách các giá trị được tuần tự hóa

Việc tuần tự hóa xảy ra bất cứ khi nào các giá trị thuộc tính CSS được đọc dưới dạng chuỗi thông qua các API JavaScript, chẳng hạn như:

- {{domxref("CSSStyleDeclaration.getPropertyValue()")}}
- {{domxref("CSSStyleDeclaration.cssText")}}
- Truy cập trực tiếp các thuộc tính trên đối tượng {{domxref("CSSStyleDeclaration")}} (ví dụ, `element.style.backgroundColor`)

Các API khác nhau trả về đối tượng `CSSStyleDeclaration` ở các giai đoạn khác nhau của [xử lý giá trị](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing), nên hành vi tuần tự hóa cũng hơi khác nhau. Ví dụ, {{domxref("Window.getComputedStyle()")}} và {{domxref("HTMLElement.style")}} trả về [giá trị đã giải quyết](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#resolved_value) của thuộc tính, trong khi {{domxref("CSSStyleRule.style")}} trả về _gần như_ [giá trị đã khai báo](/en-US/docs/Web/CSS/Guides/Cascade/Property_value_processing#declared_value).

> [!NOTE]
> [CSS Typed OM API](/en-US/docs/Web/API/CSS_Typed_OM_API) có thể biểu diễn đơn vị và các cú pháp CSS khác; tuy nhiên, các khai báo kiểu lấy từ một phần tử vẫn được xử lý và không giữ lại cú pháp gốc. Ví dụ, `CSS.cm(1).toString()` trả về `"1cm"` thay vì tuần tự hóa thành pixel, nhưng `element.computedStyleMap().get("margin-left").toString()` trả về giá trị pixel đã giải quyết.

Mỗi kiểu giá trị CSS đều có một định dạng tuần tự hóa đi kèm do các đặc tả CSS định nghĩa. Một số quy tắc phổ biến gồm:

- Các từ khóa (như `auto`, `block`, `none`) được tuần tự hóa thành chữ thường hoàn toàn.
- {{cssxref("angle")}}: được tuần tự hóa thành một đơn vị góc nào đó, tùy bối cảnh (không được chỉ rõ). Với `element.style` và `getComputedStyle()`, đơn vị là `deg`.
- {{cssxref("&lt;color&gt;")}}:
  - Với màu sRGB ({{cssxref("named-color")}}, `transparent`, {{cssxref("system-color")}}, {{cssxref("hex-color")}}, `rgb`, `hsl`, `hwb`): được tuần tự hóa dưới dạng cú pháp cũ dùng dấu phẩy `rgb(R, G, B)` hoặc `rgba(R, G, B, A)`, trong đó mọi đối số đều là số. Dạng `rgb` được chọn nếu alpha chính xác bằng `1`.
  - Với màu `lab()`, `lch()`, `oklab()`, `oklch()`, và `color()`: giữ nguyên dạng hàm, với các đối số số.
  - Từ khóa `currentColor` được tuần tự hóa thành `currentcolor`.
- {{cssxref("percentage")}}: được giữ nguyên dưới dạng phần trăm.
- {{cssxref("ratio")}}: được tuần tự hóa thành hai số phân tách bằng `" / "`.
- {{cssxref("url_value", "&lt;url&gt;")}}: được tuần tự hóa thành một {{cssxref("url_value", "&lt;url&gt;")}} có dấu ngoặc kép (`url("...")`), với URL được phân giải thành URL tuyệt đối.

Cần lưu ý rằng giá trị `<percentage>` thường được chuyển thành các kích thước tuyệt đối (như `<length>`) trong quá trình xử lý giá trị, nên chúng có thể không còn xuất hiện dưới dạng phần trăm khi được tuần tự hóa từ style đã tính toán. Với các kích thước có đơn vị, như {{cssxref("&lt;frequency&gt;")}}, {{cssxref("&lt;length&gt;")}}, {{cssxref("&lt;resolution&gt;")}}, và {{cssxref("&lt;time&gt;")}}, đơn vị được tuần tự hóa phụ thuộc vào bối cảnh và không được đặc tả rõ ràng. `getComputedStyle()` và `element.style` tuần tự hóa chúng thành `Hz`, `px`, `dppx`, và `s` tương ứng.

Khi tuần tự hóa giá trị cho các thuộc tính viết tắt, các thuộc tính con của nó sẽ được tuần tự hóa và ghép lại theo quy tắc dành cho thuộc tính viết tắt đó.

> [!NOTE]
> Có rất nhiều chi tiết phức tạp về cách các thuộc tính CSS được tuần tự hóa, đặc biệt là với các thuộc tính phức tạp như `font`. Chúng có thể chưa được đặc tả hoặc thậm chí không nhất quán giữa các trình duyệt. Bạn cần kiểm tra và xác minh hành vi cho trường hợp sử dụng cụ thể của mình.

```html
<div>Example Element</div>
```

```css
div {
  position: absolute; /* keyword */
  rotate: 1rad; /* <angle> */
  color: hsl(240 100% 50%); /* <color> */
  background-color: hsl(120 50% 50% / 0.3); /* <color> with alpha */
  border-color: lab(10 -120 -120); /* <color> in non-sRGB space */
  margin: 2em; /* relative <length> */
  padding: 2cm; /* absolute <length> */
  font-size: calc(1em + 2px); /* complex expression */
  left: 50%; /* <percentage> */
  animation-duration: 500ms; /* <time> */
}
```

```js
const element = document.querySelector("div");
const table = document.createElement("table");
const elemStyle = getComputedStyle(element);
const ruleStyle = document.getElementById("css-output").sheet.cssRules[0].style;
const head = table.createTHead().insertRow();
["Property", "getComputedStyle()", "CSSStyleRule"].forEach((text) => {
  const th = document.createElement("th");
  th.textContent = text;
  head.appendChild(th);
});
for (const property of [
  "position",
  "rotate",
  "color",
  "background-color",
  "border-color",
  "margin",
  "padding",
  "font-size",
  "left",
  "animation-duration",
]) {
  const row = document.createElement("tr");
  const propCell = document.createElement("td");
  const valueCell = document.createElement("td");
  const ruleCell = document.createElement("td");
  propCell.textContent = property;
  valueCell.textContent = elemStyle.getPropertyValue(property);
  ruleCell.textContent = ruleStyle.getPropertyValue(property);
  row.appendChild(propCell);
  row.appendChild(valueCell);
  row.appendChild(ruleCell);
  table.appendChild(row);
}
document.body.appendChild(table);
```

{{EmbedLiveSample("", "", 400)}}

## Ví dụ

### Tuần tự hóa giá trị màu

Màu là một trong những kiểu dữ liệu thường xuyên bị ảnh hưởng bởi tuần tự hóa. Dù bạn định nghĩa màu bằng `hsl()`, `hwb()`, một từ khóa, hay một không gian màu hiện đại, JavaScript thường trả về nó ở [định dạng `rgb()` hoặc `rgba()` cũ](/en-US/docs/Web/CSS/Reference/Values/color_value/rgb#syntax).

Các ví dụ sau minh họa cách các định dạng màu khác nhau được tuần tự hóa khi truy cập qua JavaScript.

```html
<div class="example hsl">HSL Color</div>
<div class="example lab">LAB Color</div>
<div class="example named">Named Color</div>
<div class="example alpha">Transparent Color</div>
<pre id="output"></pre>
```

```css
.example {
  padding: 10px;
  margin: 5px;
  color: white;
}

.hsl {
  background-color: hsl(240 100% 50%);
}

.lab {
  background-color: lab(100% 0 0);
}

.named {
  background-color: blue;
}

.alpha {
  background-color: hsl(120 50% 50% / 0.3);
}
```

```js
const examples = document.querySelectorAll(".example");
const output = document.getElementById("output");

examples.forEach((element) => {
  const style = getComputedStyle(element);
  output.textContent += `${element.className}: ${style.getPropertyValue("background-color")}\n`;
});
```

{{EmbedLiveSample("Color value serialization", , 400)}}

### Tuần tự hóa giá trị độ dài

Độ dài là một trường hợp phổ biến khác. Các đơn vị tương đối (như `em`, `%`) thường được giải thành pixel tuyệt đối khi được tuần tự hóa qua các API JavaScript.

```js
element.style.marginLeft = "2em";
console.log(getComputedStyle(element).marginLeft);
// "32px" (tùy thuộc vào kích thước phông chữ)
```

Việc chuẩn hóa này cho phép script so sánh hoặc tính toán độ dài một cách nhất quán.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [`CSSStyleDeclaration.getPropertyValue()`](/en-US/docs/Web/API/CSSStyleDeclaration/getPropertyValue)
- [`Window.getComputedStyle()`](/en-US/docs/Web/API/Window/getComputedStyle)
- [CSS colors](/en-US/docs/Web/CSS/Guides/Colors)
- {{cssxref("&lt;color&gt;")}}
- [CSS values and units](/en-US/docs/Web/CSS/Guides/Values_and_units) module
