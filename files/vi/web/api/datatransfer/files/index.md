---
title: "DataTransfer: thuộc tính files"
short-title: files
slug: Web/API/DataTransfer/files
page-type: web-api-instance-property
browser-compat: api.DataTransfer.files
---

{{APIRef("HTML Drag and Drop API")}}

Thuộc tính **`files`** chỉ đọc của đối tượng [`DataTransfer`](/en-US/docs/Web/API/DataTransfer) là [danh sách các tệp](/en-US/docs/Web/API/FileList) trong thao tác kéo. Nếu thao tác không bao gồm tệp nào, danh sách sẽ rỗng.

Tính năng này có thể được sử dụng để kéo tệp từ màn hình nền của người dùng vào trình duyệt.

> [!NOTE]
> Thuộc tính `files` của đối tượng [`DataTransfer`](/en-US/docs/Web/API/DataTransfer) chỉ có thể được truy cập từ bên trong các sự kiện {{domxref("HTMLElement/drop_event", "drop")}} và {{domxref("Element/paste_event", "paste")}}. Đối với tất cả các sự kiện khác, thuộc tính `files` sẽ rỗng, vì kho dữ liệu bên dưới sẽ ở [chế độ được bảo vệ](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store#protected_mode).

## Giá trị

Một {{domxref("FileList")}} các tệp trong thao tác kéo, một mục danh sách cho mỗi tệp trong thao tác. Nếu thao tác kéo không có tệp nào, danh sách rỗng.

## Ví dụ

### Đọc danh sách tệp

Ví dụ này tạo một khu vực cơ bản mà bạn có thể thả tệp vào và hiển thị một số siêu dữ liệu.

```html
<pre id="output">Drop files here from your file system.</pre>
```

```css
#output {
  min-height: 200px;
  border: 1px solid black;
  padding: 1em;
}
```

```js
const output = document.getElementById("output");

function log(text) {
  output.innerText += text;
}

output.addEventListener("dragenter", (e) => {
  e.stopPropagation();
  e.preventDefault();
  output.textContent = "";
});
output.addEventListener("dragover", (e) => {
  e.stopPropagation();
  e.preventDefault();
});
output.addEventListener("drop", (e) => {
  e.stopPropagation();
  e.preventDefault();
  const files = event.dataTransfer.files;
  log(`File Count: ${files.length}\n`);

  for (const file of files) {
    log(`  File: ${file}, ${file.name}, ${file.size} bytes\n`);
  }
});
```

{{EmbedLiveSample("reading_the_files_list", "", "300")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
