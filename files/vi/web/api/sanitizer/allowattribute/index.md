---
title: "Sanitizer: phương thức allowAttribute()"
short-title: allowAttribute()
slug: Web/API/Sanitizer/allowAttribute
page-type: web-api-instance-method
browser-compat: api.Sanitizer.allowAttribute
---

{{APIRef("HTML Sanitizer API")}}

Phương thức **`allowAttribute()`** của giao diện {{domxref("Sanitizer")}} đặt một thuộc tính là được phép trên tất cả các phần tử khi bộ làm sạch được dùng.

Phương thức có thể được dùng với [cấu hình cho phép](/en-US/docs/Web/API/HTML_Sanitizer_API#allow_configurations) hoặc [cấu hình xóa](/en-US/docs/Web/API/HTML_Sanitizer_API#remove_configurations).
Nếu dùng với cấu hình cho phép, thuộc tính được chỉ định sẽ được thêm vào mảng `attributes`.
Nếu dùng với cấu hình xóa, thuộc tính sẽ bị xóa khỏi mảng `removeAttributes` (nếu có).

Lưu ý rằng để cho phép/không cho phép các thuộc tính chỉ trên các phần tử cụ thể, hãy dùng {{domxref('Sanitizer.allowElement()')}}.

## Cú pháp

```js-nolint
allowAttribute(attribute)
```

### Tham số

- `attribute`
  - : Một chuỗi cho biết tên của thuộc tính được phép toàn cục trên các phần tử, hoặc một đối tượng với các thuộc tính sau:
    - `name`
      - : Một chuỗi chứa tên của thuộc tính.
    - `namespace` {{optional_inline}}
      - : Một chuỗi chứa không gian tên của thuộc tính, mặc định là `null`.

### Giá trị trả về

`true` nếu thao tác thay đổi cấu hình để cho phép thuộc tính, và `false` nếu cấu hình đã cho phép thuộc tính đó.

Lưu ý rằng `false` có thể được trả về nếu cấu hình nội bộ:

- định nghĩa một mảng [`attributes`](/en-US/docs/Web/API/SanitizerConfig#attributes) và thuộc tính đã có mặt (không cần thêm lại)
- thay vào đó định nghĩa mảng [`removeAttributes`](/en-US/docs/Web/API/SanitizerConfig#removeattributes) và thuộc tính được chỉ định không có mặt (và do đó đã được cho phép)
- [`dataAttributes`](/en-US/docs/Web/API/SanitizerConfig#dataattributes) được đặt `true`, nhưng thuộc tính `data-*` được truyền vào.

## Ví dụ

### Cách cho phép các thuộc tính cụ thể trên các phần tử

Ví dụ này cho thấy cách `allowAttribute()` được dùng để chỉ định rằng một thuộc tính được phép trên các phần tử.

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

Mã trước tiên tạo một đối tượng `Sanitizer` mới ban đầu không cho phép thuộc tính nào.
Sau đó chúng tôi gọi `allowAttribute()` với các thuộc tính `title` và `mathcolor`.

```js hidden
if ("Sanitizer" in window) {
```

```js
// Tạo bộ làm sạch cho phép
const sanitizer = new Sanitizer({
  attributes: [],
});

// Cho phép thuộc tính "title"
sanitizer.allowAttribute("title");
// Cho phép thuộc tính "mathcolor"
sanitizer.allowAttribute("mathcolor");

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
Lưu ý cách cả hai thuộc tính hiện được thêm vào danh sách [`attributes`](/en-US/docs/Web/API/SanitizerConfig#attributes_2) (các thuộc tính khác sẽ không được phép trên các phần tử khi bộ làm sạch được dùng).

{{EmbedLiveSample("How to allow specific attributes on elements","100","480px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
