---
title: "Selection: phương thức setPosition()"
short-title: setPosition()
slug: Web/API/Selection/setPosition
page-type: web-api-instance-method
browser-compat: api.Selection.setPosition
---

{{ApiRef("DOM")}}

Phương thức **`Selection.setPosition()`** thu gọn vùng chọn hiện tại về một điểm duy nhất. Tài liệu không bị sửa đổi. Nếu nội dung đang được focus và có thể chỉnh sửa, caret sẽ nhấp nháy tại đó.

> [!NOTE]
> Phương thức này là bí danh của phương thức {{domxref("Selection.collapse()")}}.

## Cú pháp

```js-nolint
setPosition(node)
setPosition(node, offset)
```

### Tham số

- `node`
  - : Vị trí caret sẽ nằm trong nút này. Giá trị này cũng có thể được đặt thành `null` — nếu chỉ định `null`, phương thức sẽ hoạt động như {{domxref("Selection.removeAllRanges()")}}, tức là tất cả các range sẽ bị xóa khỏi vùng chọn.
- `offset` {{optional_inline}}
  - : Độ lệch trong `node` mà vùng chọn sẽ được thu gọn tới. Nếu không chỉ định, giá trị mặc định `0` sẽ được dùng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
// Đặt caret ở đầu phần body của tài liệu HTML.
const body = document.querySelector("body");
window.getSelection().setPosition(body, 0);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection.collapse()")}}
