---
title: SVGNumberList
slug: Web/API/SVGNumberList
page-type: web-api-interface
browser-compat: api.SVGNumberList
---

{{APIRef("SVG")}}

Giao diện **`SVGNumberList`** định nghĩa một danh sách các số.

Một đối tượng `SVGNumberList` có thể được chỉ định là chỉ đọc, nghĩa là các nỗ lực sửa đổi đối tượng sẽ dẫn đến việc ném ra một ngoại lệ.

Một đối tượng `SVGNumberList` có thể được đánh chỉ mục và truy cập như một mảng.

## Thuộc tính phiên bản

- {{domxref("SVGNumberList.length", "length")}}
  - : Số lượng phần tử trong danh sách.
- {{domxref("SVGNumberList.numberOfItems", "numberOfItems")}}
  - : Số lượng phần tử trong danh sách.

## Phương thức phiên bản

- {{domxref("SVGNumberList.appendItem", "appendItem()")}}
  - : Chèn một phần tử mới vào cuối danh sách.
- {{domxref("SVGNumberList.clear", "clear()")}}
  - : Xóa tất cả các phần tử hiện có khỏi danh sách, kết quả là một danh sách rỗng.
- {{domxref("SVGNumberList.initialize", "initialize()")}}
  - : Xóa tất cả các phần tử hiện có khỏi danh sách và khởi tạo lại danh sách để chứa phần tử duy nhất được chỉ định bởi tham số.
- {{domxref("SVGNumberList.getItem", "getItem()")}}
  - : Trả về phần tử được chỉ định từ danh sách.
- {{domxref("SVGNumberList.insertItemBefore", "insertItemBefore()")}}
  - : Chèn một phần tử mới vào danh sách tại vị trí được chỉ định.
- {{domxref("SVGNumberList.removeItem", "removeItem()")}}
  - : Xóa một phần tử hiện có khỏi danh sách.
- {{domxref("SVGNumberList.replaceItem", "replaceItem()")}}
  - : Thay thế một phần tử hiện có trong danh sách bằng một phần tử mới.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
