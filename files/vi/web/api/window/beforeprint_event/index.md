---
title: "Window: sự kiện beforeprint"
short-title: beforeprint
slug: Web/API/Window/beforeprint_event
page-type: web-api-event
browser-compat: api.Window.beforeprint_event
---

{{APIRef}}

Sự kiện **`beforeprint`** được kích hoạt khi tài liệu liên quan chuẩn bị được in hoặc xem trước khi in.

Các sự kiện {{domxref("Window.afterprint_event", "afterprint")}} và `beforeprint` cho phép các trang thay đổi nội dung trước khi bắt đầu in (ví dụ: để xóa biểu ngữ) và sau đó hoàn nguyên các thay đổi đó sau khi in xong. Nhìn chung, bạn nên ưu tiên sử dụng quy tắc CSS [`@media print`](/en-US/docs/Web/CSS/Guides/Media_queries/Using#targeting_media_types), nhưng có thể cần sử dụng các sự kiện này trong một số trường hợp.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("beforeprint", (event) => { })

onbeforeprint = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

Sử dụng `addEventListener()`:

```js
window.addEventListener("beforeprint", (event) => {
  console.log("Before print");
});
```

Sử dụng thuộc tính trình xử lý sự kiện `onbeforeprint`:

```js
window.onbeforeprint = (event) => {
  console.log("Before print");
};
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan: {{domxref("Window/afterprint_event", "afterprint")}}
