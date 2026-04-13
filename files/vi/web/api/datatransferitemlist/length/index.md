---
title: "DataTransferItemList: length property"
short-title: length
slug: Web/API/DataTransferItemList/length
page-type: web-api-instance-property
browser-compat: api.DataTransferItemList.length
---

{{APIRef("HTML Drag and Drop API")}}

Thuộc tính chỉ đọc **`length`** của giao diện {{domxref("DataTransferItemList")}} trả về số lượng mục hiện có trong danh sách mục kéo.

## Giá trị

Số lượng mục dữ liệu kéo trong danh sách, hoặc 0 nếu danh sách trống hoặc bị vô hiệu hóa. Danh sách mục kéo được coi là bị vô hiệu hóa nếu đối tượng {{domxref("DataTransfer")}} của danh sách mục không được liên kết với kho dữ liệu kéo.

## Ví dụ

Ví dụ này cho thấy cách sử dụng thuộc tính `length`.

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
  const data = ev.dataTransfer.items;
  // Loop through the dropped items and log their data
  for (let i = 0; i < data.length; i++) {
    if (data[i].kind === "string" && data[i].type.match("^text/plain")) {
      // This item is the target node
      data[i].getAsString((s) => {
        ev.target.appendChild(document.getElementById(s));
      });
    } else if (data[i].kind === "string" && data[i].type.match("^text/html")) {
      // Drag data item is HTML
      data[i].getAsString((s) => {
        console.log(`… Drop: HTML = ${s}`);
      });
    } else if (
      data[i].kind === "string" &&
      data[i].type.match("^text/uri-list")
    ) {
      // Drag data item is URI
      data[i].getAsString((s) => {
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

{{EmbedLiveSample('Examples', 100, 250)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
