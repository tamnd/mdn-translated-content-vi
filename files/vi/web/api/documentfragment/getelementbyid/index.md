---
title: "DocumentFragment: phương thức getElementById()"
short-title: getElementById()
slug: Web/API/DocumentFragment/getElementById
page-type: web-api-instance-method
browser-compat: api.DocumentFragment.getElementById
---

{{ ApiRef("DOM") }}

Phương thức **`getElementById()`** của {{domxref("DocumentFragment")}} trả về một đối tượng {{domxref("Element")}} đại diện cho phần tử có thuộc tính {{domxref("Element.id", "id")}} khớp với chuỗi được chỉ định. Vì các ID của phần tử phải là duy nhất nếu được chỉ định, đây là một cách hữu ích để truy cập nhanh vào một phần tử cụ thể.

Nếu bạn cần truy cập vào một phần tử không có ID, bạn có thể dùng {{domxref("Document.querySelector", "querySelector()")}} để tìm phần tử bằng bất kỳ {{Glossary("CSS selector", "bộ chọn")}} nào.

> [!NOTE]
> ID nên là duy nhất bên trong một document fragment. Nếu có hai hoặc nhiều phần tử trong một document fragment có cùng ID, phương thức này sẽ trả về phần tử đầu tiên tìm thấy.

## Cú pháp

```js-nolint
getElementById(id)
```

> [!NOTE]
> Phần viết hoa `"Id"` trong tên phương thức _phải_ chính xác để mã hoạt động; `getElementByID()` _không_ hợp lệ và sẽ không hoạt động, dù nó có thể trông tự nhiên hơn.

### Tham số

- `id`
  - : ID của phần tử cần tìm. ID là một chuỗi phân biệt chữ hoa chữ thường và là duy nhất trong document fragment: chỉ một phần tử nên có một ID bất kỳ.

### Giá trị trả về

Một đối tượng {{domxref("Element")}} mô tả phần tử DOM khớp với ID đã chỉ định, hoặc `null` nếu không tìm thấy phần tử phù hợp nào trong document fragment.

## Ví dụ

### Mở rộng một danh sách phần tử

Trong ví dụ này, tài liệu chứa một danh sách với một mục duy nhất là `Cherry`. Chúng ta cũng tạo một document fragment chứa bốn mục nữa là `Apple`, `Orange`, `Banana`, và `Melon`.

Sau đó chúng ta ghi lại kết quả của việc dùng `getElementById()` để tìm `Apple` và `Cherry` trong tài liệu và trong fragment. Tại thời điểm này, `Cherry` chỉ xuất hiện trong tài liệu còn `Apple` chỉ xuất hiện trong fragment.

Nếu bạn nhấp vào "Add fragment to document", chúng ta sẽ thêm fragment vào danh sách bên trong tài liệu, rồi ghi lại kết quả tìm cả `Apple` và `Cherry` trong tài liệu và trong fragment. Lần này, cả `Apple` và `Cherry` đều xuất hiện trong tài liệu, và không phần tử nào còn xuất hiện trong fragment.

Điều này là do khi thêm một fragment vào tài liệu, các nút của fragment sẽ được di chuyển vào DOM, để lại một `DocumentFragment` rỗng.

#### HTML

```html
<button id="add">Add fragment to document</button>
<button id="reset">Reset example</button> <br />
List content:
<ul>
  <li id="Cherry">Cherry</li>
</ul>
Fragment content:
<ul id="fragment"></ul>
Current status:
<pre id="log"></pre>
```

```css hidden
button {
  margin-bottom: 10px;
}
```

#### JavaScript

```js
// Tạo document fragment với nội dung ban đầu của nó
const fragment = new DocumentFragment();
["Apple", "Orange", "Banana", "Melon"].forEach((fruit) => {
  const li = document.createElement("li");
  li.textContent = fruit;
  li.id = fruit;
  fragment.append(li);
});

// Khi nút được nhấp, thêm fragment vào danh sách
document.getElementById("add").addEventListener("click", () => {
  document.querySelector("ul").append(fragment);
  displayStatus();
});

// Ghi lại kết quả của cả hai lần getElementById()
function displayStatus() {
  const log = document.getElementById("log");
  log.textContent = "";
  ["Apple", "Cherry"].forEach((id) => {
    log.textContent += `document.getElementById("${id}") ${
      document.getElementById(id) ? "Yes" : "No"
    }\n`;
    log.textContent += `fragment.getElementById("${id}") ${
      fragment.getElementById(id) ? "Yes" : "No"
    }\n`;
  });

  // Xóa khung xem fragment và điền lại nội dung hiện tại
  const fragmentViewer = document.getElementById("fragment");
  while (fragmentViewer.hasChildNodes()) {
    fragmentViewer.removeChild(fragmentViewer.lastChild);
  }
  for (const entry of fragment.children) {
    fragmentViewer.appendChild(entry.cloneNode(true));
  }
}

// Ghi lại trạng thái ban đầu
displayStatus();

// Gắn nút reset
document.getElementById("reset").addEventListener("click", () => {
  document.location.reload();
});
```

#### Kết quả

{{EmbedLiveSample('Examples', '100%', '410px')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.getElementById()")}}
