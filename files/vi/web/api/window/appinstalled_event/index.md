---
title: "Window: sự kiện appinstalled"
short-title: appinstalled
slug: Web/API/Window/appinstalled_event
page-type: web-api-event
browser-compat: api.Window.appinstalled_event
---

{{APIRef}}

Sự kiện **`appinstalled`** của [Web Manifest API](/en-US/docs/Web/Progressive_web_apps/Manifest) được kích hoạt khi trình duyệt đã cài đặt thành công một trang dưới dạng ứng dụng.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("appinstalled", (event) => { })

onappinstalled = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Bạn có thể sử dụng sự kiện `appinstalled` trong phương thức {{domxref("EventTarget/addEventListener", "addEventListener")}}:

```js
window.addEventListener("appinstalled", () => {
  console.log("Cảm ơn bạn đã cài đặt ứng dụng của chúng tôi!");
});
```

Hoặc sử dụng thuộc tính trình xử lý sự kiện `onappinstalled`:

```js
window.onappinstalled = () => {
  console.log("Cảm ơn bạn đã cài đặt ứng dụng của chúng tôi!");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}
