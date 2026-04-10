---
title: "DocumentFragment: phương thức moveBefore()"
short-title: moveBefore()
slug: Web/API/DocumentFragment/moveBefore
page-type: web-api-instance-method
browser-compat: api.DocumentFragment.moveBefore
---

{{APIRef("DOM")}}

Phương thức **`moveBefore()`** của giao diện {{domxref("DocumentFragment")}} di chuyển một {{domxref("Node")}} đã cho vào bên trong `DocumentFragment` gọi phương thức như một phần tử con trực tiếp, trước một nút tham chiếu đã cho.

## Cú pháp

```js-nolint
moveBefore(movedNode, referenceNode)
```

### Tham số

- `movedNode`
  - : Một {{domxref("Node")}} đại diện cho nút cần di chuyển. Lưu ý rằng đây phải là một nút {{domxref("Element")}} hoặc {{domxref("CharacterData")}}.
- `referenceNode`
  - : Một {{domxref("Node")}} mà `movedNode` sẽ được di chuyển đến trước đó, hoặc `null`. Nếu giá trị là `null`, `movedNode` được chèn vào cuối danh sách các nút con của `DocumentFragment` gọi phương thức.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `HierarchyRequestError` {{jsxref("TypeError")}}
  - : Được ném trong bất kỳ tình huống nào sau đây:
    - `movedNode` đã chỉ định đã được thêm vào DOM và bạn đang cố di chuyển nó vào bên trong một `DocumentFragment`.
    - Bạn đang cố di chuyển `movedNode` giữa hai phân đoạn tài liệu khác nhau.
    - `movedNode` đã chỉ định không phải là một nút {{domxref("Element")}} hoặc {{domxref("CharacterData")}}.
- `NotFoundError` {{jsxref("TypeError")}}
  - : `referenceNode` đã chỉ định không phải là một nút con của `DocumentFragment` mà bạn đang gọi `moveBefore()`, nghĩa là phân đoạn mà bạn đang cố di chuyển `movedNode` vào.
- `TypeError` {{jsxref("TypeError")}}
  - : Đối số thứ hai không được cung cấp.

## Mô tả

Phương thức `moveBefore()` di chuyển một nút đã cho đến một vị trí mới trong `DocumentFragment`. Nó cung cấp chức năng tương tự như phương thức {{domxref("Node.insertBefore()")}}, ngoại trừ việc nó không xóa rồi chèn lại nút. Điều này có nghĩa là trạng thái của nút (sẽ bị đặt lại nếu di chuyển nó bằng `insertBefore()` và các cơ chế tương tự) được bảo toàn sau khi di chuyển. Điều này bao gồm:

- Trạng thái [Animation](/en-US/docs/Web/CSS/Guides/Animations) và [transition](/en-US/docs/Web/CSS/Guides/Transitions).
- Trạng thái tải của {{htmlelement("iframe")}}.
- Các trạng thái tương tác (ví dụ: {{cssxref(":focus")}} và {{cssxref(":active")}}).
- Trạng thái phần tử [Fullscreen](/en-US/docs/Web/API/Fullscreen_API).
- Trạng thái mở/đóng của [popovers](/en-US/docs/Web/API/Popover_API).
- Trạng thái modal của các phần tử {{htmlelement("dialog")}} (các hộp thoại modal sẽ không bị đóng).

Trạng thái phát của các phần tử {{htmlelement("video")}} và {{htmlelement("audio")}} không được bao gồm trong danh sách trên, vì các phần tử này giữ nguyên trạng thái khi bị xóa và chèn lại, bất kể cơ chế được sử dụng.

Khi quan sát các thay đổi của DOM bằng {{domxref("MutationObserver")}}, các nút được di chuyển bằng `moveBefore()` sẽ được ghi lại với một [nút bị xóa](/en-US/docs/Web/API/MutationRecord/removedNodes) và một [nút được thêm](/en-US/docs/Web/API/MutationRecord/addedNodes).

### Các ràng buộc của `moveBefore()`

Có một số ràng buộc cần lưu ý khi sử dụng `moveBefore()`:

- Nó chỉ hoạt động khi di chuyển một nút trong cùng một phân đoạn tài liệu.
- Nó sẽ không hoạt động nếu bạn cố di chuyển một nút đã được thêm vào DOM vào bên trong một `DocumentFragment`.

Trong những trường hợp như vậy, `moveBefore()` sẽ thất bại với ngoại lệ `HierarchyRequestError`. Nếu các ràng buộc trên là yêu cầu cho trường hợp sử dụng cụ thể của bạn, bạn nên sử dụng {{domxref("Node.insertBefore()")}} thay thế, hoặc sử dụng [`try...catch`](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) để xử lý các lỗi phát sinh từ những trường hợp như vậy.

## Ví dụ

### Sử dụng `moveBefore()` cơ bản

Trong bản minh họa này, chúng ta minh họa cách sử dụng cơ bản của `moveBefore()`.

#### HTML

HTML có ba phần tử {{htmlelement("button")}} và một phần tử {{htmlelement("article")}}. Chúng ta sẽ sử dụng các nút để kiểm soát việc chèn các thực thể `DocumentFragment` vào `<article>` và làm trống nó.

```html live-sample___movebefore-basic
<button id="insert1">Insert fragment</button>
<button id="insert2">Insert modified fragment</button>
<button id="clear">Clear</button>
<article id="wrapper"></article>
```

#### CSS

Chúng ta cung cấp một số kiểu dáng cơ bản cho giao diện và cảm giác cũng như khoảng cách của các phần tử sau này sẽ được chèn vào trang dưới dạng phần tử con của các `DocumentFragment` được tạo bởi JavaScript.

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

Trong tập lệnh của chúng ta, chúng ta định nghĩa một hàm `createFragment()`, hàm này tạo một `DocumentFragment` chứa một phần tử {{htmlelement("div")}} và hai phần tử {{htmlelement("section")}} làm phần tử con trực tiếp.

Sau đó, chúng ta gắn một trình lắng nghe sự kiện nhấp chuột vào mỗi `<button>` thông qua {{domxref("EventTarget.addEventListener", "addEventListener()")}}:

- Nút đầu tiên nối `DocumentFragment` vào phần tử `<article>` `#wrapper`, không sửa đổi.
- Nút thứ hai nối `DocumentFragment` vào phần tử `<article>` `#wrapper`, nhưng trước tiên sử dụng `moveBefore()` để di chuyển `<div>` thành phần tử con thứ hai của `DocumentFragment` thay vì thứ nhất.
- Nút thứ ba làm trống phần tử `<article>` `#wrapper` bằng cách sử dụng {{domxref("Element.innerHTML", "innerHTML")}}.

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

Ví dụ được hiển thị trông như thế này:

{{EmbedLiveSample("movebefore-basic", "100%", "300px")}}

Hãy thử nhấp vào hai nút đầu tiên vài lần và lưu ý cách cấu trúc `DocumentFragment` được sửa đổi bởi nút thứ hai.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.moveBefore()")}}
- {{domxref("Element.moveBefore()")}}
- {{domxref("Node.insertBefore()")}}
