---
title: "DataTransferItem: phương thức getAsFile()"
short-title: getAsFile()
slug: Web/API/DataTransferItem/getAsFile
page-type: web-api-instance-method
browser-compat: api.DataTransferItem.getAsFile
---

{{APIRef("HTML Drag and Drop API")}}

Nếu mục là tệp, phương thức **`DataTransferItem.getAsFile()`** trả về đối tượng {{domxref("File")}} của mục dữ liệu kéo thả.
Nếu mục không phải là tệp, phương thức này trả về `null`.

## Cú pháp

```js-nolint
getAsFile()
```

### Tham số

Không có.

### Giá trị trả về

Nếu mục dữ liệu kéo thả là tệp, một đối tượng {{domxref("File")}} được trả về; ngược lại `null` được trả về.

## Ví dụ

Ví dụ này cho thấy việc sử dụng phương thức `getAsFile()` trong trình xử lý sự kiện {{domxref("HTMLElement/drop_event", "drop")}}.

```js
function dropHandler(ev) {
  console.log("Drop");
  ev.preventDefault();
  for (const item of ev.dataTransfer.items) {
    if (item.kind === "string" && item.type.match("^text/plain")) {
      // This item is the target node
      item.getAsString((s) => {
        ev.target.appendChild(document.getElementById(s));
      });
    } else if (item.kind === "string" && item.type.match("^text/html")) {
      // Drag data item is HTML
      console.log("… Drop: HTML");
    } else if (item.kind === "string" && item.type.match("^text/uri-list")) {
      // Drag data item is URI
      console.log("… Drop: URI");
    } else if (item.kind === "file" && item.type.match("^image/")) {
      // Drag data item is an image file
      const f = item.getAsFile();
      console.log("… Drop: File");
    }
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DataTransfer.files")}}
