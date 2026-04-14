---
title: <input type="button">
slug: Web/HTML/Reference/Elements/input/button
page-type: html-attribute-value
browser-compat: html.elements.input.type_button
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} có kiểu **`button`** được hiển thị dưới dạng nút nhấn (push button), có thể được lập trình để điều khiển các chức năng tùy chỉnh trên trang web khi được gán một hàm xử lý sự kiện (thường là sự kiện {{domxref("Element/click_event", "click")}}).

{{InteractiveExample("HTML Demo: &lt;input type=&quot;button&quot;&gt;", "tabbed-shorter")}}

```html interactive-example
<input class="styled" type="button" value="Add to favorites" />
```

```css interactive-example
.styled {
  border: 0;
  line-height: 2.5;
  padding: 0 20px;
  font-size: 1rem;
  text-align: center;
  color: white;
  text-shadow: 1px 1px 1px black;
  border-radius: 10px;
  background-color: tomato;
  background-image: linear-gradient(
    to top left,
    rgb(0 0 0 / 20%),
    rgb(0 0 0 / 20%) 30%,
    transparent
  );
  box-shadow:
    inset 2px 2px 3px rgb(255 255 255 / 60%),
    inset -2px -2px 3px rgb(0 0 0 / 60%);
}

.styled:hover {
  background-color: red;
}

.styled:active {
  box-shadow:
    inset -2px -2px 3px rgb(255 255 255 / 60%),
    inset 2px 2px 3px rgb(0 0 0 / 60%);
}
```

> [!NOTE]
> Mặc dù các phần tử `<input>` có kiểu `button` vẫn là HTML hợp lệ, nhưng phần tử {{HTMLElement("button")}} mới hơn hiện là cách được ưu tiên để tạo nút. Vì nhãn văn bản của {{HTMLElement("button")}} được đặt giữa thẻ mở và thẻ đóng, bạn có thể chèn HTML vào nhãn, thậm chí cả hình ảnh.

## Giá trị

### Nút có giá trị

Thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của phần tử `<input type="button">` chứa một chuỗi được dùng làm nhãn của nút. `value` cung cấp {{glossary("accessible description")}} cho nút.

```html
<input type="button" value="Click Me" />
```

{{EmbedLiveSample("Button_with_a_value", 650, 30)}}

### Nút không có giá trị

Nếu bạn không chỉ định `value`, bạn sẽ có một nút trống:

```html
<input type="button" />
```

{{EmbedLiveSample("Button_without_a_value", 650, 30)}}

## Sử dụng nút

Các phần tử `<input type="button">` không có hành vi mặc định (các biến thể của chúng là `<input type="submit">` và [`<input type="reset">`](/en-US/docs/Web/HTML/Reference/Elements/input/reset) được dùng để gửi và đặt lại biểu mẫu). Để làm cho nút thực hiện chức năng nào đó, bạn phải viết mã JavaScript.

### Một nút cơ bản

Chúng ta sẽ bắt đầu bằng cách tạo một nút cơ bản với trình xử lý sự kiện {{domxref("Element/click_event", "click")}} để khởi động máy (thực ra là chuyển đổi giá trị `value` của nút và nội dung văn bản của đoạn văn tiếp theo):

```html
<form>
  <input type="button" value="Start machine" />
</form>
<p>The machine is stopped.</p>
```

```js
const button = document.querySelector("input");
const paragraph = document.querySelector("p");

button.addEventListener("click", updateButton);

function updateButton() {
  if (button.value === "Start machine") {
    button.value = "Stop machine";
    paragraph.textContent = "The machine has started!";
  } else {
    button.value = "Start machine";
    paragraph.textContent = "The machine is stopped.";
  }
}
```

Script lấy tham chiếu đến đối tượng {{domxref("HTMLInputElement")}} đại diện cho `<input>` trong DOM và lưu vào biến `button`. Sau đó {{domxref("EventTarget.addEventListener", "addEventListener()")}} được dùng để gắn một hàm sẽ chạy khi sự kiện {{domxref("Element/click_event", "click")}} xảy ra trên nút.

{{EmbedLiveSample("A_basic_button", 650, 100)}}

### Thêm phím tắt bàn phím cho nút

