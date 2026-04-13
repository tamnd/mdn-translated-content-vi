---
title: Metadata
slug: Web/API/Metadata
page-type: web-api-interface
status:
  - experimental
  - non-standard
browser-compat: api.Metadata
---

{{APIRef("File and Directory Entries API")}}{{Non-standard_Header}}{{SeeCompatTable}}

Giao diện **`Metadata`** chứa thông tin về một mục trong hệ thống tệp. Siêu dữ liệu này bao gồm kích thước tệp và ngày giờ sửa đổi.

> [!NOTE]
> Giao diện này không có sẵn thông qua phạm vi toàn cục; thay vào đó, bạn lấy đối tượng `Metadata` mô tả {{domxref("FileSystemEntry")}} bằng phương thức {{domxref("FileSystemEntry.getMetadata()")}}.

## Thuộc tính phiên bản

- {{domxref("Metadata.modificationTime", "modificationTime")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{Non-standard_Inline}}
  - : Đối tượng {{jsxref("Date")}} cho biết ngày và giờ mục được sửa đổi.
- {{domxref("Metadata.size", "size")}} {{ReadOnlyInline}} {{Experimental_Inline}} {{Non-standard_Inline}}
  - : Số nguyên không dấu 64-bit cho biết kích thước của mục tính bằng byte.

## Thông số kỹ thuật

Tính năng này đã bị xóa khỏi tất cả các đặc tả và không trong quá trình được chuẩn hóa.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [File and Directory Entries API](/en-US/docs/Web/API/File_and_Directory_Entries_API)
- {{domxref("FileSystemEntry")}}
- {{domxref("FileSystemFileEntry")}} và {{domxref("FileSystemDirectoryEntry")}}
