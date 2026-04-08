---
title: CSSOM view
slug: Web/CSS/Guides/CSSOM_view
page-type: css-module
spec-urls: https://drafts.csswg.org/cssom-view/
sidebar: cssref
---

Module **CSSOM view** cho phép bạn thao tác với chế độ xem trực quan của tài liệu, bao gồm lấy vị trí của các layout boxes của phần tử, lấy chiều rộng hoặc chiều cao của viewport thông qua script, và cuộn phần tử.

## Tài liệu tham khảo

### Sự kiện

- Sự kiện {{domxref("Window")}}:
  - {{domxref("Window/resize_event", "resize")}}
- Sự kiện {{domxref("VisualViewport")}}:
  - {{domxref("VisualViewport/resize_event", "resize")}}
  - {{domxref("VisualViewport/scroll_event", "scroll")}}
  - {{domxref("VisualViewport/scrollend_event", "scrollend")}}
- Sự kiện {{domxref("Document")}}
  - {{domxref("Document/scroll_event", "scroll")}}
  - {{domxref("Document/scrollend_event", "scrollend")}}
- Sự kiện {{domxref("Element")}}
  - {{domxref("Element/scroll_event", "scroll")}}
  - {{domxref("Element/scrollend_event", "scrollend")}}
- Sự kiện {{domxref("MediaQueryList")}}
  - {{domxref("MediaQueryList/change_event", "change")}}

### Thuật ngữ

- {{glossary("Viewport")}}
- {{glossary("Layout viewport")}}
- {{glossary("Visual viewport")}}

### API

Để biết về JavaScript API được định nghĩa bởi module này, hãy xem tài liệu [CSSOM view API](/en-US/docs/Web/API/CSSOM_view_API).

## Hướng dẫn

- [Coordinate systems](/en-US/docs/Web/API/CSSOM_view_API/Coordinate_systems)
  - : Các hệ tọa độ được sử dụng để xác định vị trí trong ngữ cảnh hiển thị như cửa sổ trên màn hình, viewport trên thiết bị di động, hoặc vị trí trên tờ giấy khi in.
- [Viewport concepts](/en-US/docs/Web/CSS/Guides/CSSOM_view/Viewport_concepts)
  - : Khái niệm về viewport — nó là gì, tác động của nó đối với CSS, SVG, và các thiết bị di động — và sự khác biệt giữa visual viewport và layout viewport.

## Các khái niệm liên quan

- {{cssxref("zoom")}}
- {{htmlelement("meta")}}

### Thuật ngữ

- {{glossary("CSSOM", "CSS object model (CSSOM)")}}
- {{glossary("CSS pixel")}}
- {{glossary("Scroll container")}}

## Đặc tả

{{Specifications}}

## Xem thêm

- API [CSS Object Model (CSSOM)](/en-US/docs/Web/API/CSS_Object_Model)
- [CSSOM view API](/en-US/docs/Web/API/CSSOM_view_API)
- Module [CSS viewport](/en-US/docs/Web/CSS/Guides/Viewport)
- Module [CSS overflow](/en-US/docs/Web/CSS/Guides/Overflow)
- Module [CSS overscroll behavior](/en-US/docs/Web/CSS/Guides/Overscroll_behavior)
- Module [CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
