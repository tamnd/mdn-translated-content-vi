---
title: "Document: phương thức hasFocus()"
short-title: hasFocus()
slug: Web/API/Document/hasFocus
page-type: web-api-instance-method
browser-compat: api.Document.hasFocus
---

{{APIRef("DOM")}}

Phương thức **`hasFocus()`** của giao diện {{domxref("Document")}} trả về một giá trị boolean cho biết liệu tài liệu hoặc bất kỳ phần tử nào bên trong tài liệu có tiêu điểm hay không.
Phương thức này có thể được sử dụng để xác định xem phần tử đang hoạt động trong tài liệu có tiêu điểm hay không.

> [!NOTE]
> Khi xem một tài liệu, một phần tử có tiêu điểm luôn là [phần tử đang hoạt động](/en-US/docs/Web/API/Document/activeElement) trong tài liệu, nhưng một phần tử đang hoạt động không nhất thiết có tiêu điểm.
> Ví dụ: một phần tử đang hoạt động trong cửa sổ popup không phải là cửa sổ nền trước sẽ không có tiêu điểm.

## Cú pháp

```js-nolint
hasFocus()
```

### Tham số

Không có.

### Giá trị trả về

`false` nếu phần tử đang hoạt động trong tài liệu không có tiêu điểm;
`true` nếu phần tử đang hoạt động trong tài liệu có tiêu điểm.

## Ví dụ

### Kiểm tra xem tài liệu có tiêu điểm không

Ví dụ sau kiểm tra xem tài liệu có tiêu điểm hay không.
Một hàm gọi là `checkPageFocus()` cập nhật một phần tử đoạn văn tùy thuộc vào kết quả của `document.hasFocus()`.
Mở cửa sổ mới sẽ khiến tài liệu mất tiêu điểm và chuyển lại cửa sổ ban đầu sẽ khiến tài liệu lấy lại tiêu điểm.

```html live-sample___has-focus
<p id="log">Kết quả kiểm tra tiêu điểm được hiển thị ở đây.</p>
<button id="newWindow">Mở cửa sổ mới</button>
```

```css hidden live-sample___has-focus
body {
  padding: 1rem;
  background: gray;
  text-align: center;
  font: 1.5rem sans-serif;
}
```

```js live-sample___has-focus
const body = document.querySelector("body");
const log = document.getElementById("log");

function checkDocumentFocus() {
  if (document.hasFocus()) {
    log.textContent = "Tài liệu này có tiêu điểm.";
    body.style.background = "white";
  } else {
    log.textContent = "Tài liệu này không có tiêu điểm.";
    body.style.background = "gray";
  }
}

function openWindow() {
  window.open(
    "https://developer.mozilla.org/",
    "MDN",
    "width=640,height=320,left=150,top=150",
  );
}

document.getElementById("newWindow").addEventListener("click", openWindow);
setInterval(checkDocumentFocus, 300);
```

{{EmbedLiveSample('has-focus', , , , , , , 'allow-popups')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document.activeElement")}}
- [Sử dụng Page Visibility API](/en-US/docs/Web/API/Page_Visibility_API)
