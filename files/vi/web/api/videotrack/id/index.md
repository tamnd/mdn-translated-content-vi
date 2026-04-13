---
title: "VideoTrack: id property"
short-title: id
slug: Web/API/VideoTrack/id
page-type: web-api-instance-property
browser-compat: api.VideoTrack.id
---

{{APIRef("HTML DOM")}}

Thuộc tính **`id`** chứa chuỗi xác định duy nhất track được đại diện bởi **{{domxref("VideoTrack")}}**.

ID này có thể được dùng với phương thức {{domxref("VideoTrackList.getTrackById()")}} để xác định vị trí một track cụ thể trong media được liên kết với phần tử media.

ID của track cũng có thể được dùng làm phần fragment của URL tải track cụ thể (nếu media hỗ trợ media fragment).

## Giá trị

Chuỗi xác định track, phù hợp để sử dụng khi gọi {{domxref("VideoTrackList.getTrackById", "getTrackById()")}} trên {{domxref("VideoTrackList")}} như cái được chỉ định bởi thuộc tính {{domxref("HTMLMediaElement.videoTracks", "videoTracks")}} của phần tử media.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
