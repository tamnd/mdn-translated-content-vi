---
title: "Sanitizer: phương thức get()"
short-title: get()
slug: Web/API/Sanitizer/get
page-type: web-api-instance-method
browser-compat: api.Sanitizer.get
---

{{APIRef("HTML Sanitizer API")}}

Phương thức **`get()`** của giao diện {{domxref("Sanitizer")}} trả về một phiên bản từ điển {{domxref('SanitizerConfig')}} đại diện cho cấu hình `Sanitizer` hiện tại.

Điều này có thể được dùng để tạo một bộ làm sạch được sửa đổi nhẹ so với mặc định; bằng cách trước tiên lấy rồi sửa đổi cấu hình `Sanitizer` mặc định, và sau đó dùng nó để xây dựng một `Sanitizer` mới.

Cấu hình được trả về cũng có thể được dùng để kiểm tra cấu hình, và có thể được truyền trực tiếp cho các hàm phân tích HTML.
Tuy nhiên, lưu ý rằng sẽ hiệu quả hơn khi truyền {{domxref("Sanitizer")}} thay vì từ điển cấu hình, đặc biệt là khi `Sanitizer` được dùng nhiều lần.

## Cú pháp

```js-nolint
get()
```

### Tham số

Không có

### Giá trị trả về

Một {{domxref("SanitizerConfig")}}.

## Ví dụ

### Lấy cấu hình

Ví dụ này cho thấy cách bạn có thể tạo một bộ làm sạch mới và lấy cấu hình của nó.

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

Mã sau kiểm tra xem giao diện `Sanitizer` có được hỗ trợ không, và nếu có thì tạo một đối tượng `Sanitizer` mới bằng cách dùng {{domxref("SanitizerConfig")}} đơn giản cho phép các phần tử HTML: {{htmlelement("div")}}, {{htmlelement("p")}}, {{htmlelement("span")}}, {{htmlelement("script")}}.
Sau đó nó lấy và ghi nhật ký cấu hình.

```js hidden
if ("Sanitizer" in window) {
```

```js
// Tạo bộ làm sạch sử dụng SanitizerConfig
const sanitizer = new Sanitizer({ elements: ["div", "p", "span", "script"] });

// Lấy cấu hình hiện tại
const sanitizerConfig = sanitizer.get();

log(JSON.stringify(sanitizerConfig, null, 2));
```

```js hidden
} else {
  log("The HTML Sanitizer API is NOT supported in this browser.");
}
```

#### Kết quả

Đầu ra được ghi nhật ký bên dưới.
Lưu ý rằng cùng các phần tử được đặt khi xây dựng bộ làm sạch được trả về, nhưng các phần tử mới cũng có không gian tên.
Lưu ý rằng các chú thích và thuộc tính dữ liệu sẽ được phép.

{{EmbedLiveSample("Getting a configuration","100","480px")}}

### Lấy bộ làm sạch mặc định

Ví dụ này cho thấy cách bạn có thể lấy cấu hình cho `Sanitizer` mặc định.
Sau đó có thể sửa đổi và dùng để tạo `Sanitizer` mới đáp ứng nhu cầu cụ thể của bạn.

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

Mã sau kiểm tra xem giao diện `Sanitizer` có được hỗ trợ không.
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

// Lấy cấu hình mặc định
const defaultConfig = sanitizer.get();

log(JSON.stringify(defaultConfig, null, 2));
```

```js hidden
} else {
  log("The HTML Sanitizer API is NOT supported in this browser.");
}
```

#### Kết quả

[Cấu hình bộ làm sạch mặc định](/en-US/docs/Web/API/HTML_Sanitizer_API/Default_sanitizer_configuration) được ghi nhật ký bên dưới.
Lưu ý rằng cấu hình mặc định khá lớn, cho phép nhiều phần tử và thuộc tính.

{{EmbedLiveSample("Getting the default sanitizer","100","480px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
