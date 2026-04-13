---
title: "Sanitizer: phương thức replaceElementWithChildren()"
short-title: replaceElementWithChildren()
slug: Web/API/Sanitizer/replaceElementWithChildren
page-type: web-api-instance-method
browser-compat: api.Sanitizer.replaceElementWithChildren
---

{{APIRef("HTML Sanitizer API")}}

Phương thức **`replaceElementWithChildren()`** của giao diện {{domxref("Sanitizer")}} đặt một phần tử để được thay thế bởi các phần tử HTML con của nó khi bộ làm sạch được dùng.
Chủ yếu được dùng để xóa định dạng khỏi văn bản.

## Cú pháp

```js-nolint
replaceElementWithChildren(element)
```

### Tham số

- `element`
  - : Một chuỗi cho biết tên của phần tử cần thay thế, hoặc một đối tượng với các thuộc tính sau:
    - `name`
      - : Một chuỗi chứa tên của phần tử.
    - `namespace` {{optional_inline}}
      - : Một chuỗi chứa không gian tên của phần tử.
        Không gian tên mặc định là `"http://www.w3.org/1999/xhtml"`.

### Giá trị trả về

`true` nếu thao tác thay đổi cấu hình để đặt phần tử được thay thế bởi các phần tử con của nó, và `false` nếu bộ làm sạch đã thay thế phần tử.

## Ví dụ

### Sử dụng cơ bản

Ví dụ này cho thấy cách sử dụng cơ bản của phương thức, cấu hình một `Sanitizer` thay thế phần tử `<em>` trong đầu vào bằng nội dung con của nó.

```js
// Tạo bộ làm sạch (trong trường hợp này là mặc định)
const sanitizer = new Sanitizer();

// Thay thế các phần tử <em> bằng innerHTML của chúng
sanitizer.replaceElementWithChildren("em");
```

### Cách xóa định dạng khỏi văn bản

Ví dụ này cho thấy cách `replaceElementWithChildren()` có thể được dùng để xóa định dạng khỏi văn bản.

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 480px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

```js hidden
const logElement = document.querySelector("#log");
function log(text) {
  logElement.textContent += text;
}
```

#### JavaScript

Mã trước tiên tạo một đối tượng `Sanitizer` mới ban đầu cho phép các phần tử {{htmlelement("p")}}, {{htmlelement("em")}} và {{htmlelement("strong")}}.
Sau đó chúng tôi gọi `replaceElementWithChildren()` trên bộ làm sạch chỉ định rằng các phần tử `<strong>` sẽ bị thay thế.

Mã định nghĩa một chuỗi có các phần tử `<strong>` và dùng {{domxref("Element.setHTML()")}} với bộ làm sạch để chèn chuỗi.
Chuỗi gốc, HTML đã làm sạch từ phần tử và bộ làm sạch được ghi nhật ký.

```js hidden
if ("Sanitizer" in window) {
```

```js
// Tạo bộ làm sạch sử dụng SanitizerConfig
const sanitizer = new Sanitizer({
  elements: ["p", "em", "strong"],
});

// Thay thế phần tử <strong>
sanitizer.replaceElementWithChildren("strong");

const unsanitizedString = `<p>This is a with <strong>important</strong> text <em>highlighted</em>.</p>`;
log(`unsanitizedHTMLString:\n ${unsanitizedString}`);

// Tạo phần tử <div>
const divElement = document.createElement("div");

divElement.setHTML(unsanitizedString, { sanitizer });
log(`\n\nsanitizedHTML:\n ${divElement.innerHTML}`);

// Ghi nhật ký cấu hình bộ làm sạch
const sanitizerConfig = sanitizer.get();
log(`\n\nsanitizerConfig:\n ${JSON.stringify(sanitizerConfig, null, 2)}`);
```

```js hidden
} else {
  log("The HTML Sanitizer API is NOT supported in this browser.");
}
```

#### Kết quả

Chuỗi HTML gốc chưa làm sạch, chuỗi đã làm sạch từ phần tử và bộ làm sạch được ghi nhật ký bên dưới.
Lưu ý rằng định dạng `<strong>` bị xóa khỏi văn bản, nhưng phần tử `<em>` thì không.
Lưu ý thêm rằng phần tử `<strong>` ban đầu nằm trong danh sách `elements` trong cấu hình, nhưng bị xóa khi được thêm vào danh sách `replaceWithChildrenElements`.

{{EmbedLiveSample("How to strip styles from text","100","520px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
