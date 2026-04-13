---
title: TextTrack
slug: Web/API/TextTrack
page-type: web-api-interface
browser-compat: api.TextTrack
---

{{APIRef("WebVTT")}}

Giao diện **`TextTrack`** của [WebVTT API](/en-US/docs/Web/API/WebVTT_API) đại diện cho một text track liên kết với một phần tử media.

Một đối tượng kiểu này sở hữu danh sách các đối tượng {{domxref("VTTCue")}} sẽ được hiển thị phía trên video tại các thời điểm khác nhau.

Các đối tượng `TextTrack` có thể được thêm vào phần tử {{domxref("HTMLVideoElement")}} hoặc {{domxref("HTMLAudioElement")}} bằng phương thức {{domxref("HTMLMediaElement.addTextTrack()")}}, tương tự như thêm text track theo cách khai báo bằng các phần tử {{htmlelement("track")}} bên trong phần tử {{htmlelement("video")}} hoặc {{htmlelement("audio")}}.
Các đối tượng `TextTrack` được lưu trữ trong {{domxref("TextTrackList")}}, có thể truy cập bằng thuộc tính {{domxref("HTMLMediaElement.textTracks")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("EventTarget")}}._

- {{domxref("TextTrack.activeCues")}} {{ReadOnlyInline}}
  - : Một đối tượng {{domxref("TextTrackCueList")}} liệt kê tập hợp các cue của text track hiện đang hoạt động. Các cue của track đang hoạt động nếu vị trí phát lại hiện tại của media nằm giữa thời gian bắt đầu và kết thúc của các cue. Do đó, đối với các cue được hiển thị như phụ đề, các cue đang hoạt động hiện đang được hiển thị.
- {{domxref("TextTrack.cues")}} {{ReadOnlyInline}}
  - : Một {{domxref("TextTrackCueList")}} chứa tất cả các cue của track.
- {{domxref("TextTrack.id")}} {{ReadOnlyInline}}
  - : Một chuỗi xác định track, nếu có. Nếu không có ID, giá trị này là chuỗi rỗng (`""`). Nếu `TextTrack` được liên kết với phần tử {{HTMLElement("track")}}, thì ID của track khớp với ID của phần tử.
- {{domxref("TextTrack.inBandMetadataTrackDispatchType")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi cho biết loại điều phối track metadata in-band của track.
- {{domxref("TextTrack.kind")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi cho biết loại text track mà `TextTrack` mô tả. Phải là một trong các giá trị được phép.
- {{domxref("TextTrack.label")}} {{ReadOnlyInline}}
  - : Một chuỗi có thể đọc được chứa nhãn của text track, nếu có; nếu không, đây là chuỗi rỗng (`""`), trong trường hợp đó cần phải tạo nhãn tùy chỉnh bằng code của bạn sử dụng các thuộc tính khác của track, nếu nhãn của track cần được hiển thị cho người dùng.
- {{domxref("TextTrack.language")}} {{ReadOnlyInline}}
  - : Một chuỗi chỉ định ngôn ngữ mà nội dung của text track được viết. Giá trị phải là {{glossary("BCP 47 language tag")}} hợp lệ, ví dụ `"en-US"` cho tiếng Anh Mỹ hoặc `"pt-BR"` cho tiếng Bồ Đào Nha Brazil.
- {{domxref("TextTrack.mode")}}
  - : Một chuỗi chỉ định chế độ hiện tại của track, phải là một trong các giá trị được phép. Việc thay đổi giá trị của thuộc tính này sẽ thay đổi chế độ hiện tại của track để khớp. Mặc định là `disabled`, trừ khi thuộc tính boolean [`default`](/en-US/docs/Web/HTML/Reference/Elements/track#default) của phần tử {{HTMLElement("track")}} được đặt thành `true`, trong trường hợp đó chế độ mặc định là `showing`.
- {{domxref("TextTrack.sourceBuffer", "sourceBuffer")}} {{ReadOnlyInline}}
  - : {{domxref("SourceBuffer")}} đã tạo track. Trả về null nếu track không được tạo bởi {{domxref("SourceBuffer")}} hoặc {{domxref("SourceBuffer")}} đã bị xóa khỏi thuộc tính {{domxref("MediaSource.sourceBuffers")}} của nguồn media cha.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức từ {{domxref("EventTarget")}}._

> [!NOTE]
> Giao diện {{domxref("TextTrackCue")}} là một lớp trừu tượng được dùng làm lớp cha cho các giao diện cue khác như {{domxref("VTTCue")}}. Do đó, khi thêm hoặc xóa một cue, bạn sẽ truyền vào một trong các kiểu cue kế thừa từ `TextTrackCue`.

- {{domxref("TextTrack.addCue()")}}
  - : Thêm một cue (được chỉ định là đối tượng {{domxref("TextTrackCue")}}) vào danh sách các cue của track.
- {{domxref("TextTrack.removeCue()")}}
  - : Xóa một cue (được chỉ định là đối tượng {{domxref("TextTrackCue")}}) khỏi danh sách các cue của track.

## Sự kiện

- [`cuechange`](/en-US/docs/Web/API/TextTrack/cuechange_event)
  - : Kích hoạt khi các cue được vào và thoát. Một cue văn bản nhất định xuất hiện khi cue được vào và biến mất khi cue thoát.
    Cũng có thể truy cập qua thuộc tính `oncuechange`.

## Ví dụ

Ví dụ sau thêm một `TextTrack` mới vào video, sau đó đặt nó để hiển thị bằng {{domxref("TextTrack.mode")}}.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebVTT](/en-US/docs/Web/API/WebVTT_API)
- {{domxref("TextTrackCueList")}}
- {{domxref("VTTCue")}}
- {{HTMLElement("track")}}
- {{domxref("HTMLTrackElement")}}
