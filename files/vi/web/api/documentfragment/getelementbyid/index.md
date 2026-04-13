---
title: "DocumentFragment: phương thức getElementById()"
short-title: getElementById()
slug: Web/API/DocumentFragment/getElementById
page-type: web-api-instance-method
browser-compat: api.DocumentFragment.getElementById
---

{{ ApiRef("DOM") }}

Phương thức **`getElementById()`** của {{domxref("DocumentFragment")}} trả về một đối tượng {{domxref("Element")}} đại diện cho phần tử có thuộc tính {{domxref("Element.id", "id")}} khớp với chuỗi đã chỉ định. Vì ID của phần tử được yêu cầu là duy nhất nếu được chỉ định, chúng là một cách hữu ích để truy cập nhanh vào một phần tử cụ thể.

Nếu bạn cần truy cập vào một phần tử không có ID, bạn có thể sử dụng {{domxref("Document.querySelector", "querySelector()")}} để tìm phần tử bằng bất kỳ {{Glossary("CSS selector", "bộ chọn CSS")}} nào.

> [!NOTE]
> ID nên là duy nhất trong một phân đoạn tài liệu. Nếu hai hoặc nhiều phần tử trong một phân đoạn tài liệu có cùng ID, phương thức này trả về phần tử đầu tiên được tìm thấy.

## Cú pháp

```js-nolint
getElementById(id)
```

> [!NOTE]
> Cách viết hoa của `"Id"` trong tên của phương thức này _phải_ chính xác để mã hoạt động; `getElementByID()` _không_ hợp lệ và sẽ không hoạt động, dù có vẻ tự nhiên.

### Tham số

- `id`
  - : ID của phần tử cần xác định vị trí. ID là một chuỗi phân biệt chữ hoa thường và là duy nhất trong phân đoạn tài liệu: chỉ một phần tử nên có bất kỳ ID nào.

### Giá trị trả về

Một đối tượng {{domxref("Element")}} mô tả đối tượng phần tử DOM khớp với ID đã chỉ định, hoặc `null` nếu không tìm thấy phần tử khớp nào trong phân đoạn tài liệu.

## Ví dụ

### Mở rộng danh sách các phần tử

Trong ví dụ này, tài liệu chứa một danh sách với một mục `Cherry`. Chúng ta cũng tạo một phân đoạn tài liệu chứa bốn mục khác, `Apple`, `Orange`, `Banana`, và `Melon`.

Sau đó, chúng ta ghi kết quả của việc sử dụng `getElementById()` để tìm `Apple` và `Cherry` trong tài liệu và trong phân đoạn. Tại thời điểm này, `Cherry` chỉ xuất hiện trong tài liệu trong khi `Apple` chỉ xuất hiện trong phân đoạn.

Nếu bạn nhấp "Add fragment to document", chúng ta nối phân đoạn vào danh sách trong tài liệu, và một lần nữa ghi kết quả của việc tìm kiếm cả `Apple` và `Cherry` trong tài liệu và trong phân đoạn. Lần này, cả `Apple` và `Cherry` đều xuất hiện trong tài liệu, và không xuất hiện trong phân đoạn.

Điều này là do việc nối một phân đoạn vào tài liệu sẽ di chuyển các nút của phân đoạn vào DOM, để lại một `DocumentFragment` rỗng.

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
// Create the document fragment with its initial content
const fragment = new DocumentFragment();
["Apple", "Orange", "Banana", "Melon"].forEach((fruit) => {
  const li = document.createElement("li");
  li.textContent = fruit;
  li.id = fruit;
  fragment.append(li);
});

// When the button is clicked, add the fragment to the list
document.getElementById("add").addEventListener("click", () => {
  document.querySelector("ul").append(fragment);
  displayStatus();
});

// Log the results of both getElementById()
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

  // Empty the fragment viewer and fill it with the current content
  const fragmentViewer = document.getElementById("fragment");
  while (fragmentViewer.hasChildNodes()) {
    fragmentViewer.removeChild(fragmentViewer.lastChild);
  }
  for (const entry of fragment.children) {
    fragmentViewer.appendChild(entry.cloneNode(true));
  }
}

// Log the initial state
displayStatus();

// Hook the reset button
document.getElementById("reset").addEventListener("click", () => {
  document.location.reload();
});
```

#### Kết quả

{{EmbedLiveSample('Examples', '100%', '410px')}}

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.getElementById()")}}
