---
title: MediaQueryListEvent
slug: Web/API/MediaQueryListEvent
page-type: web-api-interface
browser-compat: api.MediaQueryListEvent
---

{{APIRef("CSSOM")}}

Giao diện **`MediaQueryListEvent`** lưu trữ thông tin về sự thay đổi xảy ra với một đối tượng {{domxref("MediaQueryList")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("MediaQueryListEvent.MediaQueryListEvent()", "MediaQueryListEvent()")}}
  - : Tạo một đối tượng `MediaQueryListEvent` mới.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha {{domxref("Event")}}._

- {{domxref("MediaQueryListEvent.matches")}} {{ReadOnlyInline}}
  - : Giá trị boolean `true` nếu {{domxref("document")}} hiện khớp với danh sách media query, hoặc `false` nếu không.
- {{domxref("MediaQueryListEvent.media")}} {{ReadOnlyInline}}
  - : Chuỗi đại diện cho một media query được tuần tự hóa.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ giao diện cha {{domxref("Event")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Media Queries](/en-US/docs/Web/CSS/CSS_media_queries/Using_media_queries)
- [Sử dụng media queries từ mã](/en-US/docs/Web/CSS/CSS_media_queries/Testing_media_queries)
- {{domxref("window.matchMedia()")}}
- {{domxref("MediaQueryList")}}
