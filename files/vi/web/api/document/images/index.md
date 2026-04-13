---
title: "Document: thuộc tính images"
short-title: images
slug: Web/API/Document/images
page-type: web-api-instance-property
browser-compat: api.Document.images
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`images`** của giao diện {{domxref("Document")}} trả về một [bộ sưu tập](/en-US/docs/Web/API/HTMLCollection) gồm các [hình ảnh](/en-US/docs/Web/API/HTMLImageElement) trong tài liệu HTML hiện tại.

## Giá trị

Một {{domxref("HTMLCollection")}} cung cấp danh sách trực tiếp của tất cả hình ảnh chứa trong tài liệu hiện tại.
Mỗi mục trong bộ sưu tập là một {{domxref("HTMLImageElement")}} đại diện cho một phần tử hình ảnh duy nhất.

## Ghi chú sử dụng

Bạn có thể sử dụng ký hiệu mảng JavaScript hoặc phương thức {{domxref("HTMLCollection.item", "item()")}} trên bộ sưu tập trả về để truy cập các mục trong bộ sưu tập.
Hai cách sau tương đương:

```js
firstImage = imageCollection.item(0);

firstImage = imageCollection[0];
```

## Ví dụ

Ví dụ này duyệt qua danh sách hình ảnh và tìm những hình ảnh có tên `"banner.gif"`.

```js
for (const image of document.images) {
  if (image.src === "banner.gif") {
    console.log("Found the banner");
  }
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
