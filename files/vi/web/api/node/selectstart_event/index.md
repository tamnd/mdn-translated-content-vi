---
title: "Node: sự kiện selectstart"
short-title: selectstart
slug: Web/API/Node/selectstart_event
page-type: web-api-event
browser-compat: api.Node.selectstart_event
---

{{APIRef("Selection API")}}

Sự kiện **`selectstart`** của [Selection API](/en-US/docs/Web/API/Selection) được kích hoạt khi người dùng bắt đầu một vùng chọn mới.

Nếu sự kiện bị hủy, vùng chọn sẽ không thay đổi.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("selectstart", (event) => { })

onselectstart = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

```js
// Phiên bản addEventListener
document.addEventListener("selectstart", () => {
  console.log("Selection started");
});

// Phiên bản onselectstart
document.onselectstart = () => {
  console.log("Selection started.");
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document/selectionchange_event", "selectionchange")}}
