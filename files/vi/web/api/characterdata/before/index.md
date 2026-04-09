---
title: "CharacterData: phương thức before()"
short-title: before()
slug: Web/API/CharacterData/before
page-type: web-api-instance-method
browser-compat: api.CharacterData.before
---

{{APIRef("DOM")}}

Phương thức **`before()`** của giao diện {{domxref("CharacterData")}}
chèn một tập các đối tượng {{domxref("Node")}} và chuỗi
vào danh sách phần tử con của nút cha của `CharacterData`, ngay trước nút `CharacterData`.

Các chuỗi được chèn dưới dạng nút {{domxref("Text")}}; chuỗi được truyền làm đối số cho hàm khởi tạo {{domxref("Text/Text", "Text()")}}.

## Cú pháp

```js-nolint
before(...nodes)
```

### Tham số

- `nodes`
  - : Một tập các đối tượng {{domxref("Node")}} hoặc chuỗi cần chèn.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{DOMxRef("DOMException")}}
  - : Được ném ra khi các nút mới không thể được chèn vào vị trí đã chỉ định trong hệ phân cấp, tức là nếu một trong các điều kiện sau xảy ra:
    - Nếu việc chèn một trong các nút được thêm vào sẽ dẫn đến vòng lặp, tức là nếu một trong số chúng là tổ tiên của nút {{domxref("CharacterData")}} này.
    - Nếu một trong các nút được thêm vào không phải là {{domxref("DocumentFragment")}}, {{domxref("DocumentType")}}, {{domxref("Element")}} hoặc {{domxref("CharacterData")}}.
    - Nếu nút {{domxref("CharacterData")}} này thực chất là một nút {{domxref("Text")}}, và nút cha của nó là một {{domxref("Document")}}.
    - Nếu nút cha của nút {{domxref("CharacterData")}} này là một {{domxref("Document")}} và một trong các nút cần chèn là một {{domxref("DocumentFragment")}} có nhiều hơn một nút con {{domxref("Element")}}, hoặc có một nút con {{domxref("Text")}}.

## Ví dụ

Phương thức `before()` cho phép bạn chèn các nút mới trước một
nút `CharacterData` mà vẫn giữ nguyên dữ liệu của nút hiện tại.

```js
const h1TextNode = document.querySelector("h1").firstChild;
h1TextNode.before("h1# ");

h1TextNode.parentElement.childNodes;
// NodeList [#text "h1# ", #text "CharacterData.before()"]

h1TextNode.data;
// "CharacterData.before()"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CharacterData.appendData()")}}
- {{domxref("CharacterData.after()")}}
- {{domxref("DocumentType.before()")}}
- {{domxref("Element.before()")}}
- {{domxref("Element.append()")}}
- {{domxref("Node.appendChild()")}}
- {{domxref("Element.insertAdjacentElement()")}}
