---
title: "TextTrack: inBandMetadataTrackDispatchType property"
short-title: inBandMetadataTrackDispatchType
slug: Web/API/TextTrack/inBandMetadataTrackDispatchType
page-type: web-api-instance-property
browser-compat: api.TextTrack.inBandMetadataTrackDispatchType
---

{{APIRef("WebVTT")}}

Thuộc tính chỉ đọc **`inBandMetadataTrackDispatchType`** của giao diện {{domxref("TextTrack")}} trả về loại điều phối track metadata in-band của text track được đại diện bởi đối tượng {{domxref("TextTrack")}}.

Loại điều phối track metadata in-band là một chuỗi được trích xuất từ tài nguyên media dành riêng cho các track metadata in-band. Một ví dụ về tài nguyên media có thể có các track như vậy là một đài truyền hình phát sóng trực tiếp trên web. Text Track có thể được dùng để bao gồm metadata để nhắm mục tiêu quảng cáo, thông tin bổ sung như dữ liệu công thức trong một chương trình nấu ăn, hoặc dữ liệu trò chơi đố trong một chương trình đố vui.

Giá trị của thuộc tính này có thể được dùng để gắn các track này vào các module script chuyên dụng khi chúng được tải.

## Giá trị

Một chuỗi chứa `inBandMetadataTrackDispatchType`, hoặc chuỗi rỗng.

## Ví dụ

Trong ví dụ sau, giá trị của `inBandMetadataTrackDispatchType` được in ra console.

```js
let video = document.querySelector("video");
let track = video.addTextTrack("captions", "Captions", "en");
track.mode = "showing";
console.log(track.inBandMetadataTrackDispatchType);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
