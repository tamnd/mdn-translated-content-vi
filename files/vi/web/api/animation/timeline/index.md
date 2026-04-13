---
title: "Animation: thuộc tính timeline"
short-title: timeline
slug: Web/API/Animation/timeline
page-type: web-api-instance-property
browser-compat: api.Animation.timeline
---

{{ APIRef("Web Animations") }}

Thuộc tính **`Animation.timeline`** của giao diện {{domxref("Animation")}} trả về hoặc đặt {{domxref("AnimationTimeline", "timeline")}} được liên kết với hoạt ảnh này. Timeline là nguồn các giá trị thời gian phục vụ mục đích đồng bộ hóa, và là một đối tượng dựa trên {{domxref("AnimationTimeline")}}. Theo mặc định, timeline của hoạt ảnh và timeline của {{domxref("Document")}} là như nhau.

## Giá trị

Một {{domxref("AnimationTimeline", "đối tượng timeline", "", 1)}} dùng làm nguồn thời gian cho hoạt ảnh, hoặc `null` để dùng giá trị mặc định là timeline của {{domxref("Document")}}.

## Ví dụ

Ở đây chúng ta đặt timeline của hoạt ảnh giống với timeline của tài liệu (đây cũng chính là timeline mặc định của mọi hoạt ảnh):

```js
animation.timeline = document.timeline;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}}
- {{domxref("AnimationTimeline")}} là đối tượng cha mà mọi timeline kế thừa từ đó.
- {{domxref("DocumentTimeline")}} là loại đối tượng timeline duy nhất hiện có ở thời điểm này.
- {{domxref("Document.timeline")}} là timeline mặc định được gán cho mọi hoạt ảnh.
