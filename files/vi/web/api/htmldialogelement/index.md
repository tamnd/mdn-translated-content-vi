---
title: HTMLDialogElement
slug: Web/API/HTMLDialogElement
page-type: web-api-interface
browser-compat:
  - api.HTMLDialogElement
  - api.HTMLElement.beforetoggle_event.dialog_elements
  - api.HTMLElement.toggle_event.dialog_elements
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLDialogElement`** cung cấp các phương thức để thao tác các phần tử {{HTMLElement("dialog")}}. Nó kế thừa các thuộc tính và phương thức từ giao diện {{domxref("HTMLElement")}}.

{{InheritanceDiagram}}

## Thuộc tính instance

_Cũng kế thừa các thuộc tính từ giao diện cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLDialogElement.closedBy")}}
  - : Một chuỗi đặt hoặc trả về thuộc tính HTML [`closedby`](/en-US/docs/Web/HTML/Reference/Elements/dialog#closedby), cho biết các loại hành động của người dùng có thể dùng để đóng hộp thoại.
- {{domxref("HTMLDialogElement.open")}}
  - : Một giá trị boolean phản ánh thuộc tính HTML [`open`](/en-US/docs/Web/HTML/Reference/Elements/dialog#open), cho biết hộp thoại có sẵn sàng để tương tác hay không.
- {{domxref("HTMLDialogElement.returnValue")}}
  - : Một chuỗi đặt hoặc trả về giá trị trả về cho hộp thoại.

## Phương thức instance

_Cũng kế thừa các phương thức từ giao diện cha, {{domxref("HTMLElement")}}._

- {{domxref("HTMLDialogElement.close()")}}
  - : Đóng hộp thoại. Có thể truyền một chuỗi tùy chọn làm đối số, cập nhật {{domxref("HTMLDialogElement.returnValue", "returnValue")}} của hộp thoại.
- {{domxref("HTMLDialogElement.requestClose()")}}
  - : Yêu cầu đóng hộp thoại. Có thể truyền một chuỗi tùy chọn làm đối số, cập nhật {{domxref("HTMLDialogElement.returnValue", "returnValue")}} của hộp thoại.
- {{domxref("HTMLDialogElement.show()")}}
  - : Hiển thị hộp thoại ở chế độ không modal, tức là vẫn cho phép tương tác với nội dung bên ngoài hộp thoại.
- {{domxref("HTMLDialogElement.showModal()")}}
  - : Hiển thị hộp thoại dưới dạng modal, nằm trên cùng của bất kỳ hộp thoại nào khác có thể hiển thị. Mọi thứ bên ngoài hộp thoại đều ở trạng thái {{DOMxRef("HTMLElement.inert", "inert")}} với các tương tác bên ngoài hộp thoại bị chặn.

## Sự kiện

_Cũng kế thừa các sự kiện từ giao diện cha, {{DOMxRef("HTMLElement")}}._

Lắng nghe các sự kiện này bằng cách sử dụng {{DOMxRef("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này.

- {{domxref("HTMLDialogElement/cancel_event", "cancel")}}
  - : Được kích hoạt khi hộp thoại được yêu cầu đóng, dù bằng phím Escape, hoặc qua phương thức {{domxref("HTMLDialogElement.requestClose()", "requestClose()")}}. Nếu sự kiện bị hủy (thông qua {{domxref("Event.preventDefault()")}}), hộp thoại sẽ vẫn mở. Nếu không bị hủy, hộp thoại sẽ đóng và sự kiện {{domxref("HTMLDialogElement/close_event", "close")}} sẽ được kích hoạt.
- {{domxref("HTMLDialogElement/close_event", "close")}}
  - : Được kích hoạt khi hộp thoại được đóng.

## Ví dụ

### Mở / đóng một hộp thoại modal

Ví dụ sau đây hiển thị một nút bấm, khi được nhấp vào, sẽ sử dụng hàm {{domxref("HTMLDialogElement.showModal()", "showModal()")}} để mở một hộp thoại modal chứa một biểu mẫu.

Trong khi mở, mọi thứ khác ngoài nội dung của hộp thoại modal đều ở trạng thái inert.
Bạn có thể nhấp vào nút _Đóng_ để đóng hộp thoại (thông qua hàm {{domxref("HTMLDialogElement.close()", "close()")}}), hoặc gửi biểu mẫu thông qua nút _Xác nhận_.

Ví dụ minh họa:

1. Đóng một biểu mẫu bằng hàm {{domxref("HTMLDialogElement.close()", "close()")}}
2. Đóng một biểu mẫu khi gửi biểu mẫu và thiết lập {{domxref("HTMLDialogElement.returnValue", "returnValue")}} của hộp thoại
3. Đóng một biểu mẫu bằng phím <kbd>Esc</kbd>
4. Các sự kiện "thay đổi trạng thái" có thể được kích hoạt trên hộp thoại: {{domxref("HTMLDialogElement/cancel_event", "cancel")}} và {{domxref("HTMLDialogElement/close_event", "close")}}, cùng các sự kiện kế thừa {{domxref("HTMLElement/beforetoggle_event", "beforetoggle")}} và {{domxref("HTMLElement/toggle_event", "toggle")}}.

#### HTML

```html
<dialog id="dialog">
  <button id="close" type="button">Đóng</button>
  <form method="dialog" id="form">
    <p>
      <label for="fav-animal">Loài vật yêu thích:</label>
      <select id="fav-animal" name="favAnimal" required>
        <option></option>
        <option>Tôm nước mặn</option>
        <option>Gấu mèo đỏ</option>
        <option>Khỉ nhện</option>
      </select>
    </p>
    <div>
      <button id="submit" type="submit">Xác nhận</button>
    </div>
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

