---
title: "DataTransferItem: phương thức webkitGetAsEntry()"
short-title: webkitGetAsEntry()
slug: Web/API/DataTransferItem/webkitGetAsEntry
page-type: web-api-instance-method
browser-compat: api.DataTransferItem.webkitGetAsEntry
---

{{APIRef("HTML Drag and Drop API")}}

Nếu mục được mô tả bởi {{domxref("DataTransferItem")}} là tệp, `webkitGetAsEntry()` trả về một {{domxref("FileSystemFileEntry")}} hoặc {{domxref("FileSystemDirectoryEntry")}} đại diện cho nó. Nếu mục không phải là tệp, `null` được trả về.

> [!NOTE]
> Hàm này được triển khai là `webkitGetAsEntry()` trong các trình duyệt không phải WebKit bao gồm Firefox vào thời điểm này; nó có thể được đổi tên thành `getAsEntry()` trong tương lai, vì vậy bạn nên code một cách phòng vệ, tìm cả hai.

## Cú pháp

```js-nolint
webkitGetAsEntry()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng dựa trên {{domxref("FileSystemEntry")}} mô tả mục được thả xuống.
Đây sẽ là {{domxref("FileSystemFileEntry")}} hoặc {{domxref("FileSystemDirectoryEntry")}}.
Phương thức hủy bỏ và trả về `null` nếu mục được thả xuống không phải là tệp, hoặc nếu đối tượng {{domxref("DataTransferItem")}} không ở chế độ đọc hoặc đọc/ghi.

## Ví dụ

Trong ví dụ này, một vùng thả được tạo ra, phản hồi với sự kiện {{domxref("HTMLElement/drop_event", "drop")}} bằng cách quét qua các tệp và thư mục được thả, xuất ra một danh sách thư mục phân cấp.

### HTML

HTML thiết lập vùng thả, là một phần tử {{HTMLElement("div")}} với ID `"dropzone"`, và một phần tử danh sách không có thứ tự với ID `"listing"`.

```html
<p>Drag files and/or directories to the box below!</p>

<div id="dropzone">
  <div id="boxtitle">Drop Files Here</div>
</div>

<h2>Directory tree:</h2>

<ul id="listing"></ul>
```

### CSS

```css
#dropzone {
  text-align: center;
  width: 300px;
  height: 100px;
  margin: 10px;
  padding: 10px;
  border: 4px dashed red;
  border-radius: 10px;
}

#boxtitle {
  display: table-cell;
  vertical-align: middle;
  text-align: center;
  color: black;
  font:
    bold 2em "Arial",
    sans-serif;
  width: 300px;
  height: 100px;
}

body {
  font:
    14px "Arial",
    sans-serif;
}
```

### JavaScript

Hàm đệ quy `scanFiles()` nhận đầu vào là một {{domxref("FileSystemEntry")}} đại diện cho một mục trong hệ thống tệp cần được quét và xử lý (tham số `item`) và một phần tử để chèn danh sách nội dung vào (tham số `container`).

```js
let dropzone = document.getElementById("dropzone");
let listing = document.getElementById("listing");

function scanFiles(item, container) {
  let elem = document.createElement("li");
  elem.textContent = item.name;
  container.appendChild(elem);

  if (item.isDirectory) {
    let directoryReader = item.createReader();
    let directoryContainer = document.createElement("ul");
    container.appendChild(directoryContainer);
    directoryReader.readEntries((entries) => {
      entries.forEach((entry) => {
        scanFiles(entry, directoryContainer);
      });
    });
  }
}
```

Sau đó đến các trình xử lý sự kiện. Đầu tiên, chúng ta ngăn sự kiện {{domxref("HTMLElement/dragover_event", "dragover")}} được xử lý bởi trình xử lý mặc định, để vùng thả có thể nhận thao tác thả:

```js
dropzone.addEventListener("dragover", (event) => {
  event.preventDefault();
});
```

Trình xử lý sự kiện `drop`:

```js
dropzone.addEventListener("drop", (event) => {
  let items = event.dataTransfer.items;

  event.preventDefault();
  listing.textContent = "";

  for (const item of items) {
    const entry = item.webkitGetAsEntry();

    if (entry) {
      scanFiles(entry, listing);
    }
  }
});
```

### Kết quả

{{EmbedLiveSample('Examples', 600, 400)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("DataTransferItem")}}
- {{domxref("FileSystemEntry")}}, {{domxref("FileSystemFileEntry")}} và {{domxref("FileSystemDirectoryEntry")}}
- Sự kiện: {{domxref("HTMLElement/dragover_event", "dragover")}} và {{domxref("HTMLElement/drop_event", "drop")}}
