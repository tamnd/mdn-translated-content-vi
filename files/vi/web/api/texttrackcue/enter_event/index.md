---
title: "TextTrackCue: enter event"
short-title: enter
slug: Web/API/TextTrackCue/enter_event
page-type: web-api-event
browser-compat: api.TextTrackCue.enter_event
---

{{APIRef("WebVTT")}}

Sự kiện **`enter`** được kích hoạt khi một cue trở thành hoạt động. Trong trường hợp phụ đề hoặc caption, đây là khi nó hiển thị trên phương tiện.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("enter", (event) => { })

onenter = (event) => { }
```

## Loại sự kiện

Một {{DOMxRef("Event")}} chung không có thuộc tính bổ sung.

## Ví dụ

Trong ví dụ sau, `cue` in ra console khi nó là cue đang hoạt động.

```js
cue.addEventListener("enter", (event) => {
  console.log("Cue 1 has displayed");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
