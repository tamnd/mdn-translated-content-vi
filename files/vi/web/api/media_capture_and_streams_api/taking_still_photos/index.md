---
title: Taking still photos with getUserMedia()
slug: Web/API/Media_Capture_and_Streams_API/Taking_still_photos
page-type: guide
browser-compat: api.MediaDevices.getUserMedia
---

{{DefaultAPISidebar("Media Capture and Streams")}}

Bài viết này trình bày cách dùng `navigator.mediaDevices.getUserMedia()` để lấy luồng video từ webcam, hiển thị nó trong phần tử `video`, chụp một khung hình tĩnh vào `canvas`, và cuối cùng xuất ảnh PNG.

## Demo

Ví dụ này minh họa cách dùng `navigator.mediaDevices.getUserMedia()` để thiết lập một media stream bằng webcam hoặc thiết bị video khác, lấy một hình ảnh từ stream đó, và tạo một PNG từ hình ảnh ấy.

## Hướng dẫn

Luồng làm việc gồm các bước chính sau:

1. Yêu cầu quyền truy cập camera bằng `getUserMedia()`.
2. Gán stream vào một phần tử `video`.
3. Chờ sự kiện `canplay` để biết kích thước video thực tế.
4. Vẽ khung hình hiện tại lên `canvas`.
5. Chuyển `canvas` thành dữ liệu ảnh và hiển thị trong `img`.

Phần còn lại của bài viết giải thích chi tiết HTML, CSS và JavaScript dùng cho ví dụ này, bao gồm cách xử lý nút chụp ảnh và cách áp dụng bộ lọc CSS nếu có.

## Xem thêm

- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API)
- [Capabilities, constraints, and settings](/en-US/docs/Web/API/Media_Capture_and_Streams_API/Constraints)
