---
title: "DataTransfer: thuộc tính types"
short-title: types
slug: Web/API/DataTransfer/types
page-type: web-api-instance-property
browser-compat: api.DataTransfer.types
---

{{APIRef("HTML Drag and Drop API")}}

Thuộc tính chỉ đọc **`DataTransfer.types`** trả về các kiểu có sẵn trong {{domxref("DataTransfer.items","items")}}.

## Giá trị

Một mảng các định dạng dữ liệu. Mỗi định dạng là một chuỗi thường là kiểu MIME như `text/plain` hoặc `text/html`. Nếu thao tác kéo không bao gồm dữ liệu nào, danh sách này sẽ rỗng. Nếu có tệp nào đó được bao gồm trong thao tác kéo, thì một trong các kiểu sẽ là chuỗi `Files`.

## Ví dụ

Ví dụ này cho thấy cách sử dụng các thuộc tính `types` và {{domxref("DataTransfer.items","items")}}.

```html
<ul>
  <li id="i1" draggable="true">Drag Item 1 to the Drop Zone</li>
  <li id="i2" draggable="true">Drag Item 2 to the Drop Zone</li>
</ul>
<div id="target">Drop Zone</div>
<pre id="output"></pre>
```

```css
div {
  margin: 0em;
  padding: 2em;
}
#target {
  border: 1px solid black;
}
```

```js
const output = document.getElementById("output");
function log(msg) {
  output.textContent += `${msg}\n`;
}

document.querySelectorAll("li").forEach((item) => {
  item.addEventListener("dragstart", dragstartHandler);
});

function dragstartHandler(ev) {
  log(`dragStart: target.id = ${ev.target.id}`);

  // Add this element's id to the drag payload so the drop handler will
  // know which element to add to its tree
  ev.dataTransfer.setData("text/plain", ev.target.id);
  ev.dataTransfer.effectAllowed = "move";
}

const target = document.getElementById("target");

target.addEventListener("drop", (ev) => {
  log(`drop: target.id = ${ev.target.id}`);
  ev.preventDefault();

  // Get the id of the target and add the moved element to the target's DOM
  const data = ev.dataTransfer.getData("text");
  ev.target.appendChild(document.getElementById(data));

  // Print each format type
  for (let i = 0; i < ev.dataTransfer.types.length; i++) {
    log(`… types[${i}] = ${ev.dataTransfer.types[i]}`);
  }

  // Print each item's "kind" and "type"
  for (let i = 0; i < ev.dataTransfer.items.length; i++) {
    log(
      `… items[${i}].kind = ${ev.dataTransfer.items[i].kind}; type = ${ev.dataTransfer.items[i].type}`,
    );
  }
});

target.addEventListener("dragover", (ev) => {
  ev.preventDefault();
  ev.dataTransfer.dropEffect = "move";
});
```

{{EmbedLiveSample("examples", "", 400)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Kéo và thả](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- [Thao tác kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
- [Làm việc với kho dữ liệu kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)
