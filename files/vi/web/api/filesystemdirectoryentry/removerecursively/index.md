---
title: "FileSystemDirectoryEntry: removeRecursively() method"
short-title: removeRecursively()
slug: Web/API/FileSystemDirectoryEntry/removeRecursively
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.FileSystemDirectoryEntry.removeRecursively
---

{{APIRef("File and Directory Entries API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`removeRecursively()`** của giao diện {{domxref("FileSystemDirectoryEntry")}} xóa thư mục cùng với toàn bộ nội dung của nó, lặp đệ quy qua toàn bộ cây con các tệp và thư mục con.

Để xóa một tệp đơn hoặc một thư mục rỗng, bạn cũng có thể sử dụng {{domxref("FileSystemEntry.remove()")}}.

## Cú pháp

```js-nolint
removeRecursively(successCallback)
removeRecursively(successCallback, errorCallback)
```

### Tham số

- `successCallback`
  - : Một hàm được gọi khi quá trình xóa thư mục hoàn tất. Callback không có tham số.
- `errorCallback` {{optional_inline}}
  - : Một hàm được gọi nếu xảy ra lỗi khi cố gắng xóa cây thư mục. Nhận một {{domxref("DOMException")}} mô tả lỗi xảy ra làm đầu vào.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Nếu xảy ra lỗi và `errorCallback` được chỉ định, nó được gọi với một tham số đơn: đối tượng {{domxref("DOMException")}} mô tả lỗi. {{domxref("DOMException.code")}} chỉ định loại lỗi xảy ra:

- `DOMException.INVALID_MODIFICATION_ERR`
  - : Đã cố gắng xóa thư mục gốc; điều này không được phép.
- `DOMException.NO_MODIFICATION_ALLOWED_ERR`
  - : Trạng thái của hệ thống tệp không cho phép sửa đổi.
- `DOMException.NOT_FOUND_ERR`
  - : Thư mục được đại diện bởi {{domxref("FileSystemDirectoryEntry")}} không còn tồn tại.
- `DOMException.NOT_READABLE_ERR`
  - : Thư mục không thể truy cập được; có thể nó đang được sử dụng bởi ứng dụng khác hoặc bị khóa ở cấp hệ điều hành.
- `DOMException.SECURITY_ERR`
  - : Thư mục không thể bị xóa vì lý do bảo mật.

> [!NOTE]
> Nếu bạn cố gắng xóa một thư mục chứa một hoặc nhiều tệp không thể xóa, hoặc nếu xảy ra lỗi khi đang xóa nhiều tệp, một số tệp có thể không bị xóa. Bạn nên cung cấp `errorCallback` để theo dõi và xử lý điều này, có thể bằng cách thử lại.

## Ví dụ

```js
directory.removeRecursively(
  () => {
    /* The directory was removed successfully */
  },
  () => {
    /* an error occurred while removing the directory */
  },
);
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [API Mục Tệp và Thư mục](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemDirectoryEntry")}}
- {{domxref("FileSystemEntry.remove()")}}
