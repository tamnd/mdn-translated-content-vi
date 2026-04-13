---
title: PopStateEvent
slug: Web/API/PopStateEvent
page-type: web-api-interface
browser-compat: api.PopStateEvent
---

{{APIRef("History API")}}

**`PopStateEvent`** là giao diện cho sự kiện {{domxref("Window/popstate_event", "popstate")}}.

Sự kiện `popstate` được gửi đến window mỗi khi mục lịch sử đang hoạt động thay đổi giữa hai mục lịch sử cho cùng một tài liệu. Nếu mục lịch sử được kích hoạt được tạo bằng cách gọi `history.pushState()` hoặc bị ảnh hưởng bởi lệnh gọi `history.replaceState()`, thuộc tính `state` của sự kiện `popstate` chứa bản sao của đối tượng trạng thái mục lịch sử.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("PopStateEvent.PopStateEvent", "PopStateEvent()")}}
  - : Tạo một đối tượng `PopStateEvent` mới.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ lớp cha, {{domxref("Event")}}._

- {{domxref("PopStateEvent.state")}} {{ReadOnlyInline}}
  - : Trả về bản sao của thông tin được cung cấp cho `pushState()` hoặc `replaceState()`.
- {{domxref("PopStateEvent.hasUAVisualTransition", "hasUAVisualTransition")}} {{ReadOnlyInline}}
  - : Trả về `true` nếu user agent đã thực hiện chuyển đổi trực quan cho điều hướng này trước khi gửi sự kiện này, hoặc `false` trong trường hợp ngược lại.

## Phương thức phiên bản

_Giao diện này không có phương thức riêng, nhưng kế thừa các phương thức từ lớp cha, {{domxref("Event")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện [`popstate`](/en-US/docs/Web/API/Window/popstate_event)
- Sự kiện [`hashchange`](/en-US/docs/Web/API/Window/hashchange_event)
