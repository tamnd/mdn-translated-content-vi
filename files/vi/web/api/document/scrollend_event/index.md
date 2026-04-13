---
title: "Document: scrollend event"
short-title: scrollend
slug: Web/API/Document/scrollend_event
page-type: web-api-event
browser-compat: api.Document.scrollend_event
---

{{APIRef("CSSOM view API")}}

Sự kiện **`scrollend`** được kích hoạt khi khung nhìn tài liệu đã hoàn tất cuộn.
Việc cuộn được coi là hoàn tất khi vị trí cuộn không còn cập nhật đang chờ xử lý và người dùng đã hoàn tất cử chỉ của họ.

Các cập nhật vị trí cuộn bao gồm cuộn chuột trơn tru hoặc tức thì, cuộn bàn phím, các sự kiện scroll-snap, hoặc các API và cử chỉ khác khiến vị trí cuộn cập nhật.
Các cử chỉ người dùng như vuốt cảm ứng hoặc cuộn trackpad chưa hoàn tất cho đến khi thả con trỏ hoặc phím.
Nếu vị trí cuộn không thay đổi, thì sự kiện scrollend sẽ không được kích hoạt.

Để phát hiện khi việc cuộn bên trong một phần tử hoàn tất, xem sự kiện {{domxref("Element/scrollend_event", "scrollend")}} của `Element`.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("scrollend", (event) => { })

onscrollend = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Sử dụng `scrollend` của Document với event listener

Ví dụ sau đây minh họa cách sử dụng sự kiện `scrollend` với trình lắng nghe sự kiện để phát hiện khi người dùng dừng cuộn tài liệu.
Trong ví dụ, có nội dung trong iframe nhúng cao hơn và rộng hơn chính iframe, nên có thể cuộn theo cả hai hướng trong iframe.
Khi người dùng dừng cuộn, sự kiện `scrollend` được kích hoạt:

```css hidden
* {
  margin: 10px;
}

.box-wrapper {
  width: 900px;
  border: 4px dotted;
}

.box {
  height: 100px;
  width: 100px;
  display: block;
  border: 4px dotted;
  border-radius: 10px;
}

#output {
  text-align: center;
  font-size: 1.2em;
  position: sticky;
  bottom: 0;
}
```

```html
<div class="box-wrapper">
  <div class="box"></div>
  <div class="box"></div>
  <div class="box"></div>
  <div class="box"></div>
</div>
<p id="output">Waiting on scroll events...</p>
```

```js
const output = document.querySelector("p#output");

document.addEventListener("scroll", (event) => {
  output.textContent = "Document scroll event fired!";
});

document.addEventListener("scrollend", (event) => {
  output.textContent = "Document scrollend event fired!";
});
```

{{EmbedLiveSample("Using_document_scrollend_with_an_event_listener", "100%", 200)}}

### Sử dụng thuộc tính trình xử lý sự kiện `onscrollend`

Ví dụ sau đây minh họa cách sử dụng thuộc tính trình xử lý sự kiện `scrollend` để phát hiện khi người dùng dừng cuộn tài liệu.
Trong ví dụ, có nội dung trong iframe nhúng cao hơn và rộng hơn chính iframe, nên có thể cuộn theo cả hai hướng trong iframe.
Ví dụ này xây dựng dựa trên ví dụ đầu tiên, nhưng sử dụng `document.onscrollend` thay vì trình lắng nghe sự kiện:

```css hidden
* {
  margin: 10px;
}

.box-wrapper {
  width: 900px;
  border: 4px dotted;
}

.box {
  height: 100px;
  width: 100px;
  display: block;
  border: 4px dotted;
  border-radius: 10px;
}

#output {
  text-align: center;
  font-size: 1.2em;
  position: sticky;
  bottom: 0;
}
```

```html
<div class="box-wrapper">
  <div class="box"></div>
  <div class="box"></div>
  <div class="box"></div>
  <div class="box"></div>
</div>
<p id="output">Waiting on scroll events...</p>
```

```js
document.onscroll = (event) => {
  output.textContent = "Document scroll event fired!";
};

document.onscrollend = (event) => {
  output.textContent = "Document scrollend event fired!";
};
```

{{EmbedLiveSample("Using_scrollend_with_an_event_handler_property", "100%", 200)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sự kiện `scroll` của Document](/en-US/docs/Web/API/Document/scroll_event)
- [Sự kiện `scrollend` của Element](/en-US/docs/Web/API/Element/scrollend_event)
- [Sự kiện `scroll` của Element](/en-US/docs/Web/API/Element/scroll_event)
