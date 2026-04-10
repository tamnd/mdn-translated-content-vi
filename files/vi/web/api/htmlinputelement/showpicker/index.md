---
title: "HTMLInputElement: phương thức showPicker()"
short-title: showPicker()
slug: Web/API/HTMLInputElement/showPicker
page-type: web-api-instance-method
browser-compat: api.HTMLInputElement.showPicker
---

{{ APIRef("HTML DOM") }}

Phương thức **`HTMLInputElement.showPicker()`** hiển thị bộ chọn của trình duyệt cho phần tử `input`.

Đây là cùng bộ chọn thường được hiển thị khi phần tử được chọn, nhưng có thể được kích hoạt từ lần nhấn nút hoặc tương tác người dùng khác.

Thông thường trình duyệt triển khai nó cho các đầu vào loại: `"date"`, `"month"`, `"week"`, `"time"`, `"datetime-local"`, `"color"`, hoặc `"file"`.
Nó cũng có thể được điền sẵn các mục từ phần tử {{htmlelement("datalist")}} hoặc thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete).

Tổng quát hơn, phương thức này lý tưởng sẽ hiển thị bộ chọn cho bất kỳ phần tử đầu vào nào trên nền tảng có bộ chọn.

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
  - : Ném ra nếu phần tử không thể thay đổi, nghĩa là người dùng không thể sửa đổi nó và/hoặc nó không thể được điền sẵn tự động.
- `NotAllowedError` {{domxref("DOMException")}}
  - : Ném ra nếu không được kích hoạt rõ ràng bởi hành động người dùng như cử chỉ chạm hoặc nhấp chuột (bộ chọn yêu cầu {{Glossary("Transient activation")}}).
- `SecurityError` {{domxref("DOMException")}}
  - : Ném ra nếu được gọi trong iframe cross-origin, ngoại trừ bộ chọn tệp và màu (được miễn trừ vì lý do lịch sử).

## Bảo mật

Yêu cầu [kích hoạt người dùng tạm thời](/en-US/docs/Web/Security/Defenses/User_activation). Người dùng phải tương tác với trang hoặc phần tử UI để tính năng này hoạt động.

## Ví dụ

### Phát hiện tính năng

Đoạn mã dưới đây cho thấy cách kiểm tra xem `showPicker()` có được hỗ trợ không:

```js
if ("showPicker" in HTMLInputElement.prototype) {
  // showPicker() được hỗ trợ.
}
```

### Bộ chọn đầu vào thông thường

Ví dụ này cho thấy cách tính năng này có thể được sử dụng cho bộ chọn đầu vào `color` và `file`.

> [!NOTE]
> Bộ chọn cho `date`, `datetime-local`, `month`, `time`, `week` được khởi chạy theo cách tương tự.
> Chúng không thể được hiển thị ở đây vì các ví dụ trực tiếp chạy trong khung cross-origin, và sẽ gây ra [`SecurityError`](#securityerror)

#### HTML

```html
<p>
  <input type="color" />
  <button id="color">Hiện bộ chọn màu</button>
</p>

<p>
  <input type="file" />
  <button id="file">Hiện bộ chọn tệp</button>
</p>
```

#### JavaScript

Đoạn mã chỉ đơn giản lấy phần tử trước nút đã chọn và gọi `showPicker()` trên nó.

```js
document.querySelectorAll("button").forEach((button) => {
  button.addEventListener("click", (event) => {
    const input = event.srcElement.previousElementSibling;
    try {
      input.showPicker();
    } catch (error) {
      console.log(error);
    }
  });
});
```

#### Kết quả

Nhấp vào nút bên cạnh mỗi loại đầu vào để hiển thị bộ chọn của nó.

{{EmbedLiveSample("Normal input pickers", "100%", "140px")}}

### showPicker() cho đầu vào datalist

`showPicker()` có thể khởi chạy bộ chọn cho danh sách các tùy chọn được định nghĩa trong [`<datalist>`](/en-US/docs/Web/HTML/Reference/Elements/datalist).

Đầu tiên chúng ta định nghĩa một `<datalist>` trong HTML gồm một số trình duyệt internet, một đầu vào loại `text` sử dụng nó và một nút.

```html
<datalist id="browsers">
  <option value="Chrome"></option>
  <option value="Firefox"></option>
  <option value="Opera"></option>
  <option value="Safari"></option>
  <option value="Microsoft Edge"></option>
</datalist>

<input type="text" list="browsers" />
<button>Chọn trình duyệt</button>
```

Đoạn mã dưới đây thêm trình lắng nghe sự kiện gọi `showPicker()` khi nút được nhấp.

```js
const button = document.querySelector("button");
const browserInput = document.querySelector("input");

button.addEventListener("click", () => {
  try {
    browserInput.showPicker();
  } catch (error) {
    // Quay lại cơ chế bộ chọn khác
  }
});
```

Như các bộ chọn khác, chúng ta không thể hiển thị mã này chạy dưới dạng ví dụ trực tiếp vì nó chạy trong khung cross-origin, và sẽ gây ra [`SecurityError`](#securityerror).

### showPicker() cho autocomplete

`showPicker()` có thể khởi chạy bộ chọn cho đầu vào [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete).

Ở đây chúng ta định nghĩa một đầu입 nhận tùy chọn autocomplete là "name".

```html
<input autocomplete="name" /> <button>Hiện tùy chọn autocomplete</button>
```

Đoạn mã dưới đây hiển thị bộ chọn cho đầu vào khi nút được nhấp.

```js
const button = document.querySelector("button");
const browserInput = document.querySelector("input");

button.addEventListener("click", () => {
  try {
    browserInput.showPicker();
  } catch (error) {
    // Quay lại cơ chế bộ chọn khác
  }
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ HTMLElement("input") }}
- {{ domxref("HTMLInputElement") }}
- {{ domxref("HTMLSelectElement.showPicker()") }}
- {{htmlelement("datalist")}}
- [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete)
