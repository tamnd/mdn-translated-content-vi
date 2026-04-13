---
title: "ProgressEvent: total property"
short-title: total
slug: Web/API/ProgressEvent/total
page-type: web-api-instance-property
browser-compat: api.ProgressEvent.total
---

{{APIRef("XMLHttpRequest API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`ProgressEvent.total`** là một số cho biết tổng kích thước dữ liệu đang được truyền hoặc xử lý.

Đối với `ProgressEvent` được trình duyệt gửi, giá trị đề cập đến kích thước, tính bằng byte, của tài nguyên và được lấy từ tiêu đề phản hồi `Content-Length`.

Trong `ProgressEvent` bạn tự tạo, đây cũng có thể là tổng số byte của tài nguyên, mặc dù có thể là bất kỳ số nào. Ví dụ, bạn có thể muốn chuẩn hóa `total` thành giá trị như `100` hoặc `1` nếu việc tiết lộ số byte chính xác của tài nguyên là điều đáng lo ngại. Nếu sử dụng `1` làm tổng, {{domxref("ProgressEvent.loaded")}} sẽ là giá trị thập phân giữa `0` và `1`.

Nếu thuộc tính {{domxref("ProgressEvent.lengthComputable", "lengthComputable")}} của sự kiện là `false`, giá trị này vô nghĩa và nên bị bỏ qua.

## Giá trị

Một số.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("ProgressEvent")}} mà nó thuộc về.
