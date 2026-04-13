---
title: StorageEvent
slug: Web/API/StorageEvent
page-type: web-api-interface
browser-compat: api.StorageEvent
---

{{APIRef("Web Storage API")}}

Giao diện **`StorageEvent`** được hiện thực bởi sự kiện {{domxref("Window/storage_event", "storage")}}, được gửi tới một cửa sổ khi một vùng lưu trữ mà cửa sổ đó có thể truy cập bị thay đổi trong ngữ cảnh của một tài liệu khác.

{{InheritanceDiagram}}

## Constructor

- {{domxref("StorageEvent.StorageEvent()", "StorageEvent()")}}
  - : Trả về một đối tượng `StorageEvent` mới được tạo.

## Thuộc tính thể hiện

_Ngoài các thuộc tính được liệt kê bên dưới, giao diện này kế thừa các thuộc tính của giao diện cha, {{domxref("Event")}}._

- {{domxref("StorageEvent.key", "key")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa khóa của mục lưu trữ đã bị thay đổi.
    Thuộc tính `key` là `null` khi thay đổi được gây ra bởi phương thức `clear()` của storage.
- {{domxref("StorageEvent.newValue", "newValue")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa giá trị mới của mục lưu trữ đã bị thay đổi.
    Giá trị này là `null` khi thay đổi được gọi bởi phương thức `clear()` của storage, hoặc khi mục lưu trữ đã bị xóa khỏi storage.
- {{domxref("StorageEvent.oldValue", "oldValue")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa giá trị gốc của mục lưu trữ đã bị thay đổi.
    Giá trị này là `null` khi mục lưu trữ vừa được thêm mới và do đó không có giá trị trước đó.
- {{domxref("StorageEvent.storageArea", "storageArea")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{DOMxRef("Storage")}} đại diện cho đối tượng lưu trữ bị ảnh hưởng.
- {{domxref("StorageEvent.url", "url")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi chứa URL của tài liệu mà storage của nó đã thay đổi.

## Phương thức thể hiện

_Ngoài các phương thức được liệt kê bên dưới, giao diện này kế thừa các phương thức của giao diện cha, {{domxref("Event")}}._

- {{domxref("StorageEvent.initStorageEvent", "initStorageEvent()")}} {{deprecated_inline}}
  - : Khởi tạo sự kiện theo cách tương tự với phương thức {{domxref("Event.initEvent", "initEvent()")}} cùng tên trong các giao diện DOM Events. Hãy dùng constructor thay thế.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Web Storage API", "", "", "nocode")}}
