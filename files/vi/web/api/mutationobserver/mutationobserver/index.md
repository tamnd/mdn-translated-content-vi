---
title: "MutationObserver: hàm khởi tạo MutationObserver()"
short-title: MutationObserver()
slug: Web/API/MutationObserver/MutationObserver
page-type: web-api-constructor
browser-compat: api.MutationObserver.MutationObserver
---

{{APIRef("DOM WHATWG")}}

Constructor DOM **`MutationObserver()`** - một phần của giao diện {{domxref("MutationObserver")}} - tạo và trả về một observer mới, sẽ gọi một callback được chỉ định khi có sự kiện DOM xảy ra.

Việc quan sát DOM không bắt đầu ngay lập tức; trước tiên phải gọi phương thức {{domxref("MutationObserver.observe", "observe()")}} để xác định phần nào của DOM sẽ được theo dõi và loại thay đổi nào sẽ được quan sát.

## Cú pháp

```js-nolint
new MutationObserver(callback)
```

### Tham số

- `callback`
  - : Một hàm sẽ được gọi cho mỗi thay đổi DOM thỏa mãn điều kiện, dựa trên nút hoặc cây con được quan sát và các tùy chọn.

    Hàm `callback` nhận hai tham số đầu vào:
    1. Một mảng các đối tượng {{domxref("MutationRecord")}}, mô tả từng thay đổi đã xảy ra.
    2. {{domxref("MutationObserver")}} đã gọi `callback`. Điều này thường được dùng để ngắt kết nối observer bằng {{domxref("MutationObserver.disconnect()")}}.

    Xem phần [ví dụ](#examples) bên dưới để biết thêm chi tiết.

### Giá trị trả về

Một đối tượng {{domxref("MutationObserver")}} mới, được cấu hình để gọi `callback` đã chỉ định khi các biến đổi DOM xảy ra.

## Ví dụ

### Quan sát các phần tử con

Ví dụ này có các nút để thêm một phần tử {{htmlelement("li")}} vào danh sách, và để xóa phần tử `<li>` đầu tiên khỏi danh sách.

Chúng ta dùng `MutationObserver` để được thông báo về các thay đổi của danh sách. Trong callback, chúng ta ghi lại các lần thêm và xóa, và ngay khi danh sách rỗng, chúng ta ngắt kết nối observer.

Nút "Reset example" sẽ đặt lại ví dụ về trạng thái ban đầu.

#### HTML

```html
<button id="add">Add child</button>
<button id="remove">Remove child</button>
<button id="reset">Reset example</button>

<ul id="container"></ul>

<pre id="log"></pre>
```

#### CSS

```css
#container,
#log {
  height: 150px;
  overflow: scroll;
}

#container li {
  background-color: paleturquoise;
  margin: 0.5rem;
}
```

#### JavaScript

```js
const add = document.querySelector("#add");
const remove = document.querySelector("#remove");
const reset = document.querySelector("#reset");
const container = document.querySelector("#container");
const log = document.querySelector("#log");

let namePrefix = 0;

add.addEventListener("click", () => {
  const newItem = document.createElement("li");
  newItem.textContent = `item ${namePrefix}`;
  container.appendChild(newItem);
  namePrefix++;
});

remove.addEventListener("click", () => {
  const itemToRemove = document.querySelector("li");
  if (itemToRemove) {
    itemToRemove.parentNode.removeChild(itemToRemove);
  }
});

reset.addEventListener("click", () => {
  document.location.reload();
});

function logChanges(records, observer) {
  for (const record of records) {
    for (const addedNode of record.addedNodes) {
      log.textContent = `Đã thêm: ${addedNode.textContent}\n${log.textContent}`;
    }
    for (const removedNode of record.removedNodes) {
      log.textContent = `Đã xóa: ${removedNode.textContent}\n${log.textContent}`;
    }
    if (record.target.childNodes.length === 0) {
      log.textContent = `Đã ngắt kết nối\n${log.textContent}`;
      observer.disconnect();
    }
    console.log(record.target.childNodes.length);
  }
}

const observerOptions = {
  childList: true,
  subtree: true,
};

const observer = new MutationObserver(logChanges);
observer.observe(container, observerOptions);
```

#### Kết quả

Thử nhấp vào "Add child" để thêm các mục danh sách, và "Remove child" để xóa chúng. Callback của observer sẽ ghi lại các lần thêm và xóa. Ngay khi danh sách rỗng, observer sẽ ghi một thông báo "Disconnected" và ngắt kết nối observer.

Nút "Reset example" sẽ tải lại ví dụ để bạn có thể thử lại.

{{EmbedLiveSample("Observing child elements", 0, 400)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
