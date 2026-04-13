---
title: ContentVisibilityAutoStateChangeEvent
slug: Web/API/ContentVisibilityAutoStateChangeEvent
page-type: web-api-interface
browser-compat: api.ContentVisibilityAutoStateChangeEvent
---

{{APIRef("CSS Containment")}}

Giao diện **`ContentVisibilityAutoStateChangeEvent`** là đối tượng sự kiện cho sự kiện {{domxref("element/contentvisibilityautostatechange_event", "contentvisibilityautostatechange")}}, được kích hoạt trên bất kỳ phần tử nào có {{cssxref("content-visibility", "content-visibility: auto")}} khi phần tử đó bắt đầu hoặc ngừng [liên quan tới người dùng](/en-US/docs/Web/CSS/Guides/Containment/Using#relevant_to_the_user) và [bỏ qua nội dung của nó](/en-US/docs/Web/CSS/Guides/Containment/Using#skips_its_contents).

Khi phần tử không còn liên quan (giữa các sự kiện bắt đầu và kết thúc), user agent sẽ bỏ qua việc dựng hình của phần tử, bao gồm cả bố cục và vẽ.
Điều này có thể cải thiện đáng kể tốc độ dựng hình trang.
Sự kiện {{domxref("element/contentvisibilityautostatechange_event", "contentvisibilityautostatechange")}} cung cấp một cách để mã của ứng dụng cũng bắt đầu hoặc dừng các tiến trình dựng hình (ví dụ: vẽ lên một phần tử {{htmlelement("canvas")}}) khi chúng không cần thiết, từ đó tiết kiệm năng lực xử lý.

Lưu ý rằng ngay cả khi bị ẩn khỏi tầm nhìn, nội dung của phần tử vẫn giữ nguyên ý nghĩa ngữ nghĩa (ví dụ: đối với người dùng công nghệ hỗ trợ), vì vậy tín hiệu này không nên được dùng để bỏ qua các cập nhật DOM ngữ nghĩa quan trọng.

{{InheritanceDiagram}}

## Hàm tạo

- {{domxref("ContentVisibilityAutoStateChangeEvent.ContentVisibilityAutoStateChangeEvent", "ContentVisibilityAutoStateChangeEvent()")}}
  - : Tạo một thể hiện đối tượng `ContentVisibilityAutoStateChangeEvent` mới.

## Thuộc tính thực thể

_Kế thừa các thuộc tính từ đối tượng cha của nó, {{DOMxRef("Event")}}._

- {{domxref("ContentVisibilityAutoStateChangeEvent.skipped", "skipped")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu user agent đang bỏ qua việc dựng hình của phần tử, hoặc `false` nếu không.

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
