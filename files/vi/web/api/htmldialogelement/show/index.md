---
title: "HTMLDialogElement: phương thức show()"
short-title: show()
slug: Web/API/HTMLDialogElement/show
page-type: web-api-instance-method
browser-compat: api.HTMLDialogElement.show
---

{{ APIRef("HTML DOM") }}

Phương thức **`show()`** của giao diện {{domxref("HTMLDialogElement")}} hiển thị hộp thoại dưới dạng hộp thoại không modal.

Một hộp thoại không modal là hộp thoại cho phép người dùng tương tác với nội dung bên ngoài/phía sau hộp thoại đang mở.

## Cú pháp

```js-nolint
show()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu hộp thoại đã mở và ở chế độ modal (tức là, nếu hộp thoại đã được mở bằng {{domxref("HTMLDialogElement.showModal()")}}).

## Ví dụ

### Cách sử dụng cơ bản

Ví dụ sau đây hiển thị một nút bấm đơn giản, khi được nhấp vào, sẽ mở một {{htmlelement("dialog")}} bằng phương thức `show()`.

Khi hộp thoại đang mở, bạn vẫn có thể tương tác với phần còn lại của trang, bao gồm cả việc nhấp vào nút _Nhấp vào tôi_ để kích hoạt một cảnh báo.

Bạn có thể nhấp vào nút _Đóng hộp thoại_ để đóng hộp thoại (thông qua phương thức {{domxref("HTMLDialogElement.close()", "close()")}}).

#### HTML

```html
<dialog id="dialog">
  <button type="button" id="close">Đóng hộp thoại</button>
</dialog>

<p><button id="open">Mở hộp thoại</button></p>
<p><button id="alert">Kích hoạt cảnh báo</button></p>
```

#### JavaScript

```js
const dialog = document.getElementById("dialog");
const openButton = document.getElementById("open");
const closeButton = document.getElementById("close");
const alertButton = document.getElementById("alert");

// Nút mở mở một hộp thoại modeless
openButton.addEventListener("click", () => {
  dialog.show();
});

// Nút cảnh báo kích hoạt một cảnh báo
alertButton.addEventListener("click", () => {
  alert("bạn đã nhấp vào tôi!");
});

// Nút đóng đóng hộp thoại
closeButton.addEventListener("click", () => {
  dialog.close();
});
```

#### Kết quả

{{EmbedLiveSample("Basic usage", '100%', "250px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{htmlelement("dialog")}}
- {{domxref("HTMLDialogElement.showModal()")}}
