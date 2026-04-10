---
title: "IDBTransaction: thuộc tính durability"
short-title: durability
slug: Web/API/IDBTransaction/durability
page-type: web-api-instance-property
browser-compat: api.IDBTransaction.durability
---

{{securecontext_header}}{{APIRef("IndexedDB")}}

Thuộc tính chỉ đọc **`durability`** của giao diện {{domxref("IDBTransaction")}} trả về gợi ý độ bền mà transaction được tạo cùng. Đây là gợi ý cho user agent biết nên ưu tiên hiệu năng hay độ bền khi commit transaction.

Giá trị của thuộc tính này được định nghĩa trong tham số [`options.durability`](/en-US/docs/Web/API/IDBDatabase/transaction#options) khi tạo transaction bằng {{domxref("IDBDatabase.transaction()")}}.

## Giá trị

Bất kỳ một trong các giá trị chuỗi {{jsxref('String', 'string')}} sau:

- `"strict"`
  - : User agent có thể chỉ xem transaction là commit thành công sau khi xác minh rằng mọi thay đổi đang chờ đã được ghi thành công xuống một phương tiện lưu trữ bền vững.
- `"relaxed"`
  - : User agent có thể xem transaction là commit thành công ngay khi mọi thay đổi đang chờ đã được ghi vào hệ điều hành, mà không cần xác minh tiếp theo.
- `"default"`
  - : User agent nên dùng hành vi độ bền mặc định cho storage bucket.
    Đây là mặc định cho transaction nếu không chỉ định gì khác.

## Ví dụ

Để xem ví dụ đầy đủ, hãy xem ứng dụng [To-do Notifications](https://github.com/mdn/dom-examples/tree/main/to-do-notifications) của chúng tôi ([xem ví dụ trực tiếp](https://mdn.github.io/dom-examples/to-do-notifications/)).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
