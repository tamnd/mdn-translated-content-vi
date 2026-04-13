---
title: "VideoTrackList: length property"
short-title: length
slug: Web/API/VideoTrackList/length
page-type: web-api-instance-property
browser-compat: api.VideoTrackList.length
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`length`** của **{{domxref("VideoTrackList")}}** trả về số lượng mục trong `VideoTrackList`, mỗi mục là một {{domxref("VideoTrack")}} đại diện cho một video track trong phần tử media.

Giá trị 0 cho biết không có video track nào trong media.

## Giá trị

Số cho biết có bao nhiêu video track được bao gồm trong `VideoTrackList`. Mỗi track có thể được truy cập bằng cách coi `VideoTrackList` là mảng các đối tượng kiểu {{domxref("VideoTrack")}}.

## Ví dụ

Đoạn mã này lấy số lượng video track trong phần tử {{HTMLElement("video")}} đầu tiên tìm thấy trong {{Glossary("DOM")}} bởi {{domxref("Document.querySelector", "querySelector()")}}.

```js
const videoElem = document.querySelector("video");
let numVideoTracks = 0;

if (videoElem.videoTracks) {
  numVideoTracks = videoElem.videoTracks.length;
}
```

Lưu ý rằng mẫu này kiểm tra để đảm bảo {{domxref("HTMLMediaElement.videoTracks")}} được định nghĩa, để tránh thất bại trên các trình duyệt không hỗ trợ {{domxref("VideoTrack")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
