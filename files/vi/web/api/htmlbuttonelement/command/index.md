---
title: "HTMLButtonElement: thuộc tính command"
short-title: command
slug: Web/API/HTMLButtonElement/command
page-type: web-api-instance-property
browser-compat: api.HTMLButtonElement.command
---

{{APIRef("Invoker Commands API")}}

Thuộc tính **`command`** của giao diện {{domxref("HTMLButtonElement")}} lấy và đặt hành động sẽ được thực hiện trên phần tử do nút này điều khiển. Để thuộc tính này có hiệu lực, phải đặt [`commandfor`](/en-US/docs/Web/HTML/Reference/Elements/button#commandfor).

Nó phản ánh thuộc tính HTML [`command`](/en-US/docs/Web/HTML/Reference/Elements/button#command).

## Giá trị

Một chuỗi. Xem thuộc tính [`command`](/en-US/docs/Web/HTML/Reference/Elements/button#command) để biết các giá trị hợp lệ.

## Ví dụ

### Ví dụ cơ bản

```html
<button id="toggleBtn" commandfor="mypopover" command="toggle-popover">
  Toggle popover
</button>

<div popover id="mypopover">
  <button commandfor="mypopover" command="hide-popover">Hide popover</button>
</div>
```

```js
const popover = document.getElementById("mypopover");
const toggleBtn = document.getElementById("toggleBtn");

toggleBtn.command = "show-popover";
```

### Sử dụng giá trị tùy chỉnh cho lệnh

Trong ví dụ này, ba nút được tạo bằng [giá trị tùy chỉnh](/en-US/docs/Web/HTML/Reference/Elements/button#custom_values) cho `command`.
Mỗi nút nhắm đến cùng một hình ảnh bằng thuộc tính `commandfor`.

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

Một trình nghe sự kiện được gắn vào hình ảnh bằng [sự kiện `command`](/en-US/docs/Web/API/CommandEvent).
Khi một trong các nút được nhấp, trình nghe sẽ chạy mã dựa trên giá trị `command` tùy chỉnh được gán cho nút, xoay hình ảnh và đồng thời cập nhật văn bản `alt` để cho biết góc mới của hình ảnh.

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

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Invoker Commands API", "Invoker Commands API", "", "nocode")}}
- {{domxref("HTMLButtonElement.commandForElement")}}
- {{domxref("CommandEvent")}}
- [`<button>` `command` attribute](/en-US/docs/Web/HTML/Reference/Elements/button#command)
