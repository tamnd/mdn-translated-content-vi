---
title: "Node: phương thức insertBefore()"
short-title: insertBefore()
slug: Web/API/Node/insertBefore
page-type: web-api-instance-method
browser-compat: api.Node.insertBefore
---

{{APIRef("DOM")}}

Phương thức **`insertBefore()`** của giao diện {{domxref("Node")}} chèn một nút đứng trước một _nút tham chiếu_ như một phần tử con của một _nút cha_ đã chỉ định.

Nếu nút đã cho đã tồn tại trong tài liệu, `insertBefore()` sẽ di chuyển nó từ vị trí hiện tại sang vị trí mới. (Tức là nó sẽ tự động bị xóa khỏi nút cha hiện có trước khi được thêm vào nút cha mới đã chỉ định.)

Điều này có nghĩa là một nút không thể ở hai vị trí của tài liệu cùng lúc.

> [!NOTE]
> Có thể dùng {{domxref("Node.cloneNode()")}} để tạo một bản sao của nút trước khi thêm nó vào nút cha mới. Lưu ý rằng các bản sao được tạo bằng `cloneNode()` sẽ không tự động được đồng bộ hóa.

Nếu phần tử con được cho là một {{domxref("DocumentFragment")}}, toàn bộ nội dung của `DocumentFragment` sẽ được chuyển vào danh sách phần tử con của nút cha đã chỉ định.

## Cú pháp

```js-nolint
insertBefore(newNode, referenceNode)
```

### Tham số

- `newNode`
  - : Nút cần chèn.
- `referenceNode`
  - : Nút mà `newNode` sẽ được chèn trước. Nếu là `null`, thì `newNode` sẽ được chèn vào cuối danh sách nút con của nút.
    > [!NOTE]
    > `referenceNode` **không phải** là một tham số tùy chọn.
    > Bạn phải truyền rõ ràng một {{domxref("Node")}} hoặc `null`.
    > Việc không cung cấp nó hoặc truyền giá trị không hợp lệ có thể [hoạt động](https://crbug.com/419780) [khác nhau](https://bugzil.la/119489) giữa các phiên bản trình duyệt khác nhau.

### Giá trị trả về

Trả về phần tử con đã được thêm (trừ khi `newNode` là một {{domxref("DocumentFragment")}}, trong trường hợp đó trả về {{domxref("DocumentFragment")}} rỗng).

### Ngoại lệ

Kiểm tra tính hợp lệ trước khi chèn.

## Ví dụ

### Ví dụ 1

```html
<div id="parentElement">
  <span id="childElement">foo bar</span>
</div>
```

```js
// Tạo nút mới để chèn
const newNode = document.createElement("span");

// Lấy tham chiếu đến nút cha
const parentDiv = document.getElementById("childElement").parentNode;

// Bắt đầu trường hợp kiểm thử [ 1 ]: childElement hiện có (hoạt động đúng)
let sp2 = document.getElementById("childElement");
parentDiv.insertBefore(newNode, sp2);
// Kết thúc trường hợp kiểm thử [ 1 ]

// Bắt đầu trường hợp kiểm thử [ 2 ]: childElement có Type undefined
sp2 = undefined; // Nút không tồn tại có id "childElement"
parentDiv.insertBefore(newNode, sp2); // Ép kiểu động ngầm định sang kiểu Node
// Kết thúc trường hợp kiểm thử [ 2 ]

// Bắt đầu trường hợp kiểm thử [ 3 ]: childElement có Type "undefined" (chuỗi)
sp2 = "undefined"; // Nút không tồn tại có id "childElement"
parentDiv.insertBefore(newNode, sp2); // Tạo ra "Type Error: Invalid Argument"
// Kết thúc trường hợp kiểm thử [ 3 ]
```

### Ví dụ 2

```html
<div id="parentElement">
  <span id="childElement">foo bar</span>
</div>
```

```js
// Tạo một phần tử <span> mới, thuần túy
const sp1 = document.createElement("span");

// Lấy phần tử tham chiếu
const sp2 = document.getElementById("childElement");
// Lấy phần tử cha
const parentDiv = sp2.parentNode;

// Chèn phần tử mới trước sp2
parentDiv.insertBefore(sp1, sp2);
```

> [!NOTE]
> Không có phương thức `insertAfter()`.
> Có thể mô phỏng nó bằng cách kết hợp phương thức `insertBefore`
> với {{domxref("Node.nextSibling")}}.
>
> Trong ví dụ trước, `sp1` có thể được chèn sau `sp2` bằng:
>
> ```js
> parentDiv.insertBefore(sp1, sp2.nextSibling);
> ```
>
> Nếu `sp2` không có nút anh em tiếp theo, thì nó phải là nút con cuối cùng -
> `sp2.nextSibling` trả về `null`, và `sp1` được chèn
> vào cuối danh sách nút con (ngay sau `sp2`).

### Ví dụ 3

Chèn một phần tử trước phần tử con đầu tiên, dùng thuộc tính
{{domxref("Node/firstChild", "firstChild")}}.

```js
// Lấy phần tử cha
const parentElement = document.getElementById("parentElement");
// Lấy phần tử con đầu tiên của phần tử cha
const theFirstChild = parentElement.firstChild;

// Tạo phần tử mới
const newElement = document.createElement("div");

// Chèn phần tử mới trước phần tử con đầu tiên
parentElement.insertBefore(newElement, theFirstChild);
```

Khi phần tử không có phần tử con đầu tiên, thì `firstChild` là `null`. Phần tử vẫn được gắn vào nút cha, sau phần tử con cuối cùng.

Vì phần tử cha không có phần tử con đầu tiên, nên nó cũng không có phần tử con cuối cùng. Do đó, phần tử mới được chèn là phần tử _duy nhất_.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Node.removeChild()")}}
- {{domxref("Node.replaceChild()")}}
- {{domxref("Node.appendChild()")}}
- {{domxref("Node.hasChildNodes()")}}
- {{domxref("Element.insertAdjacentElement()")}}
- {{domxref("Element.prepend()")}}
- {{domxref("Element.before()")}}
- {{domxref("Element.after()")}}
