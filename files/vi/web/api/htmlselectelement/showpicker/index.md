---
title: "HTMLSelectElement: phương thức showPicker()"
short-title: showPicker()
slug: Web/API/HTMLSelectElement/showPicker
page-type: web-api-instance-method
browser-compat: api.HTMLSelectElement.showPicker
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLSelectElement.showPicker()`** hiển thị trình chọn của trình duyệt cho phần tử `select`.

Đây là cùng trình chọn vốn thường được hiển thị khi phần tử được chọn, nhưng có thể được kích hoạt từ thao tác nhấn nút hoặc tương tác khác của người dùng.

## Cú pháp

```js-nolint
showPicker()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném nếu phần tử không thể sửa đổi, nghĩa là người dùng không thể thay đổi nó và/hoặc nó không thể được điền sẵn tự động.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném nếu không được kích hoạt rõ ràng bởi hành động của người dùng như chạm hoặc nhấp chuột (trình chọn yêu cầu {{Glossary("Transient activation")}}).
- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném nếu phần tử gắn với trình chọn không đang được hiển thị.
- `SecurityError` {{domxref("DOMException")}}
  - : Được ném nếu được gọi trong iframe khác nguồn gốc.

## Cân nhắc bảo mật

Cần có [Transient user activation](/en-US/docs/Web/Security/Defenses/User_activation).
Người dùng phải tương tác với trang hoặc một phần tử giao diện để tính năng này hoạt động.

Phương thức này chỉ được phép gọi trong iframe cùng nguồn gốc; sẽ ném ngoại lệ nếu được gọi trong iframe khác nguồn gốc.

## Ví dụ

### Phát hiện tính năng

Đoạn mã dưới đây cho thấy cách kiểm tra xem `showPicker()` có được hỗ trợ hay không:

```js
if ("showPicker" in HTMLSelectElement.prototype) {
  // showPicker() is supported.
}
```

### Mở trình chọn

Ví dụ này cho thấy cách dùng một nút để mở trình chọn cho phần tử `<select>` có hai tùy chọn.

#### HTML

```html
<p>
  <select>
    <option value="1">One</option>
    <option value="2">Two</option>
  </select>
  <button type="button">Show Picker</button>
</p>
```

#### JavaScript

Đoạn mã lấy phần tử `<button>` và thêm trình nghe cho sự kiện `click` của nó.
Trình xử lý sự kiện lấy phần tử `<select>` và gọi `showPicker()` trên đó.

```js
const button = document.querySelector("button");
button.addEventListener("click", (event) => {
  const select = event.srcElement.previousElementSibling;
  try {
    select.showPicker();
  } catch (error) {
    window.alert(error);
  }
});
```

<!-- A live example cannot be shown here because they run in a cross-origin frame, and would cause a SecurityError -->

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ HTMLElement("select") }}
- {{ domxref("HTMLSelectElement") }}
- {{ domxref("HTMLInputElement.showPicker()") }}
