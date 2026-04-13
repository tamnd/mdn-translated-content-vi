---
title: "KeyboardEvent: thuộc tính key"
short-title: key
slug: Web/API/KeyboardEvent/key
page-type: web-api-instance-property
browser-compat: api.KeyboardEvent.key
---

{{APIRef("UI Events")}}

Thuộc tính chỉ đọc **`key`** của giao diện {{domxref("KeyboardEvent")}} trả về giá trị của phím do người dùng nhấn, có tính đến trạng thái của các phím bổ trợ như <kbd>Shift</kbd> cũng như ngôn ngữ và bố cục bàn phím.

## Giá trị

Một chuỗi.

Giá trị của nó được xác định như sau:

- Nếu phím được nhấn có biểu diễn in được, giá trị trả về là một chuỗi Unicode không rỗng chứa biểu diễn có thể in của phím. Ví dụ: nếu phím được nhấn là phím <kbd>Space</kbd>, giá trị trả về là một khoảng trắng (`" "`). Nếu phím được nhấn là phím <kbd>B</kbd>, giá trị trả về là chuỗi `"b"`. Tuy nhiên, nếu phím <kbd>Shift</kbd> được nhấn cùng lúc (nên {{domxref("KeyboardEvent/shiftKey", "shiftKey")}} là `true`), giá trị trả về là chuỗi `"B"`.
- Nếu phím được nhấn là phím điều khiển hoặc phím đặc biệt, giá trị trả về là một trong các [giá trị phím được xác định trước](/en-US/docs/Web/API/UI_Events/Keyboard_event_key_values).
- Nếu `KeyboardEvent` biểu diễn việc nhấn một [phím chết](https://en.wikipedia.org/wiki/Dead_key), giá trị phím phải là `"Dead"`.
- Một số phím bàn phím chuyên biệt (chẳng hạn như các phím mở rộng để điều khiển phương tiện trên bàn phím đa phương tiện) không tạo mã phím trên Windows; thay vào đó, chúng kích hoạt các sự kiện `WM_APPCOMMAND`. Các sự kiện này được ánh xạ thành các sự kiện bàn phím DOM và được liệt kê trong "Mã phím ảo" cho Windows, mặc dù chúng không thực sự là mã phím.
- Nếu không thể xác định phím, giá trị trả về là `Unidentified`.

> [!CALLOUT]
>
> [Xem danh sách đầy đủ các giá trị phím](/en-US/docs/Web/API/UI_Events/Keyboard_event_key_values).

## Chuỗi KeyboardEvent

Mỗi `KeyboardEvent` được kích hoạt theo một chuỗi được xác định trước. Đối với một lần nhấn phím, chuỗi các `KeyboardEvent` được kích hoạt như sau với giả định rằng {{domxref("Event.preventDefault")}} không được gọi:

1. Sự kiện {{domxref("Element/keydown_event", "keydown")}} được kích hoạt đầu tiên. Nếu phím được giữ thêm và phím tạo ra một ký tự, thì sự kiện tiếp tục được phát ra theo khoảng thời gian phụ thuộc vào nền tảng và thuộc tính chỉ đọc {{domxref("KeyboardEvent.repeat")}} được đặt thành `true`.
2. Nếu phím tạo ra một ký tự có thể dẫn đến ký tự được chèn vào {{HTMLElement("input")}}, {{HTMLElement("textarea")}} hoặc một phần tử có {{domxref("HTMLElement.contentEditable")}} đặt thành true, các loại sự kiện {{domxref("Element/beforeinput_event", "beforeinput")}} và {{domxref("Element/input_event", "input")}} được kích hoạt theo thứ tự đó. Lưu ý rằng một số triển khai khác có thể kích hoạt sự kiện {{domxref("Element/keypress_event", "keypress")} nếu được hỗ trợ. Các sự kiện sẽ được kích hoạt lặp lại trong khi phím được giữ.
3. Sự kiện {{domxref("Element/keyup_event", "keyup")}} được kích hoạt khi phím được nhả. Điều này hoàn tất quá trình.

Trong chuỗi 1 và 3, thuộc tính `KeyboardEvent.key` được xác định và được đặt thích hợp theo các quy tắc đã định nghĩa ở trên.

## Ví dụ về chuỗi KeyboardEvent

Xem xét chuỗi sự kiện được tạo ra khi chúng ta tương tác với phím <kbd>Shift</kbd> và phím <kbd>2</kbd> sử dụng bố cục bàn phím Mỹ so với khi sử dụng bố cục bàn phím Anh.

Hãy thử nghiệm với hai trường hợp sau:

1. Nhấn và giữ phím <kbd>Shift</kbd>, sau đó nhấn <kbd>2</kbd> và nhả ra. Cuối cùng, nhả phím <kbd>Shift</kbd>.
2. Nhấn và giữ phím <kbd>Shift</kbd>, sau đó nhấn và giữ <kbd>2</kbd>. Nhả phím <kbd>Shift</kbd>. Cuối cùng, nhả <kbd>2</kbd>.

### HTML

```html
<div class="fx">
  <div>
    <textarea rows="5" name="test-target" id="test-target"></textarea>
    <button type="button" name="btn-reset" id="btn-reset">Reset</button>
  </div>
  <div class="flex">
    <pre id="console-log"></pre>
  </div>
</div>
```

### CSS

```css
.fx {
  -webkit-display: flex;
  display: flex;
  margin-left: -20px;
  margin-right: -20px;
}

.fx > div {
  padding-left: 20px;
  padding-right: 20px;
}

.fx > div:first-child {
  width: 30%;
}

.flex {
  -webkit-flex: 1;
  flex: 1;
}

#test-target {
  display: block;
  width: 100%;
  margin-bottom: 10px;
}
```

### JavaScript

```js
const textarea = document.getElementById("test-target");
const consoleLog = document.getElementById("console-log");
const btnReset = document.getElementById("btn-reset");

function logMessage(message) {
  consoleLog.innerText += `${message}\n`;
}

textarea.addEventListener("keydown", (e) => {
  if (!e.repeat) {
    logMessage(`Phím "${e.key}" đã nhấn [sự kiện: keydown]`);
  } else {
    logMessage(`Phím "${e.key}" đang lặp [sự kiện: keydown]`);
  }
});

textarea.addEventListener("beforeinput", (e) => {
  logMessage(`Phím "${e.data}" sắp được nhập [sự kiện: beforeinput]`);
});

textarea.addEventListener("input", (e) => {
  logMessage(`Phím "${e.data}" đã nhập [sự kiện: input]`);
});

textarea.addEventListener("keyup", (e) => {
  logMessage(`Phím "${e.key}" đã nhả [sự kiện: keyup]`);
});

btnReset.addEventListener("click", (e) => {
  let child = consoleLog.firstChild;
  while (child) {
    consoleLog.removeChild(child);
    child = consoleLog.firstChild;
  }
  textarea.value = "";
});
```

### Kết quả

{{EmbedLiveSample('KeyboardEvent_sequence_example')}}

> [!NOTE]
> Trên các trình duyệt không triển khai đầy đủ giao diện {{domxref("InputEvent")} được sử dụng cho các sự kiện {{domxref("Element/beforeinput_event", "beforeinput")}} và {{domxref("Element/input_event", "input")}}, bạn có thể nhận được kết quả không chính xác trên các dòng đó của đầu ra nhật ký.

### Trường hợp 1

Khi phím shift được nhấn, sự kiện {{domxref("Element/keydown_event", "keydown")} được kích hoạt đầu tiên, và giá trị thuộc tính `key` được đặt thành chuỗi `Shift`. Khi chúng ta tiếp tục giữ phím này, sự kiện {{domxref("Element/keydown_event", "keydown")} không tiếp tục được kích hoạt lặp lại vì nó không tạo ra phím ký tự.

Khi `phím 2` được nhấn, một sự kiện {{domxref("Element/keydown_event", "keydown")} khác được kích hoạt cho lần nhấn phím mới này, và giá trị thuộc tính `key` cho sự kiện được đặt thành chuỗi `@` cho loại bàn phím Mỹ và `"` cho loại bàn phím Anh, do phím bổ trợ `shift` đang hoạt động. Các sự kiện {{domxref("Element/beforeinput_event", "beforeinput")}} và {{domxref("Element/input_event", "input")}} được kích hoạt tiếp theo vì một phím ký tự đã được tạo ra.

Khi chúng ta nhả `phím 2`, một sự kiện {{domxref("Element/keyup_event", "keyup")} được kích hoạt và thuộc tính `key` sẽ duy trì các giá trị chuỗi `@` và `"` cho các bố cục bàn phím khác nhau.

Khi chúng ta cuối cùng nhả phím `shift`, một sự kiện {{domxref("Element/keyup_event", "keyup")} khác được kích hoạt cho nó, và giá trị thuộc tính key vẫn là `Shift`.

### Trường hợp 2

Khi phím shift được nhấn, sự kiện {{domxref("Element/keydown_event", "keydown")} được kích hoạt đầu tiên, và giá trị thuộc tính `key` được đặt thành chuỗi `Shift`. Khi chúng ta tiếp tục giữ phím này, sự kiện {{domxref("Element/keydown_event", "keydown")} không tiếp tục được kích hoạt lặp lại vì nó không tạo ra phím ký tự.

Khi `phím 2` được nhấn, một sự kiện {{domxref("Element/keydown_event", "keydown")} khác được kích hoạt cho lần nhấn phím mới này, và giá trị thuộc tính `key` cho sự kiện được đặt thành chuỗi `@` cho loại bàn phím Mỹ và `"` cho loại bàn phím Anh, do phím bổ trợ `shift` đang hoạt động. Các sự kiện {{domxref("Element/beforeinput_event", "beforeinput")}} và {{domxref("Element/input_event", "input")}} được kích hoạt tiếp theo vì một phím ký tự đã được tạo ra. Khi chúng ta tiếp tục giữ phím, sự kiện {{domxref("Element/keydown_event", "keydown")} tiếp tục được kích hoạt lặp lại và thuộc tính {{domxref("KeyboardEvent.repeat")}} được đặt thành `true`. Các sự kiện {{domxref("Element/beforeinput_event", "beforeinput")}} và {{domxref("Element/input_event", "input")}} cũng được kích hoạt lặp lại.

Khi chúng ta nhả phím `shift`, một sự kiện {{domxref("Element/keyup_event", "keyup")} được kích hoạt cho nó, và giá trị thuộc tính key vẫn là `Shift`. Tại thời điểm này, lưu ý rằng giá trị thuộc tính `key` cho sự kiện keydown lặp lại của lần nhấn `phím 2` bây giờ là "2" vì phím bổ trợ `shift` không còn hoạt động. Điều tương tự cũng áp dụng cho thuộc tính {{domxref("InputEvent.data")}} của các sự kiện {{domxref("Element/beforeinput_event", "beforeinput")}} và {{domxref("Element/input_event", "input")}}.

Khi chúng ta cuối cùng nhả `phím 2`, một sự kiện {{domxref("Element/keyup_event", "keyup")} được kích hoạt nhưng thuộc tính `key` sẽ được đặt thành giá trị chuỗi `2` cho cả hai bố cục bàn phím vì phím bổ trợ `shift` không còn hoạt động.

## Ví dụ

Ví dụ này sử dụng {{domxref("EventTarget.addEventListener()")} để lắng nghe các sự kiện {{domxref("Element/keydown_event", "keydown")}}. Khi chúng xảy ra, giá trị của phím được kiểm tra để xem nó có phải là một trong các phím mà mã quan tâm hay không, và nếu có, nó sẽ được xử lý theo cách nào đó (có thể bằng cách điều khiển tàu vũ trụ, hoặc bằng cách thay đổi ô được chọn trong bảng tính).

```js
window.addEventListener("keydown", (event) => {
  if (event.defaultPrevented) {
    return; // Không làm gì nếu sự kiện đã được xử lý
  }

  switch (event.key) {
    case "ArrowDown":
      // Thực hiện hành động cho phím "mũi tên xuống".
      break;
    case "ArrowUp":
      // Thực hiện hành động cho phím "mũi tên lên".
      break;
    case "ArrowLeft":
      // Thực hiện hành động cho phím "mũi tên trái".
      break;
    case "ArrowRight":
      // Thực hiện hành động cho phím "mũi tên phải".
      break;
    case "Enter":
      // Thực hiện hành động cho phím "enter" hoặc "return".
      break;
    case " ":
      // Thực hiện hành động cho phím "space".
      break;
    case "Escape":
      // Thực hiện hành động cho phím "esc".
      break;
    default:
      return; // Thoát khi không xử lý sự kiện phím này.
  }

  // Hủy hành động mặc định để tránh nó được xử lý hai lần
  event.preventDefault();
});
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
