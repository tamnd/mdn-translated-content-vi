---
title: "Range: phương thức cloneContents()"
short-title: cloneContents()
slug: Web/API/Range/cloneContents
page-type: web-api-instance-method
browser-compat: api.Range.cloneContents
---

{{APIRef("DOM")}}

Phương thức **`cloneContents()`** của giao diện {{domxref("Range")}} sao chép các nút con {{domxref("Node")}} đã chọn của `commonAncestorContainer` của range và đặt chúng vào một đối tượng {{domxref("DocumentFragment")}} mới.

Các nút được sao chép bằng cùng thuật toán với {{domxref("Node.cloneNode()")}}, nghĩa là các trình nghe sự kiện gắn bằng script sẽ không được sao chép. Thuộc tính `id` của HTML vẫn được sao chép, điều này có thể dẫn đến tài liệu không hợp lệ.

Các nút con đầu tiên và cuối cùng được chọn của `commonAncestorContainer` có thể chỉ được chọn một phần. Trong trường hợp này, chính nút con đó được sao chép, nhưng nội dung của nó chỉ là phần được chọn, bằng cách đệ quy sao chép range giữa biên bắt đầu/kết thúc của range gốc và biên kết thúc/bắt đầu của nút con đó.

## Cú pháp

```js-nolint
cloneContents()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("DocumentFragment")}}.

## Ví dụ

```js
range = document.createRange();
range.selectNode(document.getElementsByTagName("div").item(0));
documentFragment = range.cloneContents();
document.body.appendChild(documentFragment);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Chỉ mục các giao diện DOM](/en-US/docs/Web/API/Document_Object_Model)
