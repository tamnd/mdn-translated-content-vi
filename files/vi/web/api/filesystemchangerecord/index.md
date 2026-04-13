---
title: FileSystemChangeRecord
slug: Web/API/FileSystemChangeRecord
page-type: web-api-interface
---

{{APIRef("File System API")}}

Dictionary **`FileSystemChangeRecord`** của {{domxref("File System API", "File System API", "", "nocode")}} chứa thông tin chi tiết về một thay đổi đơn lẻ được quan sát bởi {{domxref("FileSystemObserver")}}.

Tham số `records` được truyền vào hàm callback của hàm khởi tạo {{domxref("FileSystemObserver.FileSystemObserver", "FileSystemObserver()")}} là mảng các đối tượng `FileSystemChangeRecord`.

## Thuộc tính phiên bản

- `changedHandle`
  - : Tham chiếu đến handle hệ thống tệp mà thay đổi được quan sát trên đó.
    - Đối với hệ thống tệp người dùng có thể quan sát, đây có thể là {{domxref("FileSystemFileHandle")}} hoặc {{domxref("FileSystemDirectoryHandle")}}.
    - Đối với [Origin Private File System](/en-US/docs/Web/API/File_System_API/Origin_private_file_system) (OPFS), đây có thể là {{domxref("FileSystemFileHandle")}}, {{domxref("FileSystemDirectoryHandle")}} hoặc {{domxref("FileSystemSyncAccessHandle")}}.

    Thuộc tính này sẽ là `null` cho các bản ghi có kiểu `"disappeared"`, `"errored"` hoặc `"unknown"`.

- `relativePathComponents`
  - : Mảng chứa các thành phần đường dẫn tạo nên đường dẫn tệp tương đối từ `root` đến `changedHandle`, bao gồm tên tệp `changedHandle`.
- `relativePathMovedFrom`
  - : Mảng chứa các thành phần đường dẫn tạo nên đường dẫn tệp tương đối từ `root` đến vị trí cũ của `changedHandle`, trong trường hợp quan sát có kiểu `"moved"`. Nếu kiểu không phải là `"moved"`, thuộc tính này sẽ là `null`.
- `root`
  - : Tham chiếu đến handle hệ thống tệp gốc, tức là handle được truyền vào lời gọi `observe()` đã bắt đầu quan sát.
- `type`
  - : Chuỗi đại diện cho loại thay đổi được quan sát. Các giá trị có thể là:
    - `appeared`: Tệp hoặc thư mục được tạo hoặc di chuyển vào cấu trúc tệp `root`.
    - `disappeared`: Tệp hoặc thư mục bị xóa hoặc di chuyển ra khỏi cấu trúc tệp `root`.
    - `errored`: Xảy ra trạng thái lỗi trong thư mục được quan sát.
    - `modified`: Tệp hoặc thư mục được sửa đổi.
    - `moved`: Tệp hoặc thư mục được di chuyển trong cấu trúc tệp gốc.
    - `unknown`: Cho biết một số quan sát đã bị bỏ lỡ.

## Thông số kỹ thuật

Không có thông số kỹ thuật chính thức.

## Xem thêm

- {{domxref("FileSystemObserver")}}
