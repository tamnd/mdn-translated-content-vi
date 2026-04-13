---
title: Kéo và thả file
slug: Web/API/HTML_Drag_and_Drop_API/File_drag_and_drop
page-type: guide
---

{{DefaultAPISidebar("HTML Drag and Drop API")}}

Giao diện HTML Drag and Drop cho phép các ứng dụng web chấp nhận file kéo và thả từ người dùng. Hướng dẫn này mô tả cách nhận một hoặc nhiều file được kéo từ hệ thống file quản lý của hệ điều hành xuống một trang web.

## Định nghĩa mục tiêu thả

Mục tiêu thả là phần tử mà người dùng có thể thả file lên đó. Để kích hoạt khả năng nhận file, bạn cần ngăn hành vi mặc định của các sự kiện {{domxref("HTMLElement/dragover_event", "dragover")}} và {{domxref("HTMLElement/drop_event", "drop")}}.

```html
<div id="drop-zone">
  <p>Drag one or more files to this <i>drop zone</i>.</p>
</div>
```

```js
function dragoverHandler(ev) {
  ev.preventDefault();
}

function dropHandler(ev) {
  ev.preventDefault();
  // Xử lý các file được thả
}

const dropZone = document.getElementById("drop-zone");
dropZone.addEventListener("dragover", dragoverHandler);
dropZone.addEventListener("drop", dropHandler);
```

## Xử lý thả file

Khi sự kiện `drop` kích hoạt, bạn có thể truy cập các file được thả thông qua thuộc tính {{domxref("DataTransfer.files","dataTransfer.files")}} hoặc {{domxref("DataTransfer.items","dataTransfer.items")}}.

### Sử dụng `dataTransfer.files`

```js
function dropHandler(ev) {
  ev.preventDefault();

  if (ev.dataTransfer.files.length > 0) {
    for (const file of ev.dataTransfer.files) {
      console.log(`File name: ${file.name}`);
      console.log(`File size: ${file.size} bytes`);
      console.log(`File type: ${file.type}`);
    }
  }
}
```

### Sử dụng `dataTransfer.items`

Giao diện {{domxref("DataTransferItemList")}} cho phép kiểm tra loại từng mục trước khi xử lý.

```js
function dropHandler(ev) {
  ev.preventDefault();

  for (const item of ev.dataTransfer.items) {
    if (item.kind === "file") {
      const file = item.getAsFile();
      console.log(`File name: ${file.name}`);
    }
  }
}
```

## Ví dụ đầy đủ

Ví dụ sau tạo giao diện cho phép người dùng kéo và thả file:

### HTML

```html
<div
  id="drop_zone"
  ondrop="dropHandler(event);"
  ondragover="dragoverHandler(event);">
  <p>Drag one or more files to this <i>drop zone</i>.</p>
</div>

<div id="output"></div>
```

### JavaScript

```js
function dropHandler(ev) {
  ev.preventDefault();
  const output = document.getElementById("output");

  if (ev.dataTransfer.items) {
    // Use DataTransferItemList interface
    [...ev.dataTransfer.items].forEach((item, i) => {
      if (item.kind === "file") {
        const file = item.getAsFile();
        output.innerHTML += `<p>file[${i}].name = ${file.name}</p>`;
      }
    });
  } else {
    // Use DataTransfer interface
    [...ev.dataTransfer.files].forEach((file, i) => {
      output.innerHTML += `<p>file[${i}].name = ${file.name}</p>`;
    });
  }
}

function dragoverHandler(ev) {
  ev.preventDefault();
}
```

## Xem thêm

- [HTML Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- {{domxref("DataTransfer")}}
- {{domxref("File")}}
