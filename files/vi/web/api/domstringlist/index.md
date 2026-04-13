---
title: DOMStringList
slug: Web/API/DOMStringList
page-type: web-api-interface
browser-compat: api.DOMStringList
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Giao diện **`DOMStringList`** là một kiểu cũ được một số API trả về và đại diện cho một danh sách chuỗi (`DOMString`) không thể sửa đổi.

Giao diện này là một [nỗ lực tạo ra một danh sách không thể sửa đổi](https://stackoverflow.com/questions/74630989/why-use-domstringlist-rather-than-an-array/74641156#74641156) và chỉ còn được hỗ trợ để không làm hỏng các đoạn mã đã sử dụng nó. Các API hiện đại biểu diễn cấu trúc danh sách bằng những kiểu dựa trên [mảng JavaScript](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array), nhờ đó cung cấp nhiều phương thức của mảng, đồng thời áp đặt thêm ngữ nghĩa khi sử dụng chúng, chẳng hạn như làm cho các mục của chúng chỉ đọc.

Những lý do lịch sử này không có nghĩa là bạn nên tránh dùng `DOMStringList`. Bạn không tự tạo các đối tượng `DOMStringList`, mà nhận chúng từ các API như `Location.ancestorOrigins`, và các API này không bị phản đối sử dụng. Tuy nhiên, hãy cẩn thận với sự khác biệt về ngữ nghĩa so với một mảng thực sự.

Giao diện này được dùng trong [IndexedDB](/en-US/docs/Web/API/IndexedDB_API) và trong API {{domxref("Location")}}:

- {{domxref("IDBDatabase.objectStoreNames")}}
- {{domxref("IDBObjectStore.indexNames")}}
- {{domxref("Location.ancestorOrigins")}}

## Thuộc tính thể hiện

- {{domxref("DOMStringList.length")}} {{ReadOnlyInline}}
  - : Trả về kích thước của danh sách.

## Phương thức thể hiện

- {{domxref("DOMStringList.item()")}}
  - : Trả về một chuỗi từ danh sách theo chỉ số đã cho.
- {{domxref("DOMStringList.contains()")}}
  - : Trả về một giá trị boolean cho biết chuỗi đã cho có nằm trong danh sách hay không.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
