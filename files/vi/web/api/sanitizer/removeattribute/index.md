---
title: "Sanitizer: phương thức removeAttribute()"
short-title: removeAttribute()
slug: Web/API/Sanitizer/removeAttribute
page-type: web-api-instance-method
browser-compat: api.Sanitizer.removeAttribute
---

{{APIRef("HTML Sanitizer API")}}

Phương thức **`removeAttribute()`** của giao diện {{domxref("Sanitizer")}} đặt một thuộc tính để bị xóa khỏi tất cả các phần tử khi bộ làm sạch được dùng.

Phương thức có thể được dùng với [cấu hình cho phép](/en-US/docs/Web/API/HTML_Sanitizer_API#allow_configurations) hoặc [cấu hình xóa](/en-US/docs/Web/API/HTML_Sanitizer_API#remove_configurations).
Nếu dùng với cấu hình xóa, thuộc tính được chỉ định sẽ được thêm vào mảng `removeAttributes`.
Nếu dùng với cấu hình cho phép, thuộc tính sẽ bị xóa khỏi mảng `attributes` (nếu có).

Lưu ý rằng để cho phép/không cho phép các thuộc tính chỉ trên các phần tử cụ thể, hãy dùng {{domxref('Sanitizer.allowElement()')}}.

## Cú pháp

```js-nolint
removeAttribute(attribute)
```

### Tham số

- `attribute`
  - : Một chuỗi cho biết tên của thuộc tính không được phép toàn cục trên các phần tử, hoặc một đối tượng với các thuộc tính sau:
    - `name`
      - : Một chuỗi chứa tên của thuộc tính.
    - `namespace` {{optional_inline}}
      - : Một chuỗi chứa không gian tên của thuộc tính, mặc định là `null`.

### Giá trị trả về

`true` nếu thao tác thay đổi cấu hình để không cho phép thuộc tính, và `false` nếu thuộc tính đã bị cấm.

Lưu ý rằng `false` có thể được trả về nếu cấu hình nội bộ:

- định nghĩa mảng [`removeAttributes`](/en-US/docs/Web/API/SanitizerConfig#removeattributes) đã chứa thuộc tính được chỉ định (và do đó đã bị lọc)
- thay vào đó định nghĩa mảng [`attributes`](/en-US/docs/Web/API/SanitizerConfig#attributes) đã bỏ qua thuộc tính (và do đó đã bị cấm)

## Ví dụ

### Cách không cho phép các thuộc tính cụ thể

Ví dụ này cho thấy cách `removeAttribute()` được dùng để chỉ định rằng một thuộc tính phải bị xóa khỏi các phần tử.

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 300px;
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

Mã trước tiên tạo một đối tượng `Sanitizer` mới ban đầu không chỉ định thuộc tính hoặc phần tử nào.
Sau đó chúng tôi gọi `removeAttribute()` với các thuộc tính `title` và `mathcolor`.

```js hidden
if ("Sanitizer" in window) {
```

```js
// Tạo bộ làm sạch cho phép
const sanitizer = new Sanitizer({
  removeAttributes: [],
});

// Xóa thuộc tính title
sanitizer.removeAttribute("title");
// Xóa thuộc tính mathcolor
sanitizer.removeAttribute("mathcolor");

// Ghi nhật ký cấu hình bộ làm sạch
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
Lưu ý cách cả hai thuộc tính hiện được thêm vào danh sách [`removeAttributes`](/en-US/docs/Web/API/SanitizerConfig#removeattributes_2) (các thuộc tính này sẽ bị xóa nếu có trên các phần tử khi bộ làm sạch được dùng).

{{EmbedLiveSample("How to disallow specific attributes","100","360px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
