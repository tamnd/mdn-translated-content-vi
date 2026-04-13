---
title: CommandEvent
slug: Web/API/CommandEvent
page-type: web-api-interface
browser-compat: api.CommandEvent
---

{{APIRef("Invoker Commands API")}}

Giao diện **`CommandEvent`** biểu diễn một sự kiện thông báo cho người dùng khi một phần tử {{domxref("HTMLButtonElement", "button")}} có các thuộc tính {{domxref("HTMLButtonElement.commandForElement", "commandForElement")}} và {{domxref("HTMLButtonElement.command", "command")}} hợp lệ sắp gọi một phần tử tương tác.

Đây là đối tượng sự kiện cho sự kiện `command` của `HTMLElement` {{domxref("HTMLElement.command_event", "command")}}, biểu diễn một hành động từ một Invoker Control khi nó được kích hoạt (ví dụ khi được nhấp hoặc nhấn).

{{InheritanceDiagram}}

## Constructor

- {{domxref("CommandEvent.CommandEvent", "CommandEvent()")}}
  - : Tạo một đối tượng `CommandEvent`.

## Thuộc tính thể hiện

_Giao diện này kế thừa các thuộc tính từ đối tượng cha của nó, {{DOMxRef("Event")}}._

- {{domxref("CommandEvent.source")}} {{ReadOnlyInline}}
  - : Một {{domxref("HTMLButtonElement")}} biểu diễn nút đã gây ra lần gọi này.
- {{domxref("CommandEvent.command")}} {{ReadOnlyInline}}
  - : Một chuỗi biểu diễn giá trị {{domxref("HTMLButtonElement.command", "command")}} của nút nguồn.

## Ví dụ

### Ví dụ cơ bản

```html
<button commandfor="mypopover" command="show-popover">Show popover</button>

<div popover id="mypopover" role="[declare appropriate ARIA role]">
  <!-- popover content here -->
  <button commandfor="mypopover" command="hide-popover">Hide popover</button>
</div>
```

```js
const popover = document.getElementById("mypopover");

// …

popover.addEventListener("command", (event) => {
  if (event.command === "show-popover") {
    console.log("Popover is about to be shown");
  }
});
```

### Dùng giá trị tùy chỉnh cho các lệnh

Trong ví dụ này, ba nút được tạo với [`command` có giá trị tùy chỉnh](/en-US/docs/Web/HTML/Reference/Elements/button#custom_values).

```html
<div class="controls">
  <button commandfor="the-image" command="--rotate-left">Rotate Left</button>
  <button commandfor="the-image" command="--reset">Reset</button>
  <button commandfor="the-image" command="--rotate-right">Rotate Right</button>
</div>

<img
  id="the-image"
  src="/shared-assets/images/examples/dino.svg"
  alt="dinosaur head rotated 0 degrees" />
```

```css hidden
.controls {
  margin-block-end: 20px;
}
```

Một trình lắng nghe sự kiện được gắn vào hình ảnh bằng [sự kiện `command`](/en-US/docs/Web/API/HTMLElement/command_event).
Khi một trong các nút được nhấp, trình lắng nghe sẽ chạy mã dựa trên giá trị `command` tùy chỉnh được gán cho nút, xoay hình ảnh và đồng thời cập nhật văn bản `alt` của nó để cho biết góc mới của hình ảnh.

```js
const image = document.getElementById("the-image");

image.addEventListener("command", (event) => {
  let rotate = parseInt(event.target.style.rotate || "0", 10);
  if (event.command === "--reset") {
    rotate = 0;
    event.target.style.rotate = `${rotate}deg`;
  } else if (event.command === "--rotate-left") {
    rotate = rotate === -270 ? 0 : rotate - 90;
    event.target.style.rotate = `${rotate}deg`;
  } else if (event.command === "--rotate-right") {
    rotate = rotate === 270 ? 0 : rotate + 90;
    event.target.style.rotate = `${rotate}deg`;
  }
  event.target.alt = `dinosaur head rotated ${rotate} degrees`;
});
```

{{EmbedLiveSample('using_custom_values_for_commands', '100%', "220")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Invoker Commands API", "Invoker Commands API", "", "nocode")}}
- {{domxref("HTMLButtonElement.command")}}
- {{domxref("HTMLButtonElement.commandForElement")}}
