---
title: "Sanitizer: phương thức allowElement()"
short-title: allowElement()
slug: Web/API/Sanitizer/allowElement
page-type: web-api-instance-method
browser-compat: api.Sanitizer.allowElement
---

{{APIRef("HTML Sanitizer API")}}

Phương thức **`allowElement()`** của giao diện {{domxref("Sanitizer")}} đặt rằng phần tử được chỉ định được phép trong đầu ra khi bộ làm sạch được dùng.

Nó cũng có thể được dùng để chỉ định các mảng cho phép hoặc xóa thuộc tính theo từng phần tử trên các phiên bản `Sanitizer` với [cấu hình cho phép](/en-US/docs/Web/API/HTML_Sanitizer_API#allow_configurations).

## Cú pháp

```js-nolint
allowElement(element)
```

### Tham số

- `element`
  - : Một chuỗi cho biết tên của phần tử được phép, hoặc một đối tượng với các thuộc tính sau:
    - `name`
      - : Một chuỗi chứa tên của phần tử.
    - `namespace` {{optional_inline}}
      - : Một chuỗi chứa không gian tên của phần tử.
        Không gian tên mặc định là `"http://www.w3.org/1999/xhtml"`.
    - `attributes` {{optional_inline}}
      - : Một mảng cho biết các thuộc tính được phép trên phần tử (được phép) này khi làm sạch HTML.

        Mỗi thuộc tính có thể được chỉ định theo tên (một chuỗi), hoặc dưới dạng đối tượng với các thuộc tính sau:
        - `name`
          - : Một chuỗi chứa tên của thuộc tính.
        - `namespace` {{optional_inline}}
          - : Một chuỗi chứa không gian tên của thuộc tính, mặc định là `null`.

    - `removeAttributes` {{optional_inline}}
      - : Một mảng cho biết các thuộc tính cần xóa trên phần tử (được phép) này khi làm sạch HTML.

        Mỗi thuộc tính có thể được chỉ định theo tên (một chuỗi), hoặc dưới dạng đối tượng với các thuộc tính sau:
        - `name`
          - : Một chuỗi chứa tên của thuộc tính.
        - `namespace` {{optional_inline}}
          - : Một chuỗi chứa không gian tên của thuộc tính, mặc định là `null`.

### Giá trị trả về

`true` nếu thao tác thay đổi cấu hình để cho phép phần tử, và `false` nếu cấu hình không thay đổi (thường là vì phần tử đã được phép, nhưng có thể vì không thể thực hiện thay đổi).

Lưu ý rằng `false` có thể được trả về nếu cấu hình nội bộ:

- định nghĩa mảng [`elements`](/en-US/docs/Web/API/SanitizerConfig#elements) và phần tử đã có mặt (không cần thêm lại).
- định nghĩa mảng [`removeElements`](/en-US/docs/Web/API/SanitizerConfig#removeelements) và phần tử được chỉ định không có mặt (và do đó đã không bị lọc).
- định nghĩa mảng [`removeElements`](/en-US/docs/Web/API/SanitizerConfig#removeelements) và cố gắng cho phép phần tử với các thuộc tính theo từng phần tử.
  Thao tác này không được hỗ trợ vì trong [cấu hình hợp lệ](/en-US/docs/Web/API/SanitizerConfig#valid_configuration) bạn không thể có cả mảng `removeElements` và `elements`, và các thuộc tính theo từng phần tử được thêm vào mảng `elements`.
  Lời gọi sẽ không thay đổi cấu hình và sẽ tạo cảnh báo console.

## Mô tả

Phương thức `allowElement()` đặt rằng phần tử được chỉ định được phép trong đầu ra khi bộ làm sạch được dùng.

Phương thức có thể được dùng với [cấu hình cho phép](/en-US/docs/Web/API/HTML_Sanitizer_API#allow_configurations) hoặc [cấu hình xóa](/en-US/docs/Web/API/HTML_Sanitizer_API#remove_configurations).
Nếu dùng với cấu hình cho phép, phần tử được chỉ định sẽ được thêm vào mảng `elements`.
Nếu dùng với cấu hình xóa, phần tử sẽ bị xóa khỏi mảng `removeElements` (nếu có).
Nếu có, nó cũng sẽ bị xóa khỏi mảng [`replaceWithChildrenElements`](/en-US/docs/Web/API/SanitizerConfig#replacewithchildrenelements).

Ví dụ, mã sau tạo `Sanitizer` cho phép và cho phép các phần tử {{htmlelement("span")}} rồi gọi `allowElement()` để thêm cho phép các phần tử {{htmlelement("b")}}.

```js
const sanitizer = new Sanitizer({ elements: ["span"] });
sanitizer.allowElement("b");
```

Khi dùng `Sanitizer` với cấu hình cho phép, bạn cũng có thể dùng phương thức để chỉ định các thuộc tính được phép hoặc không được phép trên các phần tử thuộc loại đó.
Ví dụ, mã sau trước tiên tạo cấu hình bộ làm sạch cho phép bằng cách chỉ định mảng `elements` (tạo `Sanitizer` với đối tượng rỗng hoặc không có đối tượng cấu hình cũng sẽ tạo ra "cấu hình cho phép").
Sau đó nó gọi `allowElement()` để cho phép các phần tử `div`, cho phép thuộc tính `class` trên các phần tử `<div>`, và xóa thuộc tính `lang` trên các phần tử `<div>`.

```js
const sanitizer = new Sanitizer({ elements: ["span"] });
sanitizer.allowElement({
  name: "div",
  attributes: ["class"],
  removeAttributes: ["lang"],
});
```

Nếu bạn cần cả mảng add-attribute và remove-attribute theo từng phần tử như trên, chúng phải được thêm trong một lần gọi phương thức này.
Nếu bạn làm điều này trong hai lần gọi, lần gọi thứ hai sẽ thay thế định nghĩa phần tử được thêm trong lần gọi đầu tiên.

Khi dùng `Sanitizer` với [cấu hình xóa](/en-US/docs/Web/API/HTML_Sanitizer_API#remove_configurations), mã tương tự để thêm mảng cho phép hoặc xóa thuộc tính theo từng phần tử sẽ tạo cảnh báo console và trả về `false`.
Điều này là vì nội bộ bộ làm sạch không có mảng `elements` cần thiết để chỉ định các thuộc tính theo từng phần tử và sẽ không thay đổi cấu hình.

```js example-bad
// Định nghĩa Sanitizer với cấu hình xóa
// bằng cách chỉ định removeElements trong cấu hình
const sanitizer = new Sanitizer({ removeElements: [] });
// Trả về false và tạo cảnh báo console
sanitizer.allowElement({
  name: "div",
  attributes: ["class"],
  removeAttributes: ["lang"],
});
```

## Ví dụ

### Cách cho phép các phần tử

Ví dụ này cho thấy cách `allowElement()` được dùng để thêm phần tử vào [`cấu hình elements`](/en-US/docs/Web/API/SanitizerConfig#elements) của bộ làm sạch (danh sách các phần tử được phép).

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 400px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.textContent = text;
}
```

#### JavaScript

Mã trước tiên tạo một đối tượng `Sanitizer` mới ban đầu cho phép các phần tử {{htmlelement("div")}} và {{htmlelement("script")}}.
Sau đó nó gọi `allowElement()` để thêm phần tử {{htmlelement("p")}} được chỉ định dưới dạng tham số chuỗi, và sau đó thêm phần tử {{htmlelement("span")}} được chỉ định dưới dạng đối tượng.
Sau đó chúng tôi lấy và ghi nhật ký cấu hình.

```js hidden
if ("Sanitizer" in window) {
```

```js
// Tạo bộ làm sạch sử dụng SanitizerConfig
const sanitizer = new Sanitizer({
  elements: ["div", "script"],
});

// Cho phép <p> bằng cách chỉ định chuỗi
sanitizer.allowElement("p");

// Cho phép <span> bằng cách chỉ định đối tượng
sanitizer.allowElement({ name: "span" });

let sanitizerConfig = sanitizer.get();
log(JSON.stringify(sanitizerConfig, null, 2));
```

```js hidden
} else {
  log("The HTML Sanitizer API is NOT supported in this browser.");
}
```

#### Kết quả

Cấu hình cuối cùng được ghi nhật ký bên dưới.
Bao gồm các phần tử gốc (`<div>` và `<script>`) và hai phần tử được thêm với `allowElement()` (`<p>` và `<span>`).

{{EmbedLiveSample("How to allow elements","100","480px")}}

### Cho phép các phần tử đã được phép hoặc đã bị xóa

Ví dụ này cho thấy hiệu ứng của việc dùng `allowElement()` để thêm các phần tử đã được phép, hoặc nằm trong cấu hình là "cần xóa".

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 400px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.textContent = text;
}
```

#### JavaScript

Mã trước tiên tạo một đối tượng `Sanitizer` mới ban đầu cho phép các phần tử {{htmlelement("div")}} (xóa các thuộc tính khác ngoài `id`) và cũng thay thế các phần tử {{htmlelement("span")}} bằng các phần tử con.

Sau đó nó gọi `allowElement()`, trước tiên để thêm phần tử {{htmlelement("div")}} xóa các thuộc tính `style`.
Vì phần tử `<div>` đã được phép, nó bị xóa khỏi [`cấu hình elements`](/en-US/docs/Web/API/SanitizerConfig#elements) và định nghĩa phần tử `<div>` được thêm vào.

Phần tử {{htmlelement("span")}} sau đó được thêm vào danh sách cho phép, xóa nó khỏi [danh sách cấu hình `replaceWithChildrenElements`](/en-US/docs/Web/API/SanitizerConfig#replacewithchildrenelements).

```js hidden
if ("Sanitizer" in window) {
```

```js
// Tạo bộ làm sạch sử dụng SanitizerConfig
const sanitizer = new Sanitizer({
  elements: [{ name: "div", attributes: [{ name: "id" }] }],
  replaceWithChildrenElements: ["span"],
});

// Cho phép các phần tử <div>.
// Cho phép các phần tử id nhưng xóa các thuộc tính style của chúng
sanitizer.allowElement({
  name: "div",
  removeAttributes: ["style"],
});

// Cho phép các phần tử <span>
sanitizer.allowElement("span");

let sanitizerConfig = sanitizer.get();
log(JSON.stringify(sanitizerConfig, null, 2));
```

```js hidden
} else {
  log("The HTML Sanitizer API is NOT supported in this browser.");
}
```

#### Kết quả

Cấu hình cuối cùng được ghi nhật ký và hiển thị bên dưới.
Từ nhật ký chúng ta có thể thấy rằng bộ lọc ban đầu cho phần tử `<div>` đã bị xóa và định nghĩa mới được thêm vào danh sách `elements`.
Việc thêm phần tử `<span>` vào danh sách `elements` đã xóa nó khỏi danh sách `replaceWithChildrenElements`.

{{EmbedLiveSample("Allowing elements that are already allowed or removed","100","480px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
