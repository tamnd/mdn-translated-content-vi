---
title: "DataTransferItemList: remove() method"
short-title: remove()
slug: Web/API/DataTransferItemList/remove
page-type: web-api-instance-method
browser-compat: api.DataTransferItemList.remove
---

{{APIRef("HTML Drag and Drop API")}}

Phương thức **`DataTransferItemList.remove()`** xóa {{domxref("DataTransferItem")}} tại chỉ số được chỉ định khỏi danh sách. Nếu chỉ số nhỏ hơn 0 hoặc lớn hơn độ dài danh sách trừ 1, danh sách sẽ không thay đổi.

## Cú pháp

```js-nolint
remove(index)
```

### Tham số

- `index`
  - : Số chỉ số bắt đầu từ 0 của mục trong danh sách dữ liệu kéo cần xóa. Nếu `index` không tương ứng với mục hiện có trong danh sách, danh sách sẽ không thay đổi.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu kho dữ liệu kéo không ở chế độ đọc/ghi và do đó mục không thể bị xóa.

## Ví dụ

### Kéo và thả một phần tử

Ví dụ này cho thấy cách sử dụng phương thức `remove()`.

#### HTML

```html
<div>
  <p id="source" draggable="true">
    Select this element, drag it to the Drop Zone and then release the selection
    to move the element.
  </p>
</div>
<div id="target">Drop Zone</div>
```

#### CSS

```css
div {
  margin: 0em;
  padding: 2em;
}

#source {
  color: blue;
  border: 1px solid black;
}

#target {
  border: 1px solid black;
}
```

#### JavaScript

```js
function dragstartHandler(ev) {
  console.log("dragStart");
  // Add this element's id to the drag payload so the drop handler will
  // know which element to add to its tree
  const dataList = ev.dataTransfer.items;
  dataList.add(ev.target.id, "text/plain");
  // Add some other items to the drag payload
  dataList.add("<p>Paragraph…</p>", "text/html");
  dataList.add("http://www.example.org", "text/uri-list");
}

function dropHandler(ev) {
  console.log("Drop");
  ev.preventDefault();
  const data = event.dataTransfer.items;
  // Loop through the dropped items and log their data
  for (const item of data) {
    if (item.kind === "string" && item.type.match("^text/plain")) {
      // This item is the target node
      item.getAsString((s) => {
        ev.target.appendChild(document.getElementById(s));
      });
    } else if (item.kind === "string" && item.type.match("^text/html")) {
      // Drag data item is HTML
      item.getAsString((s) => {
        console.log(`… Drop: HTML = ${s}`);
      });
    } else if (item.kind === "string" && item.type.match("^text/uri-list")) {
      // Drag data item is URI
      item.getAsString((s) => {
        console.log(`… Drop: URI = ${s}`);
      });
    }
  }
}

function dragoverHandler(ev) {
  console.log("dragOver");
  ev.preventDefault();
  // Set the dropEffect to move
  ev.dataTransfer.dropEffect = "move";
}

function dragendHandler(ev) {
  console.log("dragEnd");
  const dataList = ev.dataTransfer.items;
  // Clear all the files. Iterate in reverse order to safely remove.
  for (let i = dataList.length - 1; i >= 0; i--) {
    if (dataList[i].kind === "file") {
      dataList.remove(i);
    }
  }
  // Clear any remaining drag data
  dataList.clear();
}

const source = document.querySelector("#source");
source.addEventListener("dragstart", dragstartHandler);
source.addEventListener("dragend", dragendHandler);

const target = document.querySelector("#target");
target.addEventListener("drop", dropHandler);
target.addEventListener("dragover", dragoverHandler);
```

#### Kết quả

{{ EmbedLiveSample('Dragging and dropping an element', 100, '300px')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
