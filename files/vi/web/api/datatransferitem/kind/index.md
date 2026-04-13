---
title: "DataTransferItem: thuộc tính kind"
short-title: kind
slug: Web/API/DataTransferItem/kind
page-type: web-api-instance-property
browser-compat: api.DataTransferItem.kind
---

{{APIRef("HTML Drag and Drop API")}}

Thuộc tính chỉ đọc **`DataTransferItem.kind`** trả về loại (chuỗi hoặc tệp) của đối tượng {{domxref("DataTransferItem")}} đại diện cho _mục dữ liệu kéo thả_.

## Giá trị

Một chuỗi đại diện cho loại của mục dữ liệu kéo thả. Giá trị phải là một trong những giá trị sau:

- `'file'`
  - : Nếu mục dữ liệu kéo thả là tệp.
- `'string'`
  - : Nếu loại của mục dữ liệu kéo thả là _chuỗi Unicode thuần túy_.

## Ví dụ

Ví dụ này cho thấy việc sử dụng thuộc tính `kind`.

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

- [Kéo và thả](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- [Thao tác kéo thả](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
- [Làm việc với kho dữ liệu kéo thả](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)
