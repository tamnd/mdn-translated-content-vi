---
title: Sử dụng HTML Sanitizer API
slug: Web/API/HTML_Sanitizer_API/Using_the_HTML_Sanitizer_API
page-type: guide
---

{{DefaultAPISidebar("HTML Sanitizer API")}}

[HTML Sanitizer API](/en-US/docs/Web/API/HTML_Sanitizer_API) cung cấp các phương thức cho phép các nhà phát triển chèn HTML không đáng tin cậy một cách an toàn vào {{domxref("Element")}}, {{domxref("ShadowRoot")}}, hoặc {{domxref("Document")}}. API cũng cho các nhà phát triển sự linh hoạt để tiếp tục hạn chế hoặc mở rộng những thực thể HTML được phép nếu cần.

## Làm sạch an toàn theo mặc định

Trường hợp sử dụng phổ biến nhất của API là chèn chuỗi do người dùng cung cấp một cách an toàn vào {{domxref("Element")}}. Trừ khi chuỗi cần chèn _cần_ chứa các thực thể HTML không an toàn, bạn có thể sử dụng {{domxref('Element.setHTML()')}} như thay thế trực tiếp cho {{domxref("Element.innerHTML")}}.

Ví dụ, đoạn mã sau đây sẽ xóa tất cả các phần tử và thuộc tính không an toàn với XSS trong chuỗi đầu vào (trong trường hợp này là phần tử {{htmlelement("script")}}), cùng với bất kỳ phần tử nào không được phép là con của phần tử đích theo đặc tả HTML:

```js
const untrustedString = "abc <script>alert(1)<" + "/script> def";
const someElement = document.getElementById("target");

// someElement.innerHTML = untrustedString;
someElement.setHTML(untrustedString);

console.log(someElement.innerHTML); // abc def
```

Các phương thức an toàn với XSS khác, {{domxref('ShadowRoot.setHTML()')}} và {{domxref('Document/parseHTML_static','Document.parseHTML()')}}, được sử dụng theo cách tương tự.

## Sử dụng cấu hình sanitizer

Tất cả các phương thức làm sạch có thể được truyền {{domxref('Sanitizer')}} hoặc {{domxref('SanitizerConfig')}}, định nghĩa những phần tử, thuộc tính và nhận xét nào được phép hoặc nên bị xóa khi chèn các chuỗi HTML.

### Sử dụng phương thức an toàn với sanitizer

Các phương thức an toàn với XSS luôn xóa bất kỳ phần tử hoặc thuộc tính HTML không an toàn nào. Bạn có thể truyền sanitizer làm đối số thứ hai cho các phương thức an toàn để cho phép các thực thể giống hoặc ít hơn so với cấu hình mặc định.

```js
const sanitizerOne = new Sanitizer({ elements: ["p", "a"] });
sanitizerOne.allowAttribute("href");
someElement.setHTML(untrustedString, { sanitizer: sanitizerOne });
```

### Cho phép làm sạch không an toàn

Đôi khi bạn có thể muốn chèn đầu vào cần chứa các phần tử hoặc thuộc tính có thể không an toàn. Trong trường hợp này bạn có thể sử dụng một trong các phương thức không an toàn với XSS của API: {{domxref('Element.setHTMLUnsafe()')}}, {{domxref('ShadowRoot.setHTMLUnsafe()')}}, và {{domxref('Document/parseHTMLUnsafe_static','Document.parseHTMLUnsafe()')}}.

```js
const untrustedString = '<button onclick="alert(1)">Button text</button>';
const someElement = document.getElementById("target");

const sanitizerOne = new Sanitizer(); // Default sanitizer
sanitizerOne.allowElement({ name: "button", attributes: ["onclick"] });
someElement.setHTMLUnsafe(untrustedString, { sanitizer: sanitizerOne });
```

## Cấu hình cho phép

