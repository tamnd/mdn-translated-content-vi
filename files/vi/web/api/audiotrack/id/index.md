---
title: "AudioTrack: thuộc tính id"
short-title: id
slug: Web/API/AudioTrack/id
page-type: web-api-instance-property
browser-compat: api.AudioTrack.id
---

{{APIRef("HTML DOM")}}

Thuộc tính **`id`** chứa một chuỗi xác định duy nhất rãnh được biểu diễn bởi **{{domxref("AudioTrack")}}**.

ID này có thể được dùng với phương thức {{domxref("AudioTrackList.getTrackById()")}} để định vị một rãnh cụ thể trong phương tiện được liên kết với một phần tử phương tiện. ID của rãnh cũng có thể được dùng làm phần đoạn của URL tải rãnh cụ thể đó (nếu phương tiện hỗ trợ media fragment).

## Giá trị

Một chuỗi dùng để xác định rãnh, phù hợp để dùng khi gọi {{domxref("AudioTrackList.getTrackById", "getTrackById()")}} trên một {{domxref("AudioTrackList")}} như danh sách được chỉ định bởi thuộc tính {{domxref("HTMLMediaElement.audioTracks", "audioTracks")}} của phần tử phương tiện.

## Các đặc tả

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}
