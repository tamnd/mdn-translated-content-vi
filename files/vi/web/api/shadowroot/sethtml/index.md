---
title: "ShadowRoot: phương thức setHTML()"
short-title: setHTML()
slug: Web/API/ShadowRoot/setHTML
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.ShadowRoot.setHTML
---

{{APIRef("HTML Sanitizer API")}}{{SeeCompatTable}}

Phương thức **`setHTML()`** của giao diện {{domxref("ShadowRoot")}} cung cấp một cách an toàn trước XSS để phân tích cú pháp và làm sạch một chuỗi HTML, rồi thay thế cây hiện có trong Shadow DOM.

Phương thức này loại bỏ mọi phần tử và thuộc tính được xem là không an toàn trước XSS, ngay cả khi chúng được phép bởi sanitizer được truyền vào. Đáng chú ý, các phần tử sau luôn bị loại bỏ: {{HTMLElement("script")}}, {{HTMLElement("frame")}}, {{HTMLElement("iframe")}}, {{HTMLElement("embed")}}, {{HTMLElement("object")}}, {{SVGElement("use")}}, và các thuộc tính xử lý sự kiện.

Nên dùng phương thức này như một thay thế trực tiếp cho {{domxref("ShadowRoot.innerHTML")}} khi đặt một chuỗi HTML do người dùng cung cấp.

## Cú pháp

```js-nolint
setHTML(input)
setHTML(input, options)
```

### Tham số

- `input`
  - : Một chuỗi định nghĩa HTML sẽ được làm sạch và chèn vào shadow root.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn với các tham số tùy chọn sau:
    - `sanitizer`
      - : Một đối tượng {{domxref("Sanitizer")}} hoặc {{domxref("SanitizerConfig")}} xác định những phần tử nào trong đầu vào được cho phép hoặc bị loại bỏ, hoặc chuỗi `"default"` cho [cấu hình sanitizer mặc định](/en-US/docs/Web/API/HTML_Sanitizer_API/Default_sanitizer_configuration). Phương thức sẽ loại bỏ mọi phần tử và thuộc tính không an toàn trước XSS, ngay cả khi chúng được sanitizer cho phép. Nếu không chỉ định, cấu hình mặc định của `Sanitizer` sẽ được dùng.

        Lưu ý rằng nếu bạn dùng cùng một cấu hình nhiều lần, thường sẽ hiệu quả hơn khi dùng một `Sanitizer` và sửa đổi nó khi cần.

### Giá trị trả về

Không có (`undefined`).

### Ngoại lệ