Bạn có thể xây dựng ["cấu hình cho phép" sanitizer](/en-US/docs/Web/API/HTML_Sanitizer_API#allow_and_remove_configurations) bằng cách chỉ định tập hợp các phần tử và thuộc tính HTML bạn muốn cho phép chèn khi sử dụng sanitizer.

```js
const sanitizer = new Sanitizer({
  elements: ["p", "div"],
  attributes: ["cite", "onclick"],
  replaceWithChildrenElements: ["b"],
});
```

### Cho phép phần tử

```js
const sanitizer = new Sanitizer({
  elements: ["div", "span"],
});
```

```js
const sanitizer = new Sanitizer({});
sanitizer.allowElement("div");
sanitizer.allowElement({
  name: "span",
  namespace: "http://www.w3.org/1999/xhtml",
});
```

### Cho phép thuộc tính toàn cục

```js
const sanitizer = new Sanitizer({
  attributes: ["cite", "onclick"],
});
```

```js
const sanitizer = new Sanitizer({});
sanitizer.allowAttribute("cite");
sanitizer.allowAttribute("onclick");
```

### Cho phép/xóa thuộc tính trên phần tử cụ thể

```js
const sanitizer = new Sanitizer({
  elements: [
    "div",
    { name: "a", attributes: ["href", "rel", "hreflang", "type"] },
    "span",
  ],
});
```

```js
const sanitizer = new Sanitizer({
  elements: ["div", { name: "a", removeAttributes: ["type"] }],
});
```

### Thay thế phần tử con

```js
const replaceBoldSanitizer = new Sanitizer({
  replaceWithChildrenElements: ["b"],
});

targetElement.setHTML("This <b>highlighting</b> isn't needed", {
  sanitizer: replaceBoldSanitizer,
});

// Log the result
console.log(targetElement.innerHTML); // This highlighting isn't needed
```

## Cấu hình xóa

Bạn có thể xây dựng ["cấu hình xóa" sanitizer](/en-US/docs/Web/API/HTML_Sanitizer_API#allow_and_remove_configurations) bằng cách chỉ định tập hợp các phần tử và thuộc tính HTML bạn muốn xóa khỏi đầu vào khi sử dụng sanitizer.

```js
const sanitizer = new Sanitizer({
  removeElements: ["script", "div", "span"],
  removeAttributes: ["onclick"],
});
```

### Xóa phần tử

```js
const sanitizer = new Sanitizer({
  removeElements: ["div", "span"],
});
```

```js
const sanitizer = new Sanitizer({});
sanitizer.removeElement("div");
sanitizer.removeElement({
  name: "span",
  namespace: "http://www.w3.org/1999/xhtml",
});
```

### Xóa thuộc tính

```js
const sanitizer = new Sanitizer({
  removeAttributes: ["onclick", "lang"],
});
```

```js
const sanitizer = new Sanitizer({});
sanitizer.removeAttribute("onclick");
sanitizer.removeAttribute("lang");
```

## Nhận xét và thuộc tính data

{{domxref("SanitizerConfig")}} cũng có thể được sử dụng để chỉ định liệu nhận xét có bị lọc khỏi nội dung được chèn hay không, sử dụng thuộc tính [`comments`](/en-US/docs/Web/API/SanitizerConfig#comments), và liệu các thuộc tính `data-` có được phép mà không cần thêm chúng vào mảng `attributes` bằng thuộc tính boolean [`dataAttributes`](/en-US/docs/Web/API/SanitizerConfig#dataattributes).

```js
const sanitizer = new Sanitizer({
  comments: true,
  dataAttributes: true,
});
```

```js
const sanitizer = new Sanitizer({});
sanitizer.setComments(true);
sanitizer.setDataAttributes(true);
```

## Sanitizer vs SanitizerConfig

Tất cả các phương thức làm sạch có thể được truyền cấu hình sanitizer là phiên bản {{domxref("Sanitizer")}} hoặc {{domxref("SanitizerConfig")}}.

{{domxref("SanitizerConfig")}} cung cấp phương thức nhỏ gọn để chỉ định nhiều phần tử hoặc thuộc tính nên được phép hoặc xóa cùng một lúc.

Đối tượng {{domxref("Sanitizer")}} là bộ bọc xung quanh {{domxref("SanitizerConfig")}} cung cấp chức năng hữu ích bổ sung:

- Hàm khởi tạo mặc định tạo cấu hình cho phép tất cả phần tử và thuộc tính an toàn với XSS.
- Các phương thức `Sanitizer` đảm bảo `SanitizerConfig` bên dưới vẫn là [cấu hình hợp lệ](/en-US/docs/Web/API/SanitizerConfig#valid_configuration).
- Phương thức {{domxref("Sanitizer.removeUnsafe()")}} có thể được sử dụng để xóa tất cả các thực thể không an toàn với XSS khỏi cấu hình hiện có.
- Bạn có thể xuất cấu hình để xem chính xác những thực thể nào được phép và bị loại bỏ.

## Ví dụ

Để xem các ví dụ khác, xem [HTML Sanitizer API](/en-US/docs/Web/API/HTML_Sanitizer_API) và các phương thức riêng lẻ của giao diện {{domxref("Sanitizer")}}.

### Demo Sanitizer

Ví dụ này cho thấy cách bạn có thể sử dụng các phương thức {{domxref("Sanitizer")}} để cập nhật sanitizer.

#### HTML

```html
<div class="button-group">
  <button id="defaultSanitizerBtn">Default Sanitizer</button>
  <button id="emptySanitizerBtn">Empty Sanitizer</button>
</div>
```

```html
<div class="select-group">
  <label for="allowElementSelect">allowElement:</label>
  <select id="allowElementSelect">
    <option value="">--Choose element--</option>
    <option value="h1">h1</option>
    <option value="div">div</option>
    <option value="span">span</option>
    <option value="script">script</option>
    <option value="p">p</option>
    <option value="button">button</option>
    <option value="img">img</option>
  </select>

  <label for="removeElementSelect">removeElement:</label>
  <select id="removeElementSelect">
    <option value="">--Choose element--</option>
    <option value="h1">h1</option>
    <option value="div">div</option>
    <option value="span">span</option>
    <option value="script">script</option>
    <option value="p">p</option>
    <option value="button">button</option>
    <option value="img">img</option>
  </select>
</div>
<div class="select-group">
  <label for="allowAttributeSelect">allowAttribute:</label>
  <select id="allowAttributeSelect">
    <option value="">--Choose attribute--</option>
    <option value="class">class</option>
    <option value="autocapitalize">autocapitalize</option>
    <option value="hidden">hidden</option>
    <option value="lang">lang</option>
    <option value="title">title</option>
    <option value="onclick">onclick</option>
  </select>
  <label for="removeAttributeSelect">removeAttribute:</label>
  <select id="removeAttributeSelect">
    <option value="">--Choose attribute--</option>
    <option value="class">class</option>
    <option value="autocapitalize">autocapitalize</option>
    <option value="hidden">hidden</option>
    <option value="lang">lang</option>
    <option value="title">title</option>
    <option value="onclick">onclick</option>
  </select>
</div>
```

```html
<div class="button-group">
  <button id="toggleCommentsBtn">Toggle comments</button>
  <button id="toggleDataAttributesBtn">Toggle data-attributes</button>
</div>
```

```html
<div>
  <p>Original string (Editable)</p>
  <pre contenteditable id="unmodified"></pre>
  <p>setHTML() (HTML as string)</p>
  <pre id="setHTML"></pre>
  <p>setHTMLUnsafe() (HTML as string)</p>
  <pre id="setHTMLUnsafe"></pre>
</div>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 430px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.textContent = text;
}
```

```js
if ("Sanitizer" in window) {
  // Define unsafe string of HTML
  const initialHTMLString =
    `<div id="mainDiv"><!-- HTML comment -->
    <p data-test="true">This is a paragraph. <button onclick="alert('You clicked the button!')">Click me</button></p>
    <p>Be <b>bold</b> and brave!</p>
    <script>alert(1)<` + "/script></div>";

  // Set unsafe string as a text node of first element
  const unmodifiedElement = document.querySelector("#unmodified");
  unmodifiedElement.innerText = initialHTMLString;
  unsafeHTMLString = unmodifiedElement.innerText;

  const setHTMLElement = document.querySelector("#setHTML");
  const setHTMLUnsafeElement = document.querySelector("#setHTMLUnsafe");
  // Create and apply default sanitizer when we start
  let sanitizer = new Sanitizer({});
  applySanitizer(sanitizer);
```

```js
function applySanitizer(sanitizer) {
  // Get string to parse into element
  unsafeHTMLString = unmodifiedElement.innerText;

  // Sanitize string using safe method and then display as text
  setHTMLElement.setHTML(unsafeHTMLString, { sanitizer });
  setHTMLElement.innerText = setHTMLElement.innerHTML;

  // Sanitize string using unsafe method and then display as text
  setHTMLUnsafeElement.setHTMLUnsafe(unsafeHTMLString, { sanitizer });
  setHTMLUnsafeElement.innerText = setHTMLUnsafeElement.innerHTML;

  // Display sanitizer configuration
  const sanitizerConfig = sanitizer.get();
  log(JSON.stringify(sanitizerConfig, null, 2));
}
```

```js
const defaultSanitizerBtn = document.querySelector("#defaultSanitizerBtn");
const emptySanitizerBtn = document.querySelector("#emptySanitizerBtn");
const allowElementSelect = document.querySelector("#allowElementSelect");
const removeElementSelect = document.querySelector("#removeElementSelect");
const allowAttributeSelect = document.querySelector("#allowAttributeSelect");
const removeAttributeSelect = document.querySelector("#removeAttributeSelect");

const toggleCommentsBtn = document.querySelector("#toggleCommentsBtn");
const toggleDataAttributesBtn = document.querySelector(
  "#toggleDataAttributesBtn",
);
```

```js
defaultSanitizerBtn.addEventListener("click", () => {
  sanitizer = new Sanitizer();
  applySanitizer(sanitizer);
});

emptySanitizerBtn.addEventListener("click", () => {
  sanitizer = new Sanitizer({});
  applySanitizer(sanitizer);
});
```

```js
allowElementSelect.addEventListener("change", (event) => {
  if (event.target.value !== "") {
    sanitizer.allowElement(event.target.value);
    applySanitizer(sanitizer);
  }
});
removeElementSelect.addEventListener("change", (event) => {
  if (event.target.value !== "") {
    sanitizer.removeElement(event.target.value);
    applySanitizer(sanitizer);
  }
});
allowAttributeSelect.addEventListener("change", (event) => {
  if (event.target.value !== "") {
    sanitizer.allowAttribute(event.target.value);
    applySanitizer(sanitizer);
  }
});
removeAttributeSelect.addEventListener("change", (event) => {
  if (event.target.value !== "") {
    sanitizer.removeAttribute(event.target.value);
    applySanitizer(sanitizer);
  }
});
```

```js
let dataAttributesActive = true;
let commentsActive = true;

toggleCommentsBtn.addEventListener("click", () => {
  commentsActive = !commentsActive;
  sanitizer.setComments(commentsActive);
  applySanitizer(sanitizer);
});

toggleDataAttributesBtn.addEventListener("click", () => {
  dataAttributesActive = !dataAttributesActive;
  sanitizer.setDataAttributes(dataAttributesActive);
  applySanitizer(sanitizer);
});


} else {
  log("The HTML Sanitizer API is NOT supported in this browser.");
  // Provide fallback or alternative behavior
}
```

#### Kết quả

{{EmbedLiveSample("Sanitizer demo","100","650px")}}
