---
title: "Window: thuộc tính performance"
short-title: performance
slug: Web/API/Window/performance
page-type: web-api-instance-property
browser-compat: api.performance
---

{{APIRef("Performance API")}}

Thuộc tính **`performance`** của giao diện {{domxref("Window")}} trả về một đối tượng {{domxref("Performance")}}, có thể dùng để thu thập thông tin hiệu năng về mã đang chạy trong phạm vi của cửa sổ.

Các performance entry là theo từng ngữ cảnh. Nếu bạn tạo một mark trên luồng chính (hoặc một worker khác), bạn sẽ không thấy nó trong một worker thread, và ngược lại.

## Giá trị

Một đối tượng {{domxref("Performance")}} cung cấp quyền truy cập vào thông tin liên quan đến hiệu năng và thời gian của mã đang chạy trong phạm vi của cửa sổ.

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích trên trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WorkerGlobalScope.performance")}}
