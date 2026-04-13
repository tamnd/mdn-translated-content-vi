---
title: AnimationTimeline
slug: Web/API/AnimationTimeline
page-type: web-api-interface
browser-compat: api.AnimationTimeline
---

{{ APIRef("Web Animations") }}

Giao diện `AnimationTimeline` của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) biểu diễn timeline của một hoạt ảnh. Giao diện này tồn tại để định nghĩa các tính năng timeline, được kế thừa bởi các kiểu timeline khác:

- {{domxref("DocumentTimeline")}}
- {{domxref("ScrollTimeline")}}
- {{domxref("ViewTimeline")}}

## Thuộc tính thể hiện

- {{domxref("AnimationTimeline.currentTime", "currentTime")}} {{ReadOnlyInline}}
  - : Trả về giá trị thời gian tính bằng mili giây cho timeline này, hoặc `null` nếu timeline này đang không hoạt động.
- {{domxref("AnimationTimeline.duration", "duration")}} {{ReadOnlyInline}}
  - : Trả về giá trị lớn nhất cho timeline này, hoặc `null`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DocumentTimeline")}}, {{domxref("ScrollTimeline")}}, {{domxref("ViewTimeline")}}
- {{domxref("Document.timeline")}}
- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
