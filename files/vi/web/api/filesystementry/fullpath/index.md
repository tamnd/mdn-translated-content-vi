---
title: "FileSystemEntry: fullPath property"
short-title: fullPath
slug: Web/API/FileSystemEntry/fullPath
page-type: web-api-instance-property
browser-compat: api.FileSystemEntry.fullPath
---

{{APIRef("File and Directory Entries API")}}

Thuộc tính chỉ đọc **`fullPath`** của giao diện {{domxref("FileSystemEntry")}} trả về một chuỗi chỉ định đường dẫn đầy đủ, tuyệt đối từ thư mục gốc của hệ thống tệp đến tệp được đại diện bởi mục.

Cũng có thể coi đây là đường dẫn tương đối so với thư mục gốc, với "/" được thêm vào đầu để tạo thành đường dẫn tuyệt đối.

## Giá trị

Một chuỗi cho biết đường dẫn đầy đủ của mục.

## Ví dụ

Ví dụ này cho thấy một hàm nhận vào một hệ thống tệp; sau đó lấy {{domxref("FileSystemFileEntry")}} cho một tệp tên `data.json` và trả về đường dẫn đầy đủ của nó.

```js
function gotFileSystem(fs) {
  let path = "";

  fs.root.getFile(
    "data.json",
    { create: true, exclusive: true },
    (entry) => {
      path = fullPath;
    },
    handleError(error),
  );

  return path;
}
```

Rõ ràng đây là một ví dụ được đơn giản hóa, vì chúng ta biết đường dẫn đầy đủ của tệp là `"/data.json"` sau khi vừa tra cứu, nhưng khái niệm vẫn đúng trong các tình huống mà bạn không biết trước.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemEntry")}}
