---
title: "ShadowRoot: phương thức setHTMLUnsafe()"
short-title: setHTMLUnsafe()
slug: Web/API/ShadowRoot/setHTMLUnsafe
page-type: web-api-instance-method
browser-compat: api.ShadowRoot.setHTMLUnsafe
---

{{APIRef("Shadow DOM")}}

> [!WARNING]
> Phương thức này phân tích đầu vào của nó như HTML và ghi kết quả vào DOM.
> Các API như thế này được biết đến như [injection sinks](/en-US/docs/Web/API/Trusted_Types_API#concepts_and_usage), và có thể là một vector cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS) nếu đầu vào ban đầu đến từ kẻ tấn công.
>
> Bạn có thể giảm thiểu rủi ro này bằng cách luôn truyền `TrustedHTML` thay vì chuỗi và [ép buộc trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types).
> Xem [Cân nhắc bảo mật](#security_considerations) để biết thêm thông tin.

> [!NOTE]
> {{domxref("ShadowRoot.setHTML()")}} gần như luôn nên được dùng thay cho phương thức này - trên các trình duyệt hỗ trợ nó - vì nó luôn loại bỏ các phần tử HTML không an toàn trước XSS.

Phương thức **`setHTMLUnsafe()`** của giao diện {{domxref("ShadowRoot")}} có thể được dùng để phân tích đầu vào HTML thành một {{domxref("DocumentFragment")}}, tùy chọn lọc các phần tử và thuộc tính không mong muốn, rồi dùng fragment đó để thay thế cây hiện có trong Shadow DOM.

## Cú pháp

```js-nolint
setHTMLUnsafe(input)
setHTMLUnsafe(input, options)
```

### Tham số

- `input`
  - : Một thể hiện {{domxref("TrustedHTML")}} hoặc một chuỗi định nghĩa HTML sẽ được phân tích cú pháp.
- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn với các tham số tùy chọn sau:
    - `sanitizer` {{optional_inline}}
      - : Một đối tượng {{domxref("Sanitizer")}} hoặc {{domxref("SanitizerConfig")}} xác định phần tử nào trong đầu vào được cho phép hoặc bị loại bỏ. Nó cũng có thể là chuỗi có giá trị `"default"`, áp dụng một `Sanitizer` với [cấu hình sanitizer mặc định](/en-US/docs/Web/API/HTML_Sanitizer_API/Default_sanitizer_configuration) (an toàn trước XSS). Nếu không chỉ định, sẽ không dùng sanitizer nào.

        Lưu ý rằng nếu bạn dùng cùng một cấu hình nhiều lần, thường sẽ hiệu quả hơn khi dùng một `Sanitizer` và sửa đổi nó khi cần.

### Giá trị trả về

Không có (`undefined`).

### Ngoại lệ

- `TypeError`
  - : Được ném ra nếu:
    - `input` được truyền một chuỗi khi [Trusted Types](/en-US/docs/Web/API/Trusted_Types_API) được [ép buộc bởi CSP](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) và không có chính sách mặc định nào được định nghĩa.
    - `options.sanitizer` được truyền:
      - một {{domxref("SanitizerConfig")}} không [hợp lệ](/en-US/docs/Web/API/SanitizerConfig#valid_configuration). Ví dụ, một cấu hình chứa đồng thời cài đặt "allowed" và "removed".
      - chuỗi không có giá trị `"default"`.
      - giá trị không phải là {{domxref("Sanitizer")}}, {{domxref("SanitizerConfig")}}, hoặc chuỗi.

## Mô tả

Phương thức **`setHTMLUnsafe()`** có thể được dùng để phân tích một chuỗi HTML, tùy chọn lọc các phần tử và thuộc tính không mong muốn, rồi dùng nó để thay thế Shadow DOM hiện có.

Không giống như {{domxref("ShadowRoot.innerHTML")}}, các [declarative shadow root](/en-US/docs/Web/HTML/Reference/Elements/template#declarative_shadow_dom) trong đầu vào sẽ được phân tích vào DOM. Nếu chuỗi HTML xác định nhiều hơn một [declarative shadow root](/en-US/docs/Web/HTML/Reference/Elements/template#declarative_shadow_dom) trong một shadow host cụ thể thì chỉ shadow root đầu tiên được tạo ra - các khai báo sau sẽ được phân tích thành các phần tử `<template>` bên trong shadow root đó.

`setHTMLUnsafe()` không thực hiện làm sạch nào theo mặc định. Nếu không truyền sanitizer nào làm tham số, toàn bộ phần tử HTML trong đầu vào sẽ được chèn vào.

### Cân nhắc bảo mật

Hậu tố "Unsafe" trong tên phương thức cho biết rằng nó không cưỡng chế việc loại bỏ mọi phần tử HTML không an toàn trước XSS (khác với {{domxref("ShadowRoot.setHTML()")}}). Mặc dù nó có thể làm như vậy nếu được dùng với một sanitizer phù hợp, nhưng nó không bắt buộc phải dùng sanitizer hiệu quả, hoặc thậm chí không dùng sanitizer nào cả! Vì vậy, phương thức này là một vector tiềm năng cho các cuộc tấn công [cross-site scripting (XSS)](/en-US/docs/Web/Security/Attacks/XSS), nơi các chuỗi có thể không an toàn do người dùng cung cấp được chèn vào DOM mà không được làm sạch trước.

Bạn nên giảm thiểu rủi ro này bằng cách luôn truyền đối tượng {{domxref("TrustedHTML")}} thay vì chuỗi, và [ép buộc trusted types](/en-US/docs/Web/API/Trusted_Types_API#using_a_csp_to_enforce_trusted_types) bằng chỉ thị CSP [`require-trusted-types-for`](/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/require-trusted-types-for). Điều này đảm bảo đầu vào được đưa qua một hàm chuyển đổi, hàm này có cơ hội [làm sạch](/en-US/docs/Web/Security/Attacks/XSS#sanitization) đầu vào để loại bỏ markup có thể nguy hiểm (như phần tử {{htmlelement("script")}} và các thuộc tính xử lý sự kiện), trước khi nó được chèn vào.

Sử dụng `TrustedHTML` giúp có thể kiểm tra và xác minh rằng mã làm sạch chỉ tồn tại ở một vài nơi, thay vì rải khắp mọi injection sink.
Khi dùng `TrustedHTML`, bạn không cần truyền sanitizer vào phương thức.

Nếu vì bất kỳ lý do nào bạn không thể dùng `TrustedHTML` (hoặc tốt hơn nữa là `setHTML()`) thì lựa chọn an toàn tiếp theo là dùng `setHTMLUnsafe()` với [cấu hình sanitizer mặc định](/en-US/docs/Web/API/HTML_Sanitizer_API/Default_sanitizer_configuration) an toàn trước XSS.

### Khi nào nên dùng `setHTMLUnsafe()`?

`setHTMLUnsafe()` gần như không bao giờ nên được dùng nếu {{domxref("ShadowRoot.setHTML()")}} khả dụng, vì rất hiếm khi (nếu có) đầu vào HTML do người dùng cung cấp lại cần chứa các phần tử không an toàn trước XSS.
Không chỉ `setHTML()` an toàn, mà nó còn giúp bạn không phải cân nhắc đến trusted types.

Dùng `setHTMLUnsafe()` có thể phù hợp nếu:

- Bạn không thể dùng `setHTML()` hoặc trusted types (vì bất kỳ lý do gì) và bạn muốn lọc một cách an toàn nhất có thể.
  Trong trường hợp này, bạn có thể dùng `setHTMLUnsafe()` với [cấu hình sanitizer mặc định](/en-US/docs/Web/API/HTML_Sanitizer_API/Default_sanitizer_configuration) để lọc các phần tử không an toàn trước XSS và các phần tử có vấn đề khác.
- Bạn không thể dùng `setHTML()` và đầu vào có thể chứa declarative shadow roots, nên bạn không thể dùng {{domxref("ShadowRoot.innerHTML")}}.
- Bạn có một trường hợp đặc biệt mà bạn buộc phải cho phép đầu vào HTML chứa một tập hợp đã biết gồm các phần tử HTML không an toàn.

  Trong trường hợp này bạn không thể dùng `setHTML()` vì nó loại bỏ mọi phần tử không an toàn.
  Bạn có thể dùng `setHTMLUnsafe()` không kèm sanitizer hoặc `innerHTML`, nhưng như vậy sẽ cho phép toàn bộ các phần tử không an toàn.

  Một lựa chọn tốt hơn ở đây là gọi `setHTMLUnsafe()` với sanitizer chỉ cho phép những phần tử và thuộc tính nguy hiểm mà thực sự cần.
  Dù vẫn không an toàn, nó vẫn an toàn hơn việc cho phép tất cả.

Cho điểm cuối cùng, hãy xem xét một tình huống trong đó mã của bạn dựa vào việc sử dụng được các trình xử lý `onclick` không an toàn. Đoạn mã sau cho thấy tác động của các phương thức và sanitizer khác nhau trong trường hợp này.

```js
const shadow = document.querySelector("#host").shadowRoot;

const input = "<img src=x onclick=alert('onclick') onerror=alert('onerror')>";

// An toàn - loại bỏ mọi phần tử không an toàn trước XSS.
shadow.setHTML(input);

// Không loại bỏ các thuộc tính xử lý sự kiện
shadow.setHTMLUnsafe(input);
shadow.innerHTML = input;

// An toàn - loại bỏ mọi phần tử không an toàn trước XSS.
const configSafe = new Sanitizer();
shadow.setHTMLUnsafe(input, { sanitizer: configSafe });

// Loại bỏ mọi phần tử không an toàn trước XSS trừ `onclick`
const configLessSafe = new Sanitizer();
config.allowAttribute("onclick");
shadow.setHTMLUnsafe(input, { sanitizer: configLessSafe });
```

## Ví dụ

### setHTMLUnsafe() với Trusted Types

Để giảm thiểu rủi ro XSS, trước tiên chúng ta sẽ tạo một đối tượng `TrustedHTML` từ chuỗi chứa HTML, rồi truyền đối tượng đó cho `setHTMLUnsafe()`. Vì trusted types chưa được hỗ trợ trên tất cả trình duyệt, chúng ta định nghĩa [trusted types tinyfill](/en-US/docs/Web/API/Trusted_Types_API#trusted_types_tinyfill). Nó đóng vai trò thay thế trong suốt cho Trusted Types JavaScript API:

```js
if (typeof trustedTypes === "undefined")
  trustedTypes = { createPolicy: (n, rules) => rules };
```

Tiếp theo, chúng ta tạo một {{domxref("TrustedTypePolicy")}} định nghĩa {{domxref("TrustedTypePolicy/createHTML", "createHTML()")}} để chuyển đổi chuỗi đầu vào thành các thể hiện {{domxref("TrustedHTML")}}. Thông thường, các triển khai `createHTML()` sẽ dùng một thư viện như [DOMPurify](https://github.com/cure53/DOMPurify) để làm sạch đầu vào như minh họa dưới đây:

```js
const policy = trustedTypes.createPolicy("my-policy", {
  createHTML: (input) => DOMPurify.sanitize(input),
});
```

Sau đó chúng ta dùng `policy` này để tạo một đối tượng `TrustedHTML` từ chuỗi đầu vào có thể không an toàn:

```js
// Chuỗi có khả năng độc hại
const untrustedString = "abc <script>alert(1)<" + "/script> def";
// Tạo thể hiện TrustedHTML bằng policy
const trustedHTML = policy.createHTML(untrustedString);
```

Bây giờ đã có `trustedHTML`, đoạn mã dưới đây cho thấy bạn có thể dùng nó với `setHTMLUnsafe()` như thế nào. Trước tiên, chúng ta tạo {{domxref("ShadowRoot")}} mà mình muốn thao tác. Nó có thể được tạo theo lập trình bằng {{domxref("Element.attachShadow()")}}, nhưng trong ví dụ này chúng ta sẽ tạo root theo kiểu khai báo.

```html
<div id="host">
  <template shadowrootmode="open">
    <span>A span element in the shadow DOM</span>
  </template>
</div>
```

Sau đó chúng ta lấy shadow root từ phần tử `#host` và gọi `setHTMLUnsafe()`. Đầu vào đã đi qua hàm chuyển đổi, nên chúng ta không truyền sanitizer cho phương thức.

```js
const shadow = document.querySelector("#host").shadowRoot;
// setHTMLUnsafe() không có sanitizer (không lọc)
shadow.setHTMLUnsafe(trustedHTML);
```

### Dùng setHTMLUnsafe() mà không có Trusted Types

Ví dụ này minh họa trường hợp chúng ta không dùng trusted types, nên sẽ truyền các đối số sanitizer.

Đoạn mã trước tiên tạo một chuỗi không đáng tin cậy và cho thấy một số cách sanitizer có thể được truyền vào phương thức.

```js
// Chuỗi có khả năng độc hại
const untrustedString = "abc <script>alert(1)<" + "/script> def";

// Lấy shadow root element
const shadow = document.querySelector("#host").shadowRoot;

// Định nghĩa Sanitizer tùy chỉnh và dùng trong setHTMLUnsafe()
// Điều này chỉ cho phép các phần tử: div, p, button, script
const sanitizer1 = new Sanitizer({
  elements: ["div", "p", "button", "script"],
});
shadow.setHTMLUnsafe(untrustedString, { sanitizer: sanitizer1 });

// Định nghĩa SanitizerConfig tùy chỉnh trong setHTMLUnsafe()
// Xóa phần tử <script> nhưng cho phép các phần tử không an toàn khác.
shadow.setHTMLUnsafe(untrustedString, {
  sanitizer: { removeElements: ["script"] },
});
```

### Ví dụ trực tiếp của `setHTMLUnsafe()`

Ví dụ này cung cấp một minh họa "trực tiếp" của phương thức khi được gọi với các sanitizer khác nhau. Mã định nghĩa các nút mà bạn có thể nhấp để chèn một chuỗi HTML. Một nút chèn HTML mà không làm sạch gì cả, và nút thứ hai dùng một sanitizer tùy chỉnh cho phép các phần tử `<script>` nhưng không cho phép các mục không an toàn khác. Chuỗi gốc và HTML đã chèn được ghi log để bạn có thể kiểm tra kết quả ở mỗi trường hợp.

> [!NOTE]
> Vì chúng ta muốn minh họa cách dùng đối số sanitizer, đoạn mã sau chèn một chuỗi thay vì một trusted type. Trong mã sản xuất, bạn không nên làm như vậy.

#### HTML

HTML định nghĩa hai phần tử {{htmlelement("button")}} để chèn HTML không có sanitizer và với một sanitizer tùy chỉnh (tương ứng), một nút khác để đặt lại ví dụ, và một {{htmlelement("div")}} chứa declarative shadow root.

```html
<button id="buttonNoSanitizer" type="button">None</button>
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

Sau đó chúng ta định nghĩa chuỗi đầu vào sẽ được chèn vào shadow root, chuỗi này sẽ giống nhau cho mọi trường hợp. Chuỗi này chứa phần tử {{htmlelement("script")}} và trình xử lý `onclick`, cả hai đều bị xem là không an toàn trước XSS. Chúng ta cũng lấy biến `shadow`, là handle của shadow root.

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

Tiếp theo chúng ta định nghĩa trình xử lý click cho nút đặt shadow root bằng `setHTMLUnsafe()` mà không truyền sanitizer. Vì không có sanitizer, ta kỳ vọng HTML được chèn sẽ khớp với chuỗi đầu vào.

```js
const buttonNoSanitizer = document.querySelector("#buttonNoSanitizer");
buttonNoSanitizer.addEventListener("click", () => {
  // Đặt nội dung của phần tử mà không có sanitizer
  shadow.setHTMLUnsafe(unsanitizedString);

  // Ghi log HTML trước khi làm sạch và sau khi được chèn
  logElement.textContent = "No sanitizer\n\n";
  log(`\nunsanitized: ${unsanitizedString}`);
  log(`\n\nsanitized: ${shadow.innerHTML}`);
});
```

Trình xử lý click tiếp theo đặt HTML mục tiêu bằng một sanitizer tùy chỉnh chỉ cho phép các phần tử {{htmlelement("div")}}, {{htmlelement("p")}}, và {{htmlelement("script")}}.

```js
const allowScriptButton = document.querySelector("#buttonAllowScript");
allowScriptButton.addEventListener("click", () => {
  // Đặt nội dung của phần tử bằng sanitizer tùy chỉnh
  const sanitizer1 = new Sanitizer({
    elements: ["div", "p", "script"],
  });
  shadow.setHTMLUnsafe(unsanitizedString, { sanitizer: sanitizer1 });

  // Ghi log HTML trước khi làm sạch và sau khi được chèn
  logElement.textContent = "Sanitizer: {elements: ['div', 'p', 'script']}\n";
  log(`\n\nunsanitized: ${unsanitizedString}`);
  log(`\nsanitized: ${shadow.innerHTML}`);
});
```

```js hidden
} else {
  log("The HTML Sanitizer API is NOT supported in this browser.");
  // Cung cấp fallback hoặc hành vi thay thế
}
```

#### Kết quả

Nhấp vào các nút "None" và "allowScript" để xem tác động của việc không dùng sanitizer và dùng một sanitizer tùy chỉnh tương ứng.

Khi bạn nhấp vào nút "None", bạn sẽ thấy đầu vào và đầu ra khớp nhau, vì không áp dụng sanitizer.
Khi bạn nhấp vào nút "allowScript", phần tử `<script>` vẫn còn, nhưng phần tử `<button>` bị loại bỏ.
Với cách này, bạn có thể tạo HTML an toàn, nhưng bạn không bị buộc phải làm vậy.

{{EmbedLiveSample("setHTMLUnsafe() live example","100","450px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ShadowRoot.setHTML()")}}
- {{domxref("ShadowRoot.innerHTML")}}
- {{domxref("Element.setHTML()")}} và {{domxref("Element.setHTMLUnsafe()")}}
- {{domxref("Document.parseHTML_static", "Document.parseHTML()")}} và {{domxref("Document.parseHTMLUnsafe_static", "Document.parseHTMLUnsafe()")}}
- [HTML Sanitizer API](/en-US/docs/Web/API/HTML_Sanitizer_API)
