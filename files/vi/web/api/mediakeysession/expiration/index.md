---
title: "MediaKeySession: thuộc tính expiration"
short-title: expiration
slug: Web/API/MediaKeySession/expiration
page-type: web-api-instance-property
browser-compat: api.MediaKeySession.expiration
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`expiration`** của giao diện {{domxref('MediaKeySession')}} trả về thời gian sau đó các khóa trong phiên hiện tại không còn có thể được sử dụng để giải mã dữ liệu phương tiện, hoặc NaN nếu không có thời gian như vậy.

Giá trị này được xác định bởi CDM và được đo bằng mili giây kể từ ngày 1 tháng 1 năm 1970, UTC. Giá trị này có thể thay đổi trong suốt thời gian phiên, chẳng hạn như khi một hành động kích hoạt sự bắt đầu của một cửa sổ.

## Giá trị

Một số hoặc NaN.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
