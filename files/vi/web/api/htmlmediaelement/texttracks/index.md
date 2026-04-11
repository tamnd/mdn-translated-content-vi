---
title: "HTMLMediaElement: thuộc tính textTracks"
short-title: textTracks
slug: Web/API/HTMLMediaElement/textTracks
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.textTracks
---

{{APIRef("HTML DOM")}}

Chỉ đọc **`textTracks`**
thuộc tính trên đối tượng {{DOMxRef("HTMLMediaElement")}} trả về một
{{DOMxRef("TextTrackList")}} object listing all of the {{DOMxRef("TextTrack")}}
các đối tượng đại diện cho các đoạn văn bản của phần tử đa phương tiện, theo thứ tự như trong
danh sách các đoạn văn bản.

Bạn có thể phát hiện khi nào các bản nhạc được thêm vào và xóa khỏi một
[`<audio>`](/en-US/docs/Web/HTML/Reference/Elements/audio) hoặc
phần tử [`<video>`](/en-US/docs/Web/HTML/Reference/Elements/video)
sử dụng các sự kiện `addtrack` và `removetrack`. Tuy nhiên, những điều này
các sự kiện không được gửi trực tiếp đến chính phần tử phương tiện. Thay vào đó, chúng được gửi tới
đối tượng danh sách bài hát của [`HTMLMediaElement`](/en-US/docs/Web/API/HTMLMediaElement)
tương ứng với loại bản nhạc đã được thêm vào phần tử

Danh sách trả về là _live_; nghĩa là, khi các bản nhạc được thêm vào và xóa khỏi
phần tử phương tiện, nội dung của danh sách sẽ thay đổi linh hoạt. Một khi bạn có một tài liệu tham khảo đến
danh sách, bạn có thể theo dõi những thay đổi để phát hiện khi nào các đoạn văn bản mới được thêm vào hoặc
những cái hiện có bị loại bỏ.

Xem [TextTrackList events](/en-US/docs/Web/API/TextTrackList#events) để tìm hiểu
biết thêm về việc theo dõi các thay đổi đối với danh sách theo dõi của phần tử phương tiện.

## Giá trị

Đối tượng {{DOMxRef("TextTrackList")}} biểu thị danh sách các bản văn bản có trong thành phần phương tiện. Có thể truy cập danh sách các bản nhạc bằng cách sử dụng `textTracks[n]` để lấy bản nhạc văn bản thứ n từ danh sách các bản nhạc văn bản của đối tượng hoặc sử dụng [`textTracks.getTrackById()`](/en-US/docs/Web/API/TextTrackList/getTrackById)
phương pháp.

Mỗi bản nhạc được thể hiện bằng một đối tượng {{DOMxRef("TextTrack")}} cung cấp
thông tin về đường đua.

## Ví dụ

Chúng tôi bắt đầu với một
[`<video>`](/en-US/docs/Web/HTML/Reference/Elements/video) có
một số [`<track>`](/en-US/docs/Web/HTML/Reference/Elements/track)
những đứa trẻ

```html
<video controls>
  <source src="/shared-assets/videos/sintel-short.webm" type="video/webm" />
  <source src="/shared-assets/videos/sintel-short.mp4" type="video/mp4" />
  <track
    kind="subtitles"
    src="/shared-assets/misc/sintel-en.vtt"
    srclang="en"
    label="English" />
  <track
    kind="subtitles"
    src="/shared-assets/misc/sintel-de.vtt"
    srclang="de"
    label="Deutsch" />
  <track
    kind="subtitles"
    src="/shared-assets/misc/sintel-es.vtt"
    srclang="es"
    label="Español" />
</video>
```

`HTMLMediaElement.textTracks` trả về `TextTrackList` mà qua đó chúng ta có thể lặp lại. Ở đây chúng tôi đặt cả ba bản nhạc để hiển thị đồng thời.

```js
const tracks = document.querySelector("video").textTracks;

for (const track of tracks) {
  track.mode = "showing";
}
```

{{EmbedLiveSample("Examples", "100%", 350)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.textTracks`
- {{HTMLElement("audio")}}, {{HTMLElement("video")}}
- {{DOMxRef("AudioTrack")}}, {{DOMxRef("AudioTrackList")}}
- {{DOMxRef("VideoTrack")}}, {{DOMxRef("VideoTrackList")}}
- [`addtrack`](/en-US/docs/Web/API/VideoTrackList/addtrack_event),
  [`change`](/en-US/docs/Web/API/VideoTrackList/change_event),
  [`removetrack`](/en-US/docs/Web/API/VideoTrackList/removetrack_event): Sự kiện AudioTrackList
- [`addtrack`](/en-US/docs/Web/API/VideoTrackList/addtrack_event),
  [`change`](/en-US/docs/Web/API/VideoTrackList/change_event),
  [`removetrack`](/en-US/docs/Web/API/VideoTrackList/removetrack_event): Sự kiện VideoTrackList
