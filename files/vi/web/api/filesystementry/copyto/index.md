---
title: "FileSystemEntry: copyTo() method"
short-title: copyTo()
slug: Web/API/FileSystemEntry/copyTo
page-type: web-api-instance-method
status:
  - deprecated
  - non-standard
browser-compat: api.FileSystemEntry.copyTo
---

{{APIRef("File and Directory Entries API")}}{{Deprecated_Header}}{{Non-standard_Header}}

Phương thức **`copyTo()`** của giao diện {{domxref("FileSystemEntry")}} sao chép tệp được chỉ định bởi mục đến một vị trí mới trong hệ thống tệp.

Có một số hạn chế điển hình về những gì bạn có thể làm:

- Không thể sao chép một thư mục vào chính nó.
- Không thể sao chép một mục vào thư mục cha của nó trừ khi bạn chỉ định tên mới.
- Khi sao chép một thư mục, thao tác sao chép luôn đệ quy; bạn không thể bỏ qua các thư mục con.

## Cú pháp

```js-nolint
copyTo(newParent)
copyTo(newParent, newName)
copyTo(newParent, newName, successCallback)
copyTo(newParent, newName, successCallback, errorCallback)
```

### Tham số

- `newParent`
  - : Một đối tượng {{domxref("FileSystemDirectoryEntry")}} chỉ định thư mục đích cho thao tác sao chép.
- `newName` {{optional_inline}}
  - : Nếu tham số này được cung cấp, bản sao sẽ được đặt tên tệp hoặc thư mục mới là chuỗi này.
- `successCallback` {{optional_inline}}
  - : Hàm được gọi khi thao tác sao chép hoàn tất thành công. Nhận một tham số đầu vào duy nhất: một đối tượng dựa trên {{domxref("FileSystemEntry")}} cung cấp thông tin chi tiết mới của mục đã sao chép.
- `errorCallback` {{optional_inline}}
  - : Callback tùy chọn được thực thi nếu xảy ra lỗi khi sao chép các mục. Có một tham số duy nhất: một {{domxref("DOMException")}} mô tả lỗi xảy ra.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `DOMException.INVALID_MODIFICATION_ERR`
  - : Thao tác yêu cầu liên quan đến một thay đổi không thể thực hiện, chẳng hạn như di chuyển thư mục vào chính nó hoặc vào một trong các thư mục con của nó, hoặc sao chép một mục trong cùng một thư mục mà không đổi tên.
- `DOMException.QUOTA_EXCEEDED_ERR`
  - : Thao tác vượt quá hạn mức lưu trữ của người dùng, hoặc không còn đủ dung lượng để hoàn tất thao tác.

## Ví dụ

Ví dụ này cho thấy cách một tệp nhật ký tạm thời có thể được chuyển vào thư mục "log" cố định hơn.

```js
workingDirectory.getFile(
  "tmp/log.txt",
  {},
  (fileEntry) => {
    workingDirectory.getDirectory(
      "log",
      {},
      (dirEntry) => {
        fileEntry.copyTo(dirEntry);
      },
      handleError,
    );
  },
  handleError,
);
```

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
