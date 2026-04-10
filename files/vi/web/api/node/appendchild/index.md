---
title: "Node: phương thức appendChild()"
short-title: appendChild()
slug: Web/API/Node/appendChild
page-type: web-api-instance-method
browser-compat: api.Node.appendChild
---

{{APIRef("DOM")}}

Phương thức **`appendChild()`** của giao diện {{domxref("Node")}} thêm một nút vào cuối danh sách các phần tử con của một nút cha được chỉ định.

> [!NOTE]
> Nếu phần tử con được truyền vào là tham chiếu đến một nút đã tồn tại trong tài liệu, `appendChild()` sẽ di chuyển nó từ vị trí hiện tại sang vị trí mới.

Nếu phần tử con được truyền vào là một {{domxref("DocumentFragment")}}, toàn bộ nội dung của {{domxref("DocumentFragment")}} sẽ được chuyển vào danh sách con của nút cha đã chỉ định.

`appendChild()` trả về nút vừa được thêm, hoặc nếu phần tử con là một {{domxref("DocumentFragment")}}, nó sẽ trả về fragment rỗng.

> [!NOTE]
> Không giống như phương thức này, {{domxref("Element.append()")}} hỗ trợ nhiều đối số và hỗ trợ thêm chuỗi. Bạn có thể ưu tiên dùng nó nếu nút của bạn là một phần tử.

## Cú pháp

```js-nolint
appendChild(child)
```

### Tham số

- `child`
  - : Nút cần thêm vào nút cha đã cho (thường là một phần tử).

### Giá trị trả về

Một {{domxref("Node")}} là phần tử con đã được thêm (`child`), trừ khi `child` là một {{domxref("DocumentFragment")}}, trong trường hợp đó trả về {{domxref("DocumentFragment")}} rỗng.

### Ngoại lệ

- `HierarchyRequestError` {{domxref("DOMException")}}
  - : Được ném ra khi các ràng buộc của cây DOM bị vi phạm, tức là nếu một trong các trường hợp sau xảy ra:
    - Nếu cha của `child` không phải là {{domxref("Document")}}, {{domxref("DocumentFragment")}} hoặc {{domxref("Element")}}.
    - Nếu việc chèn `child` sẽ tạo ra một vòng lặp, tức là `child` là tổ tiên của nút.
    - Nếu `child` không phải là {{domxref("DocumentFragment")}}, {{domxref("DocumentType")}}, {{domxref("Element")}} hoặc {{domxref("CharacterData")}}.
    - Nếu nút hiện tại là {{domxref("Text")}} và cha của nó là {{domxref("Document")}}.
    - Nếu nút hiện tại là {{domxref("DocumentType")}} và cha của nó _không phải_ là {{domxref("Document")}}, vì _doctype_ luôn phải là nút con trực tiếp của một _document_.
    - Nếu cha của nút là {{domxref("Document")}} và `child` là một {{domxref("DocumentFragment")}} có nhiều hơn một nút con {{domxref("Element")}}, hoặc có một nút con {{domxref("Text")}}.
    - Nếu việc chèn `child` sẽ làm cho {{domxref("Document")}} có nhiều hơn một {{domxref("Element")}} làm phần tử con.

## Mô tả

Nếu phần tử con được truyền vào là tham chiếu đến một nút đã tồn tại trong tài liệu, `appendChild()` sẽ di chuyển nó từ vị trí hiện tại sang vị trí mới - không cần phải xóa nút khỏi nút cha của nó trước khi thêm vào một nút khác. Điều này có nghĩa là một nút không thể ở hai vị trí của tài liệu cùng lúc. Phương thức {{domxref("Node.cloneNode()")}} có thể được dùng để tạo bản sao của nút trước khi thêm nó vào nút cha mới. Các bản sao được tạo bằng `cloneNode` không tự động được đồng bộ hóa.

`appendChild()` trả về nút vừa được thêm, thay vì trả về nút cha. Điều này có nghĩa là bạn có thể thêm nút mới ngay khi nó được tạo mà không mất tham chiếu đến nó:

```js
const paragraph = document.body.appendChild(document.createElement("p"));
// Bạn có thể thêm các phần tử khác vào đoạn văn sau này
```

Mặt khác, bạn không thể dùng `appendChild()` theo kiểu [fluent API](https://en.wikipedia.org/wiki/Fluent_interface) (như jQuery).

```js example-bad
// Cách này không thêm ba đoạn văn:
// ba phần tử sẽ bị lồng nhau thay vì là các phần tử anh em
document.body
  .appendChild(document.createElement("p"))
  .appendChild(document.createElement("p"))
  .appendChild(document.createElement("p"));
```

## Ví dụ

### Thêm một đoạn văn vào body

```js
// Tạo một phần tử đoạn văn mới và thêm nó vào cuối phần body của tài liệu
const p = document.createElement("p");
document.body.appendChild(p);
```

### Tạo một cấu trúc DOM lồng nhau

Trong ví dụ này, chúng ta cố gắng tạo một cấu trúc DOM lồng nhau bằng ít biến tạm nhất có thể.

```js
const fragment = document.createDocumentFragment();
const li = fragment
  .appendChild(document.createElement("section"))
  .appendChild(document.createElement("ul"))
  .appendChild(document.createElement("li"));
li.textContent = "hello world";

document.body.appendChild(fragment);
```

Nó tạo ra cây DOM sau:

```html
<section>
  <ul>
    <li>hello world</li>
  </ul>
</section>
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Node.removeChild()")}}
- {{domxref("Node.replaceChild()")}}
- {{domxref("Node.insertBefore()")}}
- {{domxref("Node.hasChildNodes()")}}
- {{domxref("Element.insertAdjacentElement()")}}
- {{domxref("Element.append()")}}
