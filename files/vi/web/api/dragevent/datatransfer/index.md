---
title: "DragEvent: dataTransfer property"
short-title: dataTransfer
slug: Web/API/DragEvent/dataTransfer
page-type: web-api-instance-property
browser-compat: api.DragEvent.dataTransfer
---

{{APIRef("HTML Drag and Drop API")}}

Thuộc tính chỉ-đọc **`DragEvent.dataTransfer`** chứa dữ liệu của thao tác kéo (dưới dạng một đối tượng {{domxref("DataTransfer")}}).

## Giá trị

Một đối tượng {{domxref("DataTransfer")}} chứa {{domxref("DragEvent","dữ liệu của sự kiện kéo", "", 1)}}.

Thuộc tính này có thể là `null` khi sự kiện được tạo bằng hàm tạo. Nó không bao giờ là `null` khi được trình duyệt phát ra.

## Ví dụ

Ví dụ này minh họa cách truy cập dữ liệu kéo và thả trong trình xử lý sự kiện {{domxref("HTMLElement/dragend_event", "dragend")}}.

```js
function processData(d) {
  // Xử lý dữ liệu …
}

dragTarget.addEventListener("dragend", (ev) => {
  // Gọi bộ xử lý dữ liệu kéo và thả
  if (ev.dataTransfer !== null) processData(ev.dataTransfer);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
