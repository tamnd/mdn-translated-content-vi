---
title: "DocumentFragment: phương thức moveBefore()"
short-title: moveBefore()
slug: Web/API/DocumentFragment/moveBefore
page-type: web-api-instance-method
browser-compat: api.DocumentFragment.moveBefore
---

{{APIRef("DOM")}}

Phương thức **`moveBefore()`** của giao diện {{domxref("DocumentFragment")}} di chuyển một {{domxref("Node")}} đã cho bên trong `DocumentFragment` đang gọi, thành phần tử con trực tiếp đứng trước một nút tham chiếu đã cho.

## Cú pháp

```js-nolint
moveBefore(movedNode, referenceNode)
```

### Tham số

- `movedNode`
  - : Một {{domxref("Node")}} đại diện cho nút cần di chuyển. Lưu ý rằng nút này phải là {{domxref("Element")}} hoặc nút {{domxref("CharacterData")}}.
- `referenceNode`
  - : Một {{domxref("Node")}} mà `movedNode` sẽ được di chuyển trước đó, hoặc `null`. Nếu giá trị là `null`, `movedNode` sẽ được chèn vào cuối các nút con của `DocumentFragment` đang gọi.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{jsxref("TypeError")}}
  - : Được ném ra trong bất kỳ trường hợp nào sau đây:
    - `movedNode` đã được thêm vào DOM, và bạn đang cố di chuyển nó vào một `DocumentFragment`.
    - Bạn đang cố di chuyển `movedNode` giữa hai document fragment khác nhau.
    - `movedNode` được chỉ định không phải là nút {{domxref("Element")}} hoặc {{domxref("CharacterData")}}.
- `NotFoundError` {{jsxref("TypeError")}}
  - : `referenceNode` được chỉ định không phải là phần tử con của `DocumentFragment` mà bạn đang gọi `moveBefore()` trên đó, tức fragment mà bạn đang cố di chuyển `movedNode` vào bên trong.
- `TypeError` {{jsxref("TypeError")}}
  - : Đối số thứ hai không được cung cấp.

## Mô tả

Phương thức `moveBefore()` di chuyển một nút đã cho đến một vị trí mới trong `DocumentFragment`. Nó cung cấp chức năng tương tự như phương thức {{domxref("Node.insertBefore()")}}, ngoại trừ việc nó không xóa rồi chèn lại nút. Điều này có nghĩa là trạng thái của nút, vốn sẽ bị đặt lại nếu di chuyển bằng `insertBefore()` và các cơ chế tương tự, sẽ được giữ nguyên sau khi di chuyển. Điều này bao gồm:

- Trạng thái [hoạt ảnh](/en-US/docs/Web/CSS/Guides/Animations) và [chuyển tiếp](/en-US/docs/Web/CSS/Guides/Transitions).
- Trạng thái tải của {{htmlelement("iframe")}}.
- Trạng thái tương tác (ví dụ như {{cssxref(":focus")}} và {{cssxref(":active")}}).
- Trạng thái phần tử [Fullscreen](/en-US/docs/Web/API/Fullscreen_API).
- Trạng thái mở/đóng của [popover](/en-US/docs/Web/API/Popover_API).
- Trạng thái modal của các phần tử {{htmlelement("dialog")}} (hộp thoại modal sẽ không bị đóng).

Trạng thái phát của các phần tử {{htmlelement("video")}} và {{htmlelement("audio")}} không nằm trong danh sách trên, vì các phần tử này vẫn giữ trạng thái của chúng khi bị xóa rồi chèn lại, bất kể cơ chế nào được dùng.

Khi theo dõi thay đổi DOM bằng {{domxref("MutationObserver")}}, các nút được di chuyển bằng `moveBefore()` sẽ được ghi lại với [nút bị xóa](/en-US/docs/Web/API/MutationRecord/removedNodes) và [nút được thêm](/en-US/docs/Web/API/MutationRecord/addedNodes).

### Các ràng buộc của `moveBefore()`

Cần lưu ý một số ràng buộc khi dùng `moveBefore()`:

- Nó chỉ hoạt động khi di chuyển một nút trong cùng một document fragment.
- Nó sẽ không hoạt động nếu bạn cố di chuyển một nút đã được thêm vào DOM vào bên trong một `DocumentFragment`.

