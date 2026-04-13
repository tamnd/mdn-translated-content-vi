---
title: TextTrackList
slug: Web/API/TextTrackList
page-type: web-api-interface
browser-compat: api.TextTrackList
---

{{APIRef("HTML DOM")}}

Giao diện **`TextTrackList`** được dùng để đại diện cho danh sách các text track được định nghĩa cho phần tử video hoặc audio liên quan, mỗi track được đại diện bởi một đối tượng {{domxref("TextTrack")}} riêng biệt trong danh sách.

Các text track có thể được thêm vào một phần tử media một cách khai báo bằng phần tử {{HTMLElement("track")}} hoặc theo chương trình bằng phương thức {{domxref('HTMLMediaElement.addTextTrack()')}}.

Một phiên bản của đối tượng này có thể được truy xuất bằng thuộc tính {{domxref('HTMLMediaElement.textTracks', 'textTracks')}} của một đối tượng {{domxref('HTMLMediaElement')}}.

Đối với một đối tượng {{domxref('HTMLMediaElement')}} _media_ cụ thể, các track riêng lẻ có thể được truy cập bằng:

- `media.TextTracks[n]`, để lấy track văn bản thứ n từ danh sách text track của đối tượng
- phương thức [`media.textTracks.getTrackById()`](/en-US/docs/Web/API/TextTrackList/getTrackById)

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ giao diện cha, {{domxref("EventTarget")}}._

- {{domxref("TextTrackList.length", "length")}} {{ReadOnlyInline}}
  - : Số lượng track trong danh sách.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ giao diện cha, {{domxref("EventTarget")}}._

- {{domxref("TextTrackList.getTrackById", "getTrackById()")}}
  - : Trả về {{domxref("TextTrack")}} được tìm thấy trong `TextTrackList` có {{domxref("TextTrack.id", "id")}} khớp với chuỗi được chỉ định. Nếu không tìm thấy kết quả phù hợp, `null` được trả về.

## Sự kiện

- [`addtrack`](/en-US/docs/Web/API/TextTrackList/addtrack_event)
  - : Được kích hoạt khi một text track mới được thêm vào phần tử media.
    Cũng có thể truy cập qua thuộc tính `onaddtrack`.
- [`change`](/en-US/docs/Web/API/TextTrackList/change_event)
  - : Được kích hoạt khi một text track được kích hoạt hoặc vô hiệu hóa.
    Cũng có thể truy cập qua thuộc tính `onchange`.
- [`removetrack`](/en-US/docs/Web/API/TextTrackList/removetrack_event)
  - : Được kích hoạt khi một text track mới bị xóa khỏi phần tử media.
    Cũng có thể truy cập qua thuộc tính `onremovetrack`.

## Ghi chú sử dụng

Ngoài việc có thể truy cập trực tiếp các text track có trên phần tử media, `TextTrackList` cho phép bạn thiết lập trình xử lý sự kiện cho các sự kiện {{domxref("TextTrackList/addtrack_event", "addtrack")}} và {{domxref("TextTrackList/removetrack_event", "removetrack")}}, để bạn có thể phát hiện khi track được thêm vào hoặc xóa khỏi luồng của phần tử media.

## Ví dụ

### Lấy danh sách text track của phần tử video

Để lấy `TextTrackList` của một phần tử media, hãy sử dụng thuộc tính {{domxref("HTMLMediaElement.textTracks", "textTracks")}} của nó.

```js
const textTracks = document.querySelector("video").textTracks;
```

### Theo dõi thay đổi số lượng track

Trong ví dụ này, chúng ta có một ứng dụng hiển thị thông tin về số lượng kênh có sẵn. Để cập nhật liên tục, các trình xử lý sự kiện {{domxref("TextTrackList/addtrack_event", "addtrack")}} và {{domxref("TextTrackList/removetrack_event", "removetrack")}} được thiết lập.

```js
textTracks.onaddtrack = updateTrackCount;
textTracks.onremovetrack = updateTrackCount;

function updateTrackCount(event) {
  trackCount = textTracks.length;
  drawTrackCountIndicator(trackCount);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
