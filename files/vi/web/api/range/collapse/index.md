---
title: "Range: phương thức collapse()"
short-title: collapse()
slug: Web/API/Range/collapse
page-type: web-api-instance-method
browser-compat: api.Range.collapse
---

{{APIRef("DOM")}}

Phương thức **`collapse()`** của giao diện {{domxref("Range")}} thu gọn `Range` về một trong các điểm biên của nó.

Một `Range` đã thu gọn là rỗng, không chứa nội dung, biểu thị một điểm đơn trong cây DOM. Để xác định một `Range` đã bị thu gọn hay chưa, xem thuộc tính {{domxref("AbstractRange.collapsed")}}.

## Cú pháp

```js-nolint
collapse()
collapse(toStart)
```

### Tham số

- `toStart` {{optional_inline}}
  - : Một giá trị boolean: `true` sẽ thu gọn `Range` về đầu của nó, `false` về cuối của nó. Nếu bỏ qua, mặc định là `false`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const range = document.createRange();

const referenceNode = document.getElementsByTagName("div").item(0);
range.selectNode(referenceNode);
range.collapse(true);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