Trong các trường hợp đó, `moveBefore()` sẽ thất bại với ngoại lệ `HierarchyRequestError`. Nếu các ràng buộc trên là yêu cầu của trường hợp sử dụng của bạn, bạn nên dùng {{domxref("Node.insertBefore()")}} thay thế, hoặc dùng [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) để xử lý các lỗi phát sinh từ những trường hợp đó.

## Ví dụ

### Sử dụng `moveBefore()` cơ bản

Trong bản demo này, chúng ta minh họa cách sử dụng cơ bản của `moveBefore()`.

#### HTML

HTML có ba phần tử {{htmlelement("button")}} và một phần tử {{htmlelement("article")}}. Chúng ta sẽ dùng các nút để điều khiển việc chèn các đối tượng `DocumentFragment` vào `<article>` và xóa nội dung của nó.

```html live-sample___movebefore-basic
<button id="insert1">Insert fragment</button>
<button id="insert2">Insert modified fragment</button>
<button id="clear">Clear</button>
<article id="wrapper"></article>
```

#### CSS

Chúng ta cung cấp một số kiểu dáng cơ bản cho giao diện và khoảng cách của các phần tử sau này sẽ được chèn vào trang như phần tử con của các `DocumentFragment` do JavaScript tạo ra.

```css live-sample___movebefore-basic
#section1,
#section2,
#mover {
  display: inline-block;
  width: 200px;
  height: 30px;
  border: 5px solid rgb(0 0 0 / 0.25);
  margin-top: 10px;
}

#section1,
#section2 {
  background-color: hotpink;
}

#mover {
  background-color: orange;
}
```

#### JavaScript

Trong script của chúng ta, chúng ta định nghĩa một hàm `createFragment()`, hàm này tạo một `DocumentFragment` chứa một phần tử {{htmlelement("div")}} và hai phần tử {{htmlelement("section")}} làm các phần tử con trực tiếp.

Sau đó chúng ta gắn một trình nghe sự kiện click vào mỗi `<button>` thông qua {{domxref("EventTarget.addEventListener", "addEventListener()")}}:

- Nút đầu tiên thêm `DocumentFragment` vào phần tử `<article>` `#wrapper` mà không sửa đổi.
- Nút thứ hai thêm `DocumentFragment` vào phần tử `<article>` `#wrapper`, nhưng trước tiên dùng `moveBefore()` để di chuyển `<div>` thành phần tử con thứ hai của `DocumentFragment` thay vì phần tử con đầu tiên.
- Nút thứ ba xóa phần tử `<article>` `#wrapper` bằng {{domxref("Element.innerHTML", "innerHTML")}}.

```js live-sample___movebefore-basic
const wrapper = document.getElementById("wrapper");
const insertBtn1 = document.getElementById("insert1");
const insertBtn2 = document.getElementById("insert2");
const clearBtn = document.getElementById("clear");

function createFragment() {
  const fragment = new DocumentFragment();
  const divElem = document.createElement("div");
  const section1 = document.createElement("section");
  const section2 = document.createElement("section");
  divElem.id = "mover";
  section1.id = "section1";
  section2.id = "section2";
  fragment.appendChild(divElem);
  fragment.appendChild(section1);
  fragment.appendChild(section2);

  return fragment;
}

insertBtn1.addEventListener("click", () => {
  const fragment = createFragment();
  wrapper.appendChild(fragment);
});

insertBtn2.addEventListener("click", () => {
  const fragment = createFragment();
  fragment.moveBefore(
    fragment.querySelector("#mover"),
    fragment.querySelector("#section2"),
  );

  wrapper.appendChild(fragment);
});

clearBtn.addEventListener("click", () => {
  wrapper.innerHTML = "";
});
```

#### Kết quả

Ví dụ được hiển thị sẽ trông như sau:

{{EmbedLiveSample("movebefore-basic", "100%", "300px")}}

Hãy thử nhấp vào hai nút đầu tiên vài lần và chú ý cách cấu trúc `DocumentFragment` được sửa đổi bởi nút thứ hai.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.moveBefore()")}}
- {{domxref("Element.moveBefore()")}}
- {{domxref("Node.insertBefore()")}}
