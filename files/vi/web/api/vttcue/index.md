---
title: VTTCue
slug: Web/API/VTTCue
page-type: web-api-interface
browser-compat: api.VTTCue
---

{{APIRef("WebVTT")}}

Giao diện `VTTCue` thuộc [WebVTT API](/en-US/docs/Web/API/WebVTT_API) đại diện cho một cue có thể được thêm vào track văn bản gắn với một video (hoặc phương tiện khác) cụ thể.

Một cue xác định văn bản cần hiển thị trong một khoảng thời gian nhất định của track video hoặc audio, cùng với các thuộc tính hiển thị như kích thước, căn chỉnh và vị trí.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("VTTCue.VTTCue", "VTTCue()")}}
  - : Trả về một đối tượng `VTTCue` mới bao gồm khoảng thời gian và văn bản đã cho.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("TextTrackCue")}}._

- {{domxref("VTTCue.region")}}
  - : Một đối tượng {{domxref("VTTRegion")}} mô tả vùng phụ của video mà cue sẽ được vẽ lên, hoặc `null` nếu chưa được gán.
- {{domxref("VTTCue.vertical")}}
  - : Một enum đại diện cho hướng viết của cue.
- {{domxref("VTTCue.snapToLines")}}
  - : `true` nếu thuộc tính {{domxref("VTTCue.line")}} chỉ ra số nguyên số dòng, hoặc `false` nếu nó đại diện cho phần trăm kích thước video. Mặc định là `true`.
- {{domxref("VTTCue.line")}}
  - : Đại diện cho vị trí dòng của cue. Có thể là chuỗi `auto` hoặc một số có cách diễn giải phụ thuộc vào giá trị của {{domxref("VTTCue.snapToLines")}}.
- {{domxref("VTTCue.lineAlign")}}
  - : Một enum đại diện cho căn chỉnh của VTT cue.
- {{domxref("VTTCue.position")}}
  - : Đại diện cho độ thụt lề của cue trong dòng. Có thể là chuỗi `auto`, một số đại diện cho tỷ lệ phần trăm của {{domxref("VTTCue.region")}}, hoặc kích thước video nếu {{domxref("VTTCue.region")}} là `null`.
- {{domxref("VTTCue.positionAlign")}}
  - : Một enum đại diện cho căn chỉnh của cue. Được dùng để xác định điểm neo của {{domxref("VTTCue.position")}}. Mặc định là `auto`.
- {{domxref("VTTCue.size")}}
  - : Đại diện cho kích thước của cue theo phần trăm kích thước video.
- {{domxref("VTTCue.align")}}
  - : Một enum đại diện cho căn chỉnh của tất cả các dòng văn bản trong hộp cue.
- {{domxref("VTTCue.text")}}
  - : Một chuỗi đại diện cho nội dung của cue.

## Phương thức phiên bản

- {{domxref("VTTCue.getCueAsHTML", "getCueAsHTML()")}}
  - : Trả về văn bản cue dưới dạng {{domxref("DocumentFragment")}}.

## Ví dụ

### HTML

Ví dụ sau thêm một {{domxref("TextTrack")}} mới vào video, rồi thêm các cue bằng phương thức {{domxref("TextTrack.addCue()")}}, với đối tượng `VTTCue` là giá trị.

```html
<video controls src="/shared-assets/videos/friday.mp4"></video>
```

### CSS

```css
video {
  width: 420px;
  height: 300px;
}
```

### JavaScript

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";
track.addCue(new VTTCue(0, 0.9, "Hildy!"));
track.addCue(new VTTCue(1, 1.4, "How are you?"));
track.addCue(new VTTCue(1.5, 2.9, "Tell me, is the lord of the universe in?"));
track.addCue(new VTTCue(3, 4.2, "Yes, he's in - in a bad humor"));
track.addCue(new VTTCue(4.3, 6, "Somebody must've stolen the crown jewels"));
console.log(track.cues);
```

### Kết quả

{{EmbedLiveSample('Example','400','330')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
