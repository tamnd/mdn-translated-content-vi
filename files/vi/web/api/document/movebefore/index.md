---
title: "Document: phương thức moveBefore()"
short-title: moveBefore()
slug: Web/API/Document/moveBefore
page-type: web-api-instance-method
browser-compat: api.Document.moveBefore
---

{{APIRef("DOM")}}

Phương thức **`moveBefore()`** của giao diện {{domxref("Document")}} di chuyển một {{domxref("Node")}} đã cho bên trong nút DOM `Document` dưới dạng phần tử con trực tiếp, trước một nút tham chiếu đã cho.

## Cú pháp

```js-nolint
moveBefore(movedNode, referenceNode)
```

### Tham số

- `movedNode`
  - : Một {{domxref("Node")}} đại diện cho nút cần di chuyển. Lưu ý rằng đây phải là một nút {{domxref("Element")}} hoặc {{domxref("CharacterData")}}.
- `referenceNode`
  - : Một {{domxref("Node")}} mà `movedNode` sẽ được di chuyển trước, hoặc `null`. Nếu giá trị là `null`, `movedNode` được chèn vào cuối các nút con của `Document`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{jsxref("TypeError")}}
  - : Được ném ra trong bất kỳ trường hợp nào sau đây:
    - `movedNode` đã chỉ định không phải là một phần của tài liệu này.
    - `movedNode` đã chỉ định không phải là nút {{domxref("Element")}} hoặc {{domxref("CharacterData")}}.
    - Bạn đang cố di chuyển `movedNode` trước {{glossary("doctype")}} của tài liệu (được đại diện bởi một đối tượng {{domxref("DocumentType")}}).
- `NotFoundError` {{jsxref("TypeError")}}
  - : `referenceNode` đã chỉ định không phải là con của nút mà bạn đang gọi `moveBefore()`, tức là nút mà bạn đang cố di chuyển `movedNode` vào trong.
- `TypeError` {{jsxref("TypeError")}}
  - : Đối số thứ hai không được cung cấp.

## Mô tả

Phương thức `moveBefore()` di chuyển một nút đã đến đến một vị trí mới trong DOM. Nó cung cấp chức năng tương tự như phương thức {{domxref("Node.insertBefore()")}}, ngoại trừ việc nó không xóa rồi chèn lại nút. Điều này có nghĩa là trạng thái của nút (sẽ bị đặt lại nếu di chuyển nó bằng `insertBefore()` và các cơ chế tương tự) được bảo tồn sau khi di chuyển. Điều này bao gồm:

- Trạng thái [Animation](/en-US/docs/Web/CSS/Guides/Animations) và [transition](/en-US/docs/Web/CSS/Guides/Transitions).
- Trạng thái tải của {{htmlelement("iframe")}}.
- Trạng thái tương tác (ví dụ: {{cssxref(":focus")}} và {{cssxref(":active")}}).
- Trạng thái phần tử [Fullscreen](/en-US/docs/Web/API/Fullscreen_API).
- Trạng thái mở/đóng của [popovers](/en-US/docs/Web/API/Popover_API).
- Trạng thái modal của các phần tử {{htmlelement("dialog")}} (hộp thoại modal sẽ không bị đóng).

Trạng thái phát của các phần tử {{htmlelement("video")}} và {{htmlelement("audio")}} không được bao gồm trong danh sách trên, vì các phần tử này giữ nguyên trạng thái khi bị xóa và chèn lại, bất kể cơ chế được sử dụng.

Khi quan sát các thay đổi đối với DOM bằng cách sử dụng {{domxref("MutationObserver")}}, các nút được di chuyển bằng `moveBefore()` sẽ được ghi lại với một [removed node](/en-US/docs/Web/API/MutationRecord/removedNodes) và một [added node](/en-US/docs/Web/API/MutationRecord/addedNodes).

Phương thức `moveBefore()` không đặc biệt hữu ích khi được gọi trên nút `Document`. Có một số cách sử dụng không phải phần tử cho nó, ví dụ bạn có thể sử dụng `moveBefore()` để di chuyển các nút chú thích xung quanh gốc của `Document`. Tuy nhiên, bạn có nhiều khả năng tìm thấy cách sử dụng khi gọi nó trên một `DocumentFragment` hoặc `Element` riêng lẻ — xem {{domxref("DocumentFragment.moveBefore()")}} và {{domxref("Element.moveBefore()")}}.

### Ràng buộc của `moveBefore()`

Có một số ràng buộc cần lưu ý khi sử dụng `moveBefore()`:

- Nó chỉ hoạt động khi di chuyển một nút trong cùng một tài liệu.
- Nó sẽ không hoạt động nếu bạn cố di chuyển một nút không được kết nối với DOM đến một cha đã được kết nối, hoặc ngược lại.

Trong những trường hợp như vậy, `moveBefore()` sẽ thất bại với ngoại lệ `HierarchyRequestError`. Nếu các ràng buộc trên là yêu cầu cho trường hợp sử dụng cụ thể của bạn, bạn nên sử dụng {{domxref("Node.insertBefore()")}} thay thế, hoặc sử dụng [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) để xử lý các lỗi phát sinh từ những trường hợp như vậy.

## Ví dụ

### Di chuyển nút chú thích bằng `moveBefore()`

Trong bản demo này, chúng tôi trình bày cách sử dụng `document.moveBefore()` để di chuyển một nút chú thích trong DOM.

#### HTML

HTML là một mẫu tối thiểu có một chú thích bên trong {{htmlelement("body")}}.

```html live-sample___movebefore-comment
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <title>Ví dụ document.moveBefore()</title>
  </head>
  <body>
    <!-- Đây là chú thích nên ở cuối tài liệu -->
    <p>Some content</p>
  </body>
</html>
```

#### JavaScript

Trong tập lệnh của chúng tôi, chúng tôi duyệt qua tất cả {{domxref("Node.childNodes", "childNodes")}} của phần tử `<body>`. Khi chúng tôi tìm thấy một nút có giá trị {{domxref("Node.nodeType", "nodeType")}} là `8` (cho biết một nút chú thích), chúng tôi lưu trữ tham chiếu đến nó trong một biến gọi là `commentNode`. Sau đó chúng tôi gọi `document.moveBefore()`, chỉ định rằng chúng tôi muốn di chuyển nút chú thích và chỉ định đối số thứ hai là `null` để chèn chú thích vào cuối các nút con của `Document`.

```js live-sample___movebefore-comment
let commentNode;

for (node of document.querySelector("body").childNodes) {
  if (node.nodeType === 8) {
    commentNode = node;
  }
}

document.moveBefore(commentNode, null);
```

#### Kết quả

Ví dụ được hiển thị trông như sau:

{{EmbedLiveSample("movebefore-comment", "100%", "60px")}}

Nếu bạn kiểm tra ví dụ bằng công cụ dành cho nhà phát triển của trình duyệt, bạn sẽ nhận thấy rằng chú thích đã được di chuyển đến cuối tài liệu, sau thẻ đóng `</html>`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DocumentFragment.moveBefore()")}}
- {{domxref("Element.moveBefore()")}}
- {{domxref("Node.insertBefore()")}}
