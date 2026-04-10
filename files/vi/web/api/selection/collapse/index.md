---
title: "Selection: phương thức collapse()"
short-title: collapse()
slug: Web/API/Selection/collapse
page-type: web-api-instance-method
browser-compat: api.Selection.collapse
---

{{ApiRef("DOM")}}

Phương thức **`Selection.collapse()`** thu gọn vùng chọn hiện tại về một điểm duy nhất. Tài liệu không bị sửa đổi. Nếu nội dung đang được focus và có thể chỉnh sửa, caret sẽ nhấp nháy tại đó.

> [!NOTE]
> Phương thức này là bí danh của phương thức {{domxref("Selection.setPosition()")}}.

## Cú pháp

```js-nolint
collapse(node)
collapse(node, offset)
```

### Tham số

- `node`
  - : Vị trí caret sẽ nằm trong nút này. Giá trị này cũng có thể được đặt thành `null` - nếu chỉ định `null`, phương thức sẽ hoạt động như {{domxref("Selection.removeAllRanges()")}}, tức là tất cả các range sẽ bị xóa khỏi vùng chọn.
- `offset` {{optional_inline}}
  - : Độ lệch trong `node` mà vùng chọn sẽ được thu gọn tới. Nếu không chỉ định, giá trị mặc định `0` sẽ được dùng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
// Đặt caret ở đầu phần body của tài liệu HTML.
const body = document.querySelector("body");
window.getSelection().collapse(body, 0);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection.setPosition()")}}
