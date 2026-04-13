---
title: DOMException
slug: Web/API/DOMException
page-type: web-api-interface
browser-compat: api.DOMException
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Giao diện **`DOMException`** đại diện cho một sự kiện bất thường (gọi là **ngoại lệ**) xảy ra do gọi một phương thức hoặc truy cập thuộc tính của một Web API. Đây là cách mô tả các điều kiện lỗi trong Web API.

Mỗi ngoại lệ có một **tên**, là một chuỗi ngắn theo kiểu "PascalCase" xác định lỗi hoặc điều kiện bất thường.

`DOMException` là một {{Glossary("Serializable object")}}, do đó nó có thể được nhân bản với {{DOMxRef("Window.structuredClone", "structuredClone()")}} hoặc sao chép giữa các [Workers](/en-US/docs/Web/API/Worker) bằng cách sử dụng {{domxref("Worker.postMessage()", "postMessage()")}}.

## Hàm khởi tạo

- {{domxref("DOMException.DOMException()", "DOMException()")}}
  - : Trả về một đối tượng `DOMException` với thông điệp và tên được chỉ định.

## Thuộc tính phiên bản

- {{domxref("DOMException.code")}} {{deprecated_inline}} {{ReadOnlyInline}}
  - : Trả về một trong các hằng số mã lỗi cũ, hoặc `0` nếu không khớp.
