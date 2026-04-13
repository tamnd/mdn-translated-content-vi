---
title: "Sanitizer: hàm khởi tạo Sanitizer()"
short-title: Sanitizer()
slug: Web/API/Sanitizer/Sanitizer
page-type: web-api-constructor
browser-compat: api.Sanitizer.Sanitizer
---

{{APIRef("HTML Sanitizer API")}}

Hàm khởi tạo **`Sanitizer()`** tạo một đối tượng {{domxref("Sanitizer")}} mới, có thể được dùng để lọc các phần tử và thuộc tính không mong muốn từ HTML hoặc tài liệu trước khi chúng được chèn/phân tích vào DOM.

## Cú pháp

```js-nolint
new Sanitizer()
new Sanitizer(configuration)
```

### Tham số

- `configuration` {{optional_inline}}
  - : Một {{domxref("SanitizerConfig")}} định nghĩa [cấu hình hợp lệ](/en-US/docs/Web/API/SanitizerConfig#valid_configuration), hoặc chuỗi `"default"` để chỉ ra [cấu hình bộ làm sạch mặc định](/en-US/docs/Web/API/HTML_Sanitizer_API/Default_sanitizer_configuration).
    "Cấu hình rỗng" (`{}`) cũng có thể được truyền vào, và dẫn đến [cấu hình xóa](/en-US/docs/Web/API/HTML_Sanitizer_API#remove_configurations) với các mảng rỗng.

    Nếu bị bỏ qua, hàm khởi tạo trả về `Sanitizer` với cấu hình mặc định.

### Giá trị trả về

Một phiên bản của đối tượng {{domxref("Sanitizer")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Tham số `configuration` được truyền một trong các giá trị sau:
    - Một {{domxref("SanitizerConfig")}} không phải là cấu hình hợp lệ.
      Ví dụ, một cấu hình bao gồm cả các cài đặt cấu hình "được phép" và "bị xóa".
    - Một chuỗi không có giá trị `"default"`.

## Mô tả

Hàm khởi tạo tạo một đối tượng {{domxref("Sanitizer")}} mới, có thể được dùng để lọc các phần tử và thuộc tính không mong muốn từ HTML hoặc tài liệu trước khi chúng được chèn/phân tích vào DOM.

[Cấu hình bộ làm sạch mặc định](/en-US/docs/Web/API/HTML_Sanitizer_API/Default_sanitizer_configuration) là [bộ làm sạch cho phép](/en-US/docs/Web/API/HTML_Sanitizer_API#allow_configurations) bỏ qua các phần tử và thuộc tính không an toàn XSS, cùng với các phần tử và thuộc tính khác có thể được dùng trong các cuộc tấn công khác như clickjacking và giả mạo.
Cấu hình này phù hợp cho phần lớn các trường hợp sử dụng làm sạch.
Nó được tạo nếu `"default"` hoặc không có đối tượng nào được truyền vào hàm khởi tạo.

Hàm khởi tạo có thể được truyền {{domxref("SanitizerConfig")}} với [cấu hình hợp lệ](/en-US/docs/Web/API/SanitizerConfig#valid_configuration) để tùy chỉnh hành vi bộ làm sạch.

Cấu hình hợp lệ có thể chỉ định mảng `elements` hoặc `removeElements` (nhưng không phải cả hai) và mảng `attributes` hoặc `removeAttributes` (nhưng không phải cả hai).
Trong hầu hết các trường hợp, không quan trọng bạn dùng mảng nào vì, ví dụ, phương thức {{domxref("Sanitizer/allowAttribute","allowAttribute()")}} có thể triển khai cùng hành vi bằng cách thêm thuộc tính vào mảng `attributes` hoặc xóa nó khỏi mảng `removeAttributes`.
Điều chính cần lưu ý là nếu bạn có cấu hình với `removeElements` thì bạn không thể có các thuộc tính theo từng phần tử, vì chúng phải được định nghĩa trong mảng `elements`.

## Ví dụ

### Tạo bộ làm sạch mặc định

Ví dụ này cho thấy cách bạn có thể tạo `Sanitizer` mặc định và ghi nhật ký đối tượng cấu hình kết quả.

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

#### JavaScript

Mã trước tiên kiểm tra xem giao diện `Sanitizer` có được hỗ trợ không.
Sau đó tạo `Sanitizer` mặc định, không truyền tùy chọn, rồi lấy và ghi nhật ký cấu hình.

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.textContent = text;
}
```

```js hidden
if ("Sanitizer" in window) {
```

```js
// Tạo bộ làm sạch mặc định
const sanitizer = new Sanitizer();

// Lấy và ghi nhật ký cấu hình (mặc định)
const defaultConfig = sanitizer.get();
log(JSON.stringify(defaultConfig, null, 2));
```

```js hidden
} else {
  log("The HTML Sanitizer API is NOT supported in this browser.");
}
```

#### Kết quả

Đầu ra được ghi nhật ký bên dưới.
Lưu ý rằng cấu hình mặc định là cấu hình cho phép, có cả mảng `elements` và `attributes` chứa các phần tử được phép khi bộ làm sạch được dùng.

{{EmbedLiveSample("Creating the default sanitizer","100","480px")}}

### Tạo `Sanitizer` và dùng nó với `setHTML()`

Ví dụ này cho thấy cách bạn có thể tạo và dùng bộ làm sạch tùy chỉnh trong phương thức chèn DOM HTML an toàn.

#### HTML

Ở đây chúng tôi định nghĩa hai phần tử {{htmlelement("pre")}} trong đó chúng tôi sẽ hiển thị cả HTML đã làm sạch và chưa làm sạch.

```html
<pre id="unmodified"></pre>
<pre id="setHTML"></pre>
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

Mã sau kiểm tra xem giao diện `Sanitizer` có được hỗ trợ không.
Sau đó định nghĩa một chuỗi "HTML không an toàn", chứa cả các phần tử an toàn như {{htmlelement("p")}} và {{htmlelement("span")}}, và các phần tử không an toàn XSS như {{htmlelement("script")}}

Sau đó chúng tôi tạo đối tượng `Sanitizer` với {{domxref("SanitizerConfig")}} cho phép các phần tử HTML: {{htmlelement("div")}}, {{htmlelement("p")}}, {{htmlelement("span")}} và {{htmlelement("script")}}.
Bộ làm sạch được dùng với chuỗi không an toàn trong {{domxref("Element.setHTML()")}}.
Cả chuỗi gốc và đã làm sạch đều được hiển thị dưới dạng nút văn bản.

```js hidden
if ("Sanitizer" in window) {
```

```js
// Định nghĩa chuỗi HTML không an toàn
const unsafeHTMLString = `
  <div>
    <p>This is a paragraph. <span onclick="alert('You clicked the span!')">Click me</span></p>
    <script src="path/to/amodule.js" type="module"
  </div>
`;

// Đặt chuỗi không an toàn như nút văn bản của phần tử đầu tiên
const unmodifiedElement = document.querySelector("#unmodified");
unmodifiedElement.innerText = unsafeHTMLString;

// Tạo bộ làm sạch sử dụng SanitizerConfig cho phép script (và các phần tử khác)
const sanitizer = new Sanitizer({ elements: ["div", "p", "span", "script"] });

// Dùng bộ làm sạch để đặt HTML của phần tử thứ hai bằng phương thức an toàn
const setHTMLElement = document.querySelector("#setHTML");
setHTMLElement.setHTML(unsafeHTMLString, { sanitizer });

// Lấy HTML đó và đặt lại vào phần tử như nút văn bản
// (để chúng ta có thể thấy các phần tử)
setHTMLElement.innerText = setHTMLElement.innerHTML;

// Ghi nhật ký cấu hình
const sanitizerConfig = sanitizer.get();
log(JSON.stringify(sanitizerConfig, null, 2));
```

```js hidden
} else {
  log("The HTML Sanitizer API is NOT supported in this browser.");
}
```

#### Kết quả

Chuỗi gốc và HTML đã làm sạch được phân tích vào DOM được hiển thị bên dưới.
Lưu ý rằng mặc dù bộ làm sạch cho phép các phần tử `<script>`, chúng bị xóa khỏi HTML được chèn khi dùng {{domxref("Element.setHTML()")}}.
Lưu ý thêm rằng cấu hình bao gồm cả tên của các phần tử và không gian tên của chúng.

{{EmbedLiveSample("Creating the default sanitizer","100","650px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
