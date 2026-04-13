---
title: "ViewTransition: skipTransition() method"
short-title: skipTransition()
slug: Web/API/ViewTransition/skipTransition
page-type: web-api-instance-method
browser-compat: api.ViewTransition.skipTransition
---

{{APIRef("View Transition API")}}

Phương thức **`skipTransition()`** của giao diện {{domxref("ViewTransition")}} bỏ qua phần hoạt ảnh của view transition, nhưng không bỏ qua việc chạy cập nhật view liên quan.

## Cú pháp

```js-nolint
skipTransition()
```

### Tham số

Không có.

### Giá trị trả về

`undefined`.

## Ví dụ

### Bỏ qua một view transition SPA

```js
// start new view transition
const transition = document.startViewTransition(() => displayNewImage());

// skip the animation and just update the DOM
transition.skipTransition();
```

### Bỏ qua một view transition MPA

```js
// Fired on the current (outgoing) page
document.addEventListener("pageswap", (event) => {
  event.viewTransition?.skipTransition();
});

// Fired on the destination (inbound) page
document.addEventListener("pagereveal", (event) => {
  event.viewTransition?.skipTransition();
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Smooth transitions with the View Transition API](https://developer.chrome.com/docs/web-platform/view-transitions/)
