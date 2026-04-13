---
title: "DataTransfer: thuộc tính items"
short-title: items
slug: Web/API/DataTransfer/items
page-type: web-api-instance-property
browser-compat: api.DataTransfer.items
---

{{APIRef("HTML Drag and Drop API")}}

Thuộc tính chỉ đọc `items` của giao diện {{domxref("DataTransfer")}} là {{domxref("DataTransferItemList","danh sách")}} các {{domxref("DataTransferItem","mục dữ liệu được truyền", "", "nocode")}} trong một thao tác kéo. Danh sách bao gồm một mục cho mỗi mục trong thao tác, và nếu thao tác không có mục nào, danh sách sẽ rỗng.

## Giá trị

Một đối tượng {{domxref("DataTransferItemList")}} chứa các đối tượng {{domxref("DataTransferItem")}} đại diện cho các mục đang được kéo trong một thao tác kéo, một mục danh sách cho mỗi đối tượng đang được kéo. Nếu thao tác kéo không có dữ liệu, danh sách rỗng.

## Ví dụ

### Ghi log các mục đang kéo

Ví dụ này sử dụng `items` để ghi log thông tin về các mục đang kéo.

#### HTML

```html
<ul>
  <li id="source1" draggable="true">Drag Item 1 to the Drop Zone</li>
  <li id="source2" draggable="true">Drag Item 2 to the Drop Zone</li>
</ul>
<div id="target">Drop Zone</div>

<button id="reset">Reset</button>
```

#### CSS

```css
div {
  margin: 0em;
  padding: 2em;
}

#target {
  border: 1px solid black;
}
```

#### JavaScript

```js
function dragstartHandler(ev) {
  console.log(`dragstart: target.id = ${ev.target.id}`);
  // Add this element's id to the drag payload so the drop handler will
  // know which element to add to its tree
  ev.dataTransfer.setData("text/plain", ev.target.id);
  ev.dataTransfer.effectAllowed = "move";
}

function dropHandler(ev) {
  ev.preventDefault();
  // Get the id of the target and add the moved element to the target's DOM
  const data = ev.dataTransfer.getData("text");
  ev.target.appendChild(document.getElementById(data));
  // Print each item's "kind" and "type"
  if (ev.dataTransfer.items) {
    for (const item of ev.dataTransfer.items) {
      console.log(`kind = ${item.kind}, type = ${item.type}`);
    }
  }
}

function dragoverHandler(ev) {
  ev.preventDefault();
  // Set the dropEffect to move
  ev.dataTransfer.dropEffect = "move";
}

const source1 = document.querySelector("#source1");
const source2 = document.querySelector("#source2");
const target = document.querySelector("#target");

source1.addEventListener("dragstart", dragstartHandler);
source2.addEventListener("dragstart", dragstartHandler);
target.addEventListener("dragover", dragoverHandler);
target.addEventListener("drop", dropHandler);

const reset = document.querySelector("#reset");
reset.addEventListener("click", () => document.location.reload());
```

#### Kết quả

{{EmbedLiveSample("Logging dragged items", 0, 400)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Kéo và thả](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- [Thao tác kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
- [Làm việc với kho dữ liệu kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)
