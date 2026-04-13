---
title: SnapEvent
slug: Web/API/SnapEvent
page-type: web-api-interface
status:
  - experimental
browser-compat: api.SnapEvent
---

{{APIRef("Snap Events")}}{{SeeCompatTable}}

Giao diện **`SnapEvent`** định nghĩa đối tượng sự kiện cho các sự kiện {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}} và {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}}. Các sự kiện này lần lượt kích hoạt trên một [scroll container](/en-US/docs/Glossary/Scroll_container) khi trình duyệt xác định rằng một snap target cuộn mới đang chờ xử lý (sẽ được chọn khi cử chỉ cuộn hiện tại kết thúc), và khi một snap target mới được chọn.

Các sự kiện này có thể được dùng để chạy mã phản hồi các phần tử mới được snap vào; `SnapEvent` cung cấp tham chiếu đến phần tử được snap trong hướng inline và/hoặc block. Các giá trị thuộc tính có trên `SnapEvent` tương ứng trực tiếp với giá trị của thuộc tính CSS {{cssxref("scroll-snap-type")}} được đặt trên scroll container:

- Nếu trục snap được chỉ định là `block` (hoặc giá trị trục vật lý tương đương `block` trong chế độ viết hiện tại), chỉ {{domxref("SnapEvent.snapTargetBlock", "snapTargetBlock")}} trả về tham chiếu phần tử.
- Nếu trục snap được chỉ định là `inline` (hoặc giá trị trục vật lý tương đương `inline` trong chế độ viết hiện tại), chỉ {{domxref("SnapEvent.snapTargetInline", "snapTargetInline")}} trả về tham chiếu phần tử.
- Nếu trục snap được chỉ định là `both`, cả `snapTargetBlock` và `snapTargetInline` đều trả về tham chiếu phần tử.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("SnapEvent.SnapEvent", "SnapEvent()")}} {{Experimental_Inline}}
  - : Tạo một thực thể đối tượng `SnapEvent` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{DOMxRef("Event")}}._

- {{domxref("SnapEvent.snapTargetBlock", "snapTargetBlock")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tham chiếu đến phần tử được snap trong hướng block khi sự kiện kích hoạt, hoặc `null` nếu scroll snapping chỉ xảy ra theo hướng inline và không có phần tử nào được snap trong hướng block.
- {{domxref("SnapEvent.snapTargetInline", "snapTargetInline")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tham chiếu đến phần tử được snap trong hướng inline khi sự kiện kích hoạt, hoặc `null` nếu scroll snapping chỉ xảy ra theo hướng block và không có phần tử nào được snap trong hướng inline.

## Ví dụ

### Ví dụ về `scrollsnapchanging`

Trong đoạn code hàm xử lý `scrollsnapchanging` sau, chúng ta đặt thuộc tính `class` của phần tử {{domxref("SnapEvent.snapTargetBlock", "snapTargetBlock")}} thành `pending` bằng cách dùng thuộc tính {{domxref("Element.className")}}, có thể được dùng để tạo kiểu khác cho phần tử khi nó trở thành snap target đang chờ xử lý.

Lưu ý rằng hàm xử lý này dự định được đặt trên scroll container theo hướng block (cuộn dọc nếu trang được đặt ở {{cssxref("writing-mode")}} ngang), do đó chỉ phần tử `snapTargetBlock` thay đổi giữa nhiều sự kiện kích hoạt. {{domxref("SnapEvent.snapTargetInline")}} sẽ trả về `null` vì không có snapping nào xảy ra theo hướng inline.

```js
scrollingElem.addEventListener("scrollsnapchanging", (event) => {
  // Set current pending snap target class to "pending"
  event.snapTargetBlock.className = "pending";

  // Logs the new pending block-direction snap target element
  console.log(event.snapTargetBlock);

  // Logs null; no inline snapping occurs
  console.log(event.snapTargetInline);
});
```

### Ví dụ về `scrollsnapchange`

Trong đoạn code hàm xử lý `scrollsnapchange` sau, chúng ta đặt class `selected` trên phần tử {{domxref("SnapEvent.snapTargetBlock")}}, có thể được dùng để tạo kiểu cho snap target mới được chọn trông như thể nó đã được chọn (ví dụ, với một animation).

```js
scrollingElem.addEventListener("scrollsnapchange", (event) => {
  event.snapTargetBlock.className = "selected";
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}}
- Sự kiện {{domxref("Element/scrollsnapchange_event", "scrollsnapchange")}}
- [Mô-đun CSS scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Sử dụng các sự kiện scroll snap](/en-US/docs/Web/CSS/Guides/Scroll_snap/Using_scroll_snap_events)
- [Scroll Snap Events](https://developer.chrome.com/blog/scroll-snap-events) trên developer.chrome.com (2024)
