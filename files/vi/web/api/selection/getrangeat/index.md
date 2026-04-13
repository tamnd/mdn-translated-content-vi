---
title: "Selection: phương thức getRangeAt()"
short-title: getRangeAt()
slug: Web/API/Selection/getRangeAt
page-type: web-api-instance-method
browser-compat: api.Selection.getRangeAt
---

{{ ApiRef("DOM") }}

Phương thức **`getRangeAt()`** của giao diện {{domxref("Selection")}} trả về một đối tượng range đại diện cho một range hiện đang được chọn.

Nếu các điểm cuối của range được chọn nằm trong một {{glossary("shadow tree")}} thì JavaScript không thể nhìn thấy các nút shadow, và phương thức nên tái phạm vi range để bao gồm phần tử host chứa điểm cuối đó.
Trên thực tế, hầu hết trình duyệt vẫn chưa triển khai hành vi này, nên range trả về là không thể đoán trước.

> [!NOTE]
> Khi chọn trong các nút có thể chứa shadow root, bạn có thể dùng {{domxref("Selection.getComposedRanges()")}} (nếu được hỗ trợ) để lấy range vùng chọn bên trong shadow tree, hoặc để tái phạm vi vùng chọn về node host một cách đáng tin cậy.

## Cú pháp

```js-nolint
getRangeAt(index)
```

### Tham số

- `index`
  - : Chỉ số dựa trên 0 của range cần trả về. Một số âm hoặc một số lớn hơn hoặc bằng {{domxref("Selection.rangeCount")}} sẽ dẫn đến lỗi.

### Giá trị trả về

Đối tượng {{domxref("Range")}} đã chỉ định.

## Ví dụ

```js
let ranges = [];

const sel = window.getSelection();

for (let i = 0; i < sel.rangeCount; i++) {
  ranges[i] = sel.getRangeAt(i);
}
/* Mỗi mục trong mảng ranges bây giờ là
 * một đối tượng range đại diện cho một trong các
 * range trong vùng chọn hiện tại */
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}, giao diện mà nó thuộc về.
