---
title: "MediaMetadata: thuộc tính chapterInfo"
short-title: chapterInfo
slug: Web/API/MediaMetadata/chapterInfo
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.MediaMetadata.chapterInfo
---

{{APIRef("Media Session API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`chapterInfo`** của giao diện {{domxref("MediaMetadata")}} trả về một mảng siêu dữ liệu thông tin chương liên quan đến phương tiện đang phát, được đại diện bởi các phiên bản đối tượng {{domxref("ChapterInformation")}}.

`chapterInfo` cho một tài nguyên phương tiện cụ thể được đặt khi nó được tạo lần đầu, thông qua thuộc tính `chapterInfo` của đối tượng khởi tạo của hàm khởi tạo {{domxref("MediaMetadata.MediaMetadata", "MediaMetadata()")}}.

## Giá trị

Một mảng các phiên bản đối tượng {{domxref("ChapterInformation")}}.

## Ví dụ

Xem trang tham khảo {{domxref("ChapterInformation")}} để có ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ChapterInformation")}}
