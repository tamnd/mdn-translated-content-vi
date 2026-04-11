---
title: "IntersectionObserverEntry: thuộc tính time"
short-title: time
slug: Web/API/IntersectionObserverEntry/time
page-type: web-api-instance-property
browser-compat: api.IntersectionObserverEntry.time
---

{{APIRef("Intersection Observer API")}}

Thuộc tính chỉ đọc **`time`** của giao diện {{domxref("IntersectionObserverEntry")}} là một {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm thay đổi giao nhau xảy ra, tính tương đối với lúc tài liệu được tạo.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm {{domxref("IntersectionObserverEntry.target", "target")}} trải qua thay đổi giao nhau được mô tả bởi `IntersectionObserverEntry`.
Thời điểm được tính bằng mili giây kể từ khi tài liệu chứa được tạo.

## Ví dụ

Xem [Theo dõi thời gian phần tử hiển thị với Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API/Timing_element_visibility) để có ví dụ đầy đủ dùng thuộc tính `time` để theo dõi một phần tử hiển thị với người dùng bao lâu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
