---
title: LockManager
slug: Web/API/LockManager
page-type: web-api-interface
browser-compat: api.LockManager
---

{{APIRef("Web Locks API")}}{{securecontext_header}} {{AvailableInWorkers}}

Giao diện **`LockManager`** của [Web Locks API](/en-US/docs/Web/API/Web_Locks_API) cung cấp các phương thức để yêu cầu đối tượng {{domxref('Lock')}} mới và truy vấn đối tượng `Lock` hiện có. Để lấy phiên bản của `LockManager`, gọi {{domxref('navigator.locks')}}.

## Phương thức phiên bản

- {{domxref('LockManager.request()')}}
  - : Yêu cầu đối tượng {{domxref('Lock')}} với các tham số chỉ định tên và đặc điểm của nó.
- {{domxref('LockManager.query()')}}
  - : Trả về {{jsxref('Promise')}} được giải quyết với đối tượng chứa thông tin về các khóa đang giữ và đang chờ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
