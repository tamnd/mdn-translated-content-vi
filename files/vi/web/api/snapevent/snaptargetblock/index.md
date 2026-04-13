---
title: "SnapEvent: snapTargetBlock property"
short-title: snapTargetBlock
slug: Web/API/SnapEvent/snapTargetBlock
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.SnapEvent.snapTargetBlock
---

{{APIRef("Snap Events")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`snapTargetBlock`** của giao diện {{domxref("SnapEvent")}} trả về tham chiếu đến phần tử được snap trong hướng block khi sự kiện kích hoạt.

Cụ thể:

- Đối với sự kiện {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}}, thuộc tính này đề cập đến snap target đang chờ theo hướng block (tức là nó sẽ được chọn khi cử chỉ cuộn hiện tại kết thúc).
- Đối với sự kiện {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}}, thuộc tính này đề cập đến snap target theo hướng block mới được chọn.

Các giá trị thuộc tính có trên `SnapEvent` tương ứng trực tiếp với giá trị của thuộc tính CSS {{cssxref("scroll-snap-type")}} được đặt trên scroll container. `snapTargetBlock` chỉ trả về tham chiếu phần tử nếu trục snap được chỉ định là `block` (hoặc giá trị trục vật lý tương đương `block` trong chế độ viết hiện tại) hoặc `both`.

## Giá trị

Một {{domxref("Node")}} đại diện cho phần tử đã snap, hoặc `null` nếu scroll snapping chỉ xảy ra theo hướng inline và không có phần tử nào được snap trong hướng block.

Nếu phần tử được snap là một pseudo-element, `Node` được trả về sẽ là phần tử chủ sở hữu của pseudo-element đó.

## Ví dụ

Xem trang chính {{domxref("SnapEvent")}} để biết các ví dụ ngắn, và hướng dẫn [Sử dụng các sự kiện scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap/Using_scroll_snap_events) để biết các ví dụ đầy đủ và giải thích.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}}
- Sự kiện {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}}
- [Mô-đun CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Scroll Snap Events](https://developer.chrome.com/blog/scroll-snap-events) trên developer.chrome.com (2024)
