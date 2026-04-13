---
title: OfflineAudioCompletionEvent
slug: Web/API/OfflineAudioCompletionEvent
page-type: web-api-interface
browser-compat: api.OfflineAudioCompletionEvent
---

{{APIRef("Web Audio API")}}

Giao diện `OfflineAudioCompletionEvent` của [Web Audio API](/en-US/docs/Web/API/Web_Audio_API) đại diện cho các sự kiện xảy ra khi quá trình xử lý của một {{domxref("OfflineAudioContext")}} kết thúc. Sự kiện {{domxref("OfflineAudioContext/complete_event", "complete")}} sử dụng giao diện này.

> [!NOTE]
> Giao diện này được đánh dấu là không dùng nữa; nó vẫn được hỗ trợ vì lý do kế thừa, nhưng sẽ sớm được thay thế khi phiên bản promise của {{domxref("OfflineAudioContext.startRendering")}} được hỗ trợ trong các trình duyệt, khi đó sẽ không còn cần đến nó nữa.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("OfflineAudioCompletionEvent.OfflineAudioCompletionEvent", "OfflineAudioCompletionEvent()")}}
  - : Tạo một phiên bản đối tượng `OfflineAudioCompletionEvent` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha {{domxref("Event")}}_.

- {{domxref("OfflineAudioCompletionEvent.renderedBuffer")}} {{ReadOnlyInline}}
  - : Một {{domxref("AudioBuffer")}} chứa kết quả xử lý của một {{domxref("OfflineAudioContext")}}.

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha {{domxref("Event")}}_.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Web Audio API](/en-US/docs/Web/API/Web_Audio_API/Using_Web_Audio_API)