```js hidden
const logElement = document.getElementById("log");
function log(text) {
  logElement.innerText = `${logElement.innerText}${text}\n`;
  logElement.scrollTop = logElement.scrollHeight;
}
```

#### JavaScript

##### Mở hộp thoại

Đoạn mã đầu tiên lấy các đối tượng cho phần tử {{htmlelement("dialog")}}, các phần tử {{htmlelement("button")}}, và phần tử {{htmlelement("select")}}.
Sau đó thêm một trình lắng nghe để gọi hàm {{domxref("HTMLDialogElement.showModal()")}} khi nút _Mở hộp thoại_ được nhấp.

```js
const dialog = document.getElementById("dialog");
const openButton = document.getElementById("open");

// Nút mở mở một hộp thoại modal
openButton.addEventListener("click", () => {
  log(`dialog: showModal()`);
  dialog.showModal();
});
```

##### Đóng hộp thoại khi nút _Đóng_ được nhấp

Tiếp theo, chúng ta thêm một trình lắng nghe cho sự kiện {{domxref("Element/click_event", "click")}} của nút _Đóng_. Trình xử lý thiết lập {{domxref("HTMLDialogElement.returnValue", "returnValue")}} và gọi hàm {{domxref("HTMLDialogElement.close()", "close()")}} để đóng hộp thoại.

```js
// Nút đóng đóng hộp thoại
const closeButton = document.getElementById("close");
closeButton.addEventListener("click", () => {
  dialog.returnValue = ""; // Đặt lại giá trị trả về
  log(`dialog: close()`);
  dialog.close();
// Hoặc, chúng ta có thể dùng dialog.requestClose(""); với giá trị trả về rỗng.
});
```

##### Đóng hộp thoại khi nút _Xác nhận_ được nhấp thông qua gửi biểu mẫu

Tiếp theo, chúng ta thêm một trình lắng nghe cho sự kiện {{domxref("HTMLFormElement.submit_event", "submit")}} của {{htmlelement("form")}}.
Biểu mẫu được gửi khi phần tử {{htmlelement("select")}} bắt buộc có giá trị và nút _Xác nhận_ được nhấp. Nếu phần tử {{htmlelement("select")}} không có giá trị, biểu mẫu sẽ không được gửi và hộp thoại sẽ vẫn mở.

```js
// Nút xác nhận đóng hộp thoại nếu có lựa chọn.
const form = document.getElementById("form");
const selectElement = document.getElementById("fav-animal");
form.addEventListener("submit", () => {
  log(`form: submit`);
  // Đặt giá trị trả về thành giá trị của tùy chọn đã chọn
  dialog.returnValue = selectElement.value;
  // Chúng ta không cần đóng hộp thoại ở đây
  // việc gửi biểu mẫu với method="dialog" sẽ tự động làm điều đó.
  // dialog.close();
});
```

