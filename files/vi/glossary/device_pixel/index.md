---
title: Điểm ảnh thiết bị
slug: Glossary/Device_pixel
page-type: glossary-definition
sidebar: glossarysidebar
---

**Điểm ảnh thiết bị** (device pixel) là đơn vị hiển thị vật lý nhỏ nhất có khả năng hiển thị màu sắc đầy đủ độc lập với điểm ảnh lân cận. Đây là đơn vị vật lý nhỏ nhất của một màn hình (như màn hình máy tính hoặc màn hình điện thoại di động), còn được gọi là _điểm ảnh phần cứng_ hoặc _điểm ảnh vật lý_. Mỗi điểm ảnh thiết bị là một chấm riêng lẻ tạo nên đầu ra của màn hình. Điểm ảnh thiết bị là cố định và không thay đổi theo viewport hoặc CSS.

Điểm ảnh thiết bị phụ thuộc vào mật độ, thay đổi dựa trên độ phân giải màn hình. _Tỷ lệ điểm ảnh thiết bị_ (device-pixel-ratio) là tỷ lệ giữa độ phân giải theo điểm ảnh vật lý thiết bị và độ phân giải theo pixel CSS cho màn hình. Nó thường khác với {{glossary("CSS pixel","pixel CSS")}}, là độ dài tuyệt đối được định nghĩa chính xác là 1/96 của 1 inch CSS. Các thiết bị Hi-DPI có nhiều hơn một điểm ảnh thiết bị trên mỗi pixel CSS trong cùng một diện tích vật lý, trong khi các thiết bị có mật độ thấp có tỷ lệ nhỏ hơn 1:1.

## Xem thêm

- Kiểu dữ liệu CSS {{cssxref("&lt;resolution&gt;")}}
- Tính năng `@media` CSS {{cssxref("@media/resolution", "resolution")}}
- Thuộc tính CSS {{cssxref("image-resolution")}}
- API {{domxref("Window.devicePixelRatio")}}
