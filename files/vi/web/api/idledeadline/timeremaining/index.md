---
title: "IdleDeadline: timeRemaining() method"
short-title: timeRemaining()
slug: Web/API/IdleDeadline/timeRemaining
page-type: web-api-instance-method
browser-compat: api.IdleDeadline.timeRemaining
---

{{APIRef("Background Tasks")}}

Phương thức **`timeRemaining()`** trên giao diện {{domxref("IdleDeadline")}} trả về số milliseconds ước tính còn lại trong chu kỳ nhàn rỗi hiện tại. Callback có thể gọi phương thức này bất kỳ lúc nào để xác định còn bao nhiêu thời gian để tiếp tục làm việc trước khi phải trả về. Ví dụ, nếu callback hoàn thành một tác vụ và có tác vụ khác để bắt đầu, nó có thể gọi `timeRemaining()` để xem có đủ thời gian để hoàn thành tác vụ tiếp theo không. Nếu không, callback có thể trả về ngay lập tức, hoặc tìm kiếm công việc khác để thực hiện với thời gian còn lại.

Khi `timeRemaining()` đạt 0, nên để callback trả lại quyền kiểm soát cho vòng lặp sự kiện của user agent.

## Cú pháp

```js-nolint
timeRemaining()
```

### Tham số

Không có.

### Giá trị trả về

Một giá trị {{domxref("DOMHighResTimeStamp")}} (là số dấu phẩy động) đại diện cho số milliseconds mà user agent ước tính còn lại trong chu kỳ nhàn rỗi hiện tại. Giá trị lý tưởng chính xác trong khoảng 5 microseconds.

Nếu thuộc tính {{domxref("IdleDeadline.didTimeout", "didTimeout")}} của đối tượng {{domxref("IdleDeadline")}} là true, phương thức này trả về không.

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
