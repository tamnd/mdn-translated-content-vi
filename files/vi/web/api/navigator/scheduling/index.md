---
title: "Navigator: thuộc tính scheduling"
short-title: scheduling
slug: Web/API/Navigator/scheduling
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Navigator.scheduling
---

{{SeeCompatTable}}{{APIRef("Prioritized Task Scheduling API")}}

Thuộc tính chỉ đọc **`scheduling`** của giao diện {{domxref("Navigator")}} trả về đối tượng {{domxref("Scheduling")}} cho tài liệu hiện tại, cung cấp các phương thức và thuộc tính để kiểm soát các tác vụ lập lịch.

> [!CẢNH BÁO]
> Giao diện {{domxref("Scheduling")}} (bao gồm phương pháp {{domxref("Scheduling.isInputPending()", "isInputPending()")}}) đã được thay thế bằng giao diện {{domxref("Scheduler")}}, các tính năng của giao diện này được thiết kế tốt hơn để giải quyết các tác vụ lập lịch trình. Xem [Don't use `isInputPending()`](https://web.dev/articles/optimize-long-tasks#isinputpending) để biết thêm chi tiết.

## Giá trị

Đối tượng {{domxref("Scheduling")}}.

## Ví dụ

Xem trang {{domxref("Scheduling.isInputPending()")}} để biết ví dụ đầy đủ.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("Scheduler")}}
- {{domxref("Prioritized_task_scheduling_api", "Prioritized Task Scheduling API", "", "nocode")}}
- [Faster input events with Facebook's first browser API contribution](https://engineering.fb.com/2019/04/22/developer-tools/isinputpending-api/) trên Engineering.fb.com (2019)
- [Better JS scheduling with isInputPending()](https://developer.chrome.com/docs/capabilities/web-apis/isinputpending) trên dev.chrome.com (2020)
- [Optimizing long tasks](https://web.dev/articles/optimize-long-tasks) trên web.dev (2022)
