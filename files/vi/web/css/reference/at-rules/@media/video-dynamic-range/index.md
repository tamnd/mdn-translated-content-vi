---
title: video-dynamic-range
slug: Web/CSS/Reference/At-rules/@media/video-dynamic-range
page-type: css-media-feature
browser-compat: css.at-rules.media.video-dynamic-range
sidebar: cssref
---

Đặc trưng media CSS **`video-dynamic-range`** có thể được dùng để kiểm tra tổ hợp độ sáng, tỷ lệ tương phản và độ sâu màu được hỗ trợ bởi mặt phẳng video của {{glossary("user agent")}} và thiết bị đầu ra.

Một số user agent, bao gồm nhiều TV, kết xuất video và đồ họa trong hai mặt phẳng riêng biệt (bi-plane) với các đặc tính màn hình riêng biệt. Đặc trưng `video-dynamic-range` được dùng để kiểm tra các đặc tính trong mặt phẳng video.

## Cú pháp

Đặc trưng `video-dynamic-range` được chỉ định là một giá trị từ khóa chọn từ danh sách bên dưới.

- `standard`
  - : Giá trị này khớp với bất kỳ thiết bị hiển thị trực quan nào và loại trừ các thiết bị không có khả năng hiển thị trực quan. User agent hoặc thiết bị đầu ra khớp với `high` cũng sẽ khớp với giá trị `standard`.

- `high`
  - : Giá trị này khớp với các user agent và thiết bị đầu ra hỗ trợ độ sáng đỉnh cao, tỷ lệ tương phản cao, và độ sâu màu lớn hơn 24 bit hoặc 8 bit mỗi thành phần màu của RGB. **Độ sáng đỉnh** đề cập đến mức độ sáng nhất mà thiết bị phát sáng, chẳng hạn như màn hình LCD, có thể tạo ra. Đối với thiết bị phản chiếu ánh sáng, chẳng hạn như giấy hoặc màn hình e-ink, độ sáng đỉnh đề cập đến điểm hấp thụ ánh sáng ít nhất. **Tỷ lệ tương phản** đề cập đến tỷ lệ giữa độ sáng của màu sáng nhất và màu tối nhất mà hệ thống có khả năng tạo ra. Hiện tại, không có cách chính xác để đo độ sáng đỉnh và tỷ lệ tương phản, và việc xác định thế nào là độ sáng đỉnh cao và tỷ lệ tương phản cao phụ thuộc vào user agent.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng Media Queries](/en-US/docs/Web/CSS/Guides/Media_queries/Using)
- [@media](/en-US/docs/Web/CSS/Reference/At-rules/@media)
