---
title: "FileSystemEntry: remove() method"
short-title: remove()
slug: Web/API/FileSystemEntry/remove
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.FileSystemEntry.remove
---

{{APIRef("File and Directory Entries API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`remove()`** của giao diện {{domxref("FileSystemEntry")}} xóa tệp hoặc thư mục khỏi hệ thống tệp. Thư mục phải rỗng trước khi có thể xóa.

Để xóa đệ quy một thư mục cùng với tất cả nội dung và thư mục con của nó, hãy gọi {{domxref("FileSystemDirectoryEntry.removeRecursively()")}} thay thế.

## Cú pháp

```js-nolint
remove(successCallback)
remove(successCallback, errorCallback)
```

### Tham số

- `successCallback`
  - : Hàm được gọi sau khi tệp được xóa thành công.
- `errorCallback` {{optional_inline}}
  - : Callback tùy chọn được gọi nếu việc xóa tệp thất bại.

### Giá trị trả về

None ({{jsxref("undefined")}}).

### Ngoại lệ

- `DOMException.INVALID_MODIFICATION_ERR`
  - : Mục được chỉ định là thư mục gốc của hệ thống tệp, hoặc mục được chỉ định là thư mục không rỗng.
- `DOMException.INVALID_STATE_ERR`
  - : Trạng thái được cache của hệ thống tệp không nhất quán với trạng thái trên đĩa, do đó tệp không thể bị xóa vì lý do an toàn.
- `DOMException.NO_MODIFICATION_ALLOWED_ERR`
  - : Trạng thái của hệ thống tệp không cho phép xóa tệp hoặc thư mục.
- `DOMException.NOT_FOUND_ERR`
  - : Tệp hoặc thư mục không tồn tại.
- `DOMException.SECURITY_ERR`
  - : Mục không thể bị xóa do quyền hạn hoặc các hạn chế truy cập khác, hoặc vì có quá nhiều lệnh gọi đang được thực hiện trên tài nguyên tệp.

## Ví dụ

Ví dụ này xóa một tệp làm việc tạm thời.

```js
workingDirectory.getFile(
  "tmp/work-file.json",
  {},
  (fileEntry) => {
    fileEntry.remove(() => {
      /* the file was removed successfully */
    });
  },
  handleError,
);
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemDirectoryEntry.removeRecursively()")}}
