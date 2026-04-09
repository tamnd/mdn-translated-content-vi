---
title: "ContentVisibilityAutoStateChangeEvent: thuộc tính skipped"
short-title: skipped
slug: Web/API/ContentVisibilityAutoStateChangeEvent/skipped
page-type: web-api-instance-property
browser-compat: api.ContentVisibilityAutoStateChangeEvent.skipped
---

{{APIRef("CSS Containment")}}

Thuộc tính chỉ đọc `skipped` của giao diện {{ domxref("ContentVisibilityAutoStateChangeEvent") }} trả về `true` nếu user agent [bỏ qua nội dung của phần tử](/en-US/docs/Web/CSS/Guides/Containment/Using#skips_its_contents), hoặc `false` nếu không.

## Giá trị

Một giá trị boolean. Trả về `true` nếu user agent bỏ qua nội dung của phần tử, hoặc `false` nếu không.

## Ví dụ

```js
const canvasElem = document.querySelector("canvas");

canvasElem.addEventListener("contentvisibilityautostatechange", stateChanged);
canvasElem.style.contentVisibility = "auto";

function stateChanged(event) {
  if (event.skipped) {
    stopCanvasUpdates(canvasElem);
  } else {
    startCanvasUpdates(canvasElem);
  }
}

// Call this when the canvas updates need to start.
function startCanvasUpdates(canvas) {
  // …
}

// Call this when the canvas updates need to stop.
function stopCanvasUpdates(canvas) {
  // …
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("element/contentvisibilityautostatechange_event", "contentvisibilityautostatechange")}}
- [CSS Containment](/en-US/docs/Web/CSS/Guides/Containment)
- Thuộc tính {{cssxref("content-visibility")}}
- Thuộc tính {{cssxref("contain")}}
