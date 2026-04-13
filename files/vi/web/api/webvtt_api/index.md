---
title: WebVTT API
slug: Web/API/WebVTT_API
page-type: web-api-overview
browser-compat:
  - api.VTTCue
  - api.TextTrack
  - api.VTTRegion
---

{{DefaultAPISidebar("WebVTT")}}

**Web Video Text Tracks** (**WebVTT**) là các text track cung cấp các "cue" văn bản cụ thể được căn chỉnh theo thời gian với các phương tiện khác, chẳng hạn như track video hoặc âm thanh. **WebVTT API** cung cấp chức năng để định nghĩa và thao tác các text track này. WebVTT API chủ yếu được sử dụng để hiển thị phụ đề hoặc chú thích chồng lên nội dung video, nhưng nó cũng có các cách sử dụng khác: cung cấp thông tin chương để điều hướng dễ dàng hơn và siêu dữ liệu chung cần được căn chỉnh theo thời gian với nội dung âm thanh hoặc video.

## Khái niệm và cách sử dụng

Text track là vùng chứa cho dữ liệu văn bản căn chỉnh theo thời gian có thể được phát song song với track video hoặc âm thanh để cung cấp bản dịch, phiên âm hoặc tổng quan về nội dung. Một phần tử phương tiện video hoặc âm thanh có thể định nghĩa các track của nhiều loại khác nhau hoặc bằng các ngôn ngữ khác nhau, cho phép người dùng hiển thị các track phù hợp dựa trên sở thích hoặc nhu cầu của họ.

