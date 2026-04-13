---
title: "Selection: phương thức removeAllRanges()"
short-title: removeAllRanges()
slug: Web/API/Selection/removeAllRanges
page-type: web-api-instance-method
browser-compat: api.Selection.removeAllRanges
---

{{ ApiRef("DOM") }}

Phương thức **`Selection.removeAllRanges()`** xóa tất cả các range khỏi vùng chọn, để các thuộc tính {{domxref("Selection.anchorNode", "anchorNode")}} và {{domxref("Selection.focusNode","focusNode")}} trở thành `null` và không còn gì được chọn. Khi phương thức này được gọi, một sự kiện {{domxref("Document/selectionchange_event", "selectionchange")}} sẽ được phát ra trên tài liệu.

> [!NOTE]
> Phương thức này là bí danh của phương thức {{domxref("Selection.empty()")}}.

## Cú pháp

```js-nolint
removeAllRanges()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này hiển thị thông báo khi có hoặc không có gì được chọn trên trang. Nó làm vậy bằng cách lắng nghe sự kiện {{domxref("Document/selectionchange_event", "selectionchange")}} trên tài liệu. Cũng có một nút xóa mọi vùng chọn bằng cách gọi `Selection.removeAllRanges()`. Khi điều này xảy ra, vùng chọn thay đổi và thông báo được cập nhật.

```html
<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse laoreet
  urna eget sapien venenatis, eget facilisis diam mattis.
</p>
<button>Clear selection</button>
<pre id="log"></pre>
```

```js
const log = document.getElementById("log");

// Đối tượng selection là singleton liên kết với tài liệu
const selection = document.getSelection();

// Ghi lại xem có vùng chọn hay không
function newSelectionHandler() {
  if (selection.rangeCount !== 0) {
    log.textContent = "Some text is selected.";
  } else {
    log.textContent = "No selection on this document.";
  }
}

document.addEventListener("selectionchange", () => {
  newSelectionHandler();
});

newSelectionHandler();

// Nút hủy mọi range của vùng chọn
const button = document.querySelector("button");
button.addEventListener("click", () => {
  selection.removeAllRanges();
});
```

{{EmbedLiveSample("Examples", "100%", "200px")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection.empty()")}}
- {{domxref("Document/selectionchange_event", "selectionchange")}}
