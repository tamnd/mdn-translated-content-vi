---
title: TrackEvent
slug: Web/API/TrackEvent
page-type: web-api-interface
browser-compat: api.TrackEvent
---

{{APIRef("HTML DOM")}}

Giao diện **`TrackEvent`** của [HTML DOM API](/en-US/docs/Web/API/HTML_DOM_API) được sử dụng cho các sự kiện đại diện cho các thay đổi đối với một tập hợp các rãnh có sẵn trên một phần tử media HTML; những sự kiện này là `addtrack` và `removetrack`.

Điều quan trọng là không nhầm lẫn `TrackEvent` với giao diện {{domxref("RTCTrackEvent")}}, được sử dụng cho các rãnh là một phần của {{domxref("RTCPeerConnection")}}.

Các sự kiện dựa trên `TrackEvent` luôn được gửi đến một trong các loại danh sách rãnh media:

- Các sự kiện liên quan đến rãnh video luôn được gửi đến {{domxref("VideoTrackList")}} được tìm thấy trong {{domxref("HTMLMediaElement.videoTracks")}}
- Các sự kiện liên quan đến rãnh âm thanh luôn được gửi đến {{domxref("AudioTrackList")}} được chỉ định trong {{domxref("HTMLMediaElement.audioTracks")}}
- Các sự kiện ảnh hưởng đến rãnh văn bản được gửi đến đối tượng {{domxref("TextTrackList")}} được chỉ định bởi {{domxref("HTMLMediaElement.textTracks")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("TrackEvent.TrackEvent", "TrackEvent()")}}
  - : Tạo và khởi tạo một đối tượng `TrackEvent` mới với loại sự kiện được chỉ định, cũng như các thuộc tính bổ sung tùy chọn.

## Thuộc tính phiên bản

_`TrackEvent` dựa trên {{domxref("Event")}}, vì vậy các thuộc tính của `Event` cũng có sẵn trên các đối tượng `TrackEvent`._

- {{domxref("TrackEvent.track", "track")}} {{ReadOnlyInline}}
  - : Đối tượng rãnh DOM mà sự kiện đề cập đến. Nếu không phải `null`, đây luôn là một đối tượng của một trong các loại rãnh media: {{domxref("AudioTrack")}}, {{domxref("VideoTrack")}}, hoặc {{domxref("TextTrack")}}).

## Phương thức phiên bản

_`TrackEvent` không có phương thức riêng; tuy nhiên, nó dựa trên {{domxref("Event")}}, vì vậy nó cung cấp các phương thức có sẵn trên các đối tượng `Event`._

## Ví dụ

Ví dụ này thiết lập hàm `handleTrackEvent()`, được gọi cho bất kỳ sự kiện `addtrack` hoặc `removetrack` nào trên phần tử {{HTMLElement("video")}} đầu tiên được tìm thấy trong tài liệu.

```js
const videoElem = document.querySelector("video");

videoElem.videoTracks.addEventListener("addtrack", handleTrackEvent);
videoElem.videoTracks.addEventListener("removetrack", handleTrackEvent);
videoElem.audioTracks.addEventListener("addtrack", handleTrackEvent);
videoElem.audioTracks.addEventListener("removetrack", handleTrackEvent);
videoElem.textTracks.addEventListener("addtrack", handleTrackEvent);
videoElem.textTracks.addEventListener("removetrack", handleTrackEvent);

function handleTrackEvent(event) {
  let trackKind;

  if (event.target instanceof VideoTrackList) {
    trackKind = "video";
  } else if (event.target instanceof AudioTrackList) {
    trackKind = "audio";
  } else if (event.target instanceof TextTrackList) {
    trackKind = "text";
  } else {
    trackKind = "unknown";
  }

  switch (event.type) {
    case "addtrack":
      console.log(`Added a ${trackKind} track`);
      break;
    case "removetrack":
      console.log(`Removed a ${trackKind} track`);
      break;
  }
}
```

Trình xử lý sự kiện sử dụng toán tử JavaScript [`instanceof`](/en-US/docs/Web/JavaScript/Reference/Operators/instanceof) để xác định loại rãnh mà sự kiện xảy ra, sau đó xuất ra console thông báo cho biết loại rãnh đó là gì và liệu nó đang được thêm vào hay xóa khỏi phần tử.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
