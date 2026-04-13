---
title: "ScrollTimeline: axis property"
short-title: axis
slug: Web/API/ScrollTimeline/axis
page-type: web-api-instance-property
browser-compat: api.ScrollTimeline.axis
---

{{APIRef("Web Animations")}}

Thuộc tính chỉ đọc **`axis`** của giao diện {{domxref("ScrollTimeline")}} trả về giá trị liệt kê đại diện cho trục cuộn đang điều khiển tiến trình của timeline.

## Giá trị

Một giá trị liệt kê. Các giá trị có thể là:

- `"block"`
  - : Thanh cuộn trên trục block của scroll container, là trục theo hướng vuông góc với luồng văn bản trong một dòng. Đối với các chế độ viết ngang như tiếng Anh chuẩn, giá trị này giống `"y"`, còn với chế độ viết dọc thì giống `"x"`.
- `"inline"`
  - : Thanh cuộn trên trục inline của scroll container, là trục theo hướng song song với luồng văn bản trong một dòng. Đối với các chế độ viết ngang, giá trị này giống `"x"`, còn với chế độ viết dọc thì giống `"y"`.
- `"y"`
  - : Thanh cuộn trên trục dọc của scroll container.
- `"x"`
  - : Thanh cuộn trên trục ngang của scroll container.

## Ví dụ

Xem trang chính {{domxref("ScrollTimeline")}} để biết ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ScrollTimeline")}}
- {{domxref("AnimationTimeline")}}, {{domxref("ViewTimeline")}}
- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- [CSS scroll-driven animations](/en-US/docs/Web/CSS/Guides/Scroll-driven_animations)
