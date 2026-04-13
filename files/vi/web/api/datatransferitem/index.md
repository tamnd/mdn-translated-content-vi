---
title: DataTransferItem
slug: Web/API/DataTransferItem
page-type: web-api-interface
browser-compat: api.DataTransferItem
---

{{APIRef("HTML Drag and Drop API")}}

Đối tượng **`DataTransferItem`** đại diện cho một mục dữ liệu kéo. Trong một _thao tác kéo_, mỗi {{domxref("DragEvent")}} có một thuộc tính {{domxref("DragEvent.dataTransfer","dataTransfer")}} chứa một {{domxref("DataTransferItemList","danh sách")}} các mục dữ liệu kéo. Mỗi mục trong danh sách là một đối tượng `DataTransferItem`.

`DataTransferItem` được thiết kế chủ yếu cho [HTML Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API), và vẫn được đặc tả trong phần kéo và thả HTML, nhưng hiện nay cũng được sử dụng bởi các API khác, chẳng hạn như {{domxref("ClipboardEvent.clipboardData")}} và {{domxref("InputEvent.dataTransfer")}}. Tài liệu về `DataTransferItem` chủ yếu thảo luận về việc sử dụng trong các thao tác kéo và thả, và bạn nên tham khảo tài liệu của các API khác để biết cách sử dụng `DataTransferItem` trong các ngữ cảnh đó.

Giao diện này không có hàm khởi tạo.

## Thuộc tính phiên bản

- {{domxref("DataTransferItem.kind")}} {{ReadOnlyInline}}
  - : _Loại_ của mục dữ liệu kéo, `string` hoặc `file`.
- {{domxref("DataTransferItem.type")}} {{ReadOnlyInline}}
  - : Kiểu của mục dữ liệu kéo, thường là một kiểu MIME.

## Phương thức phiên bản

- {{domxref("DataTransferItem.getAsFile()")}}
  - : Trả về đối tượng {{domxref("File")}} liên kết với mục dữ liệu kéo (hoặc null nếu mục kéo không phải là tệp).
- {{domxref("DataTransferItem.getAsFileSystemHandle()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref('Promise')}} hoàn thành với {{domxref('FileSystemFileHandle')}} nếu mục được kéo là tệp, hoặc hoàn thành với {{domxref('FileSystemDirectoryHandle')}} nếu mục được kéo là thư mục.
- {{domxref("DataTransferItem.getAsString()")}}
  - : Gọi hàm callback đã chỉ định với chuỗi dữ liệu của mục kéo làm đối số.
- {{domxref("DataTransferItem.webkitGetAsEntry()")}}
  - : Trả về một đối tượng dựa trên {{domxref("FileSystemEntry")}} đại diện cho mục nhập của tệp được chọn trong hệ thống tệp của nó. Thường là đối tượng {{domxref("FileSystemFileEntry")}} hoặc {{domxref("FileSystemDirectoryEntry")}}.

## Ví dụ

Tất cả các phương thức và thuộc tính của giao diện này đều có trang tham chiếu riêng, và mỗi trang tham chiếu có ví dụ về cách sử dụng.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
