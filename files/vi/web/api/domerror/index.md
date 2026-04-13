---
title: DOMError
slug: Web/API/DOMError
page-type: web-api-interface
status:
  - deprecated
browser-compat: api.DOMError
---

{{APIRef("DOM")}}{{Deprecated_Header}}

Giao diện **`DOMError`** mô tả đối tượng lỗi chứa tên lỗi.

## Thuộc tính phiên bản

- {{domxref("DOMError.name")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Trả về chuỗi đại diện cho một trong các tên loại lỗi (xem bên dưới).
- {{domxref("DOMError.message")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Trả về chuỗi đại diện cho thông điệp hoặc mô tả liên kết với tên loại lỗi đã cho.

## Các loại lỗi

| Loại                         | Mô tả                                                       |
| ---------------------------- | ----------------------------------------------------------- |
| `IndexSizeError`             | Chỉ số không nằm trong phạm vi cho phép.                    |
| `HierarchyRequestError`      | Cây phân cấp nút không đúng.                                |
| `WrongDocumentError`         | Đối tượng ở trong tài liệu sai.                             |
| `InvalidCharacterError`      | Chuỗi chứa các ký tự không hợp lệ.                          |
| `NoModificationAllowedError` | Đối tượng không thể được sửa đổi.                           |
| `NotFoundError`              | Không tìm thấy đối tượng ở đây.                             |
| `NotSupportedError`          | Thao tác không được hỗ trợ.                                 |
| `InvalidStateError`          | Đối tượng ở trạng thái không hợp lệ.                        |
| `SyntaxError`                | Chuỗi không khớp với mẫu mong đợi.                          |
| `InvalidModificationError`   | Đối tượng không thể được sửa đổi theo cách này.             |
| `NamespaceError`             | Thao tác không được phép bởi Namespaces trong XML.          |
| `InvalidAccessError`         | Đối tượng không hỗ trợ thao tác hoặc đối số.                |
| `TypeMismatchError`          | Kiểu của đối tượng không khớp với kiểu mong đợi.            |
| `SecurityError`              | Thao tác không an toàn.                                     |
| `NetworkError`               | Đã xảy ra lỗi mạng.                                         |
| `AbortError`                 | Thao tác bị hủy bỏ.                                         |
| `URLMismatchError`           | URL đã cho không khớp với URL khác.                         |
| `TimeoutError`               | Thao tác hết thời gian chờ.                                 |
| `InvalidNodeTypeError`       | Nút không đúng hoặc có tổ tiên không đúng cho thao tác này. |
| `DataCloneError`             | Đối tượng không thể được sao chép.                          |

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("DOMException") }}
