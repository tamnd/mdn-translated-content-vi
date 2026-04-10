---
title: "Range: phương thức extractContents()"
short-title: extractContents()
slug: Web/API/Range/extractContents
page-type: web-api-instance-method
browser-compat: api.Range.extractContents
---

{{APIRef("DOM")}}

Phương thức **`extractContents()`** của giao diện {{domxref("Range")}} giống như sự kết hợp giữa {{domxref("Range.cloneContents()")}} và {{domxref("Range.deleteContents()")}}. Nó xóa các nút con của range khỏi tài liệu, sao chép chúng, rồi trả về dưới dạng một đối tượng {{domxref("DocumentFragment")}} mới. Với các nút chỉ được chọn một phần, chỉ văn bản được chọn bị xóa, nhưng tất cả các nút cha bao quanh cho đến common ancestor cũng được sao chép, dẫn đến hai bản sao của các nút này, một trong tài liệu gốc và một trong fragment đã trích xuất.

## Cú pháp

```js-nolint
extractContents()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("DocumentFragment")}}.

## Ví dụ

```js
const range = document.createRange();
range.selectNode(document.getElementsByTagName("div").item(0));
const fragment = range.extractContents();
document.body.appendChild(fragment);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
