---
title: "DataTransfer: phương thức clearData()"
short-title: clearData()
slug: Web/API/DataTransfer/clearData
page-type: web-api-instance-method
browser-compat: api.DataTransfer.clearData
---

{{APIRef("HTML Drag and Drop API")}}

Phương thức **`DataTransfer.clearData()`** xóa [dữ liệu kéo](/en-US/docs/Web/API/DataTransfer) của thao tác kéo cho kiểu đã cho. Nếu dữ liệu cho kiểu đã cho không tồn tại, phương thức này không làm gì.

Nếu phương thức này được gọi mà không có tham số hoặc định dạng là một chuỗi rỗng, dữ liệu của tất cả các kiểu sẽ bị xóa.

Phương thức này _không_ xóa tệp khỏi thao tác kéo, vì vậy vẫn có thể có một mục với kiểu `"Files"` trong danh sách {{domxref("DataTransfer.types")}} của đối tượng nếu có tệp nào đó trong thao tác kéo.

> [!NOTE]
> Phương thức này chỉ có thể được sử dụng trong trình xử lý cho sự kiện {{domxref("HTMLElement/dragstart_event", "dragstart")}}, vì đó là thời điểm duy nhất kho dữ liệu của thao tác kéo có thể ghi được.

## Cú pháp

```js-nolint
clearData()
clearData(format)
```

### Tham số

- `format` {{optional_inline}}
  - : Một chuỗi chỉ định loại dữ liệu cần xóa. Nếu tham số này là một chuỗi rỗng hoặc không được cung cấp, dữ liệu của tất cả các kiểu sẽ bị xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này cho thấy cách sử dụng các phương thức {{domxref("DataTransfer.getData()","getData()")}}, {{domxref("DataTransfer.setData()","setData()")}} và `clearData()` của đối tượng {{domxref("DataTransfer")}}.

### HTML

```html
<span class="tweaked" id="source" draggable="true">
  Select this element, drag it to the Drop Zone and then release the selection
  to move the element.
</span>
<span class="tweaked" id="target">Drop Zone</span>
<div>Status: <span id="status">Drag to start</span></div>
<div>Data is: <span id="data">uninitialized</span></div>
```

### CSS

```css
span.tweaked {
  display: inline-block;
  margin: 1em 0;
  padding: 1em 2em;
}

#source {
  color: blue;
  border: 1px solid black;
}

#target {
  border: 1px solid black;
}
```

### JavaScript

```js
// Select HTML elements
const draggable = document.getElementById("source");
const droppable = document.getElementById("target");
const status = document.getElementById("status");
const data = document.getElementById("data");
let dropped = false;

// Register event handlers
draggable.addEventListener("dragstart", dragStartHandler);
draggable.addEventListener("dragend", dragEndHandler);
droppable.addEventListener("dragover", dragOverHandler);
droppable.addEventListener("dragleave", dragLeaveHandler);
droppable.addEventListener("drop", dropHandler);

function dragStartHandler(event) {
  status.textContent = "Drag in process";

  // Change target element's border to signify drag has started
  event.currentTarget.style.border = "1px dashed blue";

  // Start by clearing existing clipboards; this will affect all types since we
  // don't give a specific type.

  event.dataTransfer.clearData();

  // Set the drag's format and data (use event target's id for data)
  event.dataTransfer.setData("text/plain", event.target.id);

  data.textContent = event.dataTransfer.getData("text/plain");
}

function dragEndHandler(event) {
  if (!dropped) {
    status.textContent = "Drag canceled";
  }

  data.textContent = event.dataTransfer.getData("text/plain") || "empty";

  // Change border to signify drag is no longer in process
  event.currentTarget.style.border = "1px solid black";

  if (dropped) {
    // Remove all event listeners
    draggable.removeEventListener("dragstart", dragStartHandler);
    draggable.removeEventListener("dragend", dragEndHandler);
    droppable.removeEventListener("dragover", dragOverHandler);
    droppable.removeEventListener("dragleave", dragLeaveHandler);
    droppable.removeEventListener("drop", dropHandler);
  }
}

function dragOverHandler(event) {
  status.textContent = "Drop available";

  event.preventDefault();
}

function dragLeaveHandler(event) {
  status.textContent = "Drag in process (drop was available)";

  event.preventDefault();
}

function dropHandler(event) {
  dropped = true;

  status.textContent = "Drop done";

  event.preventDefault();

  // Get data linked to event format « text »
  const _data = event.dataTransfer.getData("text/plain");
  const element = document.getElementById(_data);

  // Append drag source element to event's target element
  event.target.appendChild(element);

  // Change CSS styles and displayed text
  element.style.cssText = "border: 1px solid black;display: block; color: red";
  element.textContent = "I'm in the Drop Zone!";
}
```

{{EmbedLiveSample('Examples', 300, 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Kéo và thả](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- [Thao tác kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
- [Làm việc với kho dữ liệu kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)