Phím tắt bàn phím, còn gọi là access key hay keyboard equivalent, cho phép người dùng kích hoạt nút bằng một phím hoặc tổ hợp phím. Để thêm phím tắt cho nút — như với bất kỳ {{HTMLElement("input")}} nào — bạn dùng thuộc tính toàn cục [`accesskey`](/en-US/docs/Web/HTML/Reference/Global_attributes/accesskey).

Trong ví dụ này, <kbd>s</kbd> được chỉ định làm access key (bạn cần nhấn <kbd>s</kbd> cộng với các phím bổ trợ tương ứng với trình duyệt/hệ điều hành; xem [accesskey](/en-US/docs/Web/HTML/Reference/Global_attributes/accesskey) để biết danh sách).

```html
<form>
  <input type="button" value="Start machine" accesskey="s" />
</form>
<p>The machine is stopped.</p>
```

```js hidden
const button = document.querySelector("input");
const paragraph = document.querySelector("p");

button.addEventListener("click", updateButton);

function updateButton() {
  if (button.value === "Start machine") {
    button.value = "Stop machine";
    paragraph.textContent = "The machine has started!";
  } else {
    button.value = "Start machine";
    paragraph.textContent = "The machine is stopped.";
  }
}
```

{{EmbedLiveSample("Adding_keyboard_shortcuts_to_buttons", 650, 100)}}

> [!NOTE]
> Vấn đề với ví dụ trên là người dùng sẽ không biết access key là gì! Trong một trang web thực tế, bạn cần cung cấp thông tin này theo cách không ảnh hưởng đến thiết kế trang (ví dụ: cung cấp liên kết trỏ đến thông tin về các access key của trang).

### Vô hiệu hóa và kích hoạt nút

Để vô hiệu hóa một nút, hãy chỉ định thuộc tính toàn cục [`disabled`](/en-US/docs/Web/HTML/Reference/Attributes/disabled) trên nút như sau:

```html
<input type="button" value="Disable me" disabled />
```

#### Thiết lập thuộc tính disabled

Bạn có thể kích hoạt và vô hiệu hóa nút vào lúc chạy bằng cách đặt `disabled` thành `true` hoặc `false`. Trong ví dụ này, nút ban đầu được kích hoạt, nhưng khi bạn nhấn nó, nút sẽ bị vô hiệu hóa bằng `button.disabled = true`. Sau đó, hàm {{domxref("Window.setTimeout", "setTimeout()")}} được dùng để đặt lại nút về trạng thái kích hoạt sau hai giây.

```html
<input type="button" value="Enabled" />
```

```js
const button = document.querySelector("input");

button.addEventListener("click", disableButton);

function disableButton() {
  button.disabled = true;
  button.value = "Disabled";
  setTimeout(() => {
    button.disabled = false;
    button.value = "Enabled";
  }, 2000);
}
```

{{EmbedLiveSample("Setting_the_disabled_attribute", 650, 60)}}

#### Kế thừa trạng thái disabled

Nếu thuộc tính `disabled` không được chỉ định, nút kế thừa trạng thái `disabled` từ phần tử cha. Điều này cho phép bạn kích hoạt và vô hiệu hóa nhóm các phần tử cùng một lúc bằng cách bao chúng trong một container như phần tử {{HTMLElement("fieldset")}}, rồi đặt `disabled` trên container.

Ví dụ dưới đây cho thấy điều này. Rất giống ví dụ trước, ngoại trừ thuộc tính `disabled` được đặt trên `<fieldset>` khi nút đầu tiên được nhấn — điều này khiến cả ba nút bị vô hiệu hóa cho đến khi hết thời gian chờ hai giây.

```html
<fieldset>
  <legend>Button group</legend>
  <input type="button" value="Button 1" />
  <input type="button" value="Button 2" />
  <input type="button" value="Button 3" />
</fieldset>
```

```js
const button = document.querySelector("input");
const fieldset = document.querySelector("fieldset");

button.addEventListener("click", disableButton);

function disableButton() {
  fieldset.disabled = true;
  setTimeout(() => {
    fieldset.disabled = false;
  }, 2000);
}
```

{{EmbedLiveSample("Inheriting_the_disabled_state", 650, 100)}}