Các loại dữ liệu văn bản khác nhau có thể được chỉ định là `captions`, `descriptions`, `chapters`, `subtitles` hoặc `metadata`; tài liệu [`<track>`](/en-US/docs/Web/HTML/Reference/Elements/track#kind) có thêm thông tin về ý nghĩa của chúng. Lưu ý rằng các trình duyệt không nhất thiết hỗ trợ tất cả các loại text track.

Các đơn vị dữ liệu văn bản căn chỉnh theo thời gian riêng lẻ trong một track được gọi là "cue". Mỗi cue có thời gian bắt đầu, thời gian kết thúc và nội dung văn bản. Nó cũng có thể có "cue settings", ảnh hưởng đến vùng hiển thị, vị trí, căn chỉnh và/hoặc kích thước của nó. Cuối cùng, một cue có thể có nhãn, có thể được sử dụng để chọn nó để tạo kiểu CSS.

Text track và cue có thể được định nghĩa trong tệp bằng cách sử dụng [WebVTT File Format](/en-US/docs/Web/API/WebVTT_API/Web_Video_Text_Tracks_Format), và sau đó được liên kết với phần tử {{HTMLElement("video")}} cụ thể bằng cách sử dụng phần tử {{HTMLElement("track")}}.

Ngoài ra, bạn có thể thêm {{domxref("TextTrack")}} vào phần tử phương tiện trong JavaScript bằng cách sử dụng [`HTMLMediaElement.addTextTrack()`](/en-US/docs/Web/API/HTMLMediaElement/addTextTrack), và sau đó thêm các đối tượng {{domxref("VTTCue")}} riêng lẻ vào track với {{domxref("TextTrack.addCue()")}}.

Phần tử giả CSS {{cssxref("::cue")}} có thể được sử dụng trong cả HTML và tệp WebVTT để tạo kiểu các cue cho phần tử cụ thể.

## Giao diện

- {{domxref("VTTCue")}}
  - : Đại diện cho một cue, văn bản được hiển thị trong khoảng thời gian cụ thể của text track liên kết với phần tử phương tiện.
- {{domxref("VTTRegion")}}
  - : Đại diện cho một phần của phần tử video mà {{domxref("VTTCue")}} có thể được hiển thị lên.
- {{domxref("TextTrack")}}
  - : Đại diện cho text track, giữ danh sách các cue để hiển thị cùng với phần tử phương tiện liên quan tại các điểm khác nhau trong khi nó phát.
- {{domxref("TextTrackCue")}}
  - : Lớp cơ sở trừu tượng cho các loại cue khác nhau, chẳng hạn như {{domxref("VTTCue")}}.
- {{domxref("TextTrackCueList")}}
  - : Đối tượng giống mảng đại diện cho danh sách cập nhật động của các đối tượng {{domxref("TextTrackCue")}}. Một phiên bản của loại này được lấy từ {{domxref('TextTrack.cues')}} để lấy tất cả các cue trong đối tượng {{domxref("TextTrack")}}.
- {{domxref("TextTrackList")}}
  - : Đại diện cho danh sách các text track được định nghĩa cho phần tử phương tiện, với mỗi track được đại diện bởi một phiên bản {{domxref("TextTrack")}} riêng biệt trong danh sách.

### Giao diện liên quan

- {{domxref("DataCue")}}
  - : Đại diện cho cue để liên kết dữ liệu tùy ý có thời gian (thay vì văn bản) với tài nguyên phương tiện.
- {{domxref("TrackEvent")}}
  - : Là một phần của HTML DOM API, đây là giao diện cho các sự kiện `addtrack` và `removetrack` được kích hoạt khi track được thêm vào hoặc xóa khỏi {{domxref("TextTrackList")}}.

### Phần mở rộng CSS liên quan

- {{CSSxRef("::cue")}}
  - : Khớp với các cue trong phần tử được chọn trong phương tiện có track VTT.

> [!NOTE]
> Đặc tả định nghĩa một phần tử giả khác, `::cue-region`, nhưng không được hỗ trợ bởi bất kỳ trình duyệt nào.

## Ví dụ

### Sử dụng WebVTT API để thêm chú thích

#### HTML

```html
<video controls src="/shared-assets/videos/friday.mp4"></video>
```

#### CSS

```css
video {
  width: 420px;
  height: 300px;
}
```

#### JavaScript

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

#### Kết quả

{{EmbedLiveSample('Using the WebVTT API to add captions','400','330')}}

### Hiển thị nội dung VTT được định nghĩa trong tệp

Ví dụ này cho thấy cách thêm cùng một bộ chú thích vào video bằng cách sử dụng phần tử {{htmlelement("track")}}.

Đầu tiên, hãy định nghĩa chú thích trong tệp "captions.vtt":

```plain
WEBVTT

00:00.000 --> 00:00.900
Hildy!

00:01.000 --> 00:01.400
How are you?

00:01.500 --> 00:02.900
Tell me, is the lord of the universe in?

00:03.000 --> 00:04.200
Yes, he's in - in a bad humor

00:04.300 --> 00:06.000
Somebody must've stolen the crown jewels
```

```html
<video controls src="video.webm">
  <track default kind="captions" src="captions.vtt" srclang="en" />
</video>
```

```html
<video controls src="video.webm">
  <track default kind="captions" src="captions.vtt" srclang="en" />
  <track kind="subtitles" src="subtitles.vtt" srclang="en" />
  <track kind="descriptions" src="descriptions.vtt" srclang="en" />
  <track kind="chapters" src="chapters_de.vtt" srclang="de" />
  <track kind="subtitles" src="subtitles_en.vtt" srclang="en" />
</video>
```

### Tạo kiểu WebVTT trong HTML hoặc stylesheet

Bạn có thể tạo kiểu các cue WebVTT bằng cách khớp các phần tử sử dụng phần tử giả {{cssxref("::cue")}}.

```css hidden
video {
  width: 420px;
  height: 300px;
}
```

```html
<video controls src="/shared-assets/videos/friday.mp4"></video>
```

```css
video::cue {
  font-size: 1.5rem;
  background-image: linear-gradient(to bottom, yellow, lightyellow);
  color: red;
}
```

```css
video::cue(u) {
  color: green;
}

video::cue(b) {
  color: purple;
}
```

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";
track.addCue(new VTTCue(0, 0.9, "Hildy!"));
track.addCue(new VTTCue(1, 1.4, "How are you?"));
track.addCue(
  new VTTCue(1.5, 2.9, "Tell me, is the <u>lord of the universe</u> in?"),
);
track.addCue(new VTTCue(3, 4.2, "Yes, he's in - in a bad humor"));
track.addCue(
  new VTTCue(4.3, 6, "Somebody must've <b>stolen</b> the crown jewels"),
);
console.log(track.cues);
```

#### Kết quả

{{EmbedLiveSample('Styling WebVTT in HTML or a stylesheet','400','330')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử giả CSS [`::cue` và `::cue()`](/en-US/docs/Web/CSS/Reference/Selectors/::cue)