##### Lấy `returnValue` khi `close`

Gọi {{domxref("HTMLDialogElement.close()", "close()")}} (hoặc gửi thành công một biểu mẫu với `method="dialog"`) sẽ kích hoạt sự kiện {{domxref("HTMLDialogElement/close_event", "close")}}, mà chúng ta triển khai bên dưới bằng cách ghi lại giá trị trả về của hộp thoại.

```js
dialog.addEventListener("close", (event) => {
  log(`close_event: (dialog.returnValue: "${dialog.returnValue}")`);
});
```

##### Sự kiện `cancel`

Sự kiện {{domxref("HTMLDialogElement/cancel_event", "cancel")}} được kích hoạt khi sử dụng các "phương thức cụ thể của nền tảng" để đóng hộp thoại, chẳng hạn như phím <kbd>Esc</kbd>.
Nó cũng được kích hoạt khi phương thức {{domxref("HTMLDialogElement.requestClose()", "requestClose()")}} được gọi.
Sự kiện này có thể "hủy" nghĩa là chúng ta có thể dùng nó để ngăn hộp thoại đóng.
Ở đây chúng ta chỉ xem việc hủy như một thao tác "đóng", và đặt lại {{domxref("HTMLDialogElement.returnValue", "returnValue")}} về `""` để xóa bất kỳ giá trị nào có thể đã được thiết lập.

```js
dialog.addEventListener("cancel", (event) => {
  log(`cancel_event: (dialog.returnValue: "${dialog.returnValue}")`);
  dialog.returnValue = ""; // Đặt lại giá trị
});
```

##### Sự kiện `toggle`

Sự kiện {{domxref("HTMLElement/toggle_event", "toggle")}} (kế thừa từ {{domxref("HTMLElement", "HTMLElement")}}) được kích hoạt ngay sau khi một hộp thoại mở hoặc đóng (nhưng trước sự kiện {{domxref("HTMLDialogElement/close_event", "close")}}).

Ở đây chúng ta thêm một trình lắng nghe để ghi lại khi hộp thoại mở và đóng.

> [!NOTE]
> Các sự kiện {{domxref("HTMLElement/toggle_event", "toggle")}} và {{domxref("HTMLElement/beforetoggle_event", "beforetoggle")}} có thể không được kích hoạt tại các phần tử dialog trên tất cả trình duyệt.
> Trên các phiên bản trình duyệt này, bạn có thể kiểm tra thuộc tính {{domxref("HTMLDialogElement.open", "open")}} sau khi cố gắng mở/đóng hộp thoại.

```js
dialog.addEventListener("toggle", (event) => {
  log(`toggle event: newState: ${event.newState}`);
});
```

##### Sự kiện `beforetoggle`

Sự kiện {{domxref("HTMLElement/beforetoggle_event", "beforetoggle")}} (kế thừa từ {{domxref("HTMLElement", "HTMLElement")}}) là một sự kiện có thể hủy được kích hoạt ngay trước khi một hộp thoại mở hoặc đóng.
Nếu cần, điều này có thể được sử dụng để ngăn hộp thoại hiển thị, hoặc để thực hiện các hành động trên các phần tử khác bị ảnh hưởng bởi trạng thái mở/đóng của hộp thoại, chẳng hạn như thêm các lớp trên chúng để kích hoạt hoạt ảnh.

Trong trường hợp này, chúng ta chỉ ghi lại trạng thái cũ và mới.

```js
dialog.addEventListener("beforetoggle", (event) => {
  log(
    `beforetoggle event: oldState: ${event.oldState}, newState: ${event.newState}`,
  );

  // Gọi event.preventDefault() để ngăn hộp thoại mở
  /*
    if (shouldCancel()) {
        event.preventDefault();
    }
  */
});
```

#### Kết quả

Hãy thử ví dụ bên dưới.
Lưu ý rằng cả hai nút `Xác nhận` và `Đóng` đều dẫn đến sự kiện {{domxref("HTMLDialogElement/close_event", "close")}} được kích hoạt, và kết quả sẽ phản ánh tùy chọn dialog đã chọn.

{{EmbedLiveSample("Open / close a modal dialog", '100%', "250px")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử HTML {{htmlelement("dialog")}}
