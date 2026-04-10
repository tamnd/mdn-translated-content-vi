---
title: "Document: scroll event"
short-title: scroll
slug: Web/API/Document/scroll_event
page-type: web-api-event
browser-compat: api.Document.scroll_event
---

{{APIRef("CSSOM view API")}}

Sự kiện **`scroll`** được kích hoạt khi khung nhìn tài liệu đã được cuộn.
Để phát hiện khi việc cuộn đã hoàn tất, xem sự kiện {{domxref("Document/scrollend_event", "scrollend")}} của `Document`.
Đối với việc cuộn phần tử, xem sự kiện {{domxref("Element/scroll_event", "scroll")}} của `Element`.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("scroll", (event) => { })

onscroll = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Giới hạn sự kiện scroll

Vì sự kiện `scroll` có thể được kích hoạt với tốc độ cao, trình xử lý sự kiện không nên thực hiện các thao tác tốn kém tài nguyên tính toán như sửa đổi DOM. Nếu bạn nhận thấy hiện tượng {{glossary("jank")}} khi cuộn nhanh, bạn nên xem xét {{glossary("throttle", "giới hạn")}} sự kiện.

Lưu ý rằng bạn có thể thấy mã giới hạn trình xử lý sự kiện `scroll` bằng {{domxref("Window.requestAnimationFrame()", "requestAnimationFrame()")}}. Điều này là _vô ích_ vì các callback animation frame được kích hoạt cùng tốc độ với trình xử lý sự kiện `scroll`. Thay vào đó, bạn phải tự đo thời gian chờ, chẳng hạn bằng cách sử dụng {{domxref("Window.setTimeout", "setTimeout()")}}.

```js
let lastKnownScrollPosition = 0;
let ticking = false;

function doSomething(scrollPos) {
  // Làm gì đó với vị trí cuộn
}

document.addEventListener("scroll", (event) => {
  lastKnownScrollPosition = window.scrollY;

  if (!ticking) {
    // Giới hạn sự kiện để "do something" mỗi 20ms
    setTimeout(() => {
      doSomething(lastKnownScrollPosition);
      ticking = false;
    }, 20);

    ticking = true;
  }
});
```

Hoặc, hãy xem xét sử dụng {{domxref("IntersectionObserver")}} thay thế, cho phép lắng nghe dựa trên ngưỡng.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sự kiện `scrollend` của Document](/en-US/docs/Web/API/Document/scrollend_event)
- [Sự kiện `scroll` của Element](/en-US/docs/Web/API/Element/scroll_event)
- [Sự kiện `scrollend` của Element](/en-US/docs/Web/API/Element/scrollend_event)
