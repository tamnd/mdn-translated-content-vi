---
title: DataTransferItemList
slug: Web/API/DataTransferItemList
page-type: web-api-interface
browser-compat: api.DataTransferItemList
---

{{APIRef("HTML Drag and Drop API")}}

Đối tượng **`DataTransferItemList`** là danh sách các đối tượng {{domxref("DataTransferItem")}} đại diện cho các mục đang được kéo. Trong _thao tác kéo_, mỗi {{domxref("DragEvent")}} có thuộc tính {{domxref("DragEvent.dataTransfer","dataTransfer")}} và thuộc tính đó là một `DataTransferItemList`.

Các mục riêng lẻ có thể được truy cập bằng [ký hiệu ngoặc](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors#bracket_notation) `[]`.

`DataTransferItemList` được thiết kế chủ yếu cho [API Kéo và Thả HTML](/en-US/docs/Web/API/HTML_Drag_and_Drop_API) và vẫn được quy định trong phần kéo và thả HTML, nhưng hiện nay cũng được sử dụng bởi các API khác như {{domxref("ClipboardEvent.clipboardData")}} và {{domxref("InputEvent.dataTransfer")}}. Tài liệu về `DataTransferItemList` chủ yếu thảo luận về cách sử dụng trong các thao tác kéo và thả, bạn nên tham khảo tài liệu API khác để biết cách sử dụng `DataTransferItemList` trong các ngữ cảnh đó.

Giao diện này không có hàm khởi tạo.

## Thuộc tính phiên bản

- {{domxref("DataTransferItemList.length")}} {{ReadOnlyInline}}
  - : Một `unsigned long` là số lượng mục kéo trong danh sách.

## Phương thức phiên bản

- {{domxref("DataTransferItemList.add()")}}
  - : Thêm một mục (đối tượng {{domxref("File")}} hoặc chuỗi) vào danh sách mục kéo và trả về đối tượng {{domxref("DataTransferItem")}} cho mục mới.
- {{domxref("DataTransferItemList.remove()")}}
  - : Xóa mục kéo khỏi danh sách tại chỉ số đã cho.
- {{domxref("DataTransferItemList.clear()")}}
  - : Xóa tất cả các mục kéo khỏi danh sách.

## Ví dụ

Ví dụ này cho thấy cách sử dụng kéo và thả.

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

{{EmbedLiveSample('Example', '35%', '250px')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
