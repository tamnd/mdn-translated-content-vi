---
title: "TextTrackCue: exit event"
short-title: exit
slug: Web/API/TextTrackCue/exit_event
page-type: web-api-event
browser-compat: api.TextTrackCue.exit_event
---

{{APIRef("WebVTT")}}

Sự kiện **`exit`** được kích hoạt khi một cue ngừng hoạt động.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("exit", (event) => { })

onexit = (event) => { }
```

## Loại sự kiện

Một {{DOMxRef("Event")}} chung không có thuộc tính bổ sung.

## Ví dụ

Trong ví dụ sau, `cue` in ra console khi nó ngừng được hiển thị là cue đang hoạt động.

```js
cue.addEventListener("enter", (event) => {
  console.log("Cue 1 has left the building.");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
