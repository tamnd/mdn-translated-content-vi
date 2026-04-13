---
title: "Document: selectionchange event"
short-title: selectionchange
slug: Web/API/Document/selectionchange_event
page-type: web-api-event
browser-compat: api.Document.selectionchange_event
---

{{APIRef("Selection API")}}

Sự kiện **`selectionchange`** của [Selection API](/en-US/docs/Web/API/Selection) được kích hoạt khi {{domxref("Selection")}} hiện tại của một {{domxref("Document")}} thay đổi.

Sự kiện này không thể hủy và không nổi bọt.

Sự kiện có thể được xử lý bằng cách thêm trình lắng nghe sự kiện cho `selectionchange` hoặc sử dụng trình xử lý sự kiện `onselectionchange`.

> [!NOTE]
> Sự kiện này không hoàn toàn giống như sự kiện `selectionchange` được kích hoạt khi vùng chọn văn bản trong phần tử {{HTMLElement("input")}} hoặc {{HTMLElement("textarea")}} thay đổi. Xem sự kiện {{domxref("HTMLInputElement.selectionchange_event", "selectionchange")} của `HTMLInputElement` để biết thêm chi tiết.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("selectionchange", (event) => { })

onselectionchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
// Phiên bản addEventListener
document.addEventListener("selectionchange", () => {
  console.log(document.getSelection());
});

// Phiên bản onselectionchange
document.onselectionchange = () => {
  console.log(document.getSelection());
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Node/selectstart_event", "selectstart")}
- {{domxref("Document.getSelection()")}
- {{domxref("Selection", "Selection")}
