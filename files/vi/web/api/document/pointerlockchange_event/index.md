---
title: "Document: sự kiện pointerlockchange"
short-title: pointerlockchange
slug: Web/API/Document/pointerlockchange_event
page-type: web-api-event
browser-compat: api.Document.pointerlockchange_event
---

{{APIRef("Pointer Lock API")}}

Sự kiện **`pointerlockchange`** được kích hoạt khi con trỏ bị khóa/mở khóa.

Trình xử lý sự kiện có thể sử dụng {{domxref("Document.pointerLockElement")}} để xác định xem con trỏ có bị khóa hay không, và nếu có, nó được khóa vào phần tử nào.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("pointerlockchange", (event) => { })

onpointerlockchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Sử dụng `addEventListener()`:

```js
addEventListener("pointerlockchange", (event) => {
  if (document.pointerLockElement)
    console.log("Con trỏ bị khóa vào: ", document.pointerLockElement);
  else {
    console.log("Con trỏ không bị khóa");
  }
});
```

Sử dụng thuộc tính trình xử lý sự kiện `onpointerlockchange`:

```js
document.onpointerlockchange = (event) => {
  if (document.pointerLockElement)
    console.log("Con trỏ bị khóa vào: ", document.pointerLockElement);
  else {
    console.log("Con trỏ không bị khóa");
  }
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Pointer Lock API](/en-US/docs/Web/API/Pointer_Lock_API)
