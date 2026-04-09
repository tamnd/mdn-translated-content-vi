---
title: "AnimationPlaybackEvent: thuộc tính timelineTime"
short-title: timelineTime
slug: Web/API/AnimationPlaybackEvent/timelineTime
page-type: web-api-instance-property
browser-compat: api.AnimationPlaybackEvent.timelineTime
---

{{ APIRef("Web Animations") }}

Thuộc tính chỉ đọc **`timelineTime`** của giao diện {{domxref("AnimationPlaybackEvent")}} biểu diễn giá trị thời gian của {{domxref("AnimationTimeline", "timeline")}} của hoạt ảnh tại thời điểm sự kiện được đưa vào hàng đợi. Giá trị này sẽ chưa được giải quyết nếu hoạt ảnh không được liên kết với một timeline vào thời điểm sự kiện được tạo hoặc nếu timeline được liên kết đang không hoạt động.

## Giá trị

Một số biểu diễn thời gian hiện tại tính bằng mili giây, hoặc `null`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("AnimationPlayBackEvent")}}
- {{domxref("AnimationTimeline")}}
