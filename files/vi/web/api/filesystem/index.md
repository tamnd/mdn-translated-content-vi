---
title: FileSystem
slug: Web/API/FileSystem
page-type: web-api-interface
browser-compat: api.FileSystem
---

{{APIRef("File and Directory Entries API")}}

Giao diện **`FileSystem`** của File and Directory Entries API được sử dụng để đại diện cho một hệ thống tệp. Các đối tượng này có thể được lấy từ thuộc tính {{domxref("FileSystemEntry.filesystem", "filesystem")}} trên bất kỳ mục hệ thống tệp nào. Một số trình duyệt cung cấp thêm các API để tạo và quản lý hệ thống tệp, chẳng hạn như phương thức {{domxref("Window.requestFileSystem", "requestFileSystem()")}} của Chrome.

Giao diện này sẽ không cấp cho bạn quyền truy cập vào hệ thống tệp của người dùng. Thay vào đó, bạn sẽ có một "ổ đĩa ảo" trong sandbox của trình duyệt nếu muốn truy cập hệ thống tệp của người dùng, bạn cần gọi người dùng, ví dụ như cài đặt tiện ích Chrome. Có thể tìm thấy API Chrome liên quan trong [tài liệu dành cho nhà phát triển Chrome](https://developer.chrome.com/docs/apps/reference/fileSystem).

## Khái niệm cơ bản

Có hai cách để truy cập đối tượng `FileSystem`:

1. Bạn có thể yêu cầu trực tiếp một đối tượng đại diện cho hệ thống tệp sandbox được tạo riêng cho ứng dụng web của bạn bằng cách gọi `window.requestFileSystem()`. Nếu lệnh gọi đó thành công, nó sẽ thực thi một callback handler nhận tham số là đối tượng `FileSystem` mô tả hệ thống tệp.
2. Bạn có thể lấy nó từ đối tượng mục hệ thống tệp, thông qua thuộc tính {{domxref("FileSystemEntry.filesystem", "filesystem")}} của nó.

## Thuộc tính phiên bản

- {{domxref("FileSystem.name")}} {{ReadOnlyInline}}
  - : Một chuỗi đại diện cho tên của hệ thống tệp. Tên này là duy nhất trong toàn bộ danh sách các hệ thống tệp được hiển thị.
- {{domxref("FileSystem.root")}} {{ReadOnlyInline}}
  - : Đối tượng {{domxref("FileSystemDirectoryEntry")}} đại diện cho thư mục gốc của hệ thống tệp. Thông qua đối tượng này, bạn có thể truy cập tất cả các tệp và thư mục trong hệ thống tệp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemEntry")}}, {{domxref("FileSystemFileEntry")}}, và {{domxref("FileSystemDirectoryEntry")}}
