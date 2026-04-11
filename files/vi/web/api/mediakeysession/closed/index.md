---
title: "MediaKeySession: thuộc tính closed"
short-title: closed
slug: Web/API/MediaKeySession/closed
page-type: web-api-instance-property
browser-compat: api.MediaKeySession.closed
---

{{APIRef("Encrypted Media Extensions")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`closed`** của giao diện {{domxref('MediaKeySession')}} trả về một {{jsxref('Promise')}} báo hiệu khi một {{domxref('MediaKeySession')}} đóng. Promise này chỉ có thể được thực hiện và không bao giờ bị từ chối. Đóng một phiên có nghĩa là các giấy phép và khóa liên kết với nó không còn hợp lệ để giải mã dữ liệu phương tiện.

## Giá trị

Một {{jsxref("Promise")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
