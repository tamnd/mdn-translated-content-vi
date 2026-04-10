---
title: "FileSystemFileHandle: phương thức getFile()"
short-title: getFile()
slug: Web/API/FileSystemFileHandle/getFile
page-type: web-api-instance-method
browser-compat: api.FileSystemFileHandle.getFile
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Phương thức **`getFile()`** của giao diện {{domxref("FileSystemFileHandle")}} trả về một {{jsxref('Promise')}} được thực thi thành một đối tượng {{domxref('File')}} đại diện cho trạng thái trên đĩa của mục nhập được handle biểu diễn.

Nếu file trên đĩa thay đổi hoặc bị xóa sau khi phương thức này được gọi, đối tượng {{domxref('File')}} trả về có khả năng sẽ không còn đọc được nữa.

## Cú pháp

```js-nolint
getFile()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref('Promise')}} được thực thi thành một đối tượng {{domxref('File')}}.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref('PermissionStatus.state')}} không phải là `granted` ở chế độ `read`.
- `NotFoundError` {{domxref("DOMException")}}
  - : Được ném ra nếu mục hiện tại không được tìm thấy.

## Ví dụ

Hàm bất đồng bộ sau hiển thị bộ chọn file và, sau khi người dùng chọn file, dùng phương thức `getFile()` để lấy nội dung.

```js
async function getTheFile() {
  // open file picker
  const [fileHandle] = await window.showOpenFilePicker(pickerOpts);

  // get file contents
  const fileData = await fileHandle.getFile();
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
