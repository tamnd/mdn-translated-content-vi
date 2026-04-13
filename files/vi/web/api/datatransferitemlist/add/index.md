---
title: "DataTransferItemList: add() method"
short-title: add()
slug: Web/API/DataTransferItemList/add
page-type: web-api-instance-method
browser-compat: api.DataTransferItemList.add
---

{{APIRef("HTML Drag and Drop API")}}

Phương thức **`DataTransferItemList.add()`** tạo một {{domxref("DataTransferItem")}} mới bằng cách sử dụng dữ liệu được chỉ định và thêm vào danh sách mục kéo. Mục có thể là đối tượng {{domxref("File")}} hoặc một chuỗi của kiểu nhất định. Nếu mục được thêm vào danh sách thành công, đối tượng {{domxref("DataTransferItem")}} mới được tạo sẽ được trả về.

## Cú pháp

```js-nolint
add(data, type)
add(file)
```

### Tham số

- `data`
  - : Một chuỗi đại diện cho dữ liệu của mục kéo.
- `type`
  - : Một chuỗi kiểu của mục kéo. Một số kiểu ví dụ là `text/html` và `text/plain`.
- `file`
  - : Một đối tượng {{domxref("File")}}. Không cần cung cấp kiểu trong trường hợp này.

### Giá trị trả về

Một {{domxref("DataTransferItem")}} chứa dữ liệu được chỉ định. Nếu mục kéo không thể được tạo (ví dụ nếu đối tượng {{domxref("DataTransfer")}} liên kết không có kho dữ liệu), `null` được trả về.

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu tham số chuỗi `data` được cung cấp và danh sách đã chứa một mục có {{domxref("DataTransferItem.kind","kind")}} là `"Plain Unicode string"` và có kiểu bằng với tham số kiểu được chỉ định.

## Ví dụ

Ví dụ này cho thấy cách sử dụng phương thức `add()`.

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
  for (let i = 0; i < dataList.length; i++) {
    dataList.remove(i);
  }
  // Clear any remaining drag data
  dataList.clear();
});

target.addEventListener("drop", (ev) => {
  console.log("Drop");
  ev.preventDefault();
  // Loop through the dropped items and log their data
  for (const item of event.dataTransfer.items) {
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
