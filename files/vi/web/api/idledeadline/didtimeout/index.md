---
title: "IdleDeadline: didTimeout property"
short-title: didTimeout
slug: Web/API/IdleDeadline/didTimeout
page-type: web-api-instance-property
browser-compat: api.IdleDeadline.didTimeout
---

{{APIRef("Background Tasks")}}

Thuộc tính chỉ đọc **`didTimeout`** trên giao diện **{{domxref("IdleDeadline")}}** là một giá trị Boolean cho biết callback nhàn rỗi có đang được gọi vì khoảng thời gian timeout được chỉ định khi {{domxref("Window.requestIdleCallback()")}} được gọi đã hết không.

Nếu `didTimeout` là `true`, phương thức {{domxref("IdleDeadline.timeRemaining", "timeRemaining()")}} của đối tượng `IdleDeadline` sẽ trả về xấp xỉ 0.

Các callback nhàn rỗi hỗ trợ khái niệm timeout để đảm bảo rằng bất kỳ tác vụ nào chúng được dự định thực hiện thực sự xảy ra, ngay cả khi user agent không bao giờ có đủ thời gian nhàn rỗi. Callback của bạn thường sẽ kiểm tra giá trị của `didTimeout` nếu cần thực hiện một hành động ngay cả khi trình duyệt quá bận để cấp thời gian; bạn nên phản ứng bằng cách thực hiện tác vụ cần thiết hoặc, lý tưởng nhất là, một lượng công việc tối thiểu có thể được thực hiện để giữ mọi thứ tiến triển, sau đó lên lịch callback mới để thử lại phần còn lại của công việc.

## Giá trị

Một Boolean có giá trị `true` nếu callback đang chạy do thời gian timeout của callback đã hết, hoặc `false` nếu callback đang chạy vì user agent đang nhàn rỗi và đang cấp thời gian cho callback.

## Ví dụ

Xem [ví dụ đầy đủ](/en-US/docs/Web/API/Background_Tasks_API#example) của chúng ta trong bài viết [Cooperative Scheduling of Background Tasks API](/en-US/docs/Web/API/Background_Tasks_API).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Collaborative Scheduling of Background Tasks](/en-US/docs/Web/API/Background_Tasks_API)
- {{domxref("IdleDeadline")}}
- {{domxref("Window.requestIdleCallback()")}}
- {{domxref("Window.cancelIdleCallback()")}}