- `TypeError`
  - : Được ném ra nếu `options.sanitizer` nhận:
    - một {{domxref("SanitizerConfig")}} không [hợp lệ](/en-US/docs/Web/API/SanitizerConfig#valid_configuration). Ví dụ, một cấu hình chứa đồng thời cài đặt "allowed" và "removed".
    - chuỗi không có giá trị `"default"`.
    - giá trị không phải là {{domxref("Sanitizer")}}, {{domxref("SanitizerConfig")}}, hoặc chuỗi.

## Mô tả

Phương thức **`setHTML()`** cung cấp một cách an toàn trước XSS để phân tích cú pháp và làm sạch một chuỗi HTML rồi dùng nó để thay thế cây hiện có trong Shadow DOM.

`setHTML()` loại bỏ mọi phần tử HTML không được phép bởi cấu hình sanitizer, và tiếp tục loại bỏ mọi phần tử hoặc thuộc tính không an toàn trước XSS, bất kể chúng có được sanitizer cho phép hay không.

Nếu không chỉ định sanitizer trong tham số `options.sanitizer`, `setHTML()` sẽ được dùng với [cấu hình sanitizer mặc định](/en-US/docs/Web/API/HTML_Sanitizer_API/Default_sanitizer_configuration). Cấu hình này phù hợp với phần lớn các trường hợp sử dụng vì nó ngăn các cuộc tấn công XSS, cũng như các cuộc tấn công khác như clickjacking hoặc spoofing.

Có thể chỉ định một `Sanitizer` hoặc `SanitizerConfig` tùy chỉnh để chọn phần tử, thuộc tính và comment nào được phép hoặc bị loại bỏ. Lưu ý rằng ngay cả khi các tùy chọn không an toàn được sanitizer cho phép, chúng vẫn sẽ bị loại bỏ khi dùng phương thức này (nó loại bỏ cùng các phần tử như một sanitizer mà trên đó đã gọi {{domxref('Sanitizer.removeUnsafe()')}}).

`setHTML()` nên được dùng thay vì {{domxref("ShadowRoot.innerHTML")}} để chèn các chuỗi HTML không đáng tin cậy vào shadow DOM. Nó cũng nên được dùng thay vì {{domxref("ShadowRoot.setHTMLUnsafe()")}}, trừ khi có nhu cầu cụ thể phải cho phép các phần tử và thuộc tính không an toàn.

Lưu ý rằng vì phương thức này luôn làm sạch chuỗi đầu vào khỏi các phần tử không an toàn trước XSS, nó không được bảo vệ hay xác thực bằng [Trusted Types API](/en-US/docs/Web/API/Trusted_Types_API).

## Ví dụ

### Cách dùng cơ bản

Ví dụ này cho thấy một số cách bạn có thể dùng `setHTML()` để làm sạch và chèn một chuỗi HTML.

Trước tiên, chúng ta sẽ tạo {{domxref("ShadowRoot")}} cần thao tác. Nó có thể được tạo theo lập trình bằng {{domxref("Element.attachShadow()")}}, nhưng trong ví dụ này chúng ta sẽ tạo root theo kiểu khai báo.

```html
<div id="host">
  <template shadowrootmode="open">
    <span>A span element in the shadow DOM</span>
  </template>
</div>
```

Chúng ta có thể lấy shadow root từ phần tử `#host` như sau:

```js
const shadow = document.querySelector("#host").shadowRoot;
```

Đoạn mã dưới đây cho thấy cách gọi `setHTML()` với một chuỗi và các sanitizer khác nhau để lọc và chèn HTML vào shadow root.

```js
// Định nghĩa chuỗi HTML chưa được làm sạch
const unsanitizedString = "abc <script>alert(1)<" + "/script> def";

// setHTML() với sanitizer mặc định
shadow.setHTML(unsanitizedString);

// Định nghĩa Sanitizer tùy chỉnh và dùng trong setHTML()
// Điều này chỉ cho phép các phần tử: <div>, <p>, <span> (<script> là không an toàn và sẽ bị loại bỏ)
const sanitizer1 = new Sanitizer({ elements: ["div", "p", "span", "script"] });
shadow.setHTML(unsanitizedString, { sanitizer: sanitizer1 });

// Định nghĩa SanitizerConfig tùy chỉnh trong setHTML()
// Điều này loại bỏ các phần tử <div>, <p>, <span>, <script>, và mọi phần tử/thuộc tính không an toàn khác
shadow.setHTML(unsanitizedString, {
  sanitizer: { removeElements: ["div", "p", "span", "script"] },
});
```

### Ví dụ trực tiếp của `setHTML()`

Ví dụ này cung cấp một minh họa "trực tiếp" của phương thức khi được gọi với các sanitizer khác nhau. Mã định nghĩa các nút mà bạn có thể nhấp để làm sạch và chèn một chuỗi HTML bằng sanitizer mặc định và sanitizer tùy chỉnh tương ứng. Chuỗi gốc và HTML đã được làm sạch được ghi log để bạn có thể kiểm tra kết quả ở mỗi trường hợp.

#### HTML

HTML định nghĩa hai phần tử {{htmlelement("button")}} để áp dụng các sanitizer khác nhau, một nút khác để đặt lại ví dụ, và một {{htmlelement("div")}} chứa declarative shadow root.

```html
<button id="buttonDefault" type="button">Default</button>
<button id="buttonAllowScript" type="button">allowScript</button>
<button id="reload" type="button">Reload</button>

<div id="host">
  <template shadowrootmode="open">
    <span>I am in the shadow DOM </span>
  </template>
</div>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 320px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
  margin: 5px;
}
```

#### JavaScript

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.textContent += text;
}
```

```js hidden
if ("Sanitizer" in window) {
```

Trước hết chúng ta định nghĩa trình xử lý cho nút tải lại.

```js
const reload = document.querySelector("#reload");
reload.addEventListener("click", () => document.location.reload());
```

Sau đó chúng ta định nghĩa chuỗi cần làm sạch, chuỗi này sẽ giống nhau cho mọi trường hợp. Nó chứa phần tử {{htmlelement("script")}} và trình xử lý `onclick`, cả hai đều bị xem là không an toàn trước XSS. Chúng ta cũng lấy biến `shadow`, là handle của shadow root.

```js
// Định nghĩa chuỗi HTML không an toàn
const unsanitizedString = `
  <div>
    <p>Paragraph to inject into shadow DOM.
      <button onclick="alert('You clicked the button!')">Click me</button>
    </p>
    <script src="path/to/a/module.js" type="module"><\/script>
    <p data-id="123">Para with <code>data-</code> attribute</p>
  </div>
`;

const shadow = document.querySelector("#host").shadowRoot;
```

Tiếp theo chúng ta định nghĩa trình xử lý click cho nút đặt shadow root với sanitizer mặc định. Nó sẽ loại bỏ tất cả phần tử không an toàn trước khi chèn chuỗi HTML. Lưu ý rằng bạn có thể xem chính xác các phần tử nào bị loại bỏ trong các ví dụ của constructor [`Sanitizer()`](/en-US/docs/Web/API/Sanitizer/Sanitizer#creating_the_default_sanitizer).

```js
const defaultSanitizerButton = document.querySelector("#buttonDefault");
defaultSanitizerButton.addEventListener("click", () => {
  // Đặt nội dung phần tử bằng sanitizer mặc định
  shadow.setHTML(unsanitizedString);

  // Ghi log HTML trước khi làm sạch và sau khi được chèn
  logElement.textContent =
    "Default sanitizer: remove script element, onclick attribute, data- attribute\n\n";
  log(`\nunsanitized: ${unsanitizedString}`);
  log(`\n\nsanitized: ${shadow.innerHTML}`);
});
```

Trình xử lý click tiếp theo đặt HTML mục tiêu bằng một sanitizer tùy chỉnh chỉ cho phép các phần tử {{htmlelement("div")}}, {{htmlelement("p")}}, và {{htmlelement("script")}}. Lưu ý rằng vì chúng ta đang dùng phương thức `setHTML`, `<script>` cũng sẽ bị loại bỏ!

```js
const allowScriptButton = document.querySelector("#buttonAllowScript");
allowScriptButton.addEventListener("click", () => {
  // Đặt nội dung phần tử bằng sanitizer tùy chỉnh
  const sanitizer1 = new Sanitizer({
    elements: ["div", "p", "script"],
  });
  shadow.setHTML(unsanitizedString, { sanitizer: sanitizer1 });

  // Ghi log HTML trước khi làm sạch và sau khi được chèn
  logElement.textContent =
    "Sanitizer: {elements: ['div', 'p', 'script']}\n Script removed even though allowed\n";
  log(`\nunsanitized: ${unsanitizedString}`);
  log(`\n\nsanitized: ${shadow.innerHTML}`);
});
```

```js hidden
} else {
  log("The HTML Sanitizer API is NOT supported in this browser.");
  // Cung cấp fallback hoặc hành vi thay thế
}
```

#### Kết quả

Nhấp vào các nút "Default" và "allowScript" để xem tác động của sanitizer mặc định và sanitizer tùy chỉnh tương ứng.

Lưu ý rằng vì chúng ta đang dùng một phương thức làm sạch an toàn, trong cả hai trường hợp phần tử `<script>` và trình xử lý `onclick` đều bị loại bỏ, ngay cả khi được sanitizer cho phép một cách rõ ràng. Tuy nhiên, trong khi thuộc tính `data-` bị loại bỏ với sanitizer mặc định, nó vẫn được phép khi chúng ta truyền vào một sanitizer.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
