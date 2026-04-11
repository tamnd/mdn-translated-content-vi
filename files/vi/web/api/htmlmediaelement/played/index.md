---
title: "HTMLMediaElement: thuộc tính played"
short-title: played
slug: Web/API/HTMLMediaElement/played
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.played
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`played`** của giao diện {{domxref("HTMLMediaElement")}} cho biết khoảng thời gian mà tài nguyên, tệp phương tiện {{htmlelement("audio")}} hoặc {{htmlelement("video")}}, đã phát. Nó trả về một đối tượng {{domxref("TimeRanges")}} mới chứa các phạm vi của nguồn phương tiện mà trình duyệt đã phát, nếu có, tại thời điểm thuộc tính được đánh giá.

## Giá trị

Một đối tượng {{domxref("TimeRanges")}}; đại diện cho phạm vi thời gian đã được chơi.

## Ví dụ

```js
const media = document.querySelector("audio");
const playedTimeRanges = media.played;
let timePlayed = 0;
// calculate the total time the media has played
for (let i = 0; i < playedTimeRanges.length; i++) {
  timePlayed += playedTimeRanges.end(i) - playedTimeRanges.start(i);
}
console.log(`The media played for a total of ${timePlayed} seconds.`);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện {{domxref("HTMLMediaElement.seeked_event", "seeked")}}
- Sự kiện {{domxref("HTMLMediaElement.progress_event", "progress")}}
- {{domxref("HTMLMediaElement.seekable")}}
- {{domxref("HTMLMediaElement.buffered")}}
- {{domxref("HTMLVideoElement")}}
- {{domxref("HTMLAudioElement")}}
