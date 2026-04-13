---
title: "MediaQueryList: sự kiện change"
short-title: change
slug: Web/API/MediaQueryList/change_event
page-type: web-api-event
browser-compat: api.MediaQueryList.change_event
---

{{APIRef("CSSOM view API")}}

Sự kiện **`change`** của giao diện {{DOMxRef("MediaQueryList")}} được kích hoạt khi trạng thái hỗ trợ media query thay đổi.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính xử lý sự kiện.

```js-nolint
addEventListener("change", (event) => { })

onchange = (event) => { }
```

## Loại sự kiện

Một {{domxref("MediaQueryListEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("MediaQueryListEvent")}}

## Thuộc tính sự kiện

_Giao diện `MediaQueryListEvent` kế thừa các thuộc tính từ giao diện cha, {{DOMxRef("Event")}}._

- {{DOMxRef("MediaQueryListEvent.matches")}} {{ReadOnlyInline}}
  - : Một giá trị boolean là `true` nếu {{DOMxRef("document")}} hiện tại khớp với danh sách media query, hoặc `false` nếu không.
- {{DOMxRef("MediaQueryListEvent.media")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho media query đã được tuần tự hóa.

## Ví dụ

```js
const mql = window.matchMedia("(width <= 600px)");

mql.onchange = (e) => {
  if (e.matches) {
    /* the viewport is 600 pixels wide or less */
    console.log("This is a narrow screen — less than 600px wide.");
  } else {
    /* the viewport is more than 600 pixels wide */
    console.log("This is a wide screen — more than 600px wide.");
  }
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Media query](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [Sử dụng media query từ code](/en-US/docs/Web/CSS/Guides/Media_queries/Testing)
- {{DOMxRef("window.matchMedia()")}}
- {{DOMxRef("MediaQueryList")}}
- {{DOMxRef("MediaQueryListEvent")}}
