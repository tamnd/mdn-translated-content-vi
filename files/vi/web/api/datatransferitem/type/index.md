---
title: "DataTransferItem: thuộc tính type"
short-title: type
slug: Web/API/DataTransferItem/type
page-type: web-api-instance-property
browser-compat: api.DataTransferItem.type
---

{{APIRef("HTML Drag and Drop API")}}

Thuộc tính chỉ đọc **`DataTransferItem.type`** trả về kiểu (định dạng) của đối tượng {{domxref("DataTransferItem")}} đại diện cho mục dữ liệu kéo thả.
`type` là một chuỗi Unicode thường được cho bởi kiểu MIME, mặc dù kiểu MIME không bắt buộc.

Một số ví dụ về kiểu: `text/plain` và `text/html`.

## Giá trị

Một chuỗi đại diện cho kiểu của mục dữ liệu kéo thả.

## Ví dụ

Ví dụ này cho thấy việc sử dụng thuộc tính `type`.

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

- {{domxref("DataTransfer.types()")}}
- [Danh sách các kiểu MIME phổ biến](/en-US/docs/Web/HTTP/Guides/MIME_types/Common_types)
