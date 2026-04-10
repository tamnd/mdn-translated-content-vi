---
title: FileSystemHandle
slug: Web/API/FileSystemHandle
page-type: web-api-interface
browser-compat: api.FileSystemHandle
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Giao diện **`FileSystemHandle`** của {{domxref("File System API", "", "", "nocode")}} là một đối tượng đại diện cho một mục nhập file hoặc thư mục. Nhiều handle có thể đại diện cho cùng một mục nhập. Phần lớn thời gian, bạn không làm việc trực tiếp với `FileSystemHandle` mà với các giao diện con của nó là {{domxref('FileSystemFileHandle')}} và {{domxref('FileSystemDirectoryHandle')}}.

## Các giao diện dựa trên FileSystemHandle

Dưới đây là danh sách các giao diện dựa trên giao diện `FileSystemHandle`.

- {{domxref("FileSystemFileHandle")}}
  - : Đại diện cho một handle tới một mục nhập file.
- {{domxref("FileSystemDirectoryHandle")}}
  - : Cung cấp một handle tới một mục nhập thư mục.

## Thuộc tính thể hiện

- {{domxref('FileSystemHandle.kind','kind')}} {{ReadOnlyInline}}
  - : Trả về kiểu của mục nhập. Giá trị là `'file'` nếu mục nhập liên quan là một file, hoặc `'directory'` nếu là thư mục.
- {{domxref('FileSystemHandle.name', 'name')}} {{ReadOnlyInline}}
  - : Trả về tên của mục nhập liên quan.

## Phương thức thể hiện

- {{domxref('FileSystemHandle.isSameEntry()', 'isSameEntry()')}}
  - : So sánh hai handle để xem các mục nhập liên quan, dù là file hay thư mục, có khớp nhau hay không.
- {{domxref('FileSystemHandle.queryPermission()', 'queryPermission()')}} {{Experimental_Inline}}
  - : Truy vấn trạng thái quyền hiện tại của handle hiện tại.
- {{domxref('FileSystemHandle.remove', 'remove()')}} {{Experimental_Inline}} {{Non-standard_Inline}}
  - : Yêu cầu xóa mục nhập được biểu diễn bởi handle khỏi hệ thống file nền.
- {{domxref('FileSystemHandle.requestPermission', 'requestPermission()')}} {{Experimental_Inline}}
  - : Yêu cầu quyền đọc hoặc đọc-ghi cho file handle.

## Ví dụ

### Kiểm tra kiểu

Đoạn mã dưới đây cho phép người dùng chọn một file từ bộ chọn file, rồi kiểm tra xem handle trả về là file hay thư mục:

```js
// lưu tham chiếu tới file handle của chúng ta
let fileHandle;

async function getFile() {
  // mở bộ chọn file
  [fileHandle] = await window.showOpenFilePicker();

  if (fileHandle.kind === "file") {
    // chạy mã dành cho file
  } else if (fileHandle.kind === "directory") {
    // chạy mã dành cho thư mục
  }
}
```

### Truy vấn/Yêu cầu quyền

Hàm bất đồng bộ sau trả về `true` nếu người dùng đã cấp quyền đọc hoặc đọc-ghi cho file handle. Nếu chưa, quyền sẽ được yêu cầu.

```js
// fileHandle là một FileSystemFileHandle
// withWrite là một boolean được đặt thành true nếu muốn ghi

async function verifyPermission(fileHandle, withWrite) {
  const opts = {};
  if (withWrite) {
    opts.mode = "readwrite";
  }

  // Kiểm tra xem chúng ta đã có quyền chưa, nếu có thì trả về true.
  if ((await fileHandle.queryPermission(opts)) === "granted") {
    return true;
  }

  // Yêu cầu quyền với file, nếu người dùng cấp quyền thì trả về true.
  if ((await fileHandle.requestPermission(opts)) === "granted") {
    return true;
  }

  // Người dùng không cấp quyền, trả về false.
  return false;
}
```

### So sánh các mục nhập

Hàm sau so sánh một mục nhập đơn lẻ với một mảng các mục nhập, và trả về một mảng mới đã loại bỏ mọi mục nhập khớp.

```js
function removeMatches(fileEntry, entriesArr) {
  const newArr = entriesArr.filter((entry) => !fileEntry.isSameEntry(entry));

  return newArr;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [File System Access API: đơn giản hóa truy cập tới file cục bộ](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
