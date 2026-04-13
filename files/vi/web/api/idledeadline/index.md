---
title: IdleDeadline
slug: Web/API/IdleDeadline
page-type: web-api-interface
browser-compat: api.IdleDeadline
---

{{APIRef("Background Tasks")}}

Giao diện `IdleDeadline` được sử dụng làm kiểu dữ liệu của tham số đầu vào cho các callback nhàn rỗi được thiết lập bằng cách gọi {{domxref("Window.requestIdleCallback()")}}. Nó cung cấp phương thức {{domxref("IdleDeadline.timeRemaining", "timeRemaining()")}}, cho phép bạn xác định thời gian còn lại mà user agent ước tính nó sẽ tiếp tục nhàn rỗi, và thuộc tính {{domxref("IdleDeadline.didTimeout", "didTimeout")}}, cho phép bạn xác định xem callback của bạn có đang thực thi vì thời gian timeout đã hết không.

Để tìm hiểu thêm về cách hoạt động của request callbacks, xem [Collaborative Scheduling of Background Tasks](/en-US/docs/Web/API/Background_Tasks_API).

## Thuộc tính phiên bản

- {{domxref("IdleDeadline.didTimeout")}} {{ReadOnlyInline}}
  - : Một Boolean có giá trị `true` nếu callback đang được thực thi vì timeout được chỉ định khi callback nhàn rỗi được cài đặt đã hết.

## Phương thức phiên bản

- {{domxref("IdleDeadline.timeRemaining()")}}
  - : Trả về một {{domxref("DOMHighResTimeStamp")}}, là một giá trị dấu phẩy động cung cấp ước tính số milliseconds còn lại trong chu kỳ nhàn rỗi hiện tại. Nếu chu kỳ nhàn rỗi kết thúc, giá trị là 0. Callback của bạn có thể gọi phương thức này nhiều lần để xem có đủ thời gian để thực hiện thêm công việc trước khi trả về không.

## Ví dụ

Xem [ví dụ đầy đủ](/en-US/docs/Web/API/Background_Tasks_API#example) của chúng ta trong bài viết [Cooperative Scheduling of Background Tasks API](/en-US/docs/Web/API/Background_Tasks_API).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Cooperative Scheduling of Background Tasks API](/en-US/docs/Web/API/Background_Tasks_API)
- {{domxref("Window.requestIdleCallback()")}}
- {{domxref("Window.cancelIdleCallback()")}}
