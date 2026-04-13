---
title: CSSOM view API
slug: Web/API/CSSOM_view_API
page-type: web-api-overview
spec-urls: https://drafts.csswg.org/cssom-view/
---

{{DefaultAPISidebar("CSSOM view API")}}

**CSSOM view API** cho phép bạn thao tác chế độ xem trực quan của tài liệu, bao gồm lấy vị trí của các hộp bố cục phần tử, lấy chiều rộng hoặc chiều cao của khung nhìn qua script, và cuộn phần tử.

## Hướng dẫn

- [Hệ thống tọa độ](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems)
  - : Các hệ thống tọa độ được sử dụng để chỉ định vị trí trong ngữ cảnh hiển thị như cửa sổ trên màn hình, khung nhìn trên thiết bị di động, hoặc vị trí trên tờ giấy khi in.
- [Khái niệm khung nhìn](/en-US/docs/Web/CSS/Guides/CSSOM_view/Viewport_concepts)
  - : Khái niệm về khung nhìn, tác động của nó về CSS, SVG và thiết bị di động, và sự khác biệt giữa khung nhìn trực quan và khung nhìn bố cục.

## Giao diện

- {{domxref("MediaQueryList")}}
- {{domxref("MediaQueryListEvent")}}
- {{domxref("Screen")}}
- {{domxref("CaretPosition")}}
- {{domxref("VisualViewport")}}

## Phần mở rộng cho các giao diện khác

Module này thêm thuộc tính, phương thức và sự kiện vào các giao diện được định nghĩa trong các spec khác.

### Phần mở rộng cho Window

- {{domxref("Window.devicePixelRatio", "devicePixelRatio")}}
- {{domxref("Window.innerHeight", "innerHeight")}}
- {{domxref("Window.innerWidth", "innerWidth")}}
- {{domxref("Window.matchMedia", "matchMedia()")}}
- {{domxref("Window.moveBy", "moveBy()")}}
- {{domxref("Window.moveTo", "moveTo()")}}
- {{domxref("Window.outerHeight", "outerHeight")}}
- {{domxref("Window.outerWidth", "outerWidth")}}
- `pageXOffset` (xem {{domxref("Window.scrollX", "scrollX")}})
- `pageYOffset` (xem {{domxref("Window.scrollY", "scrollY")}})
- {{domxref("Window.resizeBy", "resizeBy()")}}
- {{domxref("Window.resizeTo", "resizeTo()")}}
- {{domxref("Window.screen", "screen")}}
- {{domxref("Window.screenLeft", "screenLeft")}}
- {{domxref("Window.screenTop", "screenTop")}}
- {{domxref("Window.screenX", "screenX")}}
- {{domxref("Window.screenY", "screenY")}}
- {{domxref("Window.visualViewport", "visualViewport")}}
- {{domxref("Window.scroll", "scroll()")}}
- {{domxref("Window.scrollBy", "scrollBy()")}}
- {{domxref("Window.scrollTo", "scrollTo()")}}
- {{domxref("Window.scrollX", "scrollX")}}
- {{domxref("Window.scrollY", "scrollY")}}
- Sự kiện {{domxref("Window/resize_event", "resize")}}

### Phần mở rộng cho Document

- {{domxref("Document.elementFromPoint", "elementFromPoint()")}}
- {{domxref("Document.caretPositionFromPoint", "caretPositionFromPoint()")}}
- {{domxref("Document.scrollingElement", "scrollingElement")}}
- Sự kiện {{domxref("Document/scroll_event", "scroll")}}
- Sự kiện {{domxref("Document/scrollend_event", "scrollend")}}

### Phần mở rộng cho Element

- {{domxref("Element.checkVisibility", "checkVisibility()")}}
- {{domxref("Element.clientHeight", "clientHeight")}}
- {{domxref("Element.clientLeft", "clientLeft")}}
- {{domxref("Element.clientTop", "clientTop")}}
- {{domxref("Element.clientWidth", "clientWidth")}}
- {{domxref("Element.currentCSSZoom", "currentCSSZoom")}}
- {{domxref("Element.getBoundingClientRect", "getBoundingClientRect()")}}
- {{domxref("Element.getClientRects", "getClientRects()")}}
- {{domxref("Element.scroll", "scroll()")}}
- {{domxref("Element.scrollBy", "scrollBy()")}}
- {{domxref("Element.scrollHeight", "scrollHeight")}}
- {{domxref("Element.scrollIntoView", "scrollIntoView()")}}
- {{domxref("Element.scrollLeft", "scrollLeft")}}
- {{domxref("Element.scrollTo", "scrollTo()")}}
- {{domxref("Element.scrollTop", "scrollTop")}}
- {{domxref("Element.scrollWidth", "scrollWidth")}}
- Sự kiện {{domxref("Element/scroll_event", "scroll")}}
- Sự kiện {{domxref("Element/scrollend_event", "scrollend")}}

### Phần mở rộng cho HTMLElement

- {{domxref("HTMLElement.offsetHeight", "offsetHeight")}}
- {{domxref("HTMLElement.offsetLeft", "offsetLeft")}}
- {{domxref("HTMLElement.offsetParent", "offsetParent")}}
- {{domxref("HTMLElement.offsetTop", "offsetTop")}}
- {{domxref("HTMLElement.offsetWidth", "offsetWidth")}}

### Phần mở rộng cho HTMLImageElement

- {{domxref("HTMLImageElement.x", "x")}}
- {{domxref("HTMLImageElement.y", "y")}}

### Phần mở rộng cho Range

- {{domxref("Range.getBoundingClientRect", "getBoundingClientRect()")}}
- {{domxref("Range.getClientRects", "getClientRects()")}}

### Phần mở rộng cho MouseEvent

- {{domxref("MouseEvent.clientX", "clientX")}}
- {{domxref("MouseEvent.clientY", "clientY")}}
- {{domxref("MouseEvent.offsetX", "offsetX")}}
- {{domxref("MouseEvent.offsetY", "offsetY")}}
- {{domxref("MouseEvent.pageX", "pageX")}}
- {{domxref("MouseEvent.pageY", "pageY")}}
- {{domxref("MouseEvent.screenY", "screenY")}}
- {{domxref("MouseEvent.x", "x")}}
- {{domxref("MouseEvent.y", "y")}}

Module này xác định các phương thức tiện ích hình học áp dụng cho các giao diện {{domxref("Text")}}, {{domxref("Element")}}, {{domxref("CSSPseudoElement")}} và {{domxref("Document")}}. Các tính năng `GeometryUtils` này chưa được triển khai trong bất kỳ trình duyệt nào.

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [CSS Object Model (CSSOM)](/en-US/docs/Web/API/CSS_Object_Model) API
- [CSSOM view](/en-US/docs/Web/CSS/Guides/CSSOM_view) module
- [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow) module
- [CSS overscroll behavior](/en-US/docs/Web/CSS/Guides/Overscroll_behavior) module
- [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap) module
- {{glossary("Viewport")}}
- {{glossary("Layout viewport")}}
- {{glossary("Visual viewport")}}
- {{cssxref("zoom")}}
- {{glossary("CSSOM")}}
- {{glossary("CSS pixel")}}
- {{glossary("Scroll container")}}
- {{htmlelement("meta")}}
