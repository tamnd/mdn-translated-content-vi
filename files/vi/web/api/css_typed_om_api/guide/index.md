---
title: Sử dụng CSS Typed Object Model
slug: Web/API/CSS_Typed_OM_API/Guide
page-type: guide
---

{{DefaultAPISidebar("CSS Typed Object Model API")}}

**[CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)** biểu thị các giá trị CSS dưới dạng các đối tượng JavaScript có kiểu để cho phép thao tác hiệu quả với chúng.

Việc chuyển đổi các chuỗi giá trị [CSS Object Model](/en-US/docs/Web/API/CSS_Object_Model) sang các biểu diễn JavaScript có nghĩa và ngược lại (thông qua {{domxref("HTMLElement.style")}}) có thể gây ra chi phí hiệu suất đáng kể.

CSS Typed OM làm cho thao tác CSS trở nên hợp lý hơn và hiệu quả hơn bằng cách cung cấp các tính năng đối tượng (thay vì thao tác chuỗi CSSOM), cung cấp quyền truy cập vào các kiểu, phương thức và mô hình đối tượng cho các giá trị CSS.

Bài viết này cung cấp một giới thiệu về tất cả các tính năng chính của nó.

## computedStyleMap()

Với CSS Typed OM API, chúng ta có thể truy cập tất cả các thuộc tính CSS và giá trị, bao gồm cả các thuộc tính tùy chỉnh, đang ảnh hưởng đến một phần tử. Hãy xem cách điều này hoạt động bằng cách tạo ví dụ đầu tiên, khám phá {{domxref('Element.computedStyleMap()', 'computedStyleMap()')}}.

### Lấy tất cả thuộc tính và giá trị

#### HTML

Chúng ta bắt đầu với một số HTML: một đoạn văn với một liên kết, cùng với một danh sách định nghĩa mà chúng ta sẽ thêm tất cả các cặp Thuộc tính CSS / Giá trị vào.

```html
<p>
  <a href="https://example.com">Link</a>
</p>
<dl id="regurgitation"></dl>
```

#### JavaScript

Chúng ta thêm JavaScript để lấy liên kết chưa được tạo kiểu và trả về danh sách định nghĩa của tất cả các giá trị thuộc tính CSS mặc định ảnh hưởng đến liên kết sử dụng `computedStyleMap()`.

```js
// Get the element
const myElement = document.querySelector("a");

// Get the <dl> we'll be populating
const stylesList = document.querySelector("#regurgitation");

// Retrieve all computed styles with computedStyleMap()
const defaultComputedStyles = myElement.computedStyleMap();

// Iterate through the map of all the properties and values, adding a <dt> and <dd> for each
for (const [prop, val] of defaultComputedStyles) {
  // properties
  const cssProperty = document.createElement("dt");
  cssProperty.appendChild(document.createTextNode(prop));
  stylesList.appendChild(cssProperty);

  // values
  const cssValue = document.createElement("dd");
  cssValue.appendChild(document.createTextNode(val));
  stylesList.appendChild(cssValue);
}
```

Phương thức `computedStyleMap()` trả về một đối tượng {{domxref('StylePropertyMapReadOnly')}} chứa thuộc tính [`size`](/en-US/docs/Web/API/StylePropertyMapReadOnly/size), cho biết có bao nhiêu thuộc tính trong map. Chúng ta duyệt qua style map, tạo một [`<dt>`](/en-US/docs/Web/HTML/Reference/Elements/dt) và [`<dd>`](/en-US/docs/Web/HTML/Reference/Elements/dd) cho mỗi thuộc tính và giá trị tương ứng.

#### Kết quả

