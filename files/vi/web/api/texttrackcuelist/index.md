---
title: TextTrackCueList
slug: Web/API/TextTrackCueList
page-type: web-api-interface
browser-compat: api.TextTrackCueList
---

{{APIRef("WebVTT")}}

Giao diện **`TextTrackCueList`** của [WebVTT API](/en-US/docs/Web/API/WebVTT_API) là một đối tượng tương tự mảng đại diện cho danh sách các đối tượng {{domxref("TextTrackCue")}} được cập nhật động.

Một phiên bản của kiểu này được lấy từ {{domxref('TextTrack.cues')}} để lấy tất cả các cue trong đối tượng {{domxref("TextTrack")}}. Giao diện này không có hàm khởi tạo.

## Thuộc tính phiên bản

- {{domxref('TextTrackCueList.length')}} {{ReadOnlyInline}}
  - : Một `unsigned long` là số lượng cue trong danh sách.

## Phương thức phiên bản

- {{domxref('TextTrackCueList.getCueById()')}}
  - : Trả về đối tượng {{domxref('TextTrackCue')}} đầu tiên có định danh được truyền vào.

## Ví dụ

Thuộc tính {{domxref("HTMLMediaElement.textTracks")}} trả về đối tượng {{domxref("TextTrackList")}} liệt kê tất cả các đối tượng {{domxref("TextTrack")}}, một cho mỗi rãnh văn bản được liên kết với media. Thuộc tính {{domxref("TextTrack.cues")}} sau đó trả về `TextTrackCueList` chứa các cue cho rãnh cụ thể đó.

```js
const video = document.getElementById("video");
video.onplay = () => {
  console.log(video.textTracks[0].cues);
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
