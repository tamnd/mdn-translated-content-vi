---
title: "HTMLDialogElement: thuộc tính returnValue"
short-title: returnValue
slug: Web/API/HTMLDialogElement/returnValue
page-type: web-api-instance-property
browser-compat: api.HTMLDialogElement.returnValue
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`returnValue`** của giao diện {{domxref("HTMLDialogElement")}} là một chuỗi đại diện cho giá trị trả về cho một phần tử {{htmlelement("dialog")}} khi nó được đóng.
Bạn có thể thiết lập giá trị trực tiếp (`dialog.returnValue = "result"`) hoặc bằng cách cung cấp giá trị dưới dạng đối số chuỗi cho {{domxref("HTMLDialogElement.close()", "close()")}} hoặc {{domxref("HTMLDialogElement.requestClose()", "requestClose()")}}.

## Giá trị

Một chuỗi đại diện cho `returnValue` của hộp thoại.
Mặc định là một chuỗi rỗng (`""`).

## Ví dụ

### Kiểm tra giá trị trả về

Ví dụ sau đây hiển thị một nút bấm để mở một hộp thoại. Hộp thoại hỏi người dùng có muốn chấp nhận lời nhắc Điều khoản Dịch vụ hay không.

Hộp thoại chứa các nút "Chấp nhận" hoặc "Từ chối": khi người dùng nhấp vào một trong các nút, trình xử lý nhấp của nút đó sẽ đóng hộp thoại, truyền lựa chọn của họ vào hàm {{domxref("HTMLDialogElement.close()", "close()")}}. Điều này gán lựa chọn cho thuộc tính `returnValue` của hộp thoại.

Trong trình xử lý sự kiện {{domxref("HTMLDialogElement.close_event", "close")}} của hộp thoại, ví dụ cập nhật văn bản trạng thái của trang chính để ghi lại `returnValue`.

Nếu người dùng đóng hộp thoại mà không nhấp vào một nút (ví dụ: bằng cách nhấn phím <kbd>Esc</kbd>), thì giá trị trả về không được thiết lập.

#### HTML

```html
<dialog id="dialog">
  <p>Bạn có đồng ý với Điều khoản Dịch vụ (liên kết) không?</p>
  <button id="decline" value="declined">Từ chối</button>
  <button id="accept" value="accepted">Chấp nhận</button>
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

```js hidden
const logElement = document.getElementById("log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

#### JavaScript

```js
const dialog = document.getElementById("dialog");
const openButton = document.getElementById("open");
const declineButton = document.getElementById("decline");
const acceptButton = document.getElementById("accept");

openButton.addEventListener("click", () => {
  // Đặt lại giá trị trả về mỗi khi mở
  dialog.returnValue = "";
  updateReturnValue();
  // Hiển thị hộp thoại
  dialog.showModal();
});

function closeDialog(event) {
  const button = event.target;
  dialog.close(button.value);
}

function updateReturnValue() {
  log(`Giá trị trả về: "${dialog.returnValue}"`);
}

declineButton.addEventListener("click", closeDialog);
acceptButton.addEventListener("click", closeDialog);

dialog.addEventListener("close", updateReturnValue);
```

#### Kết quả

Nhấp "Mở hộp thoại", sau đó chọn nút "Chấp nhận" hoặc "Từ chối" trong hộp thoại, hoặc đóng hộp thoại bằng cách nhấn phím <kbd>Esc</kbd>.
Quan sát các cập nhật trạng thái khác nhau.

{{ EmbedLiveSample('Checking the return value', '100%', "250px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{htmlelement("dialog")}}
