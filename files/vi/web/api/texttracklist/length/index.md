---
title: "TextTrackList: length property"
short-title: length
slug: Web/API/TextTrackList/length
page-type: web-api-instance-property
browser-compat: api.TextTrackList.length
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`length`** của **{{domxref("TextTrackList")}}** trả về số mục trong `TextTrackList`, mỗi mục là một {{domxref("TextTrack")}} đại diện cho một track trong phần tử media.

Giá trị 0 cho biết không có text track nào trong media.

## Giá trị

Một số cho biết bao nhiêu text track được bao gồm trong `TextTrackList`. Mỗi track có thể được truy cập bằng cách coi `TextTrackList` như một mảng các đối tượng kiểu {{domxref("TextTrack")}}.

## Ví dụ

Đoạn code này lấy số lượng text track trong phần tử media đầu tiên được tìm thấy trong {{Glossary("DOM")}} bởi {{domxref("Document.querySelector", "querySelector()")}}.

```js
const mediaElem = document.querySelector("video, audio");
let numTextTracks = 0;

if (mediaElem.textTracks) {
  numTextTracks = mediaElem.textTracks.length;
}
```

Lưu ý rằng mẫu này kiểm tra xem {{domxref("HTMLMediaElement.textTracks")}} có được định nghĩa không, để tránh lỗi trên các trình duyệt không hỗ trợ {{domxref("TextTrack")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
