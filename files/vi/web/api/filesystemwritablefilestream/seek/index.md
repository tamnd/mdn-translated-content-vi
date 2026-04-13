---
title: "FileSystemWritableFileStream: seek() method"
short-title: seek()
slug: Web/API/FileSystemWritableFileStream/seek
page-type: web-api-instance-method
browser-compat: api.FileSystemWritableFileStream.seek
---

{{securecontext_header}}{{APIRef("File System API")}}{{AvailableInWorkers}}

Phương thức **`seek()`** của giao diện {{domxref("FileSystemWritableFileStream")}} cập nhật vị trí con trỏ tệp hiện tại đến vị trí (tính bằng byte) được chỉ định khi gọi phương thức.

## Cú pháp

```js-nolint
seek(position)
```

### Tham số

- `position`
  - : Một số xác định vị trí byte từ đầu tệp.

### Giá trị trả về

Một {{jsxref('Promise')}} trả về `undefined`.

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref('PermissionStatus.state')}} không phải là `granted`.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu `position` không phải là số hoặc không được xác định.

## Ví dụ

Hàm bất đồng bộ sau đây mở hộp thoại 'Save File', trả về {{domxref('FileSystemFileHandle')}} khi một tệp được chọn. Từ đó, một luồng ghi được tạo bằng phương thức {{domxref('FileSystemFileHandle.createWritable()')}}.

Tiếp theo, chúng ta ghi vào luồng:

1. Một chuỗi văn bản được ghi vào luồng.
2. Phương thức `seek()` được sử dụng để đưa con trỏ về đầu luồng.
3. Một chuỗi văn bản thứ hai được ghi vào đầu luồng, ghi đè lần ghi đầu tiên.

Sau đó luồng được đóng lại.

```js
async function saveFile() {
  try {
    // create a new handle
    const newHandle = await window.showSaveFilePicker();

    // create a FileSystemWritableFileStream to write to
    const writableStream = await newHandle.createWritable();

    // write our file
    await writableStream.write("My first file content");
    await writableStream.seek(0);
    await writableStream.write("My second file content");

    // close the file and write the contents to disk.
    await writableStream.close();
  } catch (err) {
    console.error(err.name, err.message);
  }
}
```

Nếu bạn chạy hàm trên và sau đó mở tệp kết quả được tạo trên đĩa, bạn sẽ thấy văn bản "My second file content".

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File System API](/en-US/docs/Web/API/File_System_API)
- [The File System Access API: simplifying access to local files](https://developer.chrome.com/docs/capabilities/web-apis/file-system-access)
