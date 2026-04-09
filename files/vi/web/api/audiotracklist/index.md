---
title: AudioTrackList
slug: Web/API/AudioTrackList
page-type: web-api-interface
browser-compat: api.AudioTrackList
---

{{APIRef("HTML DOM")}}

Giao diện **`AudioTrackList`** được dùng để biểu diễn danh sách các rãnh âm thanh có trong một phần tử media HTML nhất định, trong đó mỗi rãnh được biểu diễn bởi một đối tượng {{domxref("AudioTrack")}} riêng trong danh sách.

Lấy một thể hiện của đối tượng này bằng {{domxref('HTMLMediaElement.audioTracks')}}. Có thể truy cập từng rãnh riêng lẻ bằng cú pháp mảng.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha của nó, {{domxref("EventTarget")}}._

- {{domxref("AudioTrackList.length", "length")}} {{ReadOnlyInline}}
  - : Số lượng rãnh trong danh sách.

## Phương thức thể hiện

_Giao diện này cũng kế thừa các phương thức từ giao diện cha của nó, {{domxref("EventTarget")}}._

- {{domxref("AudioTrackList.getTrackById", "getTrackById()")}}
  - : Trả về {{domxref("AudioTrack")}} được tìm thấy trong `AudioTrackList` có {{domxref("AudioTrack.id", "id")}} khớp với chuỗi đã chỉ định. Nếu không tìm thấy kết quả khớp, `null` sẽ được trả về.

## Sự kiện

- [`addtrack`](/en-US/docs/Web/API/AudioTrackList/addtrack_event)
  - : Được kích hoạt khi một rãnh âm thanh mới được thêm vào phần tử media.
- [`change`](/en-US/docs/Web/API/AudioTrackList/change_event)
  - : Được kích hoạt khi một rãnh được bật hoặc tắt.
- [`removetrack`](/en-US/docs/Web/API/AudioTrackList/removetrack_event)
  - : Được kích hoạt khi một rãnh âm thanh bị xóa khỏi phần tử media.

## Ghi chú sử dụng

Ngoài việc có thể truy cập trực tiếp các rãnh âm thanh có trên một phần tử media, `AudioTrackList` còn cho phép bạn thiết lập trình xử lý sự kiện cho các sự kiện {{domxref("AudioTrackList/addtrack_event", "addtrack")}} và {{domxref("AudioTrackList/removetrack_event", "removetrack")}}, để bạn có thể phát hiện khi các rãnh được thêm vào hoặc bị xóa khỏi luồng của phần tử media. Hãy xem các sự kiện {{domxref("AudioTrackList/addtrack_event", "addtrack")}} và {{domxref("AudioTrackList/removetrack_event", "removetrack")}} để biết chi tiết và ví dụ.

## Ví dụ

### Lấy danh sách rãnh âm thanh của phần tử media

Để lấy `AudioTrackList` của một phần tử media, hãy dùng thuộc tính {{domxref("HTMLMediaElement.audioTracks", "audioTracks")}} của nó.

```js
const audioTracks = document.querySelector("video").audioTracks;
```

### Theo dõi thay đổi số lượng rãnh

Trong ví dụ này, chúng ta có một ứng dụng hiển thị thông tin về số lượng kênh hiện có. Để giữ thông tin luôn cập nhật, trình xử lý cho các sự kiện {{domxref("AudioTrackList/addtrack_event", "addtrack")}} và {{domxref("AudioTrackList/removetrack_event", "removetrack")}} được thiết lập.

```js
audioTracks.onaddtrack = updateTrackCount;
audioTracks.onremovetrack = updateTrackCount;

function updateTrackCount(event) {
  trackCount = audioTracks.length;
  drawTrackCountIndicator(trackCount);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
