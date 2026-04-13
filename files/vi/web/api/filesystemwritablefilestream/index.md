---
title: FileSystemWritableFileStream
slug: Web/API/FileSystemWritableFileStream
page-type: web-api-interface
browser-compat: api.FileSystemWritableFileStream
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Giao diện **`FileSystemWritableFileStream`** của {{domxref("File System API", "File System API", "", "nocode")}} là đối tượng {{domxref('WritableStream')}} với các phương thức tiện lợi bổ sung, hoạt động trên một tệp duy nhất trên đĩa. Giao diện này được truy cập thông qua phương thức {{domxref('FileSystemFileHandle.createWritable()')}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ lớp cha, {{DOMxRef("WritableStream")}}._

## Phương thức phiên bản

_Kế thừa các phương thức từ lớp cha, {{DOMxRef("WritableStream")}}._

- {{domxref('FileSystemWritableFileStream.write()')}}
  - : Ghi nội dung vào tệp mà phương thức được gọi, tại vị trí con trỏ tệp hiện tại.
- {{domxref('FileSystemWritableFileStream.seek()')}}
  - : Cập nhật vị trí con trỏ tệp hiện tại đến vị trí (tính bằng byte) được chỉ định.
- {{domxref('FileSystemWritableFileStream.truncate()')}}
  - : Thay đổi kích thước tệp liên kết với luồng thành kích thước được chỉ định tính bằng byte.

## Ví dụ

Hàm bất đồng bộ sau đây mở hộp thoại 'Save File', trả về {{domxref('FileSystemFileHandle')}} khi một tệp được chọn. Từ đó, một luồng ghi được tạo bằng phương thức {{domxref('FileSystemFileHandle.createWritable()')}}.

Sau đó, một chuỗi văn bản được ghi vào luồng, và luồng được đóng lại.

```js
async function saveFile() {
  // create a new handle
  const newHandle = await window.showSaveFilePicker();

  // create a FileSystemWritableFileStream to write to
  const writableStream = await newHandle.createWritable();

  // write our file
  await writableStream.write("This is my file content");

  // close the file and write the contents to disk.
  await writableStream.close();
}
```

Các ví dụ sau đây cho thấy các tùy chọn khác nhau có thể được truyền vào phương thức `write()`.

```js
// just pass in the data (no options)
writableStream.write(data);

// writes the data to the stream from the determined position
writableStream.write({ type: "write", position, data });

// updates the current file cursor offset to the position specified
writableStream.write({ type: "seek", position });

// resizes the file to be size bytes long
writableStream.write({ type: "truncate", size });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
