---
title: AnimationPlaybackEvent
slug: Web/API/AnimationPlaybackEvent
page-type: web-api-interface
browser-compat: api.AnimationPlaybackEvent
---

{{ APIRef("Web Animations") }}

Giao diện `AnimationPlaybackEvent` của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) biểu diễn các sự kiện hoạt ảnh.

Khi hoạt ảnh chạy, chúng báo cáo những thay đổi của {{domxref("Animation.playState", "playState")}} thông qua các sự kiện hoạt ảnh.

{{InheritanceDiagram}}

## Bộ khởi tạo

- {{domxref("AnimationPlaybackEvent.AnimationPlaybackEvent", "AnimationPlaybackEvent()")}}
  - : Tạo một thể hiện đối tượng `AnimationPlaybackEvent` mới.

## Thuộc tính thể hiện

- {{domxref("AnimationPlaybackEvent.currentTime")}} {{ReadOnlyInline}}
  - : Thời gian hiện tại của hoạt ảnh đã tạo ra sự kiện.
- {{domxref("AnimationPlaybackEvent.timelineTime")}} {{ReadOnlyInline}}
  - : Giá trị thời gian của timeline của hoạt ảnh đã tạo ra sự kiện.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation.playState")}}
