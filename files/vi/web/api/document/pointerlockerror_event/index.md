---
title: "Document: sự kiện pointerlockerror"
short-title: pointerlockerror
slug: Web/API/Document/pointerlockerror_event
page-type: web-api-event
browser-compat: api.Document.pointerlockerror_event
---

{{APIRef("Pointer Lock API")}}

Sự kiện **`pointerlockerror`** được kích hoạt khi việc khóa con trỏ thất bại (vì lý do kỹ thuật hoặc vì quyền bị từ chối).

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("pointerlockerror", (event) => { })

onpointerlockerror = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Sử dụng `addEventListener()`:

```js
const para = document.querySelector("p");

document.addEventListener("pointerlockerror", (event) => {
  console.log("Lỗi khi khóa con trỏ");
});
```

Sử dụng thuộc tính trình xử lý sự kiện `onpointerlockerror`:

```js
document.onpointerlockerror = (event) => {
  console.log("Lỗi khi khóa con trỏ");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Pointer Lock API](/en-US/docs/Web/API/Pointer_Lock_API)
