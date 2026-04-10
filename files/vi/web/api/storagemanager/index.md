---
title: StorageManager
slug: Web/API/StorageManager
page-type: web-api-interface
browser-compat: api.StorageManager
---

{{securecontext_header}}{{APIRef("Storage")}} {{AvailableInWorkers}}

Giao diện **`StorageManager`** của [Storage API](/en-US/docs/Web/API/Storage_API) cung cấp một giao diện để quản lý quyền lưu trữ bền vững và ước lượng dung lượng lưu trữ khả dụng. Bạn có thể lấy tham chiếu đến giao diện này bằng {{domxref("navigator.storage")}} hoặc {{domxref("WorkerNavigator.storage")}}.

## Phương thức thể hiện

- {{domxref("StorageManager.estimate()")}}
  - : Trả về một {{jsxref('Promise')}} được giải quyết bằng một đối tượng chứa các số liệu `usage` và `quota` cho origin của bạn.
- {{domxref("StorageManager.getDirectory()")}}
  - : Dùng để lấy tham chiếu đến một đối tượng {{domxref("FileSystemDirectoryHandle")}} cho phép truy cập một thư mục và nội dung của nó, được lưu trong [origin private file system](/en-US/docs/Web/API/File_System_API/Origin_private_file_system). Trả về một {{jsxref('Promise')}} được thực thi thành công với một đối tượng {{domxref("FileSystemDirectoryHandle")}}.
- {{domxref("StorageManager.persist()")}}
  - : Trả về một {{jsxref('Promise')}} được giải quyết thành `true` nếu user agent có thể lưu trữ bền vững dữ liệu của trang web bạn.
- {{domxref("StorageManager.persisted()")}}
  - : Trả về một {{jsxref('Promise')}} được giải quyết thành `true` nếu quyền lưu trữ bền vững đã được cấp cho dữ liệu của trang web bạn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
