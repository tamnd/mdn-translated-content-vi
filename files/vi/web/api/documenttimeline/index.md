---
title: DocumentTimeline
slug: Web/API/DocumentTimeline
page-type: web-api-interface
browser-compat: api.DocumentTimeline
---

{{ APIRef("Web Animations") }}

Giao diện **`DocumentTimeline`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) đại diện cho các timeline hoạt ảnh, bao gồm timeline tài liệu mặc định (được truy cập qua {{domxref("Document.timeline")}}).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("DocumentTimeline.DocumentTimeline", "DocumentTimeline()")}}
  - : Tạo đối tượng `DocumentTimeline` mới liên kết với tài liệu đang hoạt động của ngữ cảnh duyệt web hiện tại.

## Thuộc tính phiên bản

_Giao diện này kế thừa thuộc tính từ lớp cha, {{domxref("AnimationTimeline")}}._

- {{domxref("AnimationTimeline.currentTime")}}
  - : Trả về giá trị thời gian tính bằng mili giây cho timeline này hoặc `null` nếu nó không hoạt động.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("AnimationTimeline")}}
- {{domxref("AnimationTimeline.currentTime")}}
- {{domxref("Document.timeline")}}
- {{domxref("DocumentTimeline.DocumentTimeline", "DocumentTimeline()")}}
