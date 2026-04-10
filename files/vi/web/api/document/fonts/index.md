---
title: "Document: thuộc tính fonts"
short-title: fonts
slug: Web/API/Document/fonts
page-type: web-api-instance-property
browser-compat: api.Document.fonts
---

{{APIRef("DOM")}}

Thuộc tính **`fonts`** của giao diện {{domxref("Document")}} trả về giao diện {{domxref("FontFaceSet")}} của tài liệu.

Tính năng này là một phần của [CSS Font Loading API](/en-US/docs/Web/API/CSS_Font_Loading_API).

## Giá trị

Giá trị trả về là giao diện {{domxref("FontFaceSet")}} của tài liệu.
Giao diện `FontFaceSet` hữu ích cho việc tải phông chữ mới, kiểm tra trạng thái của phông chữ đã tải trước đó, v.v.

## Ví dụ

### Thực hiện thao tác sau khi phông chữ được tải

```js
document.fonts.ready.then((fontFaceSet) => {
  // Bất kỳ thao tác nào cần thực hiện chỉ sau khi tất cả phông chữ được sử dụng
  // hoàn tất tải có thể đặt ở đây.
  const fontFaces = [...fontFaceSet];
  console.log(fontFaces);
  // một số phông chữ có thể vẫn chưa được tải nếu chúng không được sử dụng trên trang
  console.log(fontFaces.map((f) => f.status));
});
```

Promise được phân giải khi các thao tác tải và bố cục của tất cả phông chữ được sử dụng hoàn tất. Tập hợp phông chữ được sử dụng có thể khác với tập hợp phông chữ _khai báo_, ví dụ: nếu phông chữ tùy chọn (tức là phông chữ được khai báo qua `font-display: optional`) không thể tải kịp thời.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("FontFaceSet")}}
- {{domxref("FontFace")}}
