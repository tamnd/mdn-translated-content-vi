---
title: "Document: phương thức importNode()"
short-title: importNode()
slug: Web/API/Document/importNode
page-type: web-api-instance-method
browser-compat: api.Document.importNode
---

{{APIRef("DOM")}}

Phương thức **`importNode()`** của giao diện {{domxref("Document")}} tạo một bản sao của một {{domxref("Node")}} hoặc {{domxref("DocumentFragment")}} từ tài liệu khác, để chèn vào tài liệu hiện tại sau đó.

Nút được nhập chưa được bao gồm trong cây tài liệu. Để bao gồm nó, bạn cần gọi một phương thức chèn như {{domxref("Node.appendChild", "appendChild()")}} hoặc {{domxref("Node.insertBefore", "insertBefore()")}} với một nút _đang_ có trong cây tài liệu.

Không giống như {{domxref("document.adoptNode()")}}, nút gốc không bị xóa khỏi tài liệu gốc của nó. Nút được nhập là một bản sao của bản gốc.

Phương thức {{domxref("Node.cloneNode()")}} cũng tạo một bản sao của một nút. Sự khác biệt là `importNode()` sao chép nút trong ngữ cảnh của tài liệu gọi, trong khi `cloneNode()` sử dụng tài liệu của nút được sao chép. Ngữ cảnh tài liệu xác định {{domxref("CustomElementRegistry")}} để xây dựng bất kỳ phần tử tùy chỉnh nào. Vì lý do này, để sao chép các nút được sử dụng trong tài liệu khác, hãy sử dụng `importNode()` trên tài liệu đích. {{domxref("HTMLTemplateElement.content")}} được sở hữu bởi một tài liệu riêng biệt, vì vậy nó cũng nên được sao chép bằng `document.importNode()` để các phần tử hậu duệ tùy chỉnh được xây dựng bằng cách sử dụng các định nghĩa trong tài liệu hiện tại. Xem các ví dụ trên trang {{domxref("Node.cloneNode()")}} để biết thêm chi tiết.

## Cú pháp

```js-nolint
importNode(externalNode)
importNode(externalNode, deep)
```

### Tham số

- `externalNode`
  - : {{domxref("Node")}} hoặc {{domxref("DocumentFragment")}} bên ngoài cần nhập vào tài liệu hiện tại.
- `deep` {{optional_inline}}
  - : Một cờ boolean, có giá trị mặc định là `false`, kiểm soát xem có bao gồm toàn bộ cây con DOM của `externalNode` trong quá trình nhập hay không.
    - Nếu `deep` được đặt thành `true`, thì `externalNode` và tất cả hậu duệ của nó được sao chép.
    - Nếu `deep` được đặt thành `false`, thì chỉ `externalNode` được nhập — nút mới không có phần tử con.

### Giá trị trả về

`importedNode` đã sao chép trong phạm vi của tài liệu nhập.

> [!NOTE]
> {{domxref("Node.parentNode")}} của `importedNode` là `null`, vì nó chưa được chèn vào cây tài liệu!

## Ví dụ

### Sử dụng importNode()

```js
const iframe = document.querySelector("iframe");
const oldNode = iframe.contentWindow.document.getElementById("myNode");
const newNode = document.importNode(oldNode, true);
document.getElementById("container").appendChild(newNode);
```

## Ghi chú

Trước khi có thể chèn vào tài liệu hiện tại, các nút từ tài liệu bên ngoài nên:

- được sao chép bằng `document.importNode()`; hoặc
- được nhận nuôi bằng {{domXref("document.adoptNode()")}}.

> [!NOTE]
> Mặc dù Firefox hiện không thực thi quy tắc này, chúng tôi khuyến khích bạn tuân theo quy tắc này để cải thiện khả năng tương thích trong tương lai.

Để biết thêm về các vấn đề {{domXref("Node.ownerDocument")}}, xem FAQ DOM của W3C.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("document.adoptNode()")}}, hoạt động rất giống với phương thức này
- {{domxref("Node.appendChild()")}}
- {{domxref("Node.insertBefore()")}}
