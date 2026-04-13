---
title: "DataTransferItemList: clear() method"
short-title: clear()
slug: Web/API/DataTransferItemList/clear
page-type: web-api-instance-method
browser-compat: api.DataTransferItemList.clear
---

{{APIRef("HTML Drag and Drop API")}}

Phương thức **`clear()`** của {{domxref("DataTransferItemList")}} xóa tất cả các đối tượng {{domxref("DataTransferItem")}} khỏi danh sách mục dữ liệu kéo, để danh sách trống.

Kho dữ liệu kéo mà danh sách này được lưu trữ chỉ có thể ghi khi xử lý sự kiện {{domxref("HTMLElement/dragstart_event", "dragstart")}}. Khi xử lý {{domxref("HTMLElement/drop_event", "drop")}}, kho dữ liệu kéo ở chế độ chỉ đọc và phương thức này không làm gì. Không có ngoại lệ nào được ném ra.

## Cú pháp

```js-nolint
clear()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này cho thấy cách sử dụng phương thức `clear()`.

### HTML

```html
<div>
  <p id="source" draggable="true">
    Select this element, drag it to the Drop Zone and then release the selection
    to move the element.
  </p>
</div>
<div id="target">Drop Zone</div>
```

### CSS

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

### JavaScript

```js
const source = document.getElementById("source");
const target = document.getElementById("target");

source.addEventListener("dragstart", (ev) => {
  console.log("dragStart");

  // Add this element's id to the drag payload so the drop handler will
  // know which element to add to its tree
  const dataList = ev.dataTransfer.items;
  dataList.add(ev.target.id, "text/plain");

  // Add some other items to the drag payload
  dataList.add("<p>Paragraph…</p>", "text/html");
  dataList.add("http://www.example.org", "text/uri-list");
});

source.addEventListener("dragend", (ev) => {
  console.log("dragEnd");
  const dataList = ev.dataTransfer.items;

  // Clear any remaining drag data
  dataList.clear();
});

target.addEventListener("drop", (ev) => {
  console.log("Drop");
  ev.preventDefault();

  // Loop through the dropped items and log their data
  for (const item of ev.dataTransfer.items) {
    if (item.kind === "string" && item.type.match(/^text\/plain/)) {
      // This item is the target node
      item.getAsString((s) => {
        ev.target.appendChild(document.getElementById(s));
      });
    } else if (item.kind === "string" && item.type.match(/^text\/html/)) {
      // Drag data item is HTML
      item.getAsString((s) => {
        console.log(`… Drop: HTML = ${s}`);
      });
    } else if (item.kind === "string" && item.type.match(/^text\/uri-list/)) {
      // Drag data item is URI
      item.getAsString((s) => {
        console.log(`… Drop: URI = ${s}`);
      });
    }
  }
});

target.addEventListener("dragover", (ev) => {
  console.log("dragOver");
  ev.preventDefault();

  // Set the dropEffect to move
  ev.dataTransfer.dropEffect = "move";
});
```

### Kết quả

{{EmbedLiveSample('Examples', 400, 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
