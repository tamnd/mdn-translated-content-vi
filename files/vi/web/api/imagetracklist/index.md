---
title: ImageTrackList
slug: Web/API/ImageTrackList
page-type: web-api-interface
browser-compat: api.ImageTrackList
---

{{APIRef("WebCodecs API")}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện **`ImageTrackList`** của {{domxref('WebCodecs API','','','true')}} đại diện cho danh sách các track hình ảnh.

## Thuộc tính phiên bản

- {{domxref("ImageTrackList.ready")}} {{ReadOnlyInline}}
  - : Trả về một {{jsxref("promise")}} phân giải khi `ImageTrackList` được điền đầy đủ với các {{domxref("ImageTrack","track")}}.
- {{domxref("ImageTrackList.length")}} {{ReadOnlyInline}}
  - : Trả về số nguyên cho biết độ dài của `ImageTrackList`.
- {{domxref("ImageTrackList.selectedIndex")}} {{ReadOnlyInline}}
  - : Trả về số nguyên cho biết chỉ số của `selectedTrack`.
- {{domxref("ImageTrackList.selectedTrack")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("ImageTrack")}} đã được chọn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
