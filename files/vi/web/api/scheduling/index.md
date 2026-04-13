---
title: Scheduling
slug: Web/API/Scheduling
page-type: web-api-interface
status:
  - experimental
browser-compat: api.Scheduling
---

{{SeeCompatTable}}{{APIRef("Prioritized Task Scheduling API")}}

Đối tượng **`Scheduling`** cung cấp các phương thức và thuộc tính để kiểm soát việc lập lịch các tác vụ trong tài liệu hiện tại.

> [!WARNING]
> Giao diện `Scheduling` đã được thay thế bởi giao diện {{domxref("Scheduler")}}, với các tính năng được thiết kế tốt hơn để giải quyết các tác vụ lập lịch. Xem [Don't use `isInputPending()`](https://web.dev/articles/optimize-long-tasks#isinputpending) để biết thêm chi tiết.

## Phương thức phiên bản

- {{domxref("Scheduling.isInputPending", "isInputPending()")}} {{Experimental_Inline}}
  - : Trả về giá trị boolean cho biết có sự kiện đầu vào đang chờ trong hàng đợi sự kiện không, nghĩa là người dùng đang cố gắng tương tác với trang.

## Ví dụ

Xem trang {{domxref("Scheduling.isInputPending()")}} để biết ví dụ đầy đủ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("Scheduler")}}
- {{domxref("Prioritized_task_scheduling_api", "Prioritized Task Scheduling API", "", "nocode")}}
- [Faster input events with Facebook's first browser API contribution](https://engineering.fb.com/2019/04/22/developer-tools/isinputpending-api/) trên engineering.fb.com (2019)
- [Better JS scheduling with isInputPending()](https://developer.chrome.com/docs/capabilities/web-apis/isinputpending) trên developer.chrome.com (2020)
- [Optimizing long tasks](https://web.dev/articles/optimize-long-tasks) trên web.dev (2022)
