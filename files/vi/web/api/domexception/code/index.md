---
title: "DOMException: code property"
short-title: code
slug: Web/API/DOMException/code
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.DOMException.code
---

{{APIRef("DOM")}}{{AvailableInWorkers}}{{deprecated_header}}

Thuộc tính chỉ đọc **`code`** của giao diện {{domxref("DOMException")}} trả về một trong các [hằng số mã lỗi](/en-US/docs/Web/API/DOMException#error_names) cũ, hoặc `0` nếu không khớp.

Trường này được sử dụng vì lý do lịch sử. Các ngoại lệ DOM mới không còn sử dụng trường này nữa, thay vào đó thông tin này được lưu trong thuộc tính {{domxref("DOMException.name")}}.

## Giá trị

Một trong các [hằng số mã lỗi](/en-US/docs/Web/API/DOMException#error_names), hoặc `0` nếu không khớp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