- {{domxref("DOMException.message")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi đại diện cho thông điệp hoặc mô tả liên quan đến [tên lỗi](#tên_lỗi) đã cho.
- {{domxref("DOMException.name")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa một trong các chuỗi liên kết với [tên lỗi](#tên_lỗi).

## Tên lỗi

Các tên lỗi phổ biến được liệt kê ở đây. Một số API xác định tập hợp tên riêng của chúng, vì vậy đây không nhất thiết là danh sách đầy đủ.

Các lỗi lịch sử đã lỗi thời sau đây không có tên lỗi mà chỉ có giá trị mã hằng số cũ và tên hằng số cũ:

- Giá trị mã cũ: `2`, tên hằng số cũ: `DOMSTRING_SIZE_ERR`
- Giá trị mã cũ: `6`, tên hằng số cũ: `NO_DATA_ALLOWED_ERR`
- Giá trị mã cũ: `16`, tên hằng số cũ: `VALIDATION_ERR`

> [!NOTE]
> Vì trong lịch sử các lỗi được xác định bằng một giá trị số tương ứng với một biến có tên được xác định có giá trị đó, một số mục bên dưới chỉ ra giá trị mã cũ và tên hằng số cũ đã được sử dụng trước đây.

- `IndexSizeError`
  - : Chỉ số không nằm trong phạm vi cho phép. Ví dụ, điều này có thể được ném ra bởi đối tượng {{ domxref("Range") }}. (Giá trị mã cũ: `1`, tên hằng số cũ: `INDEX_SIZE_ERR`)
- `HierarchyRequestError`
  - : Hệ thống cấp bậc cây nút không đúng. (Giá trị mã cũ: `3`, tên hằng số cũ: `HIERARCHY_REQUEST_ERR`)
- `WrongDocumentError`
  - : Đối tượng ở trong {{ domxref("Document") }} sai. (Giá trị mã cũ: `4`, tên hằng số cũ: `WRONG_DOCUMENT_ERR`)
- `InvalidCharacterError`
  - : Chuỗi chứa các ký tự không hợp lệ. (Giá trị mã cũ: `5`, tên hằng số cũ: `INVALID_CHARACTER_ERR`)
- `NoModificationAllowedError`
  - : Đối tượng không thể được sửa đổi. (Giá trị mã cũ: `7`, tên hằng số cũ: `NO_MODIFICATION_ALLOWED_ERR`)
- `NotFoundError`
  - : Không thể tìm thấy đối tượng ở đây. (Giá trị mã cũ: `8`, tên hằng số cũ: `NOT_FOUND_ERR`)
- `NotSupportedError`
  - : Thao tác không được hỗ trợ. (Giá trị mã cũ: `9`, tên hằng số cũ: `NOT_SUPPORTED_ERR`)
- `InUseAttributeError`
  - : Thuộc tính đang được sử dụng. (Giá trị mã cũ: `10`, tên hằng số cũ: `INUSE_ATTRIBUTE_ERR`)
- `InvalidStateError`
  - : Đối tượng ở trạng thái không hợp lệ. (Giá trị mã cũ: `11`, tên hằng số cũ: `INVALID_STATE_ERR`)
- `SyntaxError`
  - : Chuỗi không khớp với mẫu mong đợi. (Giá trị mã cũ: `12`, tên hằng số cũ: `SYNTAX_ERR`)
- `InvalidModificationError`
  - : Đối tượng không thể được sửa đổi theo cách này. (Giá trị mã cũ: `13`, tên hằng số cũ: `INVALID_MODIFICATION_ERR`)
- `NamespaceError`
  - : Thao tác không được phép bởi Namespaces trong XML. (Giá trị mã cũ: `14`, tên hằng số cũ: `NAMESPACE_ERR`)
- `InvalidAccessError`
  - : Đối tượng không hỗ trợ thao tác hoặc đối số. (Giá trị mã cũ: `15`, tên hằng số cũ: `INVALID_ACCESS_ERR`)
- `TypeMismatchError` {{deprecated_inline}}
  - : Kiểu của đối tượng không khớp với kiểu mong đợi. (Giá trị mã cũ: `17`, tên hằng số cũ: `TYPE_MISMATCH_ERR`) Giá trị này đã lỗi thời; ngoại lệ {{jsxref("TypeError")}} của JavaScript hiện được ném thay vì `DOMException` với giá trị này.
- `SecurityError`
  - : Thao tác không an toàn. (Giá trị mã cũ: `18`, tên hằng số cũ: `SECURITY_ERR`)
- `NetworkError` {{experimental_inline}}
  - : Đã xảy ra lỗi mạng. (Giá trị mã cũ: `19`, tên hằng số cũ: `NETWORK_ERR`)
- `AbortError` {{experimental_inline}}
  - : Thao tác đã bị hủy. (Giá trị mã cũ: `20`, tên hằng số cũ: `ABORT_ERR`)
- `URLMismatchError` {{experimental_inline}}
  - : URL đã cho không khớp với URL khác. (Giá trị mã cũ: `21`, tên hằng số cũ: `URL_MISMATCH_ERR`)
- {{domxref("QuotaExceededError")}}
  - : Hạn mức đã bị vượt quá. (Giá trị mã cũ: `22`, tên hằng số cũ: `QUOTA_EXCEEDED_ERR`) Đây là một giao diện thực sự kế thừa từ `DOMException`.
- `TimeoutError`
  - : Thao tác đã hết thời gian chờ. (Giá trị mã cũ: `23`, tên hằng số cũ: `TIMEOUT_ERR`)
- `InvalidNodeTypeError` {{experimental_inline}}
  - : Nút không đúng hoặc có tổ tiên không đúng cho thao tác này. (Giá trị mã cũ: `24`, tên hằng số cũ: `INVALID_NODE_TYPE_ERR`)
- `DataCloneError` {{experimental_inline}}
  - : Đối tượng không thể được nhân bản. (Giá trị mã cũ: `25`, tên hằng số cũ: `DATA_CLONE_ERR`)
- `EncodingError` {{experimental_inline}}
  - : Thao tác mã hóa hoặc giải mã đã thất bại (không có giá trị mã và tên hằng số cũ).
- `NotReadableError` {{experimental_inline}}
  - : Thao tác đọc đầu vào/đầu ra đã thất bại (không có giá trị mã và tên hằng số cũ).
- `UnknownError` {{experimental_inline}}
  - : Thao tác thất bại vì lý do tạm thời không xác định (ví dụ hết bộ nhớ) (không có giá trị mã và tên hằng số cũ).
- `ConstraintError` {{experimental_inline}}
  - : Một thao tác đột biến trong giao dịch đã thất bại vì một ràng buộc không được thỏa mãn (không có giá trị mã và tên hằng số cũ).
- `DataError` {{experimental_inline}}
  - : Dữ liệu được cung cấp không đầy đủ (không có giá trị mã và tên hằng số cũ).
- `TransactionInactiveError` {{experimental_inline}}
  - : Một yêu cầu được đặt với một giao dịch hiện không hoạt động hoặc đã kết thúc (không có giá trị mã và tên hằng số cũ).
- `ReadOnlyError` {{experimental_inline}}
  - : Thao tác đột biến được thử trong giao dịch "chỉ đọc" (không có giá trị mã và tên hằng số cũ).
- `VersionError` {{experimental_inline}}
  - : Đã thử mở cơ sở dữ liệu bằng phiên bản thấp hơn phiên bản hiện có (không có giá trị mã và tên hằng số cũ).
- `OperationError` {{experimental_inline}}
  - : Thao tác thất bại vì lý do cụ thể của thao tác (không có giá trị mã và tên hằng số cũ).
- `NotAllowedError`
  - : Yêu cầu không được phép bởi tác nhân người dùng hoặc nền tảng trong ngữ cảnh hiện tại, có thể do người dùng đã từ chối quyền (không có giá trị mã và tên hằng số cũ).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `DOMException`](https://github.com/zloirock/core-js#domexception) có trong [`core-js`](https://github.com/zloirock/core-js)
- {{ domxref("DOMError") }}
