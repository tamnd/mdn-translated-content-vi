---
title: SVGStringList
slug: Web/API/SVGStringList
page-type: web-api-interface
browser-compat: api.SVGStringList
---

{{APIRef("SVG")}}

Giao diện **`SVGStringList`** định nghĩa một danh sách các chuỗi.

Một đối tượng `SVGStringList` có thể được chỉ định là chỉ đọc, nghĩa là các nỗ lực sửa đổi đối tượng sẽ dẫn đến việc ném ra một ngoại lệ.

Một đối tượng `SVGStringList` có thể được đánh chỉ mục và truy cập như một mảng.

## Thuộc tính phiên bản

- {{domxref("SVGStringList.length", "length")}}
  - : Số lượng phần tử trong danh sách.
- {{domxref("SVGStringList.numberOfItems", "numberOfItems")}}
  - : Số lượng phần tử trong danh sách.

## Phương thức phiên bản

- {{domxref("SVGStringList.appendItem", "appendItem()")}}
  - : Chèn một phần tử mới vào cuối danh sách.
- {{domxref("SVGStringList.clear", "clear()")}}
  - : Xóa tất cả các phần tử hiện có khỏi danh sách, kết quả là một danh sách rỗng.
- {{domxref("SVGStringList.initialize", "initialize()")}}
  - : Xóa tất cả các phần tử hiện có khỏi danh sách và khởi tạo lại danh sách để chứa phần tử duy nhất được chỉ định bởi tham số.
- {{domxref("SVGStringList.getItem", "getItem()")}}
  - : Trả về phần tử được chỉ định từ danh sách.
- {{domxref("SVGStringList.insertItemBefore", "insertItemBefore()")}}
  - : Chèn một phần tử mới vào danh sách tại vị trí được chỉ định.
- {{domxref("SVGStringList.removeItem", "removeItem()")}}
  - : Xóa một phần tử hiện có khỏi danh sách.
- {{domxref("SVGStringList.replaceItem", "replaceItem()")}}
  - : Thay thế một phần tử hiện có trong danh sách bằng một phần tử mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
