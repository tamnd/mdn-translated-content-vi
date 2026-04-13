---
title: "AudioTrackList: thuộc tính length"
short-title: length
slug: Web/API/AudioTrackList/length
page-type: web-api-instance-property
browser-compat: api.AudioTrackList.length
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`length`** của **{{domxref("AudioTrackList")}}** trả về số lượng mục trong `AudioTrackList`, mỗi mục là một {{domxref("AudioTrack")}} đại diện cho một rãnh âm thanh trong phần tử media. Giá trị `0` cho biết không có rãnh âm thanh nào trong media.

## Giá trị

Một số cho biết có bao nhiêu rãnh âm thanh được bao gồm trong `AudioTrackList`. Có thể truy cập từng rãnh bằng cách xem `AudioTrackList` như một mảng các đối tượng kiểu {{domxref("AudioTrack")}}.

## Ví dụ

Đoạn mã này lấy số lượng rãnh âm thanh trong phần tử {{HTMLElement("video")}} đầu tiên được tìm thấy trong {{Glossary("DOM")}} bằng {{domxref("Document.querySelector", "querySelector()")}}.

```js
const videoElem = document.querySelector("video");
let numAudioTracks = 0;

if (videoElem.audioTracks) {
  numAudioTracks = videoElem.audioTracks.length;
}
```

Lưu ý rằng mẫu này kiểm tra để chắc chắn {{domxref("HTMLMediaElement.audioTracks")}} đã được định nghĩa, nhằm tránh lỗi trên các trình duyệt không hỗ trợ {{domxref("AudioTrack")}}.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
