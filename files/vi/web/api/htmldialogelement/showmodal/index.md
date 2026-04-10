---
title: "HTMLDialogElement: phương thức showModal()"
short-title: showModal()
slug: Web/API/HTMLDialogElement/showModal
page-type: web-api-instance-method
browser-compat: api.HTMLDialogElement.showModal
---

{{ APIRef("HTML DOM") }}

Phương thức **`showModal()`** của giao diện {{domxref("HTMLDialogElement")}} hiển thị hộp thoại dưới dạng hộp thoại modal, nằm trên cùng của bất kỳ hộp thoại hoặc phần tử nào khác có thể đang hiển thị.

Một hộp thoại modal hiển thị trong {{glossary("top layer")}}, cùng với một phần tử giả {{cssxref('::backdrop')}}.
Các phần tử bên trong cùng tài liệu với hộp thoại, ngoại trừ hộp thoại và các phần tử con cháu của nó, trở nên _inert_ (như thể thuộc tính [`inert`](/en-US/docs/Web/HTML/Reference/Global_attributes/inert) được chỉ định).
Chỉ tài liệu chứa bị chặn; nếu hộp thoại được hiển thị bên trong một iframe, phần còn lại của trang vẫn có thể tương tác.

## Cú pháp

```js-nolint
showModal()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu hộp thoại đã mở và không modal (tức là, nếu hộp thoại đã được mở bằng {{domxref("HTMLDialogElement.show()")}}).

## Ví dụ

### Cách sử dụng cơ bản

Ví dụ sau đây hiển thị một nút bấm đơn giản, khi được nhấp vào, sẽ mở một {{htmlelement("dialog")}} bằng phương thức `showModal()`.

Khi hộp thoại đang mở, bạn không thể tương tác với phần còn lại của trang, bao gồm cả việc nhấp vào nút _Nhấp vào tôi_ mà nếu không sẽ kích hoạt một cảnh báo.

Bạn có thể nhấp vào nút _Đóng hộp thoại_ để đóng hộp thoại (thông qua phương thức {{domxref("HTMLDialogElement.close()")}}).

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

// Nút mở mở một hộp thoại modal
openButton.addEventListener("click", () => {
  dialog.showModal();
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
- {{domxref("HTMLDialogElement.show()")}}
