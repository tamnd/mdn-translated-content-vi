---
title: "Document: timeline property"
short-title: timeline
slug: Web/API/Document/timeline
page-type: web-api-instance-property
browser-compat: api.Document.timeline
---

{{ APIRef("Web Animations") }}

Thuộc tính chỉ đọc `timeline` của giao diện {{domxref("Document")}} đại diện cho dòng thời gian mặc định của tài liệu hiện tại. Dòng thời gian này là một instance đặc biệt của {{domxref("DocumentTimeline")}}.

Dòng thời gian này là duy nhất cho mỗi `document` và tồn tại trong suốt vòng đời của `document` bao gồm cả các lệnh gọi đến {{domxref("Document.open()")}}.

Dòng thời gian này biểu thị thời gian tính bằng mili giây kể từ {{domxref("Performance.timeOrigin")}}.
Trước thời điểm gốc, dòng thời gian không hoạt động và {{domxref("AnimationTimeline.currentTime","currentTime")}} của nó là `null`.

> [!NOTE]
> Một dòng thời gian tài liệu được liên kết với một tài liệu không hoạt động (một {{domxref("Document")}} không được liên kết với một {{domxref("Window")}}, {{htmlelement("iframe")}}, hoặc {{htmlelement("frame")}}) cũng được coi là không hoạt động.

## Giá trị

Một đối tượng {{domxref("DocumentTimeline")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("AnimationTimeline")}}
- {{domxref("AnimationTimeline.currentTime")}}
- {{domxref("DocumentTimeline")}}
