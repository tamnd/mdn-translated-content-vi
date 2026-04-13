---
title: "Sanitizer: phương thức removeElement()"
short-title: removeElement()
slug: Web/API/Sanitizer/removeElement
page-type: web-api-instance-method
browser-compat: api.Sanitizer.removeElement
---

{{APIRef("HTML Sanitizer API")}}

Phương thức **`removeElement()`** của giao diện {{domxref("Sanitizer")}} đặt phần tử được chỉ định để bị xóa khỏi đầu ra khi bộ làm sạch được dùng.

Phương thức có thể được dùng với [cấu hình cho phép](/en-US/docs/Web/API/HTML_Sanitizer_API#allow_configurations) hoặc [cấu hình xóa](/en-US/docs/Web/API/HTML_Sanitizer_API#remove_configurations).
Nếu dùng với cấu hình xóa, phần tử được chỉ định sẽ được thêm vào mảng `removeElements`.
Nếu dùng với cấu hình cho phép, phần tử sẽ bị xóa khỏi mảng `elements` (nếu có).

## Cú pháp

```js-nolint
removeElement(element)
```

### Tham số

- `element`
  - : Một chuỗi cho biết tên của phần tử không được phép, hoặc một đối tượng với các thuộc tính sau:
    - `name`
      - : Một chuỗi chứa tên của phần tử.
    - `namespace` {{optional_inline}}
      - : Một chuỗi chứa không gian tên của phần tử.
        Không gian tên mặc định là `"http://www.w3.org/1999/xhtml"`.

### Giá trị trả về

`true` nếu thao tác thay đổi cấu hình để không cho phép phần tử, và `false` nếu phần tử đã bị cấm.

Lưu ý rằng `false` có thể được trả về nếu cấu hình nội bộ:

- định nghĩa mảng [`elements`](/en-US/docs/Web/API/SanitizerConfig#elements) và phần tử đã bị bỏ qua (không cần xóa)
- thay vào đó định nghĩa mảng [`removeElements`](/en-US/docs/Web/API/SanitizerConfig#removeelements) và phần tử được chỉ định đã có mặt (và do đó đã bị lọc)

## Ví dụ

### Cách không cho phép các phần tử

Ví dụ này cho thấy cách `removeElement()` được dùng để chỉ định phần tử cần "bị cấm".

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 420px;
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

Mã trước tiên tạo một đối tượng `Sanitizer` mới ban đầu cho phép các phần tử {{htmlelement("div")}} và {{htmlelement("script")}}, và thay thế các phần tử {{htmlelement("span")}} bằng các phần tử con của chúng.

Mã sau đó gọi `removeElement()` để thêm các phần tử {{htmlelement("p")}}, `<script>` và `<span>` vào danh sách [`removeElements`](/en-US/docs/Web/API/SanitizerConfig#removeelements) trong cấu hình.
Lưu ý rằng việc thêm `<script>` và `<span>` xóa các phần tử khỏi danh sách gốc của chúng.

```js hidden
if ("Sanitizer" in window) {
```

```js
// Tạo bộ làm sạch sử dụng SanitizerConfig
const sanitizer = new Sanitizer({
  elements: ["div", "script"],
  replaceWithChildrenElements: ["span"],
});

// Không cho phép phần tử <p>
sanitizer.removeElement("p");

// Không cho phép phần tử <script>
sanitizer.removeElement("script");
// Không cho phép phần tử <span>
sanitizer.removeElement("span");

// Ghi nhật ký cấu hình bộ làm sạch
let sanitizerConfig = sanitizer.get();
log(JSON.stringify(sanitizerConfig, null, 2));
```

```js hidden
} else {
  log("The HTML Sanitizer API is NOT supported in this browser.");
}
```

> [!NOTE]
> Cấu hình này chỉ dùng để trình diễn.
> Các cấu hình bộ làm sạch chỉ nên bao gồm các phần tử được phép ([`elements`](/en-US/docs/Web/API/SanitizerConfig#elements)) hoặc chỉ các phần tử bị cấm ([`removeElements`](/en-US/docs/Web/API/SanitizerConfig#removeelements)), nhưng không phải cả hai.
> Trong trường hợp này chỉ có phần tử `<div>` được phép và tất cả các phần tử khác sẽ bị xóa khỏi đầu vào: do đó các phần tử bị xóa không có hiệu lực.

#### Kết quả

Cấu hình cuối cùng được ghi nhật ký bên dưới.

{{EmbedLiveSample("How to disallow elements","100","480px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
