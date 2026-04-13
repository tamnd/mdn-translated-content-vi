---
title: TextTrackCue
slug: Web/API/TextTrackCue
page-type: web-api-interface
browser-compat: api.TextTrackCue
---

{{APIRef("WebVTT")}}

Giao diện **`TextTrackCue`** của [WebVTT API](/en-US/docs/Web/API/WebVTT_API) là lớp cơ sở trừu tượng cho các loại cue dẫn xuất khác nhau, chẳng hạn như {{domxref("VTTCue")}} và {{domxref("DataCue")}}; bạn sẽ làm việc với các loại dẫn xuất này thay vì lớp cơ sở.

Các cue này đại diện cho các chuỗi văn bản được trình bày trong một khoảng thời gian nhất định trong quá trình phát {{domxref("TextTrack")}}. Cue bao gồm thời gian bắt đầu (thời điểm văn bản được hiển thị) và thời gian kết thúc (thời điểm nó bị xóa khỏi màn hình), cùng với các thông tin khác.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("EventTarget")}}._

- {{domxref("TextTrackCue.track")}} {{ReadOnlyInline}}
  - : {{domxref("TextTrack")}} mà cue này thuộc về, hoặc `null` nếu nó không thuộc về track nào.
- {{domxref("TextTrackCue.id")}}
  - : Một chuỗi xác định cue.
- {{domxref("TextTrackCue.startTime")}}
  - : Một số `double` đại diện cho thời gian video mà cue sẽ bắt đầu được hiển thị, tính bằng giây.
- {{domxref("TextTrackCue.endTime")}}
  - : Một số `double` đại diện cho thời gian video mà cue sẽ ngừng được hiển thị, tính bằng giây.
- {{domxref("TextTrackCue.pauseOnExit")}}
  - : Một giá trị `boolean` cho biết video có tạm dừng khi cue này ngừng được hiển thị hay không.

## Sự kiện

- {{domxref("TextTrackCue.enter_event", "enter")}}
  - : Được kích hoạt khi một cue trở thành hoạt động.
- {{domxref("TextTrackCue.exit_event", "exit")}}
  - : Được kích hoạt khi cue ngừng hoạt động.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
