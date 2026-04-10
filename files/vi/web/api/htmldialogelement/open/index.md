---
title: "HTMLDialogElement: thuộc tính open"
short-title: open
slug: Web/API/HTMLDialogElement/open
page-type: web-api-instance-property
browser-compat: api.HTMLDialogElement.open
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`open`** của giao diện {{domxref("HTMLDialogElement")}} là một giá trị boolean phản ánh thuộc tính HTML [`open`](/en-US/docs/Web/HTML/Reference/Elements/dialog#open), cho biết {{htmlelement("dialog")}} có sẵn sàng để tương tác hay không.

## Giá trị

Một giá trị boolean đại diện cho trạng thái của thuộc tính HTML [`open`](/en-US/docs/Web/HTML/Reference/Elements/dialog#open). Giá trị `true` nghĩa là hộp thoại đang hiển thị, trong khi `false` nghĩa là nó không hiển thị.

> [!WARNING]
> Mặc dù thuộc tính `open` về mặt kỹ thuật không phải chỉ đọc và có thể được thiết lập trực tiếp, nhưng việc này bị [đặc tả HTML](https://html.spec.whatwg.org/multipage/interactive-elements.html#note-dialog-remove-open-attribute) khuyến cáo mạnh mẽ, vì nó có thể phá vỡ các tương tác hộp thoại bình thường theo những cách không mong muốn.
> Ví dụ, sự kiện [`close`](/en-US/docs/Web/API/HTMLDialogElement/close_event) sẽ không được kích hoạt khi thiết lập `open` thành `false` theo cách lập trình, và các lệnh gọi tiếp theo đến các phương thức [`close()`](/en-US/docs/Web/API/HTMLDialogElement/close) và [`requestClose()`](/en-US/docs/Web/API/HTMLDialogElement/requestClose) sẽ không có hiệu lực.
> Thay vào đó, nên sử dụng các phương thức như [`show()`](/en-US/docs/Web/API/HTMLDialogElement/show), [`showModal()`](/en-US/docs/Web/API/HTMLDialogElement/showModal), `close()`, và `requestClose()` để thay đổi giá trị của thuộc tính `open`.

## Ví dụ

### Mở một hộp thoại

Ví dụ sau đây hiển thị một nút bấm đơn giản, khi được nhấp vào, sẽ mở một {{htmlelement("dialog")}} chứa một biểu mẫu thông qua phương thức `showModal()`.
Từ đó bạn có thể nhấp vào nút _Hủy_ để đóng hộp thoại (thông qua phương thức {{domxref("HTMLDialogElement.close()")}}), hoặc gửi biểu mẫu thông qua nút gửi.

Đoạn mã ghi lại giá trị của `open` khi trạng thái hộp thoại thay đổi.

#### HTML

```html
<!-- Hộp thoại pop-up đơn giản -->
<dialog id="dialog">
  <form method="dialog">
    <button type="submit">Đóng</button>
  </form>
</dialog>

<button id="open">Mở hộp thoại</button>
```

```html hidden
<pre id="log"></pre>
```

```css hidden
#log {
  height: 170px;
  overflow: scroll;
  padding: 0.5rem;
  border: 1px solid black;
}
```

#### JavaScript

```js hidden
const logElement = document.getElementById("log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

```js
const dialog = document.getElementById("dialog");
const openButton = document.getElementById("open");

function openCheck(dialog) {
  log(dialog.open ? "Hộp thoại: mở" : "Hộp thoại: đóng");
}

openButton.addEventListener("click", () => {
  dialog.showModal();
  openCheck(dialog);
});

dialog.addEventListener("close", () => {
  openCheck(dialog);
});
```

### Kết quả

{{ EmbedLiveSample('Opening a dialog', '100%', '250px') }}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{htmlelement("dialog")}}
