---
title: "OffscreenCanvasRenderingContext2D: phương thức commit()"
short-title: commit()
slug: Web/API/OffscreenCanvasRenderingContext2D/commit
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.OffscreenCanvasRenderingContext2D.commit
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}{{deprecated_header}}{{non-standard_header}}

Phương thức **`OffscreenCanvasRenderingContext2D.commit()`** của [Canvas 2D API](/en-US/docs/Web/API/OffscreenCanvasRenderingContext2D) được thiết kế để sao chép bitmap của ngữ cảnh kết xuất sang bitmap của phần tử {{HtmlElement("canvas")}} placeholder của đối tượng `OffscreenCanvas` liên kết. Thao tác sao chép là đồng bộ. Không cần gọi phương thức này để chuyển đổi, vì nó diễn ra tự động trong quá trình thực thi vòng lặp sự kiện.

## Cú pháp

```js-nolint
commit()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const placeholder = document.createElement("canvas");
const offscreen = placeholder.transferControlToOffscreen();
const ctx = offscreenCanvas.getContext("2d");

// Perform some drawing using the 2d context
ctx.fillStyle = "blue";
ctx.fillRect(0, 0, 10, 10);

// Push placeholder to the canvas element
ctx.commit();
```

## Thông số kỹ thuật

Không thuộc bất kỳ thông số kỹ thuật nào.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện định nghĩa phương thức này: {{domxref("OffscreenCanvasRenderingContext2D")}}
