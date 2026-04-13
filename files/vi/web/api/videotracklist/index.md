---
title: VideoTrackList
slug: Web/API/VideoTrackList
page-type: web-api-interface
browser-compat: api.VideoTrackList
---

{{APIRef("HTML DOM")}}

Giao diện **`VideoTrackList`** được dùng để đại diện cho danh sách các video track có trong phần tử {{HTMLElement("video")}}, với mỗi track được đại diện bởi một đối tượng {{domxref("VideoTrack")}} riêng biệt trong danh sách.

Lấy một phiên bản của đối tượng này bằng {{domxref('HTMLMediaElement.videoTracks')}}. Các track riêng lẻ có thể được truy cập bằng cú pháp mảng hoặc các hàm như {{jsxref("Array.forEach", "forEach()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("EventTarget")}}._

- {{domxref("VideoTrackList.length", "length")}} {{ReadOnlyInline}}
  - : Số lượng track trong danh sách.
- {{domxref("VideoTrackList.selectedIndex", "selectedIndex")}} {{ReadOnlyInline}}
  - : Chỉ số của track đang được chọn, nếu có, hoặc `−1` nếu không.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ giao diện cha của nó, {{domxref("EventTarget")}}._

- {{domxref("VideoTrackList.getTrackById", "getTrackById()")}}
  - : Trả về {{domxref("VideoTrack")}} tìm thấy trong `VideoTrackList` có {{domxref("VideoTrack.id", "id")}} khớp với chuỗi được chỉ định. Nếu không tìm thấy, trả về `null`.

## Sự kiện

- {{domxref("VideoTrackList/addtrack_event", "addtrack")}}
  - : Được kích hoạt khi một video track mới đã được thêm vào phần tử media.
    Cũng có thể sử dụng qua thuộc tính `onaddtrack`.
- {{domxref("VideoTrackList.change_event", "change")}}
  - : Được kích hoạt khi một video track đã được kích hoạt hoặc hủy kích hoạt.
    Cũng có thể sử dụng qua thuộc tính `onchange`.
- {{domxref("VideoTrackList/removetrack_event", "removetrack")}}
  - : Được kích hoạt khi một video track mới đã bị xóa khỏi phần tử media.
    Cũng có thể sử dụng qua thuộc tính `onremovetrack`.

## Ghi chú sử dụng

Ngoài khả năng truy cập trực tiếp vào các video track có trên phần tử media, `VideoTrackList` cho phép bạn đặt trình xử lý sự kiện trên các sự kiện {{domxref("VideoTrackList/addtrack_event", "addtrack")}} và {{domxref("VideoTrackList/removetrack_event", "removetrack")}}, để bạn có thể phát hiện khi track được thêm vào hoặc xóa khỏi luồng của phần tử media.

## Ví dụ

### Lấy danh sách video track của phần tử media

Để lấy `VideoTrackList` của phần tử media, hãy sử dụng thuộc tính {{domxref("HTMLMediaElement.videoTracks", "videoTracks")}} của nó.

```js
const videoTracks = document.querySelector("video").videoTracks;
```

### Giám sát thay đổi số lượng track

Trong ví dụ này, chúng ta có một ứng dụng hiển thị thông tin về số lượng kênh có sẵn. Để cập nhật thông tin này, trình xử lý cho các sự kiện {{domxref("VideoTrackList/addtrack_event", "addtrack")}} và {{domxref("VideoTrackList/removetrack_event", "removetrack")}} được thiết lập.

```js
videoTracks.onaddtrack = updateTrackCount;
videoTracks.onremovetrack = updateTrackCount;

function updateTrackCount(event) {
  trackCount = videoTracks.length;
  drawTrackCountIndicator(trackCount);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