> [!NOTE]
> Không giống các trình duyệt khác, Firefox duy trì trạng thái `disabled` của phần tử `<input>` ngay cả sau khi trang được tải lại. Để khắc phục, hãy đặt thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete) của phần tử `<input>` thành `off`. (Xem [Firefox bug 654072](https://bugzil.la/654072) để biết thêm chi tiết.)

## Kiểm tra hợp lệ

Nút không tham gia vào kiểm tra ràng buộc; chúng không có giá trị thực sự cần ràng buộc.

## Ví dụ

Ví dụ dưới đây cho thấy một ứng dụng vẽ rất cơ bản được tạo bằng phần tử {{htmlelement("canvas")}} cùng một số CSS và JavaScript (CSS sẽ được ẩn để ngắn gọn). Hai điều khiển đầu cho phép bạn chọn màu và kích thước bút vẽ. Nút khi được nhấn sẽ gọi hàm xóa canvas.

```html
<div class="toolbar">
  <input type="color" aria-label="select pen color" />
  <input
    type="range"
    min="2"
    max="50"
    value="30"
    aria-label="select pen size" /><span class="output">30</span>
  <input type="button" value="Clear canvas" />
</div>

<canvas class="myCanvas">
  <p>Add suitable fallback here.</p>
</canvas>
```

```css hidden
body {
  background: #cccccc;
  margin: 0;
  overflow: hidden;
}

.toolbar {
  background: #cccccc;
  width: 150px;
  height: 75px;
  padding: 5px;
}

input[type="color"],
input[type="button"] {
  width: 90%;
  margin: 0 auto;
  display: block;
}

input[type="range"] {
  width: 70%;
}

span {
  position: relative;
  bottom: 5px;
}
```

```js
const canvas = document.querySelector(".myCanvas");
const width = (canvas.width = window.innerWidth);
const height = (canvas.height = window.innerHeight - 85);
const ctx = canvas.getContext("2d");

ctx.fillStyle = "rgb(0 0 0)";
ctx.fillRect(0, 0, width, height);

const colorPicker = document.querySelector('input[type="color"]');
const sizePicker = document.querySelector('input[type="range"]');
const output = document.querySelector(".output");
const clearBtn = document.querySelector('input[type="button"]');

// covert degrees to radians
function degToRad(degrees) {
  return (degrees * Math.PI) / 180;
}

// update size picker output value

sizePicker.oninput = () => {
  output.textContent = sizePicker.value;
};

// store mouse pointer coordinates, and whether the button is pressed
let curX;
let curY;
let pressed = false;

// update mouse pointer coordinates
document.onmousemove = (e) => {
  curX = e.pageX;
  curY = e.pageY;
};

canvas.onmousedown = () => {
  pressed = true;
};

canvas.onmouseup = () => {
  pressed = false;
};

clearBtn.onclick = () => {
  ctx.fillStyle = "rgb(0 0 0)";
  ctx.fillRect(0, 0, width, height);
};

function draw() {
  if (pressed) {
    ctx.fillStyle = colorPicker.value;
    ctx.beginPath();
    ctx.arc(
      curX,
      curY - 85,
      sizePicker.value,
      degToRad(0),
      degToRad(360),
      false,
    );
    ctx.fill();
  }

  requestAnimationFrame(draw);
}

draw();
```

{{EmbedLiveSample("Examples", '100%', 600)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>Một chuỗi được dùng làm nhãn của nút</td>
    </tr>
    <tr>
      <td><strong>Sự kiện</strong></td>
      <td>{{domxref("Element/click_event", "click")}}</td>
    </tr>
    <tr>
      <td><strong>Thuộc tính chung được hỗ trợ</strong></td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#type"><code>type</code></a> và
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#value"><code>value</code></a>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td><code>value</code></td>
    </tr>
    <tr>
      <td><strong>Giao diện DOM</strong></td>
      <td><p>{{domxref("HTMLInputElement")}}</p></td>
    </tr>
    <tr>
      <td><strong>Phương thức</strong></td>
      <td>Không có</td>
    </tr>
    <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role"><code>button</code></a></td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}} và giao diện {{domxref("HTMLInputElement")}} thực thi nó.
- Phần tử {{HTMLElement("button")}} hiện đại hơn.
