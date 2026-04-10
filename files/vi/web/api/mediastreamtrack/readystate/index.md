---
title: "MediaStreamTrack: thuộc tính readyState"
short-title: readyState
slug: Web/API/MediaStreamTrack/readyState
page-type: web-api-instance-property
browser-compat: api.MediaStreamTrack.readyState
---

{{APIRef("Media Capture and Streams")}}

Thuộc tính chỉ đọc **`readyState`** của giao diện {{domxref("MediaStreamTrack")}} trả về một giá trị được liệt kê cho biết trạng thái của track.

## Giá trị

Nó nhận một trong các giá trị sau:

- `"live"` cho biết một đầu vào đã được kết nối và nỗ lực hết mức trong việc cung cấp dữ liệu thời gian thực. Trong trường hợp đó, đầu ra dữ liệu có thể được bật hoặc tắt bằng thuộc tính {{domxref("MediaStreamTrack.enabled")}}.
- `"ended"` cho biết đầu vào không còn cung cấp thêm dữ liệu và sẽ không bao giờ cung cấp dữ liệu mới.

## Đặc tả kỹ thuật

{{Specifications}}

## Hỗ trợ trình duyệt

{{Compat}}

## Xem thêm

- [API Media Capture and Streams](/vi/docs/Web/API/Media_Capture_and_Streams_API)
- [WebRTC](/vi/docs/Web/API/WebRTC_API)
- Sự kiện {{domxref("MediaStreamTrack.ended_event", "ended")}}
