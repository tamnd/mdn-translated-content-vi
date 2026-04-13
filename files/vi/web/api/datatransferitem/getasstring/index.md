---
title: "DataTransferItem: phương thức getAsString()"
short-title: getAsString()
slug: Web/API/DataTransferItem/getAsString
page-type: web-api-instance-method
browser-compat: api.DataTransferItem.getAsString
---

{{APIRef("HTML Drag and Drop API")}}

Phương thức **`DataTransferItem.getAsString()`** gọi callback đã cho với dữ liệu chuỗi của mục kéo thả làm đối số nếu {{domxref("DataTransferItem.kind","kind")}} của mục là _chuỗi Unicode thuần túy_ (tức là `kind` là `string`).

## Cú pháp

```js-nolint
getAsString(callbackFn)
```

### Tham số

- `callbackFn`
  - : Một hàm callback nhận các đối số sau:
    - `data`
      - : Dữ liệu chuỗi của {{domxref("DataTransferItem")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này cho thấy việc sử dụng phương thức `getAsString()` như một _hàm nội tuyến_ trong trình xử lý sự kiện {{domxref("HTMLElement/drop_event", "drop")}}.

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

- {{domxref("DataTransfer.getData()")}}
