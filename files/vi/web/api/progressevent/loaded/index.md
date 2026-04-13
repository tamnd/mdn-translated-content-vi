---
title: "ProgressEvent: loaded property"
short-title: loaded
slug: Web/API/ProgressEvent/loaded
page-type: web-api-instance-property
browser-compat: api.ProgressEvent.loaded
---

{{APIRef("XMLHttpRequest API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`ProgressEvent.loaded`** là một số cho biết kích thước dữ liệu đã được truyền hoặc xử lý. Tỷ lệ tiến trình có thể được tính bằng cách chia giá trị của thuộc tính này cho {{domxref("ProgressEvent.total")}}.

Đối với `ProgressEvent` được trình duyệt gửi trong các tin nhắn HTTP, giá trị đề cập đến số byte của tài nguyên đã hoàn thành và được lấy từ tiêu đề `Content-Length`. Đối với các yêu cầu nén có tổng kích thước không xác định, `loaded` có thể chứa kích thước dữ liệu đã nén hoặc chưa nén, tùy thuộc vào trình duyệt. Tính đến năm 2024, nó chứa kích thước dữ liệu đã nén trong Firefox và kích thước dữ liệu chưa nén trong Chrome.

Trong `ProgressEvent` bạn tự tạo, bạn có thể gán bất kỳ giá trị số nào cho `loaded` đại diện cho lượng công việc đã hoàn thành so với giá trị `total`.

## Giá trị

Một số.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("ProgressEvent")}} mà nó thuộc về.