Trong [các trình duyệt hỗ trợ `computedStyleMap()`](/en-US/docs/Web/API/Element/computedStyleMap#browser_compatibility), bạn sẽ thấy danh sách tất cả các thuộc tính và giá trị CSS. Trong các trình duyệt khác, bạn sẽ chỉ thấy một liên kết.

{{EmbedLiveSample("Getting_all_the_properties_and_values", 120, 300)}}

### Phương thức .get() / thuộc tính tùy chỉnh

Hãy cập nhật ví dụ để chỉ lấy một vài thuộc tính và giá trị. Hãy bắt đầu bằng cách thêm một số CSS vào ví dụ, bao gồm một thuộc tính tùy chỉnh và một thuộc tính có thể kế thừa:

```css
p {
  font-weight: bold;
}

a {
  --color: red;
  color: var(--color);
}
```

Thay vì lấy _tất cả_ các thuộc tính, chúng ta tạo một mảng các thuộc tính quan tâm và sử dụng phương thức {{domxref('StylePropertyMapReadOnly.get()')}} để lấy mỗi giá trị của chúng:

```html hidden
<p>
  <a href="https://example.com">Link</a>
</p>
<dl id="regurgitation"></dl>
```

```js
// Get the element
const myElement = document.querySelector("a");

// Get the <dl> we'll be populating
const stylesList = document.querySelector("#regurgitation");

// Retrieve all computed styles with computedStyleMap()
const allComputedStyles = myElement.computedStyleMap();

// Array of properties we're interested in
const ofInterest = ["font-weight", "border-left-color", "color", "--color"];

// iterate through our properties of interest
for (const value of ofInterest) {
  // Properties
  const cssProperty = document.createElement("dt");
  cssProperty.appendChild(document.createTextNode(value));
  stylesList.appendChild(cssProperty);

  // Values
  const cssValue = document.createElement("dd");
  cssValue.appendChild(document.createTextNode(allComputedStyles.get(value)));
  stylesList.appendChild(cssValue);
}
```

{{EmbedLiveSample(".get_method_custom_properties", 120, 300)}}

### CSSUnitValue và CSSKeywordValue

Sức mạnh của CSS Typed OM là các giá trị tách biệt khỏi các đơn vị. Mọi thuộc tính CSS trong style map đều có một giá trị. Nếu giá trị là một từ khóa, đối tượng trả về là một [`CSSKeywordValue`](/en-US/docs/Web/API/CSSKeywordValue). Nếu giá trị là số, một [`CSSUnitValue`](/en-US/docs/Web/API/CSSUnitValue) được trả về.

`CSSKeywordValue` là một lớp định nghĩa các từ khóa như `inherit`, `initial`, `unset` và các chuỗi khác mà bạn không trích dẫn, chẳng hạn như `auto` và `grid`.

`CSSUnitValue` được trả về nếu giá trị là một loại đơn vị. Đây là một lớp định nghĩa các số với các đơn vị đo lường như `20px`, `40%`, `200ms` hoặc `7`. Nó được trả về với hai thuộc tính: `value` và `unit`.

Hãy viết một đoạn văn bình thường, không áp dụng kiểu dáng nào và kiểm tra một số thuộc tính CSS của nó bằng cách trả về một bảng với đơn vị và giá trị:

```html
<p>
  This is a paragraph with some content. Open up this example in CodePen or
  JSFiddle, and change some features. Try adding some CSS, such as a width for
  this paragraph, or adding a CSS property to the ofInterest array.
</p>
<table id="regurgitation">
  <thead>
    <tr>
      <th>Property</th>
      <th>Value</th>
      <th>Unit</th>
    </tr>
  </thead>
</table>
```

```js
// Get the element we're inspecting
const myElement = document.querySelector("p");

// Get the table we'll be populating
const stylesTable = document.querySelector("#regurgitation");

// Retrieve all computed styles with computedStyleMap()
const allComputedStyles = myElement.computedStyleMap();

// Array of properties we're interested in
const ofInterest = [
  "padding-top",
  "margin-bottom",
  "font-size",
  "font-stretch",
  "animation-duration",
  "animation-iteration-count",
  "width",
  "height",
];

// Iterate through our properties of interest
for (const value of ofInterest) {
  // Create a row
  const row = document.createElement("tr");

  // Add the name of the property
  const cssProperty = document.createElement("td");
  cssProperty.appendChild(document.createTextNode(value));
  row.appendChild(cssProperty);

  // Add the unitless value
  const cssValue = document.createElement("td");

  // Shrink long floats to 1 decimal point
  let propVal = allComputedStyles.get(value).value;
  propVal = propVal % 1 ? propVal.toFixed(1) : propVal;
  cssValue.appendChild(document.createTextNode(propVal));
  row.appendChild(cssValue);

  // Add the type of unit
  const cssUnit = document.createElement("td");
  cssUnit.appendChild(
    document.createTextNode(allComputedStyles.get(value).unit),
  );
  row.appendChild(cssUnit);

  // Add the row to the table
  stylesTable.appendChild(row);
}
```

{{EmbedLiveSample("CSSUnitValue_and_CSSKeywordValue", 120, 300)}}

## CSSStyleValue

Giao diện `CSSStyleValue` của [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Object_Model#css_typed_object_model) là lớp cơ sở của tất cả các giá trị CSS có thể truy cập thông qua Typed OM API, bao gồm {{domxref('CSSImageValue')}}, {{domxref('CSSKeywordValue')}}, {{domxref('CSSNumericValue')}}, {{domxref('CSSPositionValue')}}, {{domxref('CSSTransformValue')}} và {{domxref('CSSUnparsedValue')}}.

Nó có hai phương thức:

- {{domxref("CSSStyleValue/parse_static", "CSSStyleValue.parse()")}}
- {{domxref("CSSStyleValue/parseAll_static", "CSSStyleValue.parseAll()")}}

Hãy kiểm tra một ví dụ CSS với một số thuộc tính tùy chỉnh, transforms, `calc()` và các tính năng khác. Chúng ta sẽ xem xét các kiểu của chúng bằng cách sử dụng các đoạn JavaScript ngắn xuất ra {{domxref("console/log_static", "console.log()")}}:

```css
:root {
  --main-color: hsl(198 43% 42%);
  --black: hsl(0 0% 16%);
  --white: hsl(0 0% 97%);
  --unit: 1.2rem;
}

button {
  --main-color: hsl(198 100% 66%);
  display: inline-block;
  padding: var(--unit) calc(var(--unit) * 2);
  width: calc(30% + 20px);
  background: no-repeat 5% center url("magic-wand.png") var(--main-color);
  border: 4px solid var(--main-color);
  border-radius: 2px;
  font-size: calc(var(--unit) * 2);
  color: var(--white);
  cursor: pointer;
  transform: scale(0.95);
}
```

```html
<button>Styled Button</button>
```

```html hidden
<p>
  There is nothing to see here. Please open your browser console to see the
  output!
</p>
```

```js
const allComputedStyles = document.querySelector("button").computedStyleMap();
```

### CSSUnparsedValue

{{domxref('CSSUnparsedValue')}} biểu diễn [thuộc tính tùy chỉnh](/en-US/docs/Web/CSS/Guides/Cascading_variables/Using_custom_properties):

```js
// CSSUnparsedValue
const unit = allComputedStyles.get("--unit");

console.log(unit); // CSSUnparsedValue {0: " 1.2rem", length: 1}
console.log(unit[0]); // " 1.2rem"
```

### CSSMathSum

Mặc dù phần tử [`<button>`](/en-US/docs/Web/HTML/Reference/Elements/button) là phần tử nội tuyến theo mặc định, chúng ta đã thêm `display: inline-block;` để cho phép định kích thước. Trong CSS, chúng ta có `width: calc(30% + 20px);`, là một hàm {{cssxref("calc()")}} để định nghĩa chiều rộng.

Khi chúng ta `get()` `width`, chúng ta nhận được một [`CSSMathSum`](/en-US/docs/Web/API/CSSMathSum) trả về.

```js
const btnWidth = allComputedStyles.get("width");

console.log(btnWidth); // CSSMathSum
console.log(btnWidth.values); // CSSNumericArray {0: CSSUnitValue, 1: CSSUnitValue, length: 2}
console.log(btnWidth.operator); // 'sum'
```

### CSSTransformValue với CSSScale

Trong CSS, chúng ta có `transform: scale(0.95);`, là một hàm {{cssxref('transform')}}.

```js
const transform = allComputedStyles.get("transform");

console.log(transform); // CSSTransformValue {0: CSSScale, 1: CSSTranslate, length: 2, is2D: true}
console.log(transform.length); // 1
console.log(transform[0]); // CSSScale {x: CSSUnitValue, y: CSSUnitValue, z: CSSUnitValue, is2D: true}
console.log(transform[0].x); // CSSUnitValue {value: 0.95, unit: "number"}
console.log(transform[0].y); // CSSUnitValue {value: 0.95, unit: "number"}
console.log(transform[0].z); // CSSUnitValue {value: 1, unit: "number"}
console.log(transform.is2D); // true
```

### CSSImageValue

Button của chúng ta có một hình nền: một cây đũa thần.

```js
const bgImage = allComputedStyles.get("background-image");

console.log(bgImage); // CSSImageValue
console.log(bgImage.toString()); // url("magic-wand.png")
```

Cuối cùng, chúng ta kết hợp tất cả lại trong một mẫu trực tiếp. Hãy nhớ sử dụng console của trình duyệt để kiểm tra kết quả.

{{EmbedLiveSample("CSSStyleValue", 120, 300)}}

## Tóm tắt

Điều này sẽ giúp bạn bắt đầu hiểu CSS Typed OM. Hãy xem tất cả các giao diện [CSS Typed OM](/en-US/docs/Web/API/CSS_Typed_OM_API) để tìm hiểu thêm.

## Xem thêm

- [Sử dụng CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API/Guide)
