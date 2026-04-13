---
title: VideoTrack
slug: Web/API/VideoTrack
page-type: web-api-interface
browser-compat: api.VideoTrack
---

{{APIRef("HTML DOM")}}

Giao diện **`VideoTrack`** đại diện cho một video track đơn lẻ từ phần tử {{HTMLElement("video")}}.

Cách sử dụng phổ biến nhất để truy cập đối tượng `VideoTrack` là bật/tắt thuộc tính {{domxref("VideoTrack.selected", "selected")}} của nó để làm cho nó trở thành video track hoạt động của phần tử {{HTMLElement("video")}}.

## Thuộc tính phiên bản

- {{domxref("VideoTrack.selected", "selected")}}
  - : Giá trị Boolean kiểm soát xem video track có đang hoạt động hay không. Chỉ có một video track duy nhất có thể hoạt động tại bất kỳ thời điểm nào, vì vậy việc đặt thuộc tính này thành `true` cho một track trong khi track khác đang hoạt động sẽ làm cho track kia không hoạt động.
- {{domxref("VideoTrack.id", "id")}} {{ReadOnlyInline}}
  - : Chuỗi xác định duy nhất track trong media. ID này có thể được dùng để xác định vị trí một track cụ thể trong danh sách video track bằng cách gọi {{domxref("VideoTrackList.getTrackById()")}}. ID cũng có thể được dùng làm phần fragment của URL nếu media hỗ trợ tìm kiếm theo media fragment theo [Media Fragments URI specification](https://www.w3.org/TR/media-frags/).
- {{domxref("VideoTrack.kind", "kind")}} {{ReadOnlyInline}}
  - : Chuỗi chỉ định danh mục mà track thuộc về. Ví dụ, video track chính sẽ có `kind` là `"main"`.
- {{domxref("VideoTrack.label", "label")}} {{ReadOnlyInline}}
  - : Chuỗi cung cấp nhãn có thể đọc được cho track. Ví dụ, một track có `kind` là `"sign"` có thể có `label` là `"A sign-language interpretation"`. Chuỗi này rỗng nếu không có nhãn nào được cung cấp.
- {{domxref("VideoTrack.language", "language")}} {{ReadOnlyInline}}
  - : Chuỗi chỉ định ngôn ngữ chính của video track, hoặc chuỗi rỗng nếu không rõ. Ngôn ngữ được chỉ định dưới dạng {{glossary("BCP 47 language tag")}} như `"en-US"` hoặc `"pt-BR"`.
- {{domxref("VideoTrack.sourceBuffer", "sourceBuffer")}} {{ReadOnlyInline}}
  - : {{domxref("SourceBuffer")}} đã tạo ra track. Trả về null nếu track không được tạo bởi {{domxref("SourceBuffer")}} hoặc {{domxref("SourceBuffer")}} đã bị xóa khỏi thuộc tính {{domxref("MediaSource.sourceBuffers")}} của nguồn media cha.

## Ghi chú sử dụng

Để lấy `VideoTrack` cho một phần tử media nhất định, hãy sử dụng thuộc tính {{domxref("HTMLMediaElement.videoTracks", "videoTracks")}} của phần tử, trả về đối tượng {{domxref("VideoTrackList")}} từ đó bạn có thể lấy các track riêng lẻ có trong media:

```js
const el = document.querySelector("video");
const tracks = el.videoTracks;
```

Sau đó bạn có thể truy cập các track riêng lẻ của media bằng cú pháp mảng hoặc các hàm như {{jsxref("Array.forEach", "forEach()")}}.

Ví dụ đầu tiên này lấy video track đầu tiên trên media:

```js
const firstTrack = tracks[0];
```

Ví dụ tiếp theo quét qua tất cả các video track của media, kích hoạt video track đầu tiên có ngôn ngữ ưa thích của người dùng (lấy từ biến `userLanguage`).

```js
for (const track of tracks) {
  if (track.language === userLanguage) {
    track.selected = true;
    break;
  }
}
```

{{domxref("VideoTrack.language", "language")}} được chỉ định dưới dạng {{glossary("BCP 47 language tag")}} hợp lệ, ví dụ `"en-US"` cho tiếng Anh Mỹ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
