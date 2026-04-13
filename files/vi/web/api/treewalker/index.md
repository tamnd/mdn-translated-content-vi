---
title: TreeWalker
slug: Web/API/TreeWalker
page-type: web-api-interface
browser-compat: api.TreeWalker
---

{{ APIRef("DOM") }}

Đối tượng **`TreeWalker`** đại diện cho các nút của một cây con tài liệu và vị trí hiện tại bên trong chúng.

Bạn có thể tạo một `TreeWalker` bằng phương thức {{domxref("Document.createTreeWalker()")}}.

## Thuộc tính thể hiện

_Giao diện này không kế thừa thuộc tính nào._

- {{domxref("TreeWalker.root")}} {{ReadOnlyInline}}
  - : Trả về {{domxref("Node")}} gốc như đã chỉ định khi `TreeWalker` được tạo.
- {{domxref("TreeWalker.whatToShow")}} {{ReadOnlyInline}}
  - : Trả về một `unsigned long` là bitmask được tạo từ các hằng số mô tả những kiểu {{domxref("Node")}} cần hiển thị. Các nút không khớp sẽ bị bỏ qua, nhưng nút con của chúng vẫn có thể được bao gồm nếu phù hợp.
- {{domxref("TreeWalker.filter")}} {{ReadOnlyInline}}
  - : Trả về `NodeFilter` được liên kết với `TreeWalker` này và được dùng để chọn các nút phù hợp.
- {{domxref("TreeWalker.currentNode")}}
  - : Là {{domxref("Node")}} mà `TreeWalker` hiện đang trỏ tới.

## Phương thức thể hiện

_Giao diện này không kế thừa phương thức nào._

> [!NOTE]
> Trong ngữ cảnh của `TreeWalker`, một nút được xem là _có thể thấy_ nếu nó tồn tại trong chế độ xem logic được xác định bởi các đối số `whatToShow` và `filter`. Việc nút có hiển thị trên màn hình hay không là không liên quan.

- {{domxref("TreeWalker.parentNode()")}}
  - : Di chuyển {{domxref("Node")}} hiện tại đến nút cha tổ tiên _có thể thấy_ đầu tiên theo thứ tự tài liệu, và trả về nút đó. Đồng thời nút hiện tại cũng được cập nhật sang nút này. Nếu không có nút như vậy, hoặc nếu nó nằm trước _nút gốc_ được xác định khi tạo đối tượng, phương thức trả về `null` và nút hiện tại không thay đổi.
- {{domxref("TreeWalker.firstChild()")}}
  - : Di chuyển {{domxref("Node")}} hiện tại đến nút con _có thể thấy_ đầu tiên của nút hiện tại, và trả về nút con tìm được. Đồng thời nút hiện tại cũng được cập nhật sang nút này. Nếu không có nút con như vậy, phương thức trả về `null` và nút hiện tại không thay đổi. Lưu ý rằng nút do `firstChild()` trả về phụ thuộc vào giá trị `whatToShow` được đặt khi khởi tạo đối tượng `TreeWalker`. Giả sử cây HTML sau và bạn đặt `whatToShow` thành `NodeFilter.SHOW_ALL`, thì lời gọi `firstChild()` sẽ trả về một nút `Text` chứ không phải đối tượng `HTMLDivElement`.

    ```html
    <!doctype html>
    <html lang="en">
      <head>
        <title>Demo</title>
      </head>
      <body>
        <div id="container"></div>
      </body>
    </html>
    ```

    ```js
    let walker = document.createTreeWalker(document.body, NodeFilter.SHOW_ALL);
    let node = walker.firstChild(); // nodeName: "#text"
    ```

    Nhưng nếu chúng ta làm như sau:

    ```js
    let walker = document.createTreeWalker(
      document.body,
      NodeFilter.SHOW_ELEMENT,
    );
    let node = walker.firstChild(); // nodeName: "DIV"
    ```

    Điều tương tự cũng áp dụng cho `nextSibling()`, `previousSibling()`, `firstChild()` và `lastChild()`

- {{domxref("TreeWalker.lastChild()")}}
  - : Di chuyển {{domxref("Node")}} hiện tại đến nút con _có thể thấy_ cuối cùng của nút hiện tại, và trả về nút con tìm được. Đồng thời nút hiện tại cũng được cập nhật sang nút này. Nếu không có nút con như vậy, phương thức trả về `null` và nút hiện tại không thay đổi.
- {{domxref("TreeWalker.previousSibling()")}}
  - : Di chuyển {{domxref("Node")}} hiện tại đến nút anh em trước đó của nó, nếu có, và trả về nút anh em tìm được. Nếu không có nút như vậy, trả về `null` và nút hiện tại không thay đổi.
- {{domxref("TreeWalker.nextSibling()")}}
  - : Di chuyển {{domxref("Node")}} hiện tại đến nút anh em tiếp theo của nó, nếu có, và trả về nút anh em tìm được. Nếu không có nút như vậy, phương thức trả về `null` và nút hiện tại không thay đổi.
- {{domxref("TreeWalker.previousNode()")}}
  - : Di chuyển {{domxref("Node")}} hiện tại đến nút _có thể thấy_ trước đó theo thứ tự tài liệu, và trả về nút tìm được. Đồng thời nút hiện tại cũng được cập nhật sang nút này. Nếu không có nút như vậy, hoặc nếu nó nằm trước _nút gốc_ được xác định khi tạo đối tượng, phương thức trả về `null` và nút hiện tại không thay đổi.
- {{domxref("TreeWalker.nextNode()")}}
  - : Di chuyển {{domxref("Node")}} hiện tại đến nút _có thể thấy_ tiếp theo theo thứ tự tài liệu, và trả về nút tìm được. Đồng thời nút hiện tại cũng được cập nhật sang nút này. Nếu không có nút như vậy, phương thức trả về `null` và nút hiện tại không thay đổi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phương thức tạo: {{domxref("Document.createTreeWalker()")}}.
- Giao diện liên quan: {{domxref("NodeIterator")}}.
